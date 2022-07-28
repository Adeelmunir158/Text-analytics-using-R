require(qdap)
require(tm)
require(wordcloud)
require(wordcloud2)
require(sentimentr)
#---------------------------------------
folder='MankiBaat'
list.files(folder)
files=list.files(folder)
all=paste(folder, "\\", files, sep="")

text=lapply(all, FUN=readLines)
t=lapply(text,FUN=paste, collapse="")
t

c=VCorpus(VectorSource(t))
c=tm_map(c, content_transformer(tolower))
c=tm_map(c, removePunctuation)
c=tm_map(c, removeNumbers)
c=tm_map(c, removeWords, stopwords("en"))
c=tm_map(c, stripWhitespace)
c=tm_map(c, stemDocument)
c

tdm=TermDocumentMatrix(c)
tdm
inspect(tdm)
# Find frequency terms and find associations

findFreqTerms(tdm, 50)
findAssocs(tdm, "india", 0.7)


dtm=DocumentTermMatrix(c)
inspect(dtm)
tt=removeSparseTerms(tdm, .4)
inspect(tt)

m=as.matrix(tt)
mm=m[,1:4]            
colnames(mm)
colnames(mm)=c("Jan","Feb","Mar","Apr")
comparison.cloud(mm, random.order=FALSE, rot.per=.3,
                 colors=brewer.pal(max(3,ncol(mm)),"Dark2"))
