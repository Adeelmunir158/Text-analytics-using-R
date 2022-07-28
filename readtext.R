install.packages("readtext")
require(readtext)

#=====================================
#Import an Individual file
#=====================================

#-------------------------------------
#Step-1 First set a working directory
#Step-2 Use readtext to read from that
#       directory/folder   

s=readLines("speech.txt")
s
# or
readLines(file.choose())

#-------------------------------------
x=readtext(file.choose())
x$text

#=====================================
#Importing Multiple Files
#=====================================

#-------------------------------------
#Step-1 First set a working directory
#Step-2 Fetch all filenames into a var
#Step-3 Use readtext to read from that
#       variable   
#-------------------------------------

#Import PDF files
p = list.files(pattern = "pdf")
#See filenames
p
#Read text from files
pp=readtext(p)
#See the text of various files
pp$text

#-------------------------------------

#Import TEXT files
t=list.files(pattern = "txt")
#See filenames
t
#Read text from files
tt=readtext(t)
#See the text of various files
tt$text


#-------------------------------------

#Import DOCX files
d=list.files(pattern = "docx")
#See filenames
d
#Read text from files
dd=readtext(d)
#See the text of various files
dd$text

#-------------------------------------
