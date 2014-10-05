library(twitteR)
library(plyr)

projectDir = getwd()
codeDir = file.path(projectDir, 'R')

# load our score.sentiment() function:
source( file.path(codeDir, 'sentiment.R') )

# get the 1500 most recent tweets mentioning '@delta'
delta.tweets = searchTwitter('@delta', n=1500)

# inspect data
length(delta.tweets)
class(delta.tweets)

# get all text from tweets
delta.text = laply(delta.tweets, function(t) t$getText() )

# get positive word directory for sentiment analysis
hu.liu.pos = scan('~/src/sentiment_analysis/positive-words.txt', what='character', comment.char=';')

# get negative word directory for sentiment analysis
hu.liu.neg = scan('~/src/sentiment_analysis/negative-words.txt', what='character', comment.char=';')

# add some words
pos.words = c(hu.liu.pos, 'upgrade')
neg.words = c(hu.liu.neg, 'wtf', 'wait', 'waiting', 'epicfail', 'mechanical')



