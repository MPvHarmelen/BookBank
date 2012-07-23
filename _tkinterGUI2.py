# -*- coding: cp1252 -*-
# todo:
# buttons koppelen
# database implementeren
# serial i/o implementeren

import tkinter as tk

#import sqlalchemy
from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
<<<<<<< HEAD
#from sqlalchemy.connectors import mysqldb
from sqlalchemy.dialects.mysql import *
=======
from sqlalchemy.connectors import mysqldb
>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3


money = 0

# # # # # # # # # # # # # # # # # # # # # # # # # # #
# shall contain a catalog of all the Table objects  #
Base = declarative_base()


# # # # # # # # # # # # #
# BEGIN DATABASE TABLES #
class Boekenlijst(Base):
    __tablename__ = 'boekenlijst1'

    # Boek isbn, code, naam, versie en leerjaar
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
        return "<Boekenlijst('%i', '%s', '%s', '%i')>" % (self.code, self.name, self.version, self.year)
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
# END DATABASE TABLES #
# # # # # # # # # # # #


# Leerling object, gemaakt door de 'Zoek' button om een sessie te starten
class newStudentObj():
    booksGiven = None
    booksReturned = None

    #books missing is booksgiven - booksreturned
<<<<<<< HEAD
    booksMissing = None
=======
    #booksMissing
>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3

    #stacks if books are damaged or lost
    payPrice = None


# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# BOEK BANK USER INTERFACE				#
# bevat alle assets van de gui (knoppen, labels, etc.)  #
class BookApplication(tk.Frame):
<<<<<<< HEAD
    
=======

>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3
    # # # # # # # # #
    # CONSTRUCTOR   #
    def __init__(self, master=None):
        tk.Frame.__init__(self, master, width=100, height=500)
        self.grid()
        self.createWidgets()
<<<<<<< HEAD
		
    def createWidgets(self):

        money = 0
        
=======

    # # # # # # # # # # #
    # WIDGET CREATION   #
    def createWidgets(self):

        # nr_field bevat het leerling nummer
>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3
        def search():
            money_var.set(' ')
            #Session = sessionmaker(bind=engine)
            #llname = Session.query().filter_by(LLN=nr_field.get())
            #print(llname)
            #name.set(llname)
            #nr_field.delete(0, tk.END)

        def pickup():
            print('Boek afgeven')
            book = book_pickup_field.get()
            print(book)
            # CHECK HET HUIDIGE BOEK NAAR 'GROEN'
            # check picked up (add to student profile)
            book_pickup_field.delete(0, tk.END)

        def returns():
            print('Boek innemen')
            returned_book = book_return_field.get()
            book_return_field.delete(0, tk.END)
            # CHECK HET HUIDIGE BOEK NAAR 'GEEL' // NODIG = ROOD - YES // NO

        def extend():
            print('Boek verlengen')

        def lost():
            global money
            
            lost_book = book_return_field.get()
            book_return_field.delete(0, tk.END)
            
            print('verloren boek: ' + lost_book)
            money += 5
            money_var.set('€' + str(money))

        def undo():
            # undo last action
            # if added to student profile, clear it
            # if removed from student profile, add it
            # if booked a 'boete', minus it
            # if booked a lost book ok, set it false
            # etc.
            print('Laatste actie ongedaan gemaakt')

        def order():
            print('Boek(en) bestellen')
            # show order frame

        def report():
            print('Leerling boek overzicht')

        def settings():
            print('Programma instellingen (kleur)')

        def getVersion():
            print('Versie 1.0')
            #print op ext. frame

        def reportBug():
            print('Fout melden')

        def calcMoney():
            print('Het te betalen bedrag')

        # Menu
        menu = tk.Menu(self)
        root.config(menu=menu)
        filemenu = tk.Menu(menu)
        menu.add_cascade(label='Opties', menu=filemenu)
        filemenu.add_command(label='Bestellen', command=order)
        filemenu.add_command(label='Overzicht leerling', command=report)
        filemenu.add_command(label='Instellingen', command=settings)

        helpmenu = tk.Menu(menu)
        menu.add_cascade(label='Help', menu=helpmenu)
        helpmenu.add_command(label='Versie', command=getVersion)
