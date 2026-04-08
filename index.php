<?php
session_start();
require "koneksi.php";

if(isset($_POST['login'])){
    $username = $_POST["username"];
    $password = $_POST["password"];

    $query = $conn->query("SELECT * FROM admin WHERE username='$username' AND password='$password'");
    $data = $query->fetch_assoc();

    if($data){
        $_SESSION['username'] = $data['username'];
        $_SESSION['password'] = $data['password'];
        $_SESSION['level'] = $data['level'];

        //cek derajat pengguna

        if($data['level'] == 'admin'){
            header("location: halaman_admin.php");
        }else if($data['level'] == 'usr'){
            header("location: halaman_user.php");
        }
        exit;
    } else{
        echo "<script>alert('login gagal');</script>";
    }


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
    
    <div class="kotak login">
    <form method="POST">
        <h2>Login</h2>
        <input type="text" name="username" placeholder="username" required> <br><br>
        <input type="password" name="password" placeholder="password" required> <br><br>
        <button type="submit" name="login">Masuk</button>
    </form>
    </div>
</body>
</html>