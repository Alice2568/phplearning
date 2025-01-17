-- Active: 1736869092207@@127.0.0.1@3306
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

CREATE TABLE fournisseur (
    FouID INT PRIMARY KEY AUTO_INCREMENT,
    Nom VARCHAR(50),
    Adresse VARCHAR(100),
    CP CHAR(5),
    Ville VARCHAR(50),
    Tel VARCHAR(10),
    Mail VARCHAR(50),
    Type BIT(1)
);

CREATE TABLE rubrique (
    RubID INT,
    Libelle VARCHAR(50)
);

CREATE TABLE produit (
    ProCode CHAR(6),
    Libelle VARCHAR(100),
    Description VARCHAR(250),
    Photo VARCHAR(250),
    Affichage BIT(1),
    PrixAchat INT,
    StockPhysique INT,
    StockAlerte INT,
    fournisseur_id INT,
    rubrique_id INT
)

CREATE TABLE panier (
    compQuantiteProduit INT,
    compPrixVentePar FLOAT,
    compPrixVentePro FLOAT,
    produit CHAR,
    commande INT
)

CREATE TABLE commande (
    ComID INT,
    DateCommande DATE,
    DateLivraison DATE,
    EtatCommande VARCHAR(25),
    EditionFacture BIT(1),
    client_id INT
)
