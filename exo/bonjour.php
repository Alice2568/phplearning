<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Table de Multiplication 9</title>
    <style>
        table {
            width: 50%;
            border: 1px solid #000;
            margin: 20px auto;
            text-align: center;
        }
        th, td {
            border: 1px solid #000;
            padding: 10px;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
    <table>
        <thead>
            <tr>
                <th>0</th>
                <?php for ($i = 1; $i <= 9; $i++): ?>
                    <th><?= $i ?></th>
                <?php endfor; ?>
            </tr>
        </thead>
        <tbody>
            <?php for ($row = 1; $row <= 9; $row++): ?>
                <tr>
                    <th><?= $row ?></th>
                    <?php for ($col = 1; $col <= 9; $col++): ?>
                        <td><?= $row * $col ?></td>
                    <?php endfor; ?>
                </tr>
            <?php endfor; ?>
        </tbody>
    </table>
</body>
</html>
