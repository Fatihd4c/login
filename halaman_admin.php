<?php
session_start();
require "koneksi.php";

if(!isset($_SESSION['level']) || $_SESSION['level'] !='admin'){
    header("Location: index.php");
    exit;
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="ini.css">
</head>
<body>
    <h2>Halo atmien</h2>
</body>
</html>