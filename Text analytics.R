install.packages("readtext")
require(readtext)

install.packages("rjava")
require(rJava)

#=====================================
#Import an Individual file
#=====================================

#-------------------------------------
#Step-1 First set a working directory
#Step-2 Use readtext to read from that
#       directory/folder   

s=readLines("speech.txt")
s
# Number of characters in each row

nchar(s)
# For lower case
tolower(s)
# For upper case
toupper(s)
 # or
casefold(s, upper = F)

casefold(s, upper = T)


library(readxl)
View(Textdata)
attach(Textdata)
nchar(name)
nchar(email)
tolower(email)

# To combine names and surnames

paste(name,surname)

paste(name,surname, sep = "_")

paste(name,surname, sep = "/")

# To remove the space
s=paste(s, collapse = " ")
s

# For short speech

s=readLines("shortspeech.txt")
s
s=tolower(s)
s
s=paste(s, collapse = " ")
s
# Remove stopwords
require(tm)

stopwords()
sort(stopwords())

s=removeWords(s, stopwords())
s

s=removeWords(s, "ji")
s

l=c("also","ji","like")


r=removeWords(s, "l")
r

r=gsub(pattern = "\\W", replacement = " ", r)
r

r=gsub(pattern = "\\b[a-z]\\b{1}", replacement = " ", r)
r

# Another example with long text

s=readLines("speech.txt")
s
# Number of characters in each row

nchar(s)
# For lower case
tolower(s)




# To remove the space
s=paste(s, collapse = " ")
s

# Remove stopwords
require(tm)

stopwords()
sort(stopwords())

s=removeWords(s, stopwords())
s
# or
install.packages("qdapDictionaries")
library(qdapDictionaries)
t=Top200Words
t
s=removeWords(s, "ji")
s

l=c("also","ji","like")


s=removeWords(s, "l")
s
s=removeWords(t)

s=removeWords(s,"t")

tolower(s)
s

casefold(s, upper = F)
s
s=gsub(pattern = "\\W", replacement = " ", s)
s
# To convert digits into words

s1=gsub(pattern = "\\d", replacement = " ", s)
s1

# or another package qdap can be used as well

install.packages("qdap")
library(qdap)
s2=replace_number(s)
s2


# To remove signle words

s2=gsub(pattern = "\\b[a-z]\\b{1}", replacement = " ", s2)
s2

x=stripWhitespace(s2)
x

install.packages("SnowballC")
library(SnowballC)
x=stemDocument(x)
x
c=VCorpus(VectorSource(x))
c
inspect(c)

# All these processes also can be done by following commands

c=tm_map(c, removePunctuation)
c=tm_map(c, removeNumbers)
c=tm_map(c, removeWords, stopwords("en"))
c=tm_map(c, removeWords, Top200Words)
c=tm_map(c, stripWhitespace)
c=tm_map(c, stemDocument)
c
inspect(c)
# tm_map only works for corpus

freq_terms(x, top=20,at.least = 2,stopwords = NULL,extend = TRUE)
#or

freq_terms(x, top=20,at.least = 2,stopwords =c("will", "want","one","the"),extend = TRUE)

# For word clouds

install.packages("wordcloud")
library(wordcloud)


wordcloud(x, colors = rainbow(4), min.freq = "5", random.order = F)

wordcloud(x, colors = brewer.pal(8,"Dark2"), rot.per = .4, random.order = F)

# or

install.packages("wordcloud2")
library(wordcloud2)

xx= freq_terms(x)
xx
wordcloud2(data=xx, minSize = 10)
