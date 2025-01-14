<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exo fonction</title>
</head>
    <body>
        <?php 
        /* function lien($link, $title){
echo "<a href=". $link .">". $title ."</a>";
         }*/
        function somme($tab){
            $resultat = array_sum($tab);
            echo $resultat;
        }
        $tab = [4, 3, 8, 2];
        ?>
        <?php
        function VerifMdp(string $motDePasse): bool {
           
            if (strlen($motDePasse) < 8) {
                return false;
            }
        
            
            if (!preg_match('/\d/', $motDePasse)) {
                return false;
            }
        
            
            if (!preg_match('/[A-Z]/', $motDePasse)) {
                return false;
            }
        
            
            if (!preg_match('/[a-z]/', $motDePasse)) {
                return false;
            }
        
            
            return true;
        }
        
        
        $motDePasse = "MotDePasse123";
        if (VerifMdp($motDePasse)) {
            echo "Mot de passe valide.";
        } else {
            echo "Mot de passe invalide.";
        }//faire un retour pour recommencer ? retaper un autre mdp et re faire fonction
        ?>
        
        <!--<div><?= lien("https://www.reddit.com/", "Reddit Hug"); ?>
        </div>-->
        <h1><?= somme($tab); ?></h1>
        
        <form action="exofonctions.php" method="GET">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="lname">Last name:</label><br>
  <input type="text" id="lname" name="lname" value="Doe"><br><br>
  <input type="submit" value="Submit">
</form> 
            
    </body>
</html>