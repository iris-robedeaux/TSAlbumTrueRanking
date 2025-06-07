#import the libraries
library(tidyverse)
library(taylor)

#load in the data
lastfmData <- read.csv("C:\\Users\\theba\\Desktop\\taylor analysis\\honeybeats.csv", header = FALSE)

#rename lastfm columns
lastfmData <- lastfmData %>% rename(
  artist = V1,
  album = V2,
  song = V3,
  date_streamed = V4
)

#turn the stream date into a date object
lastfmData$date_streamed <- dmy_hm(lastfmData$date_streamed)

#get just 2024 and taylor
lastfmData <- lastfmData %>%
  filter(year(date_streamed) == 2024)
lastfmData <- lastfmData %>%
  filter(artist == "Taylor Swift")

#make the album a factor
lastfmData$album <- as.factor(lastfmData$album)

#recode albums to match og, deluxe, extras, chapters, etc
lastfmData$album <- lastfmData$album %>% 
  recode_factor("1989 (Taylor's Version)" = "1989",
                "1989 (Taylor's Version) [Deluxe]" = "1989",
                "All of the Girls You Loved Before" = "Lover",
                "All Too Well (10 Minute Version) (The Short Film)" = "Red",
                "evermore (deluxe version)" = "evermore",
                "Eyes Open (Taylor's Version)" = "Red",
                "Fearless (Taylor's Version)" = "Fearless",
                "folklore (deluxe version)" = "folklore",
                "Hannah Montana The Movie" = "Taylor Swift",
                "If This Was a Movie (Taylor’s Version)" = "Speak Now",
                "Love Story (Taylor’s Version)" = "Fearless",
                "Midnights (3am Edition)" = "Midnights",
                "Midnights (Complete Edition)" = "Midnights",
                "Midnights (The Til Dawn Edition)" = "Midnights",
                "Mr. Perfectly Fine (Taylor’s Version) (From The Vault)" = "Fearless",
                "Red (Deluxe Edition)" = "Red",
                "Red (Taylor's Version)" = "Red",
                "reputation" = "Reputation",
                "Safe & Sound (Taylor's Version)" = "Red",
                "Speak Now (Deluxe Package)" = "Speak Now",
                "Speak Now (Taylor's Version)" = "Speak Now",
                "The Cruelest Summer" = "Lover",
                "The More Fearless (Taylor’s Version) Chapter" = "Speak Now",
                "The More Lover Chapter" = "Lover",
                "THE TORTURED POETS DEPARTMENT: THE ANTHOLOGY" = "THE TORTURED POETS DEPARTMENT",
                "Wildest Dreams (Taylor's Version)" = "1989",
                "You're Losing Me (From the Vault)" = "Midnights",
                "You All Over Me (feat. Maren Morris) (Taylor’s Version) (From The Vault)" = "Fearless")

#keep just the albums
albumsData <- subset(lastfmData, album %in% c("Taylor Swift",
                                            "Fearless",
                                            "Speak Now",
                                            "Red",
                                            "1989",
                                            "Reputation",
                                            "Lover",
                                            "folklore",
                                            "evermore",
                                            "Midnights",
                                            "THE TORTURED POETS DEPARTMENT"))

#remove the other unused levels of the factor
albumsData$album <- factor( albumsData$album )

#get the counts for each album
albumCounts <- albumsData %>% count(album)

#add the weights
albumCounts <- albumCounts %>% mutate(
  weights = case_when(
    album == "Taylor Swift" ~ 1/15,
    album == "Fearless" ~ 1/26,
    album == "Speak Now" ~ 1/23,
    album == "Red" ~ 1/32,
    album == "1989" ~ 1/21,
    album == "Reputation" ~ 1/15,
    album == "Lover" ~ 1/19,
    album == "folklore" ~ 1/17,
    album == "evermore" ~ 1/17,
    album == "Midnights" ~ 1/23,
    album == "THE TORTURED POETS DEPARTMENT" ~ 1/31
  )
)

#multiply the counts by the weights
albumCounts <- albumCounts %>% 
  mutate( weightedCount = n * weights )

#print the album counts
albumCounts %>% arrange( desc(weightedCount) )