<?php 
session_start();
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
}
?>