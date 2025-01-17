<?php
function ConnexionBase(): PDO {

    try 
    {
        $connexion = new PDO('mysql:host=127.0.0.1:3306;charset=utf8;dbname=record',    'admin','Afpa1234');
        $connexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $connexion;

    } catch (Exception $e) {
        echo "Erreur : " . $e->getMessage() . "<br>";
        echo "N° : " . $e->getCode();
        die("Fin du script");
    }
}
?>