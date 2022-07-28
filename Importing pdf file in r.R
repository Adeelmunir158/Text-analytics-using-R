install.packages("tm")

library(tm)
f = 'amelia.pdf'

r = readPDF(control = list(text = "-layout"))

corpus = VCorpus(URISource(f), readerControl = list(reader = r))

c= content(content(corpus)[[1]])
c
