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
}

$acteurs_result = $conn->query("SELECT * FROM acteurs");
$roles_result = $conn->query("SELECT * FROM role");
$equipes_result = $conn->query("SELECT * FROM equipes");
$acteurs_roles_result = $conn->query("SELECT arp.id_acteur_role_possible, CONCAT(a.nom, ' ', a.prenom) AS acteur_nom, r.nomRole, arp.id_act  
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
        let originalRoles = {};

        function updateRoles(acteurId) {
            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                document.getElementById("rolesContainer").innerHTML = this.responseText;
                saveOriginalRoles();
            }
            xhttp.open("GET", "fetch_roles.php?acteur_id=" + acteurId, true);
            xhttp.send();
        }

        function toggleRole(acteurId, roleId, checked) {
            if (!(acteurId in originalRoles)) {
                originalRoles[acteurId] = {};
            }
            originalRoles[acteurId][roleId] = checked;
        }

        function saveOriginalRoles() {
            const checkboxes = document.querySelectorAll("#rolesContainer input[type='checkbox']");
            checkboxes.forEach(checkbox => {
                checkbox.addEventListener('change', function() {
                    toggleRole(this.dataset.acteur, this.value, this.checked);
                });
            });
        }

        function saveChanges() {
            const acteurId = document.getElementById("acteur_role").value;
            if (!(acteurId in originalRoles)) return;

            for (let roleId in originalRoles[acteurId]) {
                const checked = originalRoles[acteurId][roleId];
                const xhttp = new XMLHttpRequest();
                xhttp.onload = function() {
                    if (this.status !== 200) {
                        console.error('Response:', this.responseText);
                        alert('Une erreur s\'est produite lors de la mise à jour du rôle.');
                    }
                }
                xhttp.onerror = function() {
                    console.error('Request failed');
                    alert('Une erreur s\'est produite lors de la mise à jour du rôle.');
                }
                xhttp.open("POST", "update_role.php", true);
                xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhttp.send("acteur=" + acteurId + "&role=" + roleId + "&checked=" + checked);
            }

            // Rafraîchir la page après avoir enregistré les modifications
            window.location.reload();
        }

        function cancelChanges() {
            updateRoles(document.getElementById("acteur_role").value);
        }

        function editActorRoles(acteurId) {
            document.getElementById("acteur_role").value = acteurId;
            updateRoles(acteurId);
        }

        function deleteRole(roleId) {
            if (!confirm("Voulez-vous vraiment supprimer ce rôle ?")) return;

            const xhttp = new XMLHttpRequest();
            xhttp.onload = function() {
                if (this.status === 200) {
                    window.location.reload();
                } else {
                    alert("Une erreur s'est produite lors de la suppression du rôle.");
                }
            }
            xhttp.onerror = function() {
                alert("Une erreur s'est produite lors de la suppression du rôle.");
            }
            xhttp.open("POST", "delete_role.php", true);
            xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhttp.send("id=" + roleId);
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

                <button type="submit" class="styled-button" name="add_role">Ajouter un ACTEUR-ROLE</button>
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
                            <td><a href="#" onclick="editActorRoles(<?php echo $row['id_act']; ?>)"><img src="images/edit_icon.png" alt="Edit" style="width: 20px; height: 20px;"></a></td>
                            <td>
                                <a href="#" onclick="deleteRole(<?php echo $row['id_acteur_role_possible']; ?>)"><img src="images/delete_icon.png" alt="Delete" style="width: 20px; height: 20px;"></a>
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
                <button type="button" class="styled-button" onclick="saveChanges()">Enregistrer</button>
                <button type="button" class="styled-button" onclick="cancelChanges()">Annuler</button>
            </form>
        </div>
    </div>
</body>
</html>
