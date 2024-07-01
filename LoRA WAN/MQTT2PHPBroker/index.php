<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$server   = '172.18.30.140';
$port     = 1883;
$username = 'capteur-temp';
$password = 'NNSXS.VWEKVGT34DYLH6WPZ4LWS2MDPSFXHS7J4LXRFNA.4HIVDCSQHTK7CRII44S7H3PKSC74ESI64JGWKIMN2H5E6QQBM4BA';
$topic    = '#';  // S'abonner à tous les topics
$storageFile = 'latest_message.json';

// Commande mosquitto_sub pour s'abonner à tous les topics et récupérer un seul message
$command = "mosquitto_sub -h $server -p $port -t '$topic' -u '$username' -P '$password' -C 1";
$output = shell_exec($command);

if ($output) {
    file_put_contents($storageFile, $output);
} else {
    if (file_exists($storageFile)) {
        $output = file_get_contents($storageFile);
    }
}

$data = json_decode($output, true);
if (isset($data['uplink_message']['decoded_payload'])) {
    $decoded = $data['uplink_message']['decoded_payload'];
    $batV = $decoded['BatV'];
    $tempC1 = $decoded['TempC1'];
    $message = "Battery Voltage: $batV V, Temperature: $tempC1 °C";
} else {
    $message = "Invalid message format.";
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MQTT2PHP - gab</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="container">
        <h1>Données MQTT</h1>
        <p><?php echo $message; ?></p>
        <button onclick="location.reload();">Rafraîchir la page</button>
        <button onclick="window.location.href='brut.php';">Afficher les données brutes</button>
    </div>
</body>
</html>
