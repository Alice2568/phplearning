<?php 
/*session_start();
$bdd = new PDO('mysql:host=127.0.0.1:3306;charset=utf8;dbname=Espace_Membres','admin','Afpa1234');
if(isset($_POST['login'])){
    if(!empty($_POST['email']) && !empty($_POST['mdp'])){
        $email = htmlspecialchars($_POST['email']);
        $mdp = sha1($_POST['mdp']);
        $insertUser = $bdd->prepare('INSERT INTO Membres(email, mdp)VALUES(?, ?)');
        $insertUser->execute(array($email, $mdp));

        $recupUser = $bdd->prepare('SELECT * FROM Membres WHERE email = ? AND mdp = ?');
        $recupUser->execute(array($email, $mdp));
        if($recupUser->rowCount() > 0){
            $_SESSION['email'] = $email;
            $_SESSION['mdp'] = $mdp;
            $_SESSION['id'] =$recupUser->fetch()['M_ID'];
        }

       echo $_SESSION['id'];

    }else{
        echo "Veuillez completer tous les champs";
    }
}*/
?>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"content="width=device-width, initial-scale=1.0">
        <title> Inscription</title>
    </head>
    <body>
        <form action="login_script.php" method="post">
            <label for="nom">Votre nom</label>
            <input type="text" id="nom" name="nom"><br> 
            <label for="prenom">Votre prenom</label>
            <input type="text" id="prenom" name="prenom"> <br>
            <label for="identifiant">Votre email</label>
            <input type="text" id="email" name="email" placeholder="Entrez votre email" autocomplete="off">
            <br>
            <label for="mdp">Votre mot de passe</label>
            <input type="password" id="mdp" name="mdp" autocomplete="off">
            <br>
            <input type="submit" name="inscription">
        </form>
    </body>
</html>