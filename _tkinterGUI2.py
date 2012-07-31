# -*- coding: cp1252 -*-
# todo:
# database connectie

import tkinter as tk
from database import *


money = 0

# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# BOEK BANK USER INTERFACE				#
# bevat alle assets van de gui (knoppen, labels, etc.)  #
class BookApplication(tk.Frame):

    def __init__(self, master=None):
        tk.Frame.__init__(self, master, width=100, height=500)
        self.grid()
        self.create_widgets()

    def create_widgets(self):

        # nr_field bevat het leerling nummer
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
            # CHECK HET HUIDIGE BOEK NAAR YES // NO

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

        def get_version():
            print('Versie 1.0')
            #print op ext. frame

        def report_bug():
            print('Fout melden')

        def calc_money():
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
        helpmenu.add_command(label='Versie', command=get_version)
        helpmenu.add_command(label='Fout melden', command=report_bug)

        # Student number. #
        self.StudentNr = tk.Label(self, text='LEERLING NR.:').grid(row=0, column=0)

        # leerling naam label
        name = tk.StringVar()
        name.set(' ')
        self.StudentNa = tk.Label(self, text='LEERLING NAAM:').grid(row=1, column=0)
        self.Name = tk.Label(self, textvariable=name, width=25).grid(row=1,column=1)

        # te betalen bedrag
        money_var = tk.StringVar()
        money_var.set(' ')
        money_label = tk.Label(self, text='TE BETALEN BERAG:').grid(row=4, column=0, sticky=tk.E)
        money_var_label = tk.Label(self, textvariable=money_var, width=5).grid(row=4,column=1, sticky=tk.W)


        # Image
        imgLabel = tk.Label(self)


        # Input Fields
        nr_field = tk.Entry(self, width=100)
        nr_field.grid(row=0, column=1, columnspan=10, padx=12, sticky = tk.E)
        book_pickup_field = tk.Entry(self, width=100)
        book_pickup_field.grid(row=2, column=1, columnspan=10, padx=12, sticky = tk.E)
        book_return_field = tk.Entry(self, width=100)
        book_return_field.grid(row=3, column=1, columnspan=10, padx=12, sticky = tk.E)

        # Buttons
        search_button = tk.Button(self, text='ZOEKEN', height=5, width=15, activebackground='#787878', command=search)
        search_button.grid(row=0, column=13, padx=400, pady=2, sticky=tk.E)

        pickup_button = tk.Button(self, text='BOEK AFGEVEN',  height=5, width=15, activebackground='#787878', command=pickup)
        pickup_button.grid(row=2, column=13, padx=400, pady=2, sticky=tk.E)

        returns_button = tk.Button(self, text='BOEK INNEMEN', height=5, width=15, activebackground='#787878', command=returns)
        returns_button.grid(row=3, column=13, padx=400, pady=2, sticky=tk.E)

        lost_button = tk.Button(self, text='BOEK VERLOREN', height=5, width=15, activebackground='#787878', command=lost)
        lost_button.grid(row=4, column=13, padx=400, pady=2, sticky=tk.E)


# Main #


# test_leerling = Leerling('vollenaam', 3)

# interface
root = tk.Tk()
root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth()-20,root.winfo_screenheight()-60))
root.wm_title("Boeken bank - Cygnus Gymnasium Pieter Nieuwland College  ")
app = BookApplication(master=root)
app.mainloop()

