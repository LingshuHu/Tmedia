
## read and combine data
read_combine <- function(file_name_pattern) {
  files <- list.files("data", pattern = file_name_pattern, 
                      all.files = T, full.names = T, include.dirs = T)
  lst <- lapply(files, readRDS)
  df <- do.call("rbind", lst)
  df <- df[!duplicated(df$status_id), ]
  return(df)
}

ch <- read_combine("chinese_national_media.*")
us <- read_combine("media_tweets.*")

saveRDS(ch, "data/chinese_national_media_2020-4-30-2020-12-24.rds")
saveRDS(us, "data/us_media_2020-4-23-2020-12-24.rds")

rtweet::write_as_csv(ch[,1:5], "data/chinese_national_media_2020-4-30-2020-12-24.csv")
rtweet::write_as_csv(us[,1:5], "data/us_media_2020-4-23-2020-12-24.csv")
