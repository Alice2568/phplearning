-- Active: 1733929630764@@127.0.0.1@3306@papyrus
DELIMITER |
CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT entcom.numfou FROM entcom ;
END |
DELIMITER ;
CALL `Lst_fournis`;
SHOW CREATE PROCEDURE Lst_fournis;

DELIMITER | 
CREATE PROCEDURE Lst_Commandes(IN coms VARCHAR(50))
BEGIN
    SELECT ligcom.codart, produit.libart, entcom.numcom, nomfou, SUM ( qtecde * priuni) AS SS_Total FROM entcom JOIN ligcom ON entcom.numcom = ligcom.numcom
JOIN produit ON produit.codart = ligcom.codart
JOIN fournis ON fournis.numfou = entcom.numfou WHERE obscom LIKE coms
GROUP BY 
  ligcom.codart, 
  produit.libart, 
  entcom.numcom, 
  nomfou;
END |

DELIMITER ;
SHOW CREATE PROCEDURE Lst_Commandes;
CALL `Lst_Commandes`('%urgent%');
DROP PROCEDURE `Lst_Commandes`;
DELIMITER |
CREATE PROCEDURE CA_Fournisseur(
    IN annéeca INT,
    IN codfou INT
)
BEGIN
SELECT fournis.nomfou, SUM(vente.prix1 * ligcom.qteliv * 1.2) AS chiffre_affaire_TTC
FROM vente 
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON entcom.numfou = fournis.numfou
WHERE YEAR(entcom.datcom) = annéeca AND fournis.numfou = codfou
GROUP BY fournis.nomfou;
END |
DELIMITER ;
CALL `CA_Fournisseur`(2020, 540);
DROP PROCEDURE `CA_Fournisseur`;
SELECT fournis.nomfou, SUM(vente.prix1 * ligcom.qteliv * 1.2) AS chiffre_affaire_TTC
FROM vente 
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON entcom.numfou = fournis.numfou
WHERE YEAR(entcom.datcom) = 2020 AND fournis.numfou = 540
GROUP BY fournis.nomfou;