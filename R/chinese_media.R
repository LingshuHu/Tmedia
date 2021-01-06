
cmedia <- c("PDChina", "ChinaDaily", "ChinaDailyAsia", "CCTV", "chinaorgcn", "XHNews",
            "CGTNOfficial", "caixin", "ChinaDailyEU", "ChinaDailyMetro", "CDT", 
            "ChinaPlusNews", "chinascio", "globaltimesnews", "CCTV_Plus", "Echinanews", 
            "yicaichina", "XinhuanetNews")

lmedia <- c("iGuangdong", "HefeiChina", "OrdosChina", "WuxiCity", "loveJiangsu", "loveqingdao", 
            "iloveguizhou", "BeijingReview", "AnhuiChina", "Xiongan_NewArea")

org <- c("PKU1898", "AirChinaNA", "Tsinghua_Uni", "HuaweiEnt", )

library(rtweet)

cmedia_tweets <- rtweet::get_timeline(cmedia, 
                                      n = 3200,
                                      token = rtweet::bearer_token(), 
                                      check = F)

saveRDS(cmedia_tweets, "chinese_national_media_2020-12-24.rds")

lmedia_tweets <- rtweet::get_timeline(lmedia, 
                                      n = 3200,
                                      token = rtweet::bearer_token(), 
                                      check = F)

saveRDS(lmedia_tweets, "chinese_local_media_2020-12-24.rds")






