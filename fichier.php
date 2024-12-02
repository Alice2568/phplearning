<?php
/*$lines = file('https://ncode.amorce.org/ressources/Pool/NEW_MS_FULL_STACK/WEB_PHP/liens.txt');
foreach ($lines as $line_num => $line) {
    echo $line."\n" ;
}*/

$lines = file('customers.csv', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

// Init tableau pour stocker données 
$data = [];

// Parcourir chaque ligne et découper avec explode()
foreach ($lines as $line) {
    $data[] = explode(",", $line);
}

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Liste des nouveaux utilisateurs</h1>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nom</th>
            <th>Prénom</th>
            <th>Email</th>
            <th>Téléphone</th>
            <th>Ville</th>
            <th>État</th>
        </tr>
        </thead>
        <tbody>
        <?php
        // Vérifier que $data contient des lignes
        if (!empty($data)) {
            foreach ($data as $index => $row) {
                if ($index === 0) continue; 

                echo "<tr>";
                foreach ($row as $cell) {
                    echo "<td>" . htmlspecialchars($cell) . "</td>";
                }
                echo "</tr>";
            }
        }
        ?>
        </tbody>
    </table>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
