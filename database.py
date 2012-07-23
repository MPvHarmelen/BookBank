from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base


# create engine, Session and Base
engine = create_engine('sqlite:///:memory:', echo=True)
Session = sessionmaker(bind=engine)
Base = declarative_base()

## student table ##
class Student(Base):
    __tablename__ = 'Students'

    # Student id kan be the designation (for the dutch, that's a leerlingnummer)
    id           = Column(Integer, primary_key=True)
    first_name   = Column(String(32))
    # 'insertion' is a poor translation of 'tussenvoegsel'
    insertion    = Column(String(16))
    surname      = Column(String(32))
    year         = Column(Integer)
    group_letter = Column(String(2))

    def get_fullname(self):
        return ' '.join((self.first_name, self.insertion, self.surname))

    def get_group(self):
        return str(self.year) + self.group_letter

    def __repr__(self):
        return '<Student({}, {})>'.format(self.get_fullname(), self.get_group())

### ISBN can never be the pk, because all books that are the same, have the same
### ISBN. However, the barcode is always unique, therefore it will be the pk.

# Books table (all years)
class Book(Base):
    __tablename__ = 'Books'

    # Boek isbn, naam, versie en leerjaar
    barcode = Column(Integer, primary_key=True)
    ISBN    = Column(Integer)
    name    = Column(String(100))
    year    = Column(Integer)
    # What is this version thing?
    version = Column(String(10))

    def __repr__(self):
        return '<Boekenlijst({}, {}, {})>'.format(self.name, self.version,
                                                  self.year)

# Makes the tables if they don't already exist.
Base.metadata.create_all(engine)
