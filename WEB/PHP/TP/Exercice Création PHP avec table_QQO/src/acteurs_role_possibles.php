<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

session_start();

if (!isset($_SESSION['loggedin']) || $_SESSION['loggedin'] !== true) {
    header('Location: ./index.php'); // Rediriger vers la page de connexion si non connecté
    exit();
}

$conn = new mysqli('localhost', 'root', 'CiKoccYG8yS0ImMJngRB', 'tp_qqo');

if ($conn->connect_error) {
    die("Échec de la connexion: " . $conn->connect_error);
}

$message = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['add_role'])) {
        $acteur = intval($_POST['acteur']);
        $role = intval($_POST['role']);

        // Vérifiez si le rôle est déjà associé à l'acteur
        $check_stmt = $conn->prepare("SELECT COUNT(*) FROM acteur_role_possible WHERE id_act = ? AND id_rol = ?");
        $check_stmt->bind_param("ii", $acteur, $role);
        $check_stmt->execute();
        $check_stmt->bind_result($count);
        $check_stmt->fetch();
        $check_stmt->close();

        if ($count > 0) {
            $message = "Le rôle est déjà associé à cet acteur.";
        } else {
            if ($acteur && $role) { // Ajouter le rôle à l'acteur
                $stmt = $conn->prepare("INSERT INTO acteur_role_possible (id_act, id_rol) VALUES (?, ?)");
                $stmt->bind_param("ii", $acteur, $role);
                if ($stmt->execute()) {
                    $message = "Rôle ajouté avec succès à l'acteur.";
                } else {
                    $message = "Erreur lors de l'ajout du rôle à l'acteur.";
                }
                $stmt->close();
                header('Location: ' . $_SERVER['PHP_SELF']);
                exit();
            } else {
                $message = "Tous les champs sont obligatoires.";
            }
        }
    }

    if (isset($_POST['delete_role'])) { // Supprimer le rôle de l'acteur
        $id = intval($_POST['id']);
        $stmt = $conn->prepare("DELETE FROM acteur_role_possible WHERE id_acteur_role_possible = ?");
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            $message = "Rôle supprimé avec succès de l'acteur.";
        } else {
            $message = "Erreur lors de la suppression du rôle de l'acteur.";
        }
        $stmt->close();
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    }

    if (isset($_POST['save_roles'])) { // Enregistrer les rôles pour l'acteur
        $acteur = intval($_POST['acteur_role']);
        $roles = $_POST['roles'];
        $stmt = $conn->prepare("DELETE FROM acteur_role_possible WHERE id_act = ?");
        $stmt->bind_param("i", $acteur);
        $stmt->execute();
        $stmt->close();

        foreach ($roles as $role) { // Ajouter les nouveaux rôles
            $stmt = $conn->prepare("INSERT INTO acteur_role_possible (id_act, id_rol) VALUES (?, ?)");
            $stmt->bind_param("ii", $acteur, $role);
            $stmt->execute();
            $stmt->close();
        }
        $message = "Les rôles pour l'acteur ont été mis à jour.";
        header('Location: ' . $_SERVER['PHP_SELF']);
        exit();
    }
}

$acteurs_result = $conn->query("SELECT * FROM acteurs"); // Récupérer tous les acteurs
$roles_result = $conn->query("SELECT * FROM role");
$equipes_result = $conn->query("SELECT * FROM equipes");
$acteurs_roles_result = $conn->query("SELECT arp.id_acteur_role_possible, CONCAT(a.nom, ' ', a.prenom) AS acteur_nom, r.nomRole  
                                      FROM acteur_role_possible arp 
                                      JOIN acteurs a ON arp.id_act = a.id_act 
                                      JOIN role r ON arp.id_rol = r.id_role"); // Récupérer les acteurs et les rôles associés

?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./styles.css">
    <title>Acteurs/Rôles Possible</title>
    <script>
        function updateRoles(acteurId) {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                document.getElementById("rolesContainer").innerHTML = this.responseText;
            }
            xhttp.open("GET", "fetch_roles.php?acteur_id=" + acteurId, true);
            xhttp.send();
        }
    </script>
</head>
<body>
    <header>
        <div class="wrapper">
            <h2>BTS CIEL</h2>
            <nav class="navigation">
                <a href="./dashboard.php">Administration</a>
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
            <h2>Gestion des Acteurs et Rôles</h2>
            <?php
            if ($message) {
                echo '<p>' . $message . '</p>';
            }
            ?>

            <h2>Ajouter un ACTEUR-role Possible</h2>
            <form method="post" action="">
                <label for="acteur">Acteur:</label>
                <select id="acteur" name="acteur">
                    <?php while ($acteur = $acteurs_result->fetch_assoc()): ?>
                        <option value="<?php echo $acteur['id_act']; ?>"><?php echo $acteur['nom'] . ' ' . $acteur['prenom']; ?></option>
                    <?php endwhile; ?>
                </select>

                <label for="role">Rôle:</label>
                <select id="role" name="role">
                    <?php while ($role = $roles_result->fetch_assoc()): ?>
                        <option value="<?php echo $role['id_role']; ?>"><?php echo $role['nomRole']; ?></option>
                    <?php endwhile; ?>
                </select>

                <button type="submit" name="add_role">Ajouter un ACTEUR-ROLE</button>
            </form>

            <h2>ACTEUR-Role Possible</h2>
            <div class="table-container">
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Acteur</th>
                        <th>Rôle</th>
                        <th>Editer</th>
                        <th>Supprimer</th>
                    </tr>
                    <?php while ($row = $acteurs_roles_result->fetch_assoc()): ?>
                        <tr>
                            <td><?php echo $row['id_acteur_role_possible']; ?></td>
                            <td><?php echo $row['acteur_nom']; ?></td>
                            <td><?php echo $row['nomRole']; ?></td>
                            <td><a href="#">Editer</a></td>
                            <td>
                                <form method="post" action="">
                                    <input type="hidden" name="id" value="<?php echo $row['id_acteur_role_possible']; ?>">
                                    <button type="submit" name="delete_role">Supprimer</button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </table>
            </div>

            <h2>Acteurs_Roles</h2>
            <form method="post" action="">
                <label for="equipe">Équipe:</label>
                <select id="equipe" name="equipe">
                    <?php while ($equipe = $equipes_result->fetch_assoc()): ?>
                        <option value="<?php echo $equipe['id_equ']; ?>"><?php echo $equipe['nom_HBCSM']; ?></option>
                    <?php endwhile; ?>
                </select>

                <label for="acteur_role">L'acteur:</label>
                <select id="acteur_role" name="acteur_role" onchange="updateRoles(this.value)">
                    <option value="">Sélectionnez un acteur</option>
                    <?php
                    $acteurs_result = $conn->query("SELECT * FROM acteurs");
                    while ($acteur = $acteurs_result->fetch_assoc()): ?>
                        <option value="<?php echo $acteur['id_act']; ?>"><?php echo $acteur['nom'] . ' ' . $acteur['prenom']; ?></option>
                    <?php endwhile; ?>
                </select>

                <div id="rolesContainer">
                    <!-- Les rôles de l'acteur sélectionné seront chargés ici -->
                </div>

                <button type="submit" name="save_roles">Enregistrer</button>
            </form>
        </div>
    </div>
</body>
</html>
