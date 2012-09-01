import datetime
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Date
from sqlalchemy import Boolean, Float
from sqlalchemy.orm import sessionmaker, relationship, backref
from sqlalchemy.ext.declarative import declarative_base

#from sqlalchemy.connectors import mysqldb
#from sqlalchemy.dialects.mysql import *
#from sqlalchemy.connectors import mysqldb

# create engine, Session and Base
engine = create_engine('sqlite:///:memory:', echo=True)
Session = sessionmaker(bind=engine)
Base = declarative_base()

DEBUG = False

### ISBN can never be the pk, because all books that are the same, have the same
### ISBN. However, the barcode is always unique, therefore it will be the pk.

# Books table (all grades)
class Book(Base):
    __tablename__ = 'book'

    # Boek isbn, naam, versie en leerjaar
    barcode = Column(Integer, primary_key=True)
    ISBN = Column(Integer, nullable=False)
    name = Column(String(100), nullable=False)
    purchased = Column(Date, nullable=False)
    price = Column(Integer, nullable=False)
    grades = Column(String(16), nullable=False)
    student_id = Column(String(32), ForeignKey('student.id'))

    gone = Column(Boolean, nullable=False, default=False)

    def get_grades(self):
        '''Get a list of all grades this book is meant for.'''
        return [int(x) for x in grades.split(',')]

    def __repr__(self):
        return '<Boekenlijst({}, {})>'.format(
            self.name,
            self.purchased.strftime('%d/%m-%Y')
        )

    def add(barcode, ISBN, name, price, grades):
        session = Session()
        book = Book(
            barcode=barcode,
            ISBN=ISBN,
            name=name,
            price=price,
            purchased=datetime.date.today(),
            grades=','.join(str(g) for g in grades)
        )
        session.add(book)
        session.commit()


## student table ##
class Student(Base):
    __tablename__ = 'student'

    # Student id can be the designation (for the dutch, that's a leerlingnummer)
    id = Column(String(32), primary_key=True)
    first_name = Column(String(32), nullable=False)
    # 'insertion' is a poor translation of 'tussenvoegsel'
    # inbetweener is a much cooler word, so we'll use that
    inbetweener = Column(String(16))
    surname = Column(String(32), nullable=False)
    grade = Column(Integer, nullable=False)
    group_letter = Column(String(2))
    books = relationship('Book', backref='student', order_by="Book.name")
    fine = Column(Float)

    def get_fullname(self):
        if self.inbetweener:
            return ' '.join((self.first_name, self.inbetweener, self.surname))
        else:
            return ' '.join((self.first_name, self.surname))

    def get_group(self):
        return str(self.grade) + (self.group_letter or '')

    def __repr__(self):
        return '<Student({}, {})>'.format(self.get_fullname(), self.get_group())

    def borrow_book(self, barcode):
        session = Session()
        book = session.query(Book).filter(Book.barcode==barcode).one()
        book.student_id = self.id
        session.add(book)
        session.commit()

    def return_book(self, barcode, damaged=False, unusable=False, fraction=1/6):
        '''Returns a book and charges a fine if damage has increased'''
        session = Session()
        book = session.query(Book).filter(Book.barcode==barcode).one()
        book.student_id = None

        if damaged:
            self.fine += book.price * fraction

        if unusable:
            self.fine += book.price * fraction
            book.gone = True

        session.add(book)
        session.add(self)
        session.commmit()

    def declare_lost(self, fraction=1/3):
        '''
        Declares all books linked to this student as lost and charge a fine
        for them.
        '''
        session = Session()
        for book in self.books:
            book.gone = True
            session.add(book)
            self.fine += book.price * fraction

        session.add(self)
        session.commit()

# Makes the tables if they don't already exist.
Base.metadata.create_all(engine)

if DEBUG:
    session = Session()
    student = Student(id='abcd', first_name='Jan', surname='Klaassen', grade='4')
    session.add(student)

    book = Book(barcode='123456', ISBN=1, name='foo', price='50',
                purchased=datetime.date.today(), grades='3,4,5')
    session.add(book)
    session.commit()

    student.borrow_book(123456)
