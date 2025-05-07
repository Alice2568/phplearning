-- Active: 1733929630764@@127.0.0.1@3306@exemple
SELECT * FROM employe;

SELECT * FROM dept;

SELECT employe.nom, employe.dateemb, employe.nosup, employe.nodep, employe.salaire FROM employe;

SELECT DISTINCT * FROM employe;

SELECT DISTINCT employe.titre FROM employe;

SELECT employe.nom, employe.noemp, employe.nodep FROM employe
WHERE employe.titre = 'secrétaire';

SELECT employe.nom, employe.nodep FROM employe WHERE employe.nodep > 40;

SELECT employe.nom, employe.prenom FROM employe WHERE employe.nom < employe.prenom;

SELECT employe.nom, employe.salaire, employe.nodep FROM employe WHERE titre = 'Représentant' AND employe.nodep = 35 AND salaire > 20000;

SELECT employe.nom, employe.salaire, employe.titre FROM employe WHERE titre = "Représentant" OR titre = 'Président';

SELECT employe.nom, employe.salaire, employe.titre, employe.nodep FROM employe WHERE nodep = 34 AND titre = 'Représentant' OR titre = 'Secrétaire';

SELECT employe.salaire, employe.nom FROM employe WHERE salaire BETWEEN 20000 AND 30000;

SELECT employe.nom FROM employe WHERE nom LIKE 'H%';

SELECT employe.nom FROM employe WHERE nom LIKE '%n';

SELECT employe.nom FROM employe WHERE nom LIKE '__u%';

SELECT employe.salaire, employe.nom FROM employe WHERE nodep = 41 ORDER BY salaire ASC ;

SELECT employe.salaire, employe.nom FROM employe WHERE nodep = 41 ORDER BY salaire DESC;

SELECT employe.nom, employe.salaire, employe.titre FROM employe ORDER BY titre ASC, salaire DESC;

SELECT employe.tauxcom, employe.nom, employe.salaire FROM employe ORDER BY tauxcom ASC;

SELECT employe.tauxcom, employe.nom, employe.salaire FROM employe WHERE tauxcom IS NULL;

SELECT employe.tauxcom, employe.nom, employe.salaire FROM employe WHERE tauxcom IS NOT NULL;

SELECT employe.tauxcom, employe.nom, employe.salaire FROM employe WHERE tauxcom < 15;

SELECT employe.tauxcom, employe.nom, employe.salaire FROM employe WHERE tauxcom > 15;

SELECT employe.nom, employe.salaire, employe.tauxcom, employe.salaire * employe.tauxcom FROM employe WHERE tauxcom IS NOT NULL;

SELECT employe.nom, employe.salaire, employe.tauxcom, employe.salaire * employe.tauxcom AS commission FROM employe WHERE tauxcom IS NOT NULL ORDER BY commission ASC ;

SELECT CONCAT (employe.nom, employe.prenom) AS nomprenom FROM employe;
SELECT SUBSTRING (employe.nom, 1, 5) FROM employe;
SELECT LOCATE ('r', employe.nom) FROM employe;
SELECT UPPER ('Vrante'), LOWER ('Vrante');
SELECT LENGTH(employe.nom), employe.nom FROM employe; 

SELECT employe.prenom, dept.noregion FROM employe, dept;
SELECT dept.nodept, dept.nom, employe.nom AS exo FROM dept, employe ORDER By dept.nodept ASC ;
SELECT employe.nom FROM employe, dept WHERE dept.nom = 'Distribution';
SELECT employe.nom, employe.titre FROM employe, dept WHERE titre in (SELECT titre from employe WHERE nom ='Amartakaldire');
SELECT employe.nom, employe.salaire, employe.nodep FROM employe WHERE salaire IN (SELECT  salaire FROM employe WHERE nodep = 31) ORDER BY salaire ASC, nodep ASC;
SELECT employe.nom, employe.salaire, employe.nodep FROM employe WHERE salaire NOT IN (SELECT  salaire FROM employe WHERE nodep = 31) ORDER BY salaire ASC, nodep ASC;
