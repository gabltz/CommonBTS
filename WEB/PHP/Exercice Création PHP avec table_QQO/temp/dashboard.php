<?php
session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: ./index.php'); // Rediriger vers la page de connexion si non connecté
    exit();
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>Dashboard</title>
</head>
<body>
    
    <header>
        <div class="wrapper">
            <h2>BTS CIEL</h2>
            <nav class="navigation">
                <a href="">Accueil</a>
            </nav>
            <div class="connect">
            <form action="./logout.php" method="POST">
                    <button type="submit">Se déconnecter</button>
                </form>
            </div>
        </div>
    </header>

    <div class="content-box">
        <div class="content">
            <h2>Gestion des utilisateurs</h2>
            <?php
            if ($message) {
                echo '<p>' . $message . '</p>';
            }
            ?>
            
            <?php
            $conn = new mysqli('localhost', 'root', 'CiKoccYG8yS0ImMJngRB', 'tp_qqo');

            if ($conn->connect_error) {
                die("Échec de la connexion: " . $conn->connect_error);
            }
            $message = "";

            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                if (isset($_POST['add'])) {
                    $username = mysqli_real_escape_string($conn, $_POST['username']);
                    $email = mysqli_real_escape_string($conn, $_POST['email']);
                    $password = mysqli_real_escape_string($conn, $_POST['password']);
                    if (!empty($username) && !empty($email) && !empty($password) ) {
                        $stmt = $conn->prepare("INSERT INTO login (username, email, password) VALUES (?, ?, ?)");
                        $stmt->bind_param("sss", $username, $email, $password);
                        if ($stmt->execute()) {
                            $message = "Utilisateur ajouté avec succès.";
                        } else {
                            $message = "Erreur lors de l'ajout de l'utilisateur.";
                        }
                        $stmt->close();
                    } else {
                        $message = "Tous les champs sont obligatoires.";
                    }
                }

                if (isset($_POST['delete'])) {
                    $id = intval($_POST['id']);
                    $stmt = $conn->prepare("DELETE FROM login WHERE id=?");
                    $stmt->bind_param("i", $id);
                    if ($stmt->execute()) {
                        $message = "Utilisateur supprimé avec succès.";
                    } else {
                        $message = "Erreur lors de la suppression de l'utilisateur.";
                    }
                    $stmt->close();
                }

                if (isset($_POST['update'])) {
                    $id = intval($_POST['id']);
                    $username = mysqli_real_escape_string($conn, $_POST['username']);
                    $email = mysqli_real_escape_string($conn, $_POST['email']);
                    $password = mysqli_real_escape_string($conn, $_POST['password']);
                    if (!empty($username) && !empty($email)&& !empty($password)) {
                        $stmt = $conn->prepare("UPDATE login SET username=?, email=?, password=? WHERE id=?");
                        $stmt->bind_param("sssi", $username, $email, $password, $id);
                        if ($stmt->execute()) {
                            $message = "Utilisateur mis à jour avec succès.";
                        } else {
                            $message = "Erreur lors de la mise à jour de l'utilisateur.";
                        }
                        $stmt->close();
                    } else {
                        $message = "Tous les champs sont obligatoires.";
                    }
                }
            }

            $result = $conn->query("SELECT * FROM login");

            echo '<table>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Action</th>
                    </tr>';

            while ($row = $result->fetch_assoc()) {
                echo '<tr>
                        <td>' . $row['id'] . '</td>
                        <td>' . $row['username'] . '</td>
                        <td>' . $row['email'] . '</td>
                        <td>' . $row['password'] . '</td>
                        <td>
                            <form action="" method="POST" style="display:inline;">
                                <input type="hidden" name="id" value="' . $row['id'] . '">
                                <button type="submit" name="delete">Supprimer</button>
                            </form>
                            <form action="" method="POST" style="display:inline;">
                                <input type="hidden" name="id" value="' . $row['id'] . '">
                                <input type="text" name="username" value="' . $row['username'] . '" required placeholder="Username">
                                <input type="email" name="email" value="' . $row['email'] . '" required required placeholder="Email">
                                <input type="password" name="password" value="' . $row['password'] . '" required placeholder="Password">
                                <button type="submit" name="update">Modifier</button>
                            </form>
                        </td>
                    </tr>';
            }

            echo '</table>';
            $conn->close();
            ?>

            <h2>Ajouter un utilisateur</h2>
            <form action="" method="POST">
                <div class="input-group">
                    <input type="text" name="username" required placeholder="Username"><label>Username</label>
                </div>
                <div class="input-group">
                    <input type="email" name="email" required placeholder="Email"><label>Email</label>
                </div>
                <div class="input-group">
                    <input type="password" name="password" required placeholder="Password"><label>Password</label>
                </div>
                <div class="submit">
                    <button type="submit" name="add">Ajouter</button>
                </div>
            </form>

            <h2>Charge du serveur</h2>
            <div class="server-load">
                <?php
                $load = sys_getloadavg();
                echo "Charge du serveur (1m, 5m, 15m): " . implode(", ", $load);
                ?>
            </div>
        </div>
    </div>

</body>
</html>
