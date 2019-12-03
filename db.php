<?php
$servername = "localhost";
$username = "eaayala";
$password = "csc4391";
$dbname = "EAAYALA";

$conn = new mysqli($servername, $username, $password, $dbname);
try {
    $db = new PDO("mysql:dbname=" . $dbname . ";host=" . $servername, $username, $password );
 }
catch(PDOException $e) {
    echo $e->getMessage();
}
?>
