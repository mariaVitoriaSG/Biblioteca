<div class="no-view">
    <?php
    session_start(); // Inicie a sessão no início do arquivo

    require_once '../Config/config.php';
    require_once 'App/Controller/UserController.php';

    $userController = new UserController($pdo);

    if (isset($_POST['nome']) && isset($_POST['email']) && isset($_POST['senha'])) {
        $userController->criarUser($_POST['nome'], $_POST['email'], $_POST['senha']);
        header('Location: cadastro.php'); // Redirecione para a página de cadastro
        exit();
    }
    ?>
</div>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Public/Css/cadastro.css">
    <link rel="shortcut icon" href="../Login/Public/Assets/logo.png" type="image/x-icon">
    <script src="Public/Js/script.js"></script>
    <title>Cadastro</title>
</head>
<body>
    <div class="no-view">

    </div>
    <section>
        <div class="logo">
            <img src="../Login/Public/Assets/logo.png" alt="logo">
        </div>
        <div class="cad">
            <h2>CADASTRO</h2>
            <form method="post">
                <label>USUÁRIO</label>
                <div class="inp"><input type="text" name="nome" required></div>
                <label>EMAIL</label>
                <div class="inp"><input type="email" name="email" required></div>
                <label>SENHA</label>
                <div class="inp"><input type="password" name="senha" required></div>

                <div class="button"><button class="button-s" type="submit">Criar</button></div>
            </form>
                <form action="login.php">
                <div class="log">JÁ TEM UMA CONTA? <a href="login.php">ENTRE</a></div>
                </form>
            
        <?php
        if (isset($_SESSION['mensagem'])) {
            echo '<div class="alert"><p>' . $_SESSION['mensagem'] . '</p></div>';
            unset($_SESSION['mensagem']);
        }
        ?>
    </div>    
    </section>
</body>
</html>