<<<<<<< HEAD
        helpmenu.add_command(label='Fout melden', command=reportBug)        
            
        # Labels 
            
        # leerling nummer label
=======
        helpmenu.add_command(label='Fout melden', command=reportBug)

        # # # # # #
        # LABELS  #

        # Student number. #
>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3
        self.StudentNr = tk.Label(self, text='LEERLING NR.:').grid(row=0, column=0)

        # leerling naam label
        name = tk.StringVar()
        name.set(' ')
        self.StudentNa = tk.Label(self, text='LEERLING NAAM:').grid(row=1, column=0)
        self.Name = tk.Label(self, textvariable=name, width=25).grid(row=1,column=1)

<<<<<<< HEAD
        # te betalen bedrag
        money_var = tk.StringVar()
        money_var.set(' ')
        money_label = tk.Label(self, text='TE BETALEN BERAG:').grid(row=4, column=0, sticky=tk.E)
        money_var_label = tk.Label(self, textvariable=money_var, width=5).grid(row=4,column=1, sticky=tk.W)

                    
        # Image 
        imgLabel = tk.Label(self)
            

        # Input Fields
=======

        # Image. #
        imgLabel = tk.Label(self)

        # # # # # # # # #
        # INPUT FIELDS  #
>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3
        nr_field = tk.Entry(self, width=100)
        nr_field.grid(row=0, column=1, columnspan=10, padx=12, sticky = tk.E)

        book_pickup_field = tk.Entry(self, width=100)
        book_pickup_field.grid(row=2, column=1, columnspan=10, padx=12, sticky = tk.E)

        book_return_field = tk.Entry(self, width=100)
<<<<<<< HEAD
        book_return_field.grid(row=3, column=1, columnspan=10, padx=12, sticky = tk.E)

        # Buttons 
=======
        #book_return_field.grid(row=2, column=1, columnspan=10, padx=12, sticky = tk.E)

>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3
        search_button = tk.Button(self, text='ZOEKEN', height=5, width=15, activebackground='#787878', command=search)
        search_button.grid(row=0, column=13, padx=400, pady=2, sticky=tk.E)

        pickup_button = tk.Button(self, text='BOEK AFGEVEN',  height=5, width=15, activebackground='#787878', command=pickup)
        pickup_button.grid(row=2, column=13, padx=400, pady=2, sticky=tk.E)

        returns_button = tk.Button(self, text='BOEK INNEMEN', height=5, width=15, activebackground='#787878', command=returns)
        returns_button.grid(row=3, column=13, padx=400, pady=2, sticky=tk.E)

        lost_button = tk.Button(self, text='BOEK VERLOREN', height=5, width=15, activebackground='#787878', command=lost)
        lost_button.grid(row=4, column=13, padx=400, pady=2, sticky=tk.E)


<<<<<<< HEAD
=======

# # # # # # # #
# MAIN BELOW  #

>>>>>>> 02ec3b153d931cea552dfd90d8bffa0823719fd3

# Main #
engine = create_engine('sqlite:///:memory:', echo=True)
#engine = create_engine('mysql+mysqlconnector:///habibjx56_boek:nexY7te0@leerik.nl/habibjx56_boek?charset=utf8&use_unicode=0', echo=True)
#engine.execute('select 1').scalar()

Base.metadata.create_all(engine)

# test_leerling = Leerling('vollenaam', 3)

# interface
root = tk.Tk()
root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth()-20,root.winfo_screenheight()-60))
root.wm_title("Boeken bank - Cygnus Gymnasium Pieter Nieuwland College  ")
app = BookApplication(master=root)
app.mainloop()

