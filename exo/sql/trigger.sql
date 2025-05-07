
-- Active: 1733929630764@@127.0.0.1@3306@papyrus
ALTER TABLE entcom ENGINE=InnoDB;

DELIMITER |
CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW 
    BEGIN
    DECLARE altitude INT;
    SET altitude = NEW.sta_altitude;
        IF altitude<1000 
            THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
    END |;

DELIMITER ;
  insert into station (sta_nom, sta_altitude) values ('station du bas', 666);
DELIMITER |
CREATE TRIGGER modif_reservation BEFORE UPDATE ON hotel.reservation
FOR EACH ROW 
BEGIN
    SIGNAL SQLSTATE '40000' 
    SET MESSAGE_TEXT = 'Un problème est survenu. Modification interdite !';
END ;

DELIMITER ; 

UPDATE reservation SET res_cli_id= 6 WHERE res_cli_id = 7;

CREATE TRIGGER insert_reservation BEFORE INSERT ON hotel.reservation
FOR EACH ROW 
BEGIN 
    DECLARE nb_resa INT;
    SELECT COUNT(hotel.reservation.res_cha_id) INTO nb_resa
    FROM reservation JOIN chambre ON cha_id = res_cha_id JOIN hotel ON hot_id = cha_hot_id WHERE res_cha_id = NEW.res_cha_id;

IF nb_resa >= 3 THEN
        SIGNAL SQLSTATE '40000'
        SET MESSAGE_TEXT = 'Limite de 10 réservations atteinte.';
    END IF;
END; 
DELIMITER ;
INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES (3, 3, '2017-01-10', '2017-07-01', '2017-07-15', 2400, 800);

DROP TRIGGER insert_chambre;
CREATE TRIGGER insert_chambre BEFORE INSERT ON hotel.chambre
FOR EACH ROW 
BEGIN 
    DECLARE nb_cha_hot INT;
    SELECT COUNT(*) INTO nb_cha_hot
    FROM chambre WHERE cha_hot_id = NEW.cha_hot_id;

IF nb_cha_hot >= 10 THEN
        SIGNAL SQLSTATE '40000'
        SET MESSAGE_TEXT = 'Limite de 10 chambres atteinte.';
    END IF;
END; 
DELIMITER ;
INSERT INTO chambre (cha_numero, cha_hot_id, cha_capacite, cha_type) VALUES (203, 1, 5, 1);

-- trigger sur la database cp
DELIMITER |
CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = NEW.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum((prix*quantite)-10/100) FROM lignedecommande WHERE id_commande=id_c); -- on recalcule le total
        -- SET tot = ??? (prévoir le calcul de la remise) 
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
    END;

DELIMITER ;
DROP TRIGGER maj_total;
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (2, 3, 10, 2);
CREATE TRIGGER maj_total_delete AFTER DELETE ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum((prix*quantite)-10/100) FROM lignedecommande WHERE id_commande=id_c); -- on recalcule le total
        -- SET tot = ??? (prévoir le calcul de la remise) 
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
    END;

DELIMITER ;

DELETE FROM lignedecommande WHERE id_commande = 2 AND id_produit =3;

CREATE TRIGGER maj_total_UPDATE AFTER UPDATE ON lignedecommande
    FOR EACH ROW
    BEGIN
    DECLARE id_c INT;
    DECLARE tot DOUBLE;
    SET id_c = OLD.id_commande; -- nous captons le numéro de commande concerné
    SET tot = (SELECT sum((prix*quantite)-10/100) FROM lignedecommande WHERE id_commande=id_c); -- on recalcule le total
        -- SET tot = ??? (prévoir le calcul de la remise) 
    UPDATE commande SET total=tot WHERE id=id_c; -- on stocke le total dans la table commande
    END;

    --phase 2 : trigger sur la table papyrus
USE papyrus;
CREATE TABLE ARTICLES_A_COMMANDER (
    CODART VARCHAR(50),
    Date_a_com DATETIME DEFAULT NOW(),
    QTE DOUBLE,
    FOREIGN KEY (CODART) REFERENCES produit(codart)
)

DELIMITER //

CREATE TRIGGER Alert_command_produit
AFTER UPDATE ON produit
FOR EACH ROW
BEGIN
    DECLARE alertstk INT;
    DECLARE stk_a_comm INT;

    SET alertstk = NEW.stkphy;
    SET stk_a_comm = NEW.stkale - NEW.stkphy;

    IF alertstk <= NEW.stkale THEN
        INSERT INTO ARTICLES_A_COMMANDER (CODART, QTE)
        VALUES (NEW.codart, stk_a_comm);
    END IF;
END;
//
DROP TRIGGER Alert_command_produit;
DELIMITER; 
UPDATE produit 
SET stkphy = 5
WHERE produit.codart ='I110';
DELIMITER //

CREATE TRIGGER Alert_ss
AFTER UPDATE ON produit
FOR EACH ROW
BEGIN
    DECLARE stk_a_comm INT;

    -- Calcul de la quantité à commander
    IF NEW.stkphy <= NEW.stkale THEN
        SET stk_a_comm = NEW.stkale - NEW.stkphy;

        -- Insertion ou mise à jour dans la table de commande
        INSERT INTO ARTICLES_A_COMMANDER (CODART, QTE)
        VALUES (NEW.codart, stk_a_comm)
        ON DUPLICATE KEY UPDATE
        QTE = stk_a_comm;
    END IF;
END;
//

DELIMITER ;


DROP TRIGGER Alert_ss;
--test trigger sans repetition d'alerte commande
DELIMITER //
CREATE TRIGGER Alert_command_produit_ss
AFTER UPDATE ON produit
FOR EACH ROW
BEGIN
    DECLARE alertstk INT;
    DECLARE stk_a_comm INT;

    SET alertstk = NEW.stkphy;
    SET stk_a_comm = NEW.stkale - NEW.stkphy;

    IF alertstk <= NEW.stkale THEN
        IF (NEW.codart = codart )
        THEN   SET stk_a_comm = NEW.stk_a_comm
             END IF ;
       INSERT INTO ARTICLES_A_COMMANDER (CODART, QTE)
        VALUES (NEW.codart, stk_a_comm);
    END IF;
END;
//

DELIMITER; 
DROP TRIGGER Alert_command_produit_ss;