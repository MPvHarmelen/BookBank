import sqlalchemy

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String



engine = create_engine('sqlite:///:memory:', echo=True)
engine.execute('select 1').scalar()

# sessie creeëren in button
Session = sessionmaker(bind=engine)
print('session bound to engine')

# shall contain a catalog of all the Table objects
Base = declarative_base()



## leerling table ##
class Leerling(Base):
    __tablename__ = 'leerling'

    # Leerling nummer, volle naam en leerjaar
    LLN = Column(Integer, primary_key=True)
    fullname = Column(String(50))
    year = Column(Integer)

    # er is een default constructor, maar ok ..
    def __init__(self, fullname, year):
        self.fullname = fullname
        self.year = year

    def __repr__(self):
        return "<Leerling('%s','%i')>" % (self.fullname, self.year)



## boekenlijst table (leerjaar 1) ##
class Boekenlijst(Base):
    __tablename__ = 'boekenlijst1'

    # Boek isbn, naam, versie en leerjaar
    ISBN = Column(Integer, primary_key=True)
    code = Column(Integer)
    name = Column(String(100))
    version = Column(String(10))
    year = (Integer)

    def __init__(self, name, version, year):
        self.name = name
        self.version = version
        self.year = year

    def __repr__(self):
        return "<Boekenlijst('%s', '%s', '%i')>" % (self.name, self.version, self.year)


# maakt de tables indien deze nog niet bestaan
Base.metadata.create_all(engine)


# test leerling
new_leerling = Leerling('vollenaam', 3)
#Session.add(new_leerling)
#Session.commit(new_leerling)

#open session
#search button query for student nr
#return fullname column



