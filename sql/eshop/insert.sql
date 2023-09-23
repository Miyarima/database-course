DELETE FROM `kategori_rader`;
DELETE FROM `hylla_rader`;
DELETE FROM `lager`;
DELETE FROM `kategori`;
DELETE FROM `produkt`;
DELETE FROM `kund`;

---------------------------------------
-- Enable LOAD DATA LOCAL INFILE on the server.
---------------------------------------
SET GLOBAL local_infile = 1;

---------------------------------------
-- Insert into kund.
---------------------------------------
LOAD DATA LOCAL INFILE 'kund.csv'
INTO TABLE `kund`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`fornamn`, `efternamn`, `adress`, `postnummer`, `ort`, `land`, `telefon`)
;

-- SELECT * FROM `kund`;

---------------------------------------
-- Insert into produkt.
---------------------------------------
LOAD DATA LOCAL INFILE 'produkt.csv'
INTO TABLE `produkt`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`produkt_kod`, `pris`, `namn`, `bildlank`, `beskrivning`)
;

-- SELECT * FROM `produkt`;

---------------------------------------
-- Insert into kategori.
---------------------------------------
LOAD DATA LOCAL INFILE 'kategori.csv'
INTO TABLE `kategori`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
;

-- SELECT * FROM `kategori`;

---------------------------------------
-- Insert into hylla.
---------------------------------------
LOAD DATA LOCAL INFILE 'lager.csv'
INTO TABLE `hylla`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`namn`)
;

-- SELECT * FROM `hylla`;

---------------------------------------
-- Insert into lager.
---------------------------------------
LOAD DATA LOCAL INFILE 'lager.csv'
INTO TABLE `lager`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`hylla`)
;

-- SELECT * FROM `lager`;

---------------------------------------
-- Insert into kategori_rader.
---------------------------------------
LOAD DATA LOCAL INFILE 'produkt2kategori.csv'
INTO TABLE `kategori_rader`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`produkt_id`, `kategori_namn`)
;

-- SELECT * FROM `kategori_rader`;

---------------------------------------
-- Insert into hylla_rader.
---------------------------------------
LOAD DATA LOCAL INFILE 'produkt2lager.csv'
INTO TABLE `hylla_rader`
CHARSET utf8
FIELDS
    TERMINATED BY ','
    ENCLOSED BY '"'
LINES
    TERMINATED BY '\n'
IGNORE 1 LINES
(`produkt_id`, `antal`, `hylla_namn`)
;

-- SELECT * FROM `hylla_rader`;