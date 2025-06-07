# Taylor Swift Album True Ranking
This script calculates a weighted count of listens for each Taylor Swift album based on the length of the albums. I noticed that when extracting a pure count of listens based on the albums, it didn't account for how some albums just have more tracks, and so The Tortured Poets Department was always at the top of the list just because it has the most tracks. This code weights those counts based on the number of tracks within each album, then prints the user's ranking. To plug and play this script, use BenjaminBenBen's Last.fm to CSV tool, which will use the same variables used in this script.

# Notes:
- BenjaminBenBen's tool is here: https://benjaminbenben.com/lastfm-to-csv/
- Some liberties were taken with the albums. Eyes Open and Safe and Sound TV's are included in Red, and similarly, All The Girls You Loved Before is included in Lover. These tracks are also included within the album weights.
- If This Was A Movie is included in Speak Now. Live with it.
- The script corrects "albums" like "The More Lover Chapter" and single titles into thier respective albums. This list is likely incomplete, and might need tuning if you listen to the single releases a lot. If you do add some, send a pull request!
