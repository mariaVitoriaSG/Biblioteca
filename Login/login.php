<?php
session_start();
?>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="../Login/Public/Assets/logo.png" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Public/Css/login.css">
    <script src="Public/Js/script.js"></script>
    <title>Login</title>
</head>
<body>
    <header>
    </header>
    <section>
        <div class="logo">
            <img src="../Login/Public/Assets/logo.png" alt="logo">
        </div>
        <div class="login">
            <h2>LOGIN</h2>
            <form action="loginconfig.php" method="POST">
                <label>USUÁRIO</label>
                <div class="inp"><input type="text" name="email"></div>
                <label>SENHA</label>
                <div class="inp"><input type="password" name="senha"></div>
                <div class="button"><button class="button-s" type="submit">LOGIN</button></div>
            </form>
            <form action="cadastro.php">
                <div class="cad">NAO TEM UMA CONTA? <a href="cadastro.php">CADASTRE-SE</a></div>
            </form>
        </div>
    </section>
</body>
</html>
