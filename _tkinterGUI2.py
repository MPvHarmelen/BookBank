# -*- coding: cp1252 -*-
# todo:
# database connectie

import tkinter as tk
from database import *
from sqlalchemy.orm.exc import NoResultFound

DEBUG = True
if DEBUG:
    create_debug_data()


# # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# BOEK BANK USER INTERFACE				                #
# bevat alle assets van de gui (knoppen, labels, etc.)  #
class BookApplication(tk.Frame):

    def __init__(self, master=None):
        tk.Frame.__init__(self, master, width=100, height=500)
        self.grid()
        self.create_widgets()

    def create_widgets(self):

        def find_student():
            self.session.commit()
            try:
                self.student = self.session.query(Student).filter(
                    Student.id==self.nr_field.get()
                ).one()
                self.name.set(self.student.get_full_name())
                self.nr_field.delete(0, tk.END)
            except NoResultFound:
                self.name.set('Deze leerling bestaat niet.')

        def lend_book():
            self.session.commit()
            if self.student is not None:
                self.student = self.session.query(Student).filter(Student.id==self.student.id).one()
                barcode = self.book_field.get()
                try:
                    self.session, book = self.student.borrow_book(self.session, barcode, self.damage_var)
                    self.book_var.set(book.name + ' is succesvol uitgeleend.')
                    self.book_field.delete(0, tk.END)

                except NoResultFound:
                    self.book_var.set('Dit boek bestaat niet.')

                except BadReferenceError as e:
                    self.book_var.set(str(e)[:-17] + ' is al uitgeleend.')

        def return_book():
            self.session.commit()
            if self.student is not None:
                self.student = self.session.query(Student).filter(Student.id==self.student.id).one()
                barcode = self.book_field.get()
                try:
                    self.session, book, time = self.student.return_book(
                        self.session,
                        barcode,
                        self.damage_var.get(),
                        self.unusable_var.get()
                    )
                    self.book_var.set(book.name + ' is succesvol ingeleverd.')
                    self.book_field.delete(0, tk.END)
                    self.money_var.set(self.student.fine.__round__(2))
                    self.time_var.set('Dit boek was ' + str(time.days) + ' dagen uitgeleend.')


                except NoResultFound:
                    self.book_var.set('Dit boek bestaat niet.')
                except BadReferenceError as e:
                    self.book_var.set(str(e)[:-33] + ' is niet van ' + self.student.get_full_name())

        def declare_lost():
            self.session.commit()
            if self.student is not None:
                self.student = self.session.query(Student).filter(Student.id==self.student.id).one()
                self.session = self.student.declare_lost(self.session)
                self.money_var.set(self.student.fine.__round__(2))

        def undo():
            self.session.rollback()
            self.book_var.set('Je laatste handeling is ongedaan gemaakt.')
            if self.student is not None:
                self.money_var.set(self.student.fine.__round__(2))

        def all_books():
            pass

        def get_version():
            pass

        #Session
        self.session = Session()

        # Menu
        menu = tk.Menu(self)
        root.config(menu=menu)
        filemenu = tk.Menu(menu)
        menu.add_cascade(label='Opties', menu=filemenu)
        #filemenu.add_command(label='Bestellen', command=order)
        filemenu.add_command(label='Overzicht leerling', command=all_books)
        #filemenu.add_command(label='Instellingen', command=settings)

        helpmenu = tk.Menu(menu)
        menu.add_cascade(label='Help', menu=helpmenu)
        helpmenu.add_command(label='Versie', command=get_version)
        #helpmenu.add_command(label='Fout melden', command=report_bug)

        column = 2
        padx = 0
        sticky = tk.W

        # Student number. #
        self.StudentNr = tk.Label(self, text='Leerling nr:').grid(row=0, column=0, sticky=tk.W)
        self.student = None

        # leerling naam label
        self.name = tk.StringVar()
        self.StudentNa = tk.Label(self, text='Leerling naam:')
        self.StudentNa.grid(row=1, column=0, sticky=tk.W)
        self.Name = tk.Label(self, textvariable=self.name, width=25)
        self.Name.grid(row=1,column=1, sticky=tk.W)

        # Image
        imgLabel = tk.Label(self)


        # Input Fields
        self.nr_field = tk.Entry(self, width=100)
        self.nr_field.grid(row=0, column=1, columnspan=10, padx=12, sticky = tk.W)

        search_button = tk.Button(self, text='Zoeken', height=1, width=15, activebackground='#787878', command=find_student)
        search_button.grid(row=0, column=column, padx=padx, pady=2, sticky=sticky)


        self.book_field = tk.Entry(self, width=100)
        self.book_field.grid(row=2, column=1, columnspan=10, padx=12, sticky = tk.W)
        self.book_var = tk.StringVar()
        self.book_label = tk.Label(self, text='Barcode:')
        self.book_label.grid(row=2, column=0, sticky=tk.W)
        self.book_name = tk.Label(self, textvariable=self.book_var, width=100)
        self.book_name.grid(row=4, column=1, sticky=tk.W)

        lend_button = tk.Button(self, text='Boek afgeven',  height=1, width=15, activebackground='#787878', command=lend_book)
        lend_button.grid(row=1, column=column, padx=padx, pady=2, sticky=sticky)

        self.damage_label = tk.Label(self, text='Is het boek beschadigd?')
        self.damage_label.grid(row=3, column=0, sticky=tk.W)
        self.damage_var = tk.IntVar()
        self.damage_box_yes = tk.Radiobutton(self, text='Ja, het boek is beschadigd.', variable=self.damage_var,
                                             value=1)
        self.damage_box_yes.grid(row=3, column=1, sticky=tk.W)
        self.damage_box_no = tk.Radiobutton(self, text='Nee, het boek is niet beschadigd.', variable=self.damage_var,
                                             value=0)
        self.damage_box_no.grid(row=3, column=1)

        self.unusable_var = tk.IntVar()
        self.unusable_box = tk.Checkbutton(self, text='Dit boek is onbruikbaar.', var=self.unusable_var)
        self.unusable_box.grid(row=4, column=1, sticky=tk.W)

        returns_button = tk.Button(self, text='Boek innemen', height=1, width=15, activebackground='#787878', command=return_book)
        returns_button.grid(row=2, column=column, padx=padx, pady=2, sticky=sticky)

        lost_button = tk.Button(self, text='Boek verloren', height=1, width=15, activebackground='#787878', command=declare_lost)
        lost_button.grid(row=3, column=column, padx=padx, pady=2, sticky=sticky)

        # te betalen bedrag

        self.money_var = tk.IntVar()
        self.money_label = tk.Label(self, text='Te betalen bedrag:').grid(row=5, column=0, sticky=tk.E)
        self.money_var_label = tk.Label(self, textvariable=self.money_var, width=5).grid(row=5,column=1, sticky=tk.W)

        self.time_var = tk.StringVar()
        self.time_label = tk.Label(self, textvariable=self.time_var, width=33)
        self.time_label.grid(row=5, column=1)

        # Buttons


        undo_button = tk.Button(self, text='Undo', height=1, width=15, activebackground='#787878', command=undo)
        undo_button.grid(row=4, column=column, padx=padx, pady=2, sticky=sticky)


# Main #


# test_leerling = Leerling('vollenaam', 3)

# interface
root = tk.Tk()
root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth()-20,root.winfo_screenheight()-60))
root.wm_title("Boeken bank - Cygnus Gymnasium Pieter Nieuwland College  ")
app = BookApplication(master=root)
app.mainloop()

