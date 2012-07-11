# -*- coding: cp1252 -*-
# todo:
# buttons koppelen
# database implementeren
# serial i/o implementeren

import tkinter as tk

import sqlalchemy
from sqlalchemy import *
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker


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


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
# BOEK BANK USER INTERFACE				#
# bevat alle assets van de gui (knoppen, labels, etc.)  #
class BookApplication(tk.Frame):
	
    # # # # # # # # #
    # CONSTRUCTOR   #
    def __init__(self, master=None):
        tk.Frame.__init__(self, master, width=100, height=500)
        self.grid()
        self.createWidgets()
		
    # # # # # # # # # # #
    # WIDGET CREATION   #
    def createWidgets(self):
		
        # nr_field bevat het leerling nummer
        def search():
            Session = sessionmaker(bind=engine)
            namy = Session.query(Leerling).filter_by(LLN=nr_field.get())
            #print(namy)
            # ZET HIERONDER NAAM A.D.H.V HET LEERLING NUMMER
            name.set(nr_field.get())
            # UNCOMMENT HIERONDER ALS JE LIEVER HEBT DAT HET VELD GECLEARD WORDT NA EEN ZOEK ACTIE
            #nr_field.delete(0, tk.END)

        def pickup():
            print('Boek afgeven')
            # CHECK HET HUIDIGE BOEK NAAR 'GROEN'
            # check picked up (add to student profile)

        def returns():
            print('Boek innemen')
            # CHECK HET HUIDIGE BOEK NAAR 'GEEL' // NODIG = ROOD - YES // NO

        def extend():
            print('Boek verlengen')

        def lost():
            # BOEK VERLOREN/SCHADE, BOEK EEN BOETE OP LEERLING NAAM
            print('Boek verloren')
			#maak object van leerling en boek een boete die stackt en uiteindelijk prijs uitrekent
            #lost_frame = tk.Frame(root, height=10, width=20, bd=2, bg='#00ff00')
            #lost_frame.grid(row=0, column=2)

        def undo():
            # undo last action
            # if added to student profile, clear it
            # if removed from student profile, add it
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

		# # # # # # #
        # MENU BAR  #
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
		helpmenu.add_command(label='Fout melden', command=reportBug)
        
		
        # # # # # #
        # LABELS  #
        
		# Student number. #
		self.StudentNr = tk.Label(self, text='LEERLING NR.:').grid(row=0, column=0)
		# Student name. #
		name = tk.StringVar()
		name.set(' ')
		self.StudentNa = tk.Label(self, text='LEERLING NAAM:').grid(row=1, column=0)
		self.Name = tk.Label(self, textvariable=name, width=25).grid(row=1,column=1)

		
        # Image. #
		imgLabel = tk.Label(self)
	
		# # # # # # # # #
		# INPUT FIELDS  #
		nr_field = tk.Entry(self, width=100)
		nr_field.grid(row=0, column=1, columnspan=10, padx=12, sticky = tk.E)

		book_return_field = tk.Entry(self, width=100)
		#book_return_field.grid(row=2, column=1, columnspan=10, padx=12, sticky = tk.E)
	
		search_button = tk.Button(self, text='ZOEKEN', height=5, width=15, activebackground='#787878', command=search)
		search_button.grid(row=0, column=13, padx=400, pady=2, sticky=tk.E)
		
		pickup_button = tk.Button(self, text='BOEK AFGEVEN',  height=5, width=15, activebackground='#787878', command=pickup)
		pickup_button.grid(row=2, column=13, padx=400, pady=2, sticky=tk.E)

		returns_button = tk.Button(self, text='BOEK INNEMEN', height=5, width=15, activebackground='#787878', command=returns)
		returns_button.grid(row=3, column=13, padx=400, pady=2, sticky=tk.E)

		lost_button = tk.Button(self, text='BOEK VERLOREN', height=5, width=15, activebackground='#787878', command=lost)
		lost_button.grid(row=4, column=13, padx=400, pady=2, sticky=tk.E)
        # END BOEK BANK USER INTERFACE  #
        # # # # # # # # # # # # # # # # #


		
# # # # # # # #		
# MAIN BELOW  #


# Maak engine met database adres (intern). #
engine = create_engine('sqlite:///:memory:', echo=True)
engine.execute('select 1').scalar()


# Maakt de tables indien deze nog niet bestaan. #
Base.metadata.create_all(engine)


# Test leerling. #
# new_leerling = Leerling('vollenaam', 3)


# Call user interface. #
root = tk.Tk()
root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth()-20,root.winfo_screenheight()-60))
root.wm_title("Boeken bank - Cygnus Gymnasium Pieter Nieuwland College  ")
app = BookApplication(master=root)
app.mainloop()


# END MAIN  #
# # # # # # #
