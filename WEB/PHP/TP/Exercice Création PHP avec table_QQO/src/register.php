<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/register.css">
    <title>S'enregistrer</title>
</head>
<body>
    
    <div class="log-box">
        <div class="log">
            <h2>S'enregister</h2>
            <div class="bar"></div>
            <form action="register.php" method="POST">
                <div class="input-group">
                    <input type="username" id="username" name="username" placeholder="Nom d'utilisateur" required>
                </div>
                <div class="input-group">
                    <input type="password" id="pwd" name="pwd" placeholder="Mot de passe" required>
                </div>
                <div class="submit">
                    <button type="submit">Se créer un compte</button>
                </div>

                <?php
                    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                        $conn = new mysqli('localhost', 'root', 'enzo2005', 'login');

                        if ($conn->connect_error) {
                            die("Connection failed: " . $conn->connect_error);
                        }

                        $username = $_POST['username'];
                        $password = $_POST['pwd'];

                        $stmt = $conn->prepare("SELECT * FROM logbase WHERE username = ?");
                        $stmt->bind_param("s", $username);
                        $stmt->execute();
                        $stmt->store_result();

                        if ($stmt->num_rows > 0) {
                            echo '<p>Ce nom d\'utilisateur est déjà pris. Veuillez en choisir un autre.</p>';
                        } else {
                            $stmt = $conn->prepare("INSERT INTO logbase (username, pwd) VALUES (?, ?)");
                            $stmt->bind_param("ss", $username, $password);

                            if ($stmt->execute()) {
                                echo '<p>Compte créé avec succès. Vous allez être redirigé vers la page de connexion.</p>';
                                header('Refresh: 2; URL=login.php');
                                exit();
                            } else {
                                echo '<p>Erreur lors de la création du compte. Veuillez réessayer.</p>';
                            }
                        }

                        $stmt->close();
                        $conn->close();
                    }
                ?>

            </form>
            <div class="register">
                <label for="">Déjà un compte ? <a href="./login.php">Connectez-vous.</a></label>
            </div>
            <div class="back">
                <a href="./index.html"><button>Retourner à l'accueil</button></a>
            </div>
        </div>
    </div>

</body>
</html>