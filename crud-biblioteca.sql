-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Dez-2023 às 17:41
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `crud-biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_livros`
--

CREATE TABLE `categoria_livros` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `categoria_livros`
--

INSERT INTO `categoria_livros` (`id`, `nome`) VALUES
(1, 'Romance'),
(2, 'Terror'),
(3, 'Ficção'),
(4, 'Fantasia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `emprestimo_id` int(11) NOT NULL,
  `livro_emprestimo` varchar(255) NOT NULL,
  `nome_livro` varchar(255) NOT NULL,
  `aluno_emprestimo` varchar(255) NOT NULL,
  `data_emprestimo` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `emprestimos`
--

INSERT INTO `emprestimos` (`emprestimo_id`, `livro_emprestimo`, `nome_livro`, `aluno_emprestimo`, `data_emprestimo`) VALUES
(42, '38', 'Escolhidos pelo amor', 'Wesley', '2023-11-30'),
(43, '24', 'Confissões de uma garota excluída, mal-amada e (um pouco) dramática ', 'Wesley', '2023-11-30'),
(44, '27', 'Prince of thorns', 'Wesley', '2023-11-30'),
(45, '19', 'Moby Dick', 'Wesley', '2023-11-30'),
(46, '21', 'A culpa é das estrelas', 'Wesley', '2023-11-30'),
(47, '40', 'A máquina do tempo', 'Wesley', '2023-11-30');

-- --------------------------------------------------------

--
-- Estrutura da tabela `historico`
--

CREATE TABLE `historico` (
  `id_hstorico` int(11) NOT NULL,
  `emprestimo_id` int(11) NOT NULL,
  `livro_id` int(11) NOT NULL,
  `nome_livro` varchar(255) NOT NULL,
  `nome_aluno` varchar(255) NOT NULL,
  `hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `historico`
--

INSERT INTO `historico` (`id_hstorico`, `emprestimo_id`, `livro_id`, `nome_livro`, `nome_aluno`, `hora`) VALUES
(30, 35, 21, 'A culpa é das estrelas', 'Wesley', '2023-11-26 19:21:15'),
(31, 33, 19, 'Moby Dick', 'Fabio', '2023-11-26 19:23:13'),
(32, 36, 22, 'A 5 Passos de você', 'Fabio', '2023-11-26 19:23:15'),
(33, 37, 36, 'Amigo Imaginário ', 'Fabio', '2023-11-26 19:23:17'),
(34, 38, 21, 'A culpa é das estrelas', 'Wesley', '2023-11-30 19:35:05'),
(35, 39, 22, 'A 5 Passos de você', 'Wesley', '2023-12-01 00:45:00'),
(36, 40, 34, 'Bird box', 'Wesley', '2023-12-01 00:45:04'),
(37, 41, 20, '7 Desafios Para Ser Rei', 'Wesley', '2023-12-01 00:45:06'),
(38, 48, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:34:25'),
(39, 49, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:34:28'),
(40, 50, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:35:01'),
(41, 51, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:35:19'),
(42, 52, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:35:25'),
(43, 53, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:36:12'),
(44, 54, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:36:37'),
(45, 55, 51, 'Quem é Você Alasca', 'Maria Vitória Silva Gabriel', '2023-12-08 13:36:46'),
(46, 56, 54, 'Cidades de Papel', 'Maria Vitória', '2023-12-08 14:28:02'),
(47, 57, 54, 'Cidades de Papel', 'Maria Vitória', '2023-12-08 14:42:52'),
(48, 58, 56, 'Tartarugas até lá Embaixo', 'Maria Vitória', '2023-12-08 16:02:14'),
(49, 59, 63, 'A Ilha Misteriosa', 'Maria Vitória', '2023-12-08 16:29:20'),
(50, 61, 60, 'Trocas Macabras', 'Maria Vitória', '2023-12-08 16:29:22'),
(51, 60, 52, 'Will & Will', 'Maria Vitória', '2023-12-08 16:29:24'),
(52, 62, 71, 'Corte de Chamas Prateadas', 'Maria Vitória', '2023-12-08 16:29:25');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE `livros` (
  `livro_id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `categoria_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`livro_id`, `nome`, `categoria`, `quantidade`, `imagem`, `categoria_id`) VALUES
(51, 'Quem é Você Alasca', 'Romance', 4, '../uploads/alasca.jpeg', 1),
(52, 'Will & Will', 'Romance', 2, '../uploads/will.png', 1),
(53, 'O Teorema Katherine', 'Romance', 3, '../uploads/teorema.jpg', 1),
(54, 'Cidades de Papel', 'Romance', 5, '../uploads/papel.jpg', 1),
(55, 'A Culpa das Estrelas', 'Romance', 5, '../uploads/estrelas.jpg', 1),
(56, 'Tartarugas até lá Embaixo', 'Romance', 4, '../uploads/tartarugas.jpg', 1),
(57, 'Carrie, a Estranha', 'Terror', 5, '../uploads/carrie.jpg', 2),
(58, 'Cujo', 'Terror', 3, '../uploads/cujo.jpg', 2),
(59, 'A Incendiária', 'Terror', 2, '../uploads/incendiaria.jpg', 2),
(60, 'Trocas Macabras', 'Terror', 4, '../uploads/trocas.jpg', 2),
(61, 'A Hora do Lobisomem', 'Terror', 3, '../uploads/lobisomem.jpg', 2),
(62, 'A Metade Sombria', 'Terror', 2, '../uploads/metade.jpg', 2),
(63, 'A Ilha Misteriosa', 'Ficção', 5, '../uploads/a ilha.png', 3),
(64, 'A Volta ao Mundo em 80 Dias', 'Ficção', 2, '../uploads/volta ao mundo.png', 3),
(65, 'Viagem ao Centro da Terra', 'Ficção', 4, '../uploads/viagem.png', 3),
(66, 'Vinte Mil Léguas Submarinas', 'Ficção', 3, '../uploads/20mil.jpg', 3),
(68, 'Corte de Espinhos e Rosas', 'Fantasia', 3, '../uploads/Corte de Espinhos e Rosas.png', 4),
(69, 'Corte de Névoa e Fúria', 'Fantasia', 3, '../uploads/Corte de Névoa e Fúria.png', 4),
(70, 'Corte de Asas e Ruína', 'Fantasia', 3, '../uploads/Corte de Asas e Ruína.png', 4),
(71, 'Corte de Chamas Prateadas', 'Fantasia', 3, '../uploads/Corte de Chamas Prateadas.png', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `nome`, `email`, `senha`, `tipo_usuario`) VALUES
(7, 'ADM', 'adm@gmail.com', '12345', 1),
(25, 'Maria Vitória', 'mariavitoria.6701@gmail.com', '1234', 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `categoria_livros`
--
ALTER TABLE `categoria_livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`emprestimo_id`);

--
-- Índices para tabela `historico`
--
ALTER TABLE `historico`
  ADD PRIMARY KEY (`id_hstorico`),
  ADD KEY `historico_id_FK` (`emprestimo_id`);

--
-- Índices para tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`livro_id`),
  ADD KEY `livro_categoria_id_FK` (`categoria_id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria_livros`
--
ALTER TABLE `categoria_livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `emprestimo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `historico`
--
ALTER TABLE `historico`
  MODIFY `id_hstorico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `livro_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `livros`
--
ALTER TABLE `livros`
  ADD CONSTRAINT `livro_categoria_id_FK` FOREIGN KEY (`categoria_id`) REFERENCES `categoria_livros` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
