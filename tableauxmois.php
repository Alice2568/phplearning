
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
    <?php
$date = new DateTime("2019-07-14");
$weekNumber = $date->format("W");
echo "Le numéro de semaine pour la date 14/07/2019 est : $weekNumber \n";
$today = new DateTime("now");
$datefin = new DateTime("2024-12-06");
$interval = date_diff($today,$datefin);
echo "fin du module dans : " .$interval ->format("%r%a days");

function is_leap_year($year){
    if ($year % 400 == 0) 
     return TRUE; 
     elseif ($year % 100 == 0) 
     return FALSE; 
     elseif ($year % 4 == 0) 
     return TRUE; 
     else 
     return FALSE; 
}
if( is_leap_year('2025') == TRUE )
    echo "\n TRUE ";
    else
    echo "\n FALSE ";
?><br>
<?php
    var_dump(checkdate( 17,  32, 2019));
echo date("h\H i");
//$nextmonth = mktime(0,0,0, date("m")+1, date("d"), date("Y"));
//echo "\n".$nextmonth;
$datem = new DateTime('2024-11-29');
$nextmonth = $datem->modify('+1 month');
echo "\n".$nextmonth->format('Y-m-d');
?>
</body>
