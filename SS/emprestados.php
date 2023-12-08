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
    <link rel="shortcut icon" href="Public/Assets/_31554896-b491-466e-b129-d77e088c3b0c-removebg-preview.png" type="image/x-icon">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <script src="Public/Js/script.js"></script>
    <link rel="stylesheet" href="Public/Css/catalogo.css">
    <link rel="stylesheet" href="Public/Css/cab-rod.css">
    <title>Catálogo</title>
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

    <h2>SEUS EMPRÉSTIMOS</h2>
    <?php $livrosEmprestados = $emprestimoController->listarLivrosEmprestados($_SESSION['usuarioNomedeUsuario']); ?>
<?php if (!empty($livrosEmprestados)): ?>
    <table>
        <tr>
            <th>Livro</th>
            <th>Nome do Usuário</th>
            <th>Ação</th>
        </tr>
        <?php foreach ($livrosEmprestados as $emprestimo): ?>
            <tr>
                <td><?php echo $emprestimo['nome_livro']; ?></td>
                <td><?php echo $emprestimo['aluno_emprestimo']; ?></td>
                <td>
                    <form method="post" action="catalogo.php">
                        <input type="hidden" name="livro_id" value="<?php echo $emprestimo['emprestimo_id']; ?>">
                        <button class="button-s" type="submit" name="devolver">Devolver</button>
                    </form>
                </td>
            </tr>
        <?php endforeach; ?>
    </table>
<?php else: ?>
    <p>Nenhum livro emprestado no momento.</p>
<?php endif; ?>

            
        </div>
    </section>
    </div>
</body>
</html>
