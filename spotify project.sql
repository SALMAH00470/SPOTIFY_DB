-- spotify project
drop table if exists spotify;
create table spotify
(
Artist varchar(260),
Track varchar(240),	
Album	varchar(250),
Album_type varchar(260),
Danceability float,	
Energy float,
Loudness float,
Speechiness float,	
Acousticness float,	
Instrumentalness float,	
energy_Liveness float,	
Valence float,	
Tempo float,
Duration_min float,	
Title varchar(260),	
Channel	varchar(260),
Views float,
Likes bigint,
Comments bigint,
Licensed varchar(6),
official_video varchar(6),	
Stream bigint,	
EnergyLiveness float,	
most_playedon varchar(60) 
);

-- EDA
select count(distinct artist)
from spotify;

select count(distinct album)from spotify;

select distinct Album_type from spotify;

select min(Duration_min)  from spotify;

select distinct channel from spotify;

select distinct most_playedon from spotify;

-----------------------------
---- data analysis = easy category
-- Q1.  retrive the names of all tracks that have over one billion streams

select *
from spotify
where stream > 1000000000;

-- Q2. list all albums along with their respective artist

select distinct
album,artist
from spotify
order by 2;

-- Q3. get the total number of comments where the licensed = TRUE
select 
sum(comments) as total_comments
from spotify
where Licensed = 'TRUE';

-- Q4..find all the tracks that belong to the album type single
select*from spotify
where album_type = 'single';

-- Q5. count the total number of track by each artist

select 
artist,
count(*) as total_no_songs
from spotify
group by 1;

-----------------------------------
-- medium level
-- Q6. calc the average Danceability of tracks in each album

select 
album,
avg(danceability) as avg_danceability
 from spotify
 group by 1
 order by 2 desc;
 
 -- Q7. find the top 5 tracks with the highest energy value
 
 select 
 track,
max(energy)
 from spotify
 group by 1
 order by 2 desc
 limit 5; 
 
 -- Q8. list all the tracks along with their views and likes where official video = 'TRUE'
 
 select
 track,
 sum(views) as total_views,
 sum(likes) as total_likes
from spotify
where official_video = 'true'
group by 1
order by 2 desc
limit 5;

























