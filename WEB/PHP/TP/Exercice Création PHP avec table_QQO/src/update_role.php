<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$conn = new mysqli('localhost', 'root', 'CiKoccYG8yS0ImMJngRB', 'tp_qqo');

if ($conn->connect_error) {
    die("Échec de la connexion: " . $conn->connect_error);
}

$acteur_id = intval($_POST['acteur']);
$role_id = intval($_POST['role']);
$checked = $_POST['checked'] === 'true';

if ($checked) {
    // Ajouter le rôle
    $stmt = $conn->prepare("INSERT INTO acteur_role_possible (id_act, id_rol) VALUES (?, ?)");
    if ($stmt === false) {
        die("Erreur de préparation de la requête : " . $conn->error);
    }
    $stmt->bind_param("ii", $acteur_id, $role_id);
    if ($stmt->execute() === false) {
        die("Erreur lors de l'exécution de la requête : " . $stmt->error);
    }
    $stmt->close();
} else {
    // Supprimer le rôle
    $stmt = $conn->prepare("DELETE FROM acteur_role_possible WHERE id_act = ? AND id_rol = ?");
    if ($stmt === false) {
        die("Erreur de préparation de la requête : " . $conn->error);
    }
    $stmt->bind_param("ii", $acteur_id, $role_id);
    if ($stmt->execute() === false) {
        die("Erreur lors de l'exécution de la requête : " . $stmt->error);
    }
    $stmt->close();
}

echo "Succès";
$conn->close();
?>
