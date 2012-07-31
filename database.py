from sqlalchemy import create_engine, Column, Integer, String, Foreignkey
from sqlalchemy.orm import sessionmaker, relationship, backref
from sqlalchemy.ext.declarative import declarative_base


# create engine, Session and Base
engine = create_engine('sqlite:///:memory:', echo=True)
Session = sessionmaker(bind=engine)
Base = declarative_base()

## student table ##
class Student(Base):
    __tablename__ = 'student'

    # Student id kan be the designation (for the dutch, that's a leerlingnummer)
    id = Column(Integer, primary_key=True)
    first_name = Column(String(32))
    # 'insertion' is a poor translation of 'tussenvoegsel'
    # inbetweener is a much cooler word, so we'll use that
    inbetweener = Column(String(16))
    surname = Column(String(32))
    year = Column(Integer)
    group_letter = Column(String(2))
    books = relationship('Child', backref='parent')

    def get_fullname(self):
        return ' '.join((self.first_name, self.inbetweener, self.surname))

    def get_group(self):
        return str(self.year) + self.group_letter

    def __repr__(self):
        return '<Student({}, {})>'.format(self.get_fullname(), self.get_group())

### ISBN can never be the pk, because all books that are the same, have the same
### ISBN. However, the barcode is always unique, therefore it will be the pk.

# Books table (all years)
class Book(Base):
    __tablename__ = 'book'

    # Boek isbn, naam, versie en leerjaar
    barcode = Column(Integer, primary_key=True)
    ISBN    = Column(Integer)
    name    = Column(String(100))
    year    = Column(Integer)
    # What is this version thing?
    version = Column(String(10))
    student_id = Column(Integer, ForeignKey('student.id'))

    def __repr__(self):
        return '<Boekenlijst({}, {}, {})>'.format(self.name, self.version,
                                                  self.year)

# Makes the tables if they don't already exist.
Base.metadata.create_all(engine)

### Shit cut from _tkinterGUI2.py:
#engine = create_engine('sqlite:///:memory:', echo=True)
##engine = create_engine('mysql+mysqlconnector:///habibjx56_boek:nexY7te0@leerik.nl/habibjx56_boek?charset=utf8&use_unicode=0', echo=True)
##engine.execute('select 1').scalar()
#
#Base.metadata.create_all(engine)
#
#Base = declarative_base()
#
## Database tables
#class Boekenlijst(Base):
#    __tablename__ = 'boekenlijst1'
#
#    # Boek isbn, code, naam, versie en leerjaar
#    ISBN = Column(Integer, primary_key=True)
#    code = Column(Integer)
#    name = Column(String(100))
#    version = Column(String(10))
#    year = (Integer)
#
#    def __init__(self, name, version, year):
#        self.name = name
#        self.version = version
#        self.year = year
#
#    def __repr__(self):
#        return "<Boekenlijst('%i', '%s', '%s', '%i')>" % (self.code, self.name, self.version, self.year)
#class Leerling(Base):
#    __tablename__ = 'leerling'
#
#    # Leerling nummer, volle naam en leerjaar
#    LLN = Column(Integer, primary_key=True)
#    fullname = Column(String(50))
#    year = Column(Integer)
#
#    # er is een default constructor, maar ok ..
#    def __init__(self, fullname, year):
#        self.fullname = fullname
#        self.year = year
#
#    def __repr__(self):
#        return "<Leerling('%s','%i')>" % (self.fullname, self.year)
#
#
#
#class newStudentObj():
#    booksGiven = None
#    booksReturned = None
#    #books missing is booksgiven - booksreturned
#    booksMissing = None
#    #booksMissing