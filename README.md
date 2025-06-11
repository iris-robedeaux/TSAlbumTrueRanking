# Taylor Swift Album True Ranking
This script calculates a weighted count of listens for each Taylor Swift album based on the length of the albums (for 2024). I noticed that when extracting a pure count of listens based on the albums, it didn't account for how some albums just have more tracks, and so The Tortured Poets Department was always at the top of the list just because it has the most tracks. This code weights those counts based on the number of tracks within each album, then prints the user's ranking. To plug and play this script, use BenjaminBenBen's Last.fm to CSV tool, which will use the same variables used in this script.

# Notes:
- BenjaminBenBen's tool is here: https://benjaminbenben.com/lastfm-to-csv/
- Some liberties were taken with the albums. Eyes Open and Safe and Sound TV's are included in Red, and similarly, All The Girls You Loved Before is included in Lover. These tracks are also included within the album weights.
- If This Was A Movie is included in Speak Now. Live with it.
- The script corrects "albums" like "The More Lover Chapter" and single titles into thier respective albums. This list is likely incomplete, and might need tuning if you listen to the single releases a lot. If you do add some, send a pull request!
- Taylor's Versions are combined with the original versions of the applicable albums.

# Sample Output
Below is my own output for 2024. The album name is listed, 'n' the raw number of streams (every listen to a song on that album), the weights are 1/(number of tracks on the album), and the weighted count is the n multiplied by the weights, essentially the number of times an album was streamed front to back. 

|album|n|weights|weightedCount|
|---|---|---|---|
|THE TORTURED POETS DEPARTMENT|1132|0.03225806|36.516129
|evermore|371|0.05882353|21.823529
|1989|335|0.04761905|15.952381
|Midnights|360|0.04347826|15.652174
|Speak Now|282|0.04347826|12.260870
|Reputation|166|0.06666667|11.066667
|folklore|180|0.05882353|10.588235
|Fearless|227|0.03846154|8.730769
|Lover|164|0.05263158|8.631579
|Red|265|0.03125000|8.281250
|Taylor Swift|111|0.06666667|7.400000
