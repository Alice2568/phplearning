-- Active: 1733929630764@@127.0.0.1@3306@papyrus
CREATE VIEW V_GlobalCde AS SELECT ligcom.codart, SUM(ligcom.qtecde) AS QteTot, SUM(ligcom.qtecde * ligcom.priuni) AS PrixTot FROM ligcom GROUP BY ligcom.codart;
CREATE VIEW v_VentesI100 AS SELECT vente.* FROM vente WHERE codart = 'I100';
CREATE VIEW v_VentesI100Grobrigan AS SELECT vente.* FROM vente JOIN fournis ON fournis.numfou=vente.numfou WHERE codart = 'I100'AND fournis.numfou = 00120;