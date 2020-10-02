# Author: Bahjat Murrad
# Date: 01/10/2020
# Description: This file contains the YesOrNo keyword used to interact with the user

from tkinter import *


class YesOrNoQuestion(object):
    """@brief This is a simple yes or not question using TK.
    Please pass the question as the argument when creating an instance.
    to find the answer please call obj.ans, this will be either Yes or No """

    # ROBOT_LIBRARY_SCOPE = 'reST'
    # ans = ""

    def __init__(self, question="Enter question ples"):
        self.question = question

    def main_loop(self):
        self.master = Tk()
        self.ans = ""
        self.master.title("Question")
        self.lbl = Label(self.master, text=self.question)
        self.lbl.pack()
        self.btn_yes = Button(self.master, text="Yes", command=self.quit_application_yes)
        self.btn_yes.pack()
        self.btn_no = Button(self.master, text="No", command=self.quit_application_no)
        self.btn_no.pack()
        self.master.mainloop()

    def quit_application_yes(self):
        # print("Yes")
        self.ans = "Yes"
        self.master.quit()
        self.master.destroy()

    def quit_application_no(self):
        # print("No")
        self.ans = "No"
        self.master.quit()
        self.master.destroy()



