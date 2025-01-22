<?php
// Récupération et validation des données du formulaire
$id = (isset($_POST['id']) && is_numeric($_POST['id'])) ? intval($_POST['id']) : null;
$nom = (isset($_POST['nom']) && trim($_POST['nom']) != "") ? trim($_POST['nom']) : null;
$url = (isset($_POST['url']) && filter_var($_POST['url'], FILTER_VALIDATE_URL)) ? trim($_POST['url']) : null;

// Redirection en cas d'erreur
if ($id === null) {
    header("Location: artists.php");
    exit;
}
if ($nom === null || $url === null) {
    header("Location: artist_form_error.php?id=" . $id);
    echo "tous les champs doivent être remplis.";
    exit;
}

// Connexion à la base de données
require "db.php";
$db = connexionBase();

try {
    // Préparation et exécution de la requête SQL
    $requete = $db->prepare("
        UPDATE artist 
        SET artist_name = :nom, artist_url = :url 
        WHERE artist_id = :id;
    ");
    $requete->bindValue(":id", $id, PDO::PARAM_INT);
    $requete->bindValue(":nom", $nom, PDO::PARAM_STR);
    $requete->bindValue(":url", $url, PDO::PARAM_STR);
    $requete->execute();
    $requete->closeCursor();
} catch (Exception $e) {
    // Gestion des erreurs
    echo "Erreur : " . $e->getMessage() . "<br>";
    die("Fin du script (script_artist_modif.php)");
}

// Redirection après succès
header("Location: artist_detail.php?id=" . $id);
exit;
