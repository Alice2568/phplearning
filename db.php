<?php
$dsn = 'mysql:host=10.119.21.6:3306;dbname=plouf;charset=utf8';
$username = 'stagiaire';
$password = 'Afpa1234';

try {
    $pdo = new PDO($dsn, $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION, // Pour afficher les erreurs en mode exception
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC, // Mode de fetch par défaut
    ]);
    echo "Connexion réussie à la base de données !";
} catch (PDOException $e) {
    echo "Erreur de connexion : " . $e->getMessage();
}
