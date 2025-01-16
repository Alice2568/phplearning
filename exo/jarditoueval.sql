-- Active: 1733929630764@@127.0.0.1@3306@plouf
DROP DATABASE IF EXISTS plouf;

CREATE DATABASE jarditou_full;

USE jarditou_full;

CREATE TABLE client (
    CliID INT PRIMARY KEY AUTO_INCREMENT,
    Type BIT,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Adresse VARCHAR(100),
    CP CHAR(5),
    Ville VARCHAR(50),
    Tel VARCHAR(10),
    Mail VARCHAR(50)
);

CREATE TABLE commande (
    
)
