<?php
/*function ConnexionBase() {*/

    try 
    {
        $connexion = new PDO('mysql:host=10.119.21.6:3306;dbname=plouf;charset=utf8', 'stagiaire', 'Afpa1234');
        $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $connexion;
        echo "ça marche";

    } catch (Exception $e) {
        echo "Erreur : " . $e->getMessage() . "<br>";
        echo "N° : " . $e->getCode();
        die("Fin du script");
    }
/*}*/
?>