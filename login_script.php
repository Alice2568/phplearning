<?php 
session_start();

$bdd = new PDO('mysql:host=127.0.0.1:3306;charset=utf8;dbname=Espace_Membres','admin','Afpa1234');

if (isset($_POST['inscription'])) {
    if (!empty($_POST['email']) && !empty($_POST['mdp']) && !empty($_POST['prenom']) && !empty($_POST['nom'])) {
        $email = htmlspecialchars($_POST['email']);
        $mdp = password_hash($_POST['mdp'], PASSWORD_DEFAULT); // Plus sécurisé
        $prenom = htmlspecialchars($_POST['prenom']);
        $nom = htmlspecialchars($_POST['nom']);

        // Vérifier si l'utilisateur existe déjà
        $checkUser = $bdd->prepare('SELECT * FROM Membres WHERE email = ?');
        $checkUser->execute([$email]);

        if ($checkUser->rowCount() == 0) {
            // Insérer l'utilisateur
            $insertUser = $bdd->prepare('INSERT INTO Membres(nom, prénom, email, mdp) VALUES(?, ?, ?, ?)');
            $insertUser->execute([$nom, $prenom, $email, $mdp]);

            echo "Inscription réussie !";
        } else {
            echo "Cet email est déjà utilisé.";
        }

        // Récupérer l'utilisateur après insertion
        $recupUser = $bdd->prepare('SELECT * FROM Membres WHERE email = ?');
        $recupUser->execute([$email]);
        $user = $recupUser->fetch();

        if ($user && password_verify($_POST['mdp'], $user['mdp'])) {
            $_SESSION['id'] = $user['M_ID']; 
            $_SESSION['email'] = $email;

            echo "Bienvenue, " . htmlspecialchars($prenom) . "!";
            header  ("location: login_form.php");
            
        } else {
            echo "Erreur lors de la connexion.";
        }

    } else {
        echo "Veuillez compléter tous les champs.";
    }
}
?>
