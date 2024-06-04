<?php
$conn = new mysqli('localhost', 'root', 'CiKoccYG8yS0ImMJngRB', 'tp_qqo');

if ($conn->connect_error) {
    die("Échec de la connexion: " . $conn->connect_error);
}

$acteur_id = intval($_GET['acteur_id']);
$roles_result = $conn->query("SELECT * FROM role");
$assigned_roles_result = $conn->query("SELECT id_rol FROM acteur_role_possible WHERE id_act = $acteur_id");

$assigned_roles = [];
while ($row = $assigned_roles_result->fetch_assoc()) {
    $assigned_roles[] = $row['id_rol'];
}

echo '<table>';
while ($role = $roles_result->fetch_assoc()) {
    $checked = in_array($role['id_role'], $assigned_roles) ? 'checked' : '';
    echo '<tr>
            <td>' . $role['nomRole'] . '</td>
            <td><input type="checkbox" name="roles[]" value="' . $role['id_role'] . '" data-acteur="' . $acteur_id . '" ' . $checked . '></td>
          </tr>';
}
echo '</table>';

$conn->close();
?>
