# SPOTIFY_DB
## overview 
This project is about analyzing a Spotify dataset using MySQL. I wrote different queries to answer questions about the data, such as finding popular tracks, checking artist performance, and exploring genre trends. The aim is to practice SQL skills and show how databases can be used to get useful insights from real-world music data.

project category: Advanced
click here to get the dataset:[Click Here to get Dataset](https://www.kaggle.com/datasets/sanjanchaudhari/spotify-dataset)
![Spotify Logo](https://github.com/najirh/najirh-Spotify-Data-Analysis-using-SQL/blob/main/spotify_logo.jpg)


## Project Steps

### 3. Data Exploration
Before diving into SQL, it’s important to understand the dataset thoroughly. The dataset contains attributes such as:
- `Artist`: The performer of the track.
- `Track`: The name of the song.
- `Album`: The album to which the track belongs.
- `Album_type`: The type of album (e.g., single or album).
- Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.

### 4. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium**, and **advanced** levels to help progressively develop SQL proficiency.

#### Easy Queries
- Simple data retrieval, filtering, and basic aggregations.
  
#### Medium Queries
- More complex queries involving grouping, aggregation functions, and joins.
  
#### Advanced Queries
- Nested subqueries, window functions, CTEs, and performance optimization.

### 5. Query Optimization
In advanced stages, the focus shifts to improving query performance. Some optimization strategies include:
- **Indexing**: Adding indexes on frequently queried columns.
- **Query Execution Plan**: Using `EXPLAIN ANALYZE` to review and refine query performance.


  ## 13 Practice Questions

### Easy Level
1. Retrieve the names of all tracks that have more than 1 billion streams.
'''sql
   select *
from spotify
where stream > 1000000000;
'''
2. List all albums along with their respective artists.
   '''sql
    select distinct
album,artist
from spotify
order by 2;
'''
3.Get the total number of comments for tracks where `licensed = TRUE`.
***sql
select 
sum(comments) as total_comments
from spotify
where Licensed = 'TRUE';
***

4. Find all tracks that belong to the album type `single`.
'''sql
  select*from spotify
where album_type = 'single';
'''

'''sql
4. Count the total number of tracks by each artist.
select 
artist,
count(*) as total_no_songs
from spotify
group by 1;

'''



### Medium Level
1. Calculate the average danceability of tracks in each album.
'''sql
   select 
album,
avg(danceability) as avg_danceability
 from spotify
 group by 1
 order by 2 desc;

   '''


2. Find the top 5 tracks with the highest energy values.
   '''sql
   select 
 track,
max(energy)
 from spotify
 group by 1
 order by 2 desc
 limit 5; 
'''

3. List all tracks along with their views and likes where `official_video = TRUE`.
4. For each album, calculate the total views of all associated tracks.
'''sql
   select 
album,track,
sum(views) as total_views
from spotify
group by 1,2
order by 3 desc;
   '''


5. Retrieve the track names that have been streamed on Spotify more than YouTube.

'''sql
select *from 
(select 
track,
-- most_playedon,
coalesce(sum(case when most_playedon = 'youtube' then stream end),0) as streamed_on_youtube,
coalesce(sum(case when most_playedon = 'spotify' then stream end),0)as streamed_on_spotify
from spotify
group by 1
)
as t1
where 
streamed_on_spotify >  streamed_on_youtube;
'''




### Advanced Level
1. Find the top 3 most-viewed tracks for each artist using window functions.
'''sql
with artist_ranking
as
(select 
 artist, 
 Track,
 sum(views) as most_viewed,
 dense_rank() over(partition by Artist order by sum(views) desc) as ranking
from spotify
group by 1,2
order by 1,3 desc
)
select*from artist_ranking
where ranking <= 3;

'''
3. Write a query to find tracks where the liveness score is above the average.
4. **Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.**
```sql





















