-- Active: 1733929630764@@127.0.0.1@3306@hotel
SELECT hot_nom, hot_ville FROM hotel;
SELECT client.cli_adresse, client.cli_nom, client.cli_prenom FROM client WHERE cli_nom = 'White';
SELECT station.sta_altitude, station.sta_nom FROM station WHERE sta_altitude > 1000;
SELECT chambre.cha_capacite,chambre.cha_numero FROM chambre WHERE cha_capacite >1;
SELECT client.cli_nom, client.cli_ville FROM client WHERE cli_ville != 'Londre';
SELECT hot_categorie, hot_nom, hot_ville FROM hotel wHERE hot_categorie > 3;
SELECT hot_nom, hot_categorie, hot_ville, sta_nom FROM hotel, station ;
SELECT chambre.cha_numero, hotel.hot_nom, hotel.hot_ville, hotel.hot_categorie FROM hotel, chambre;
SELECT chambre.cha_numero, hotel.hot_nom, hotel.hot_ville, hotel.hot_categorie, cha_capacite FROM hotel, chambre WHERE cha_capacite >1;
SELECT hotel.hot_nom, client.cli_nom, reservation.res_date FROM client, hotel, reservation ;
SELECT chambre.cha_capacite, chambre.cha_numero, hotel.hot_nom, station.sta_nom FROM chambre, station, hotel ;
SELECT hotel.hot_nom, client.cli_nom,reservation.res_date_debut, DATEDIFF(reservation.res_date_fin, reservation.res_date_debut) FROM client, hotel, reservation;
SELECT COUNT(hotel.hot_nom) FROM station, hotel;
SELECT COUNT(chambre.cha_id) FROM station, hotel, chambre;
SELECT COUNT(chambre.cha_id) FROM station, hotel, chambre WHERE cha_capacite >1;
SELECT hotel.hot_nom FROM station, hotel, client, reservation WHERE cli_nom ='Squire';
SELECT AVG(DATEDIFF(reservation.res_date_fin,reservation.res_date_debut)) AS duree_moyenne, station.sta_nom FROM reservation, station GROUP BY sta_nom;