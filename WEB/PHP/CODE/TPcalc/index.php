<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calculatrice Simplifiée</title>
    <link rel="stylesheet" href="assets/styles.css">
</head>
<body>
    <div class="calculator">
        <h1>Calculatrice Simplifiée</h1>
        <form method="post">
            <input type="number" name="operand1" placeholder="Opérande 1" required>
            <select name="operator" required>
                <option value="+">+</option>
                <option value="-">-</option>
                <option value="*">*</option>
                <option value="/">/</option>
            </select>
            <input type="number" name="operand2" placeholder="Opérande 2" required>
            <button type="submit" name="calculate">Calculer</button>
        </form>
        <?php
        if (isset($_POST['calculate'])) {
            $operand1 = $_POST['operand1'];
            $operand2 = $_POST['operand2'];
            $operator = $_POST['operator'];
            $result = null;
            switch ($operator) {
                case '+':
                    $result = $operand1 + $operand2;
                    break;
                case '-':
                    $result = $operand1 - $operand2;
                    break;
                case '*':
                    $result = $operand1 * $operand2;
                    break;
                case '/':
                    if ($operand2 != 0) {
                        $result = $operand1 / $operand2;
                    } else {
                        $result = "Erreur: Division par zéro";
                    }
                    break;
                default:
                    $result = "Opérateur invalide";
                    break;
            }
            echo "<div class='result'>Résultat: $result</div>";
        }
        ?>
    </div>
</body>
</html>
