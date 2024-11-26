
<html>
<?php
//for ($i = 1; $i<= 150; $i +=2){
//    echo $i . " ";
//}

//for ($i= 1; $i <= 5; $i+=1 ){
 //   echo "Je dois faire des sauvegardes régulières de mes fichiers \n";
//}

$mois = array(
    "JAnvier" => 31,
    "Février" => 28,
    "Mars" => 31,
    "Avril" => 30,
    "Mai" => 31,
    "Juin" => 30,
    "Juillet" => 31,
    "Aout" => 31,
    "Septembre" => 30,
    "Octobre" => 31,
    "Novembre" => 30,
    "Décembre" => 31,
);
asort($mois);
//foreach ($mois as $jours => $valeur)
//{
    //echo "Nombre de jours du mois de $jours : $valeur jours \n";
//}
?>
<style>
        table {
            border: 1px solid ;
        }
    th, td {
            border: 1px solid;
        }
        </style>
<body>
    <table>
      
        <thead>
            <tr>
                <th>Mois</th>
                <th>Jours</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($mois as $jours => $valeur): 
                 ?>
                <tr>
                    <th><?= $jours ?></th>
                        <td><?= $valeur ?></td>
                    <?php endforeach; ?>
                </tr>
            
        </tbody>
    </table>
</body>
