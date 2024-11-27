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
        <div><?= lien("https://www.reddit.com/", "Reddit Hug"); ?>
        </div>
        <h1><?= somme($tab); ?></h1>
        <form action="/action_page.php">
  <label for="fname">First name:</label><br>
  <input type="text" id="fname" name="fname" value="John"><br>
  <label for="lname">Last name:</label><br>
  <input type="text" id="lname" name="lname" value="Doe"><br><br>
  <input type="submit" value="Submit">
</form> 
    </body>
</html>