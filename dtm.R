require(qdap)
require(tm)
require(wordcloud)
require(wordcloud2)

#---------------------------------------
folder='MankiBaat'
list.files(folder)
files=list.files(folder)
all=paste(folder, "\\", files, sep="")
text=lapply(all, FUN=readLines)
t=lapply(text,FUN=paste, collapse="")
t
#-----------------------------------------

c=VCorpus(VectorSource(t))
c=tm_map(c, content_transformer(tolower))
c=tm_map(c, removePunctuation)
c=tm_map(c, removeNumbers)
c=tm_map(c, removeWords, stopwords("en"))
more_words=c("ki","ji","mann", "baat","also","ve","can")
c=tm_map(c, removeWords, more_words)
c=tm_map(c, stripWhitespace)
c=tm_map(c, stemDocument)

#-----------------------------------------

?brewer.pal
wordcloud(c, min.freq = 20, colors = brewer.pal(8, "Dark2"), rot.per = .4, random.order = F)

#-----------------------------------------

tdm=TermDocumentMatrix(c)
tdm
inspect(tdm)

td=removeSparseTerms(tdm, 0.4)
td
dim(td)
inspect(td)

tdmat=as.matrix(tdm)
tdmat
#-----------------------------------------------
comparison.cloud(tdmat, colors = brewer.pal(12, "Paired"), rot.per = .25)

colnames(tdmat)
colnames(tdmat)= c("Jan","Feb","Mar","Apr","May","June","July","Aug",
                   "Sept","Oct","Nov","Dec")

commonality.cloud(tdmat, colors = brewer.pal(8, "Dark2"))

#------------------------------------------------












#1. Term Frequency
?findFreqTerms

freq.terms=findFreqTerms(td,lowfreq = 20, highfreq = 80)
freq.terms
#-----------------------------------------------
#2. Word Associations

?findAssocs
findAssocs(td, "young", 0.5)
findAssocs(td, c("india", "young"), c(0.4,0.5))

#-----------------------------------------------
#3. Plotting Associations


plot(td, term = freq.terms, corThreshold = 0.5, weighting = T)



#-----------------------------------------




#4. Cluster Analysis
dim(tdmat)
ttt=tdmat[,1]
dist=dist(scale(ttt))
fit=hclust(dist, method = "ward.D")
plot(fit)


f=freq_terms(c, top=20)
wordcloud2(f, minSize = 2, color = brewer.pal(8, "Dark2"))
