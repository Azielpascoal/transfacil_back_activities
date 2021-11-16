-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 04/10/2021 às 11:32
-- Versão do servidor: 10.4.20-MariaDB
-- Versão do PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `transfacil`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `charger_taxista`
--

CREATE TABLE `charger_taxista` (
  `id_charger_taxista` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `carta_de_conducao` varchar(50) NOT NULL,
  `modelo_do_carro` varchar(50) NOT NULL,
  `espacamento` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `id_rota` int(11) NOT NULL,
  `n_telefone` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(50) NOT NULL,
  `n_bilhete` varchar(14) NOT NULL,
  `is_taxista` tinyint(1) NOT NULL,
  `is_charger_taxista` tinyint(1) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `horario`
--

CREATE TABLE `horario` (
  `id_horario` int(11) NOT NULL,
  `horario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedidos` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_taxista` int(11) NOT NULL,
  `id_charger_taxista` int(11) NOT NULL,
  `id_rota` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `valor_a_pagar` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `rotas`
--

CREATE TABLE `rotas` (
  `id_rotas` int(11) NOT NULL,
  `nome_rota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura para tabela `taxista`
--

CREATE TABLE `taxista` (
  `id_taxista` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `carta_de_conducao` varchar(50) NOT NULL,
  `modelo_do_carro` varchar(50) NOT NULL,
  `espacamento` int(11) NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `id_rota` int(11) NOT NULL,
  `n_telefone` int(11) NOT NULL,
  `id_horario` int(11) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `charger_taxista`
--
ALTER TABLE `charger_taxista`
  ADD PRIMARY KEY (`id_charger_taxista`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_rota` (`id_rota`),
  ADD KEY `id_horario` (`id_horario`);

--
-- Índices de tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices de tabela `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id_horario`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedidos`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_rota` (`id_rota`),
  ADD KEY `id_horario` (`id_horario`),
  ADD KEY `id_taxista` (`id_taxista`),
  ADD KEY `id_charger_taxista` (`id_charger_taxista`);

--
-- Índices de tabela `rotas`
--
ALTER TABLE `rotas`
  ADD PRIMARY KEY (`id_rotas`);

--
-- Índices de tabela `taxista`
--
ALTER TABLE `taxista`
  ADD PRIMARY KEY (`id_taxista`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_rota` (`id_rota`),
  ADD KEY `id_horario` (`id_horario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `charger_taxista`
--
ALTER TABLE `charger_taxista`
  MODIFY `id_charger_taxista` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `horario`
--
ALTER TABLE `horario`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedidos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `rotas`
--
ALTER TABLE `rotas`
  MODIFY `id_rotas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `taxista`
--
ALTER TABLE `taxista`
  MODIFY `id_taxista` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `charger_taxista`
--
ALTER TABLE `charger_taxista`
  ADD CONSTRAINT `charger_taxista_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `charger_taxista_ibfk_2` FOREIGN KEY (`id_rota`) REFERENCES `rotas` (`id_rotas`),
  ADD CONSTRAINT `charger_taxista_ibfk_3` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_rota`) REFERENCES `rotas` (`id_rotas`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`id_taxista`) REFERENCES `taxista` (`id_taxista`),
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`id_charger_taxista`) REFERENCES `charger_taxista` (`id_charger_taxista`);

--
-- Restrições para tabelas `taxista`
--
ALTER TABLE `taxista`
  ADD CONSTRAINT `taxista_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `taxista_ibfk_2` FOREIGN KEY (`id_rota`) REFERENCES `rotas` (`id_rotas`),
  ADD CONSTRAINT `taxista_ibfk_3` FOREIGN KEY (`id_horario`) REFERENCES `horario` (`id_horario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;