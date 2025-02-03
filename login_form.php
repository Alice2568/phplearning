<?php 
$bdd = new PDO('mysql:host=127.0.0.1:3306;charset=utf8;dbname=Espace_Membres','admin','Afpa1234')
if(isset($_POST['login'])){
    if(!empty($_POST['email']) && !empty($_POST['mdp'])){
        $email = htmlspecialchars($_POST[]);
        $mdp = sha1($_POST['mdp']);
        $insertUser = $bdd->prepare('INSERT INTO Membres')
    }else{
        echo "Veuillez completer tous les champs";
    }
}
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
            <label for="identifiant">Votre email</label>
            <input type="text" id="email" name="email" placeholder="Entrez votre email" autocomplete="off">
            <br>
            <label for="mdp">Votre mot de passe</label>
            <input type="password" id="mdp" name="mdp" autocomplete="off">
            <br>
            <input type="submit" name="login">
        </form>
    </body>
</html>