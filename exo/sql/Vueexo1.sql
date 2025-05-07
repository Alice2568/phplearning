-- Active: 1733929630764@@127.0.0.1@3306@hotel
CREATE VIEW Stations 
AS SELECT * FROM station;
CREATE VIEW HOTELS AS SELECT * FROM  hotel;
CREATE VIEW RESERV° AS SELECT reservation.*, client.cli_nom FROM reservation, client ORDER BY cli_nom ASC;
CREATE VIEW CHA_HOT_STA AS SELECT chambre.*, hotel.hot_nom, station.sta_nom FROM chambre JOIN hotel ON hot_id=cha_hot_id JOIN station ON sta_id=hot_sta_id ;
CREATE VIEW RESAS AS SELECT reservation.*, client.cli_nom, hotel.hot_nom FROM client JOIN reservation ON res_cli_id=cli_id JOIN chambre ON cha_id = res_cha_id JOIN hotel ON hot_id= cha_hot_id ;