/*
=================================================
Milestone 1

Nama  : Putri Joeliya
Batch : CODA-RMT-020
program ini di buat melakukan proses normalisasi pada database games fps, 
melakukan staging data, DQl dan data export.
=================================================
*/

-- membuat database
CREATE DATABASE data_game_fps;

--membuat tabel staging untuk melakukan normalisasi 
CREATE TABLE fps_games_staging (
	game_name VARCHAR(225),
	price VARCHAR(50),
	rating VARCHAR(50),
	release_date DATE,
	developer VARCHAR(225)
);

-- import file csv 
COPY fps_games_staging (game_name, price, rating, release_date, developer)
FROM 'C:\TMP\coda_P0M1_Putri_Joeliya.csv'
DELIMITER ','
CSV HEADER;

-- membuat tabel untuk ID developer 
CREATE TABLE developers (
	developer_id SERIAL PRIMARY KEY,
	developer_name VARCHAR(225) UNIQUE
);

-- membuat tabel untuk ID rating 
CREATE TABLE ratings (
	rating_id SERIAL PRIMARY KEY,
	rating_name VARCHAR(225) UNIQUE
);

-- membuat tabel final 
CREATE TABLE fps_games (
	game_id SERIAL PRIMARY KEY,
	game_name VARCHAR(255),
	price VARCHAR(50),
	release_date DATE,
	developer_id INT,
	rating_id INT,
	CONSTRAINT fk_developer FOREIGN KEY (developer_id) REFERENCES developers(developer_id),
	CONSTRAINT fk_rating FOREIGN KEY (rating_id) REFERENCES ratings(rating_id)
);

-- proses menormalisasikan kolom developer 
INSERT INTO developers (developer_name)
SELECT DISTINCT developer
FROM fps_games_staging
ON CONFLICT (developer_name) DO NOTHING;

-- proses menormalisasikan kolom rating
INSERT INTO ratings(rating_name)
SELECT DISTINCT rating 
FROM fps_games_staging 
WHERE rating IS NOT NULL 
AND rating <> '';

-- menggabungkan seluruh data atau membuat finalisasi setelah data di normalisasi 
INSERT INTO fps_games (game_name, price, release_date, developer_id, rating_id)
SELECT
    f.game_name,
    f.price,
    f.release_date,
    d.developer_id,
    r.rating_id
FROM fps_games_staging f
INNER JOIN developers d ON f.developer = d.developer_name
INNER JOIN ratings r ON f.rating = r.rating_name;




SELECT * FROM fps_games;
SELECT * FROM developers;
SELECT * FROM fps_games_staging;
SELECT * FROM ratings;

DROP TABLE fps_games;
DROP TABLE developers;
DROP TABLE fps_games_staging;
DROP TABLE ratings;
