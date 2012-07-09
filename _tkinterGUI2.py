import tkinter as tk
import sqlalchemy

# class holds widgets and their functions and assets
class BookApplication(tk.Frame):

    # Init constructor
    def __init__(self, master=None):
        tk.Frame.__init__(self, master, width=100, height=500)
        self.grid()
        self.createWidgets()

    # Widget creation
    def createWidgets(self):

        # Widget functions, they have acces to the widgets so no parameters required
        def search():
            print('Gevonden resultaten voor: ' + nr_field.get())
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
            # CHECK HET HUIDIGE BOEK NAAR 'GEEL' // NODIG = ROOD
            # check returned (clear from student profile)

        def extend():
            # IK HEB GEEN IDEE WANNEER JE DIT NODIG ZOU HEBBEN ..
            print('Boek verlengen')

        def lost():
            # BOEK VERLOREN/SCHADE, BOEK EEN BOETE OP LEERLING NAAM
            print('Boek verloren')
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


        # MENU BAR
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
        
        
        # LABELS
        #student number
        self.StudentNr = tk.Label(self, text='LEERLING NR.:').grid(row=0, column=0)

        #student name
        name = tk.StringVar()
        name.set(' ')
        self.StudentNa = tk.Label(self, text='LEERLING NAAM:').grid(row=1, column=0)
        self.Name = tk.Label(self, textvariable=name, width=25).grid(row=1,column=1)

        #image
        imgLabel = tk.Label(self)
        

        # INPUT FIELDS
        nr_field = tk.Entry(self, width=100)
        nr_field.grid(row=0, column=1, columnspan=10, padx=12, sticky=tk.E)

        book_isbn = tk.Entry(self)  
        
        # BUTTONS
        #search button
        search_button = tk.Button(self, text='ZOEKEN', height=5, width=15, activebackground='#787878', command=search)
        search_button.grid(row=0, column=13, padx=400, pady=2, sticky=tk.E)
        #pickup button
        pickup_button = tk.Button(self, text='BOEK AFGEVEN',  height=5, width=15, activebackground='#787878', command=pickup)
        pickup_button.grid(row=2, column=13, padx=400, pady=2, sticky=tk.E)
        #returns button
        returns_button = tk.Button(self, text='BOEK INNEMEN', height=5, width=15, activebackground='#787878', command=returns)
        returns_button.grid(row=3, column=13, padx=400, pady=2, sticky=tk.E)
        #lost button
        lost_button = tk.Button(self, text='BOEK VERLOREN', height=5, width=15, activebackground='#787878', command=lost)
        lost_button.grid(row=4, column=13, padx=400, pady=2, sticky=tk.E)

        # INNER FRAMES
        #color = '#f8f8f8'
        #status_frame = tk.Frame(self, height=500, width=900, bd=2, bg=color)
        #status_frame.grid(row=2, column=0)


root = tk.Tk()
root.geometry("{0}x{1}+0+0".format(root.winfo_screenwidth()-20,root.winfo_screenheight()-60))
root.wm_title("Boeken bank - Cygnus Gymnasium Pieter Nieuwland College  ")

app = BookApplication(master=root)
app.mainloop()
