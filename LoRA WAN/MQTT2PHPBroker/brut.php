<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$server   = '172.18.30.140';
$port     = 1883;
$username = 'capteur-temp';
$password = 'NNSXS.VWEKVGT34DYLH6WPZ4LWS2MDPSFXHS7J4LXRFNA.4HIVDCSQHTK7CRII44S7H3PKSC74ESI64JGWKIMN2H5E6QQBM4BA';
$topic    = '#';  // Sub à tous les topics
$storageFile = 'latest_message.json';

// Appel de la commande car utilisation de librairies via composer/phpMQTT impossibles en raisons de problèmes de QoS
$command = "mosquitto_sub -h $server -p $port -t '$topic' -u '$username' -P '$password' -C 1";
$rawMessage = shell_exec($command);

if ($rawMessage) {
    file_put_contents($storageFile, $rawMessage);
} else {
    if (file_exists($storageFile)) {
        $rawMessage = file_get_contents($storageFile);
    }
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
        <h1>Données brutes</h1>
        <pre><?php echo htmlspecialchars($rawMessage); ?></pre>
        <button onclick="location.reload();">Rafraîchir la page</button>
        <button onclick="window.location.href='index.php';">Afficher les données spécifiques</button>
    </div>
</body>
</html>
