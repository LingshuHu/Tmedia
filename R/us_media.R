
###################### get media tweets ############################
library(rtweet)

media <-  c("nytimes", "cnnbrk", "wsj", "cnn", "foxnews", "huffingtonpost", "usatoday", 
            "cbsnews", "latimes", "washingtonpost", "yahoonews", "nprnews", "sciam", 
            "usabreakingnews", "abc7", "ABC", "ABCWorldNews", "cnetnews", "HuffPost")

media_tweets <- wait_search(s = 1, t = 18, tm = 60*12, uids = media, n = 3200)

media_tweets <- rtweet::get_timeline(media, 
                                     n = 3200, 
                                     token = rtweet::bearer_token(), 
                                     check = F)

saveRDS(media_tweets, "data/media_tweets_2020-11-5.rds")

## exclude duplications
#mt <- readRDS("data/media_tweets_2020-4-23.rds")
#mt <- rbind(mt, media_tweets)
#mt <- mt[!duplicated(mt$status_id), ]

kw <- "covid 19|corona virus|ChineseVirus|AmericanVirus|covid-19|covid19|covid_19|coronavirus|2019-nCov|2019_nCov|2019nCov"
media_covid <- media_tweets[grepl(kw, media_tweets$text, ignore.case = T), ]

saveRDS(media_covid, "data/media_tweets_covid_2020-5-23.rds")




