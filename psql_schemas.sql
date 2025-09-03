DROP TABLE IF EXISTS anime_dataset CASCADE;
CREATE TABLE anime_dataset (
    AID int4 PRIMARY KEY,
    Title text, 
    Rank int4, 
    Type varchar(32), 
    Episodes varchar(8), 
    Aired varchar(64), 
    Members int4,
    page_url text, 
    image_url text, 
    Score float4
);

DROP TABLE IF EXISTS manga_dataset CASCADE;
CREATE TABLE manga_dataset (
    MID int4 PRIMARY KEY,
    Title text, 
    Rank int4, 
    Type varchar(32), 
    Volumes varchar(16), 
    Published varchar(64), 
    Members int4,
    page_url text, 
    image_url text, 
    Score float4
)