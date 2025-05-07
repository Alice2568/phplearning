-- Active: 1733929630764@@127.0.0.1@3306@papyrus
SELECT * FROM entcom where  numfou = 09120;
SELECT entcom.numfou FROM entcom ;
SELECT COUNT(*) AS nb_commande, COUNT (DISTINCT numfou) AS nb_fourni FROM entcom;
SELECT codart, libart, stkphy, stkale, qteann FROM produit WHERE  qteann <1000 AND stkphy <= stkale;
SELECT fournis.nomfou, posfou FROM fournis WHERE posfou LIKE '75%' OR posfou LIKE '78%' OR posfou LIKE '92%' OR posfou LIKE '77%' ORDER BY posfou, nomfou ASC;
SELECT * FROM entcom WHERE MONTH(datcom) IN (3,4);
SELECT entcom.numcom, datcom, obscom FROM entcom WHERE obscom IS NOT NULL AND obscom <>'';
SELECT ligcom.numcom, SUM (ligcom.qtecde*ligcom.priuni) AS Total FROM ligcom WHERE (SELECT SUM(ligcom.qtecde*ligcom.priuni)) > 1000000 AND qtecde >= 1000 GROUP BY numcom ORDER BY Total DESC;
SELECT nomfou, entcom.datcom, entcom.numcom FROM entcom, fournis ORDER BY nomfou;
SELECT ligcom.codart, produit.libart FROM entcom, produit, ligcom WHERE obscom LIKE '%urgent%';
SELECT ligcom.codart, produit.libart, entcom.numcom, nomfou, SUM ( qtecde * priuni) AS SS_Total FROM entcom JOIN ligcom ON entcom.numcom = ligcom.numcom
JOIN produit ON produit.codart = ligcom.codart
JOIN fournis ON fournis.numfou = entcom.numfou WHERE obscom LIKE '%urgent%'
GROUP BY 
  ligcom.codart, 
  produit.libart, 
  entcom.numcom, 
  nomfou;
  SELECT numfou FROM vente WHERE qte1 >=1 OR qte2 >=1 OR qte3 >=1 GROUP BY numfou;
  SELECT entcom.datcom, entcom.numcom FROM entcom WHERE entcom.numfou =( SELECT numfou FROM entcom WHERE numcom = 70210);
  SELECT produit.libart, vente.prix1 FROM produit, vente WHERE prix1 < (SELECT MIN(prix1) FROM vente JOIN produit ON vente.codart = produit.codart WHERE libart LIKE 'R%' );
  SELECT fournis.nomfou, produit.libart FROM produit JOIN vente ON vente.codart = produit.codart JOIN fournis ON fournis.numfou = vente.numfou WHERE produit.stkphy <= 1.5* stkale ORDER BY produit.libart, nomfou;
  SELECT fournis.nomfou, produit.libart FROM produit JOIN vente ON vente.codart = produit.codart JOIN fournis ON fournis.numfou = vente.numfou WHERE produit.stkphy <= 1.5* stkale AND vente.delliv < 30 ORDER BY  nomfou, produit.libart;
SELECT fournis.nomfou, COUNT(vente.qte1+vente.qte2+vente.qte3) AS QTE FROM fournis JOIN vente ON vente.numfou = fournis.numfou JOIN produit ON produit.codart = vente.codart Where produit.stkphy <= 1.5* stkale AND vente.delliv < 30 ORDER BY nomfou, QTE DESC;
SELECT fournis.nomfou, produit.libart, SUM(vente.qte1+vente.qte2+vente.qte3) AS QTETT FROM produit JOIN vente ON vente.codart = produit.codart JOIN fournis ON fournis.numfou = vente.numfou WHERE produit.stkphy <= 1.5* stkale AND vente.delliv < 30 ORDER BY  nomfou, produit.libart, QTETT DESC ;
SELECT p.libart
FROM produit p
JOIN ligcom l ON p.codart = l.codart
GROUP BY p.codart, p.qteann, p.libart
HAVING SUM(l.qtecde) > 0.9 * p.qteann;
SELECT fournis.nomfou, SUM(vente.prix1 * ligcom.qteliv * 1.2) AS chiffre_affaire_TTC
FROM vente 
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON entcom.numfou = fournis.numfou
WHERE YEAR(entcom.datcom) = 2020 
GROUP BY fournis.nomfou;
SELECT * FROM entcom WHERE YEAR(datcom) = 1993;