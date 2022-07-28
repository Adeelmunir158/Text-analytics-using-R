library(tm)
library(pdftools)
library(qdap)
library(wordcloud)
library(wordcloud2)

files <- list.files(pattern = "pdf$")
files
all=lapply(files, pdf_text)
lapply(all, length) 
x=Corpus(URISource(files), readerControl = list(reader = readPDF))
x

# Now x contain text from all PDF files
#Let's make a Corpus from it
xx=VCorpus(VectorSource(x))

#Clean the Corpus
s=tm_map(xx, content_transformer(tolower))
s=tm_map(s, removePunctuation)
s=tm_map(s, removeNumbers)
s=tm_map(s, removeWords, stopwords("en"))
s=tm_map(s, removeWords, Top200Words)
s=tm_map(s, stripWhitespace)
s=tm_map(s, stemDocument)

wordcloud(s, min.freq = 200, colors = brewer.pal(8,"Dark2"), rot.per = .4, random.order = F)
f=freq_terms(s, top=20, at.least=3)
wordcloud2(f)

#Corpus is clean. Lets make TDM from it
t=TermDocumentMatrix(s)
tt=removeSparseTerms(t, sparse = 0.1)

#Convert to Matric for Commonality and Comparison Cloud
m=as.matrix(t)
commonality.cloud(mm)
comparison.cloud(mm, random.order = T, rot.per = .4)