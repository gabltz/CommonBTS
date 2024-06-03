<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>Accueil</title>
</head>
<body>
    
    <header>
        <div class="wrapper">
            <h2>BTS CIEL</h2>
            <nav class="navigation">
                <a href="">Accueil</a>
            </nav>
            <div class="connect">
                <button>Se connecter</button>
            </div>
        </div>
    </header>

    <div class="log-box">
        <div class="log">
        <?php

session_start();
$conn = new mysqli('localhost', 'root', 'CiKoccYG8yS0ImMJngRB', 'tp_qqo');


if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $stmt = $conn->prepare("SELECT * FROM login WHERE username=? AND password=?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $_SESSION['loggedin'] = true;
        $_SESSION['username'] = $username;
        header('Location: ./dashboard.php');
        exit();
    } else {
        echo 'Identifiants incorrects';
    }

    $stmt->close();
}

$conn->close();


?>

            <h2>Se connecter</h2>
            <form action="" method="POST">
                <div class="input-group">
                    <input type="text" id="" name="username"><label>Username</label>  
                </div>
                <div class="input-group">
                    <input type="password" id="" name="password"><label>Password</label>
                </div>
                <div class="submit">
                    <button name="envoie">S'authentifier</button>
                </div>
            </form>
        </div>
    </div>

</body>
</html>