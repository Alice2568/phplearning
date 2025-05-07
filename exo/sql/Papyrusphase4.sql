-- Active: 1733929630764@@127.0.0.1@3306@papyrus
UPDATE vente SET prix1 = prix1 * 1.04, prix2 = prix2 *1.02 WHERE numfou = 9180;
UPDATE vente SET prix2 = prix1 WHERE prix2=0;
UPDATE entcom JOIN fournis ON entcom.numfou=fournis.numfou SET obscom ='*****' WHERE fournis.satisf <5;
DELETE FROM ligcom WHERE codart = 'I110';
DELETE FROM vente WHERE codart = 'I110';
DELETE FROM produit WHERE codart = 'I110';