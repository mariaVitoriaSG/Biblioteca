<div class="no-view">
    <?php
    require_once '../Config/config.php';
    require_once 'App/Controller/controller.php';

    session_start();

    $livroController = new LivroController($pdo);
    $emprestimoController = new EmprestimoController($pdo);

    $livros = $livroController->listarLivros();

    $livrosPorCategoria = [];
    foreach ($livros as $livro) {
        $categoria = $livro['categoria'];
        if (!isset($livrosPorCategoria[$categoria])) {
            $livrosPorCategoria[$categoria] = [];
        }
        $livrosPorCategoria[$categoria][] = $livro;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['emprestar'])) {
        $livroID = $_POST['livro_id'];
        $livroNome = $_POST['nome'];
        $usuarioNome = $_SESSION['usuarioNomedeUsuario'];

        $emprestimoController->emprestarLivro($livroID, $livroNome, $usuarioNome);
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['devolver'])) {
        $livroID = $_POST['livro_id'];

        $emprestimoController->devolverLivro($livroID);
    }

    ?>
</div>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="../SS/Public/assets/logo.png" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="Public/Js/script.js"></script>
    <link rel="stylesheet" href="Public/Css/index.css">
    <link rel="stylesheet" href="Public/Css/cab-rod.css">
    <title>Página Inicial</title>
</head>
<body>
<div class="grid">
    <header>
        <nav>
            <div class="logo">
                <img src="../SS/Public/assets/logo.png" alt="logo">
            </div>
            <ul class="nav-menu">
                <li class="nav-button"><a class="nav-link" href="index.php">NOSSO ACEERVO</a></li>
                <li class="nav-button"><a class="nav-link" href="emprestados.php">EMPRÉSTIMOS EFETUADOS</a></li>
            </ul>
            <div class="user-icon" id="user-icon" onclick="showUserInfo()">
                <img class="img-perfil" src="" alt="Perfil">
            </div>
            <div class="user-info" id="user-info">
                <?php
                    include '../Login/verifica_login.php'
                ?>
                <h4>Olá <?php echo $_SESSION['usuarioNomedeUsuario'] , "!"; ?> </h4>
                <button id="log" onclick="logout()"><img src="" alt="deslog"></button>
            </div>
        </nav>
    </header>
    <section>
    <div class="catalogo">
            <h2>ACERVO DISPONÍVEL</h2>
            <?php foreach ($livrosPorCategoria as $categoria => $livrosNaCategoria): ?>
    <h2><?php echo  $categoria; ?></h2>
    <table>
        <tr>
            <th>CAPA</th>
            <th>Nome</th>
            <th>QUANTIDADE</th>
            <th>OPCAO</th>
        </tr>
        <?php foreach ($livrosNaCategoria as $livro): ?>
            <tr>
                <td>
                    <?php
                    if (!empty($livro['imagem'])) {
                        echo '<img class="capa-l" src="' . $livro['imagem'] . '" alt="Imagem do Livro">';
                    } else {
                        echo 'Sem Imagem';
                    }
                    ?>
                </td>
                <td><?php echo $livro['nome']; ?></td>
                <td><?php echo $livro['quantidade']; ?> Livro(s) Disponíveis</td>
                <td>
                    <form method="post" action="catalogo.php">
                        <input type="hidden" name="livro_id" value="<?php echo $livro['livro_id']; ?>">
                        <input type="hidden" name="nome" value="<?php echo $livro['nome']; ?>">
                        <button class="button-s" type="submit" name="emprestar">Emprestar</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php endforeach; ?>

    </section>
</div>
</body>
</html>