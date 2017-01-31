import subprocess
from Tkinter import *


print 'Hello Adrian'
return_code = subprocess.call("echo Hello World >> output.txt", shell=True)



#create the window
root = Tk()


#modify the window
root.title("Crypt-keeper GUI")
root.geometry("500x600")

#kick off the event loop 
root.mainloop()






