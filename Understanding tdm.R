folder='text'
list.files(folder)
files=list.files(folder)
all=paste(folder, "\\", files, sep="")
text=lapply(all, FUN=readLines)
t=lapply(text,FUN=paste, collapse="")
t

c=VCorpus(VectorSource(t))
tdm=TermDocumentMatrix(c)
inspect(tdm)
