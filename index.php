<?php 

include("db1.php");
$db = ConnexionBase();

    // on lance une requête pour chercher toutes les fiches d'artistes
    $requete = $db->query("SELECT * FROM artist");
    // on récupère tous les résultats trouvés dans une variable
    $tableau = $requete->fetchAll(PDO::FETCH_OBJ);
    var_dump($tableau);
    // on clôt la requête en BDD
    $requete->closeCursor();

?>