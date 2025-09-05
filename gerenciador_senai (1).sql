-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05/09/2025 às 20:48
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `gerenciador_senai`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alteracao_turma`
--

CREATE TABLE `alteracao_turma` (
  `id_alteracao_turma` int(11) NOT NULL,
  `data_hora_alteracao_turmacol` datetime NOT NULL,
  `descricao_alteracao_turma` varchar(220) NOT NULL,
  `justificativa_alteracao_turma` varchar(220) NOT NULL,
  `sessions_id_session` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `alteracao_turma`
--

INSERT INTO `alteracao_turma` (`id_alteracao_turma`, `data_hora_alteracao_turmacol`, `descricao_alteracao_turma`, `justificativa_alteracao_turma`, `sessions_id_session`) VALUES
(1, '2025-09-03 20:37:49', 'Mudamos da sala 1 para a 2', 'Quebrou o projetor', 0),
(2, '2025-09-03 20:37:49', 'Mudamos para 20 alunos na turma', 'Conseguimos mais computadores', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ambientes`
--

CREATE TABLE `ambientes` (
  `id_ambiente` int(11) NOT NULL,
  `nome_ambiente` varchar(220) NOT NULL,
  `num_ambiente` int(11) DEFAULT NULL,
  `capacidade_ambiente` int(11) NOT NULL,
  `status_ambiente` enum('0','1') NOT NULL,
  `tipos_ambientes_id_tipo_ambiente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `ambientes`
--

INSERT INTO `ambientes` (`id_ambiente`, `nome_ambiente`, `num_ambiente`, `capacidade_ambiente`, `status_ambiente`, `tipos_ambientes_id_tipo_ambiente`) VALUES
(18, 'Sala 1', 2, 32, '1', 4),
(19, 'Oficina 1', 1, 32, '1', 1),
(20, 'Sala 2', 1, 32, '1', 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias_cursos`
--

CREATE TABLE `categorias_cursos` (
  `id_categoria_curso` int(11) NOT NULL,
  `nome_categoria_curso` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `categorias_cursos`
--

INSERT INTO `categorias_cursos` (`id_categoria_curso`, `nome_categoria_curso`) VALUES
(15, 'TEC'),
(16, 'CAI'),
(17, 'FIC I'),
(18, 'FIC A '),
(19, 'FIC Q'),
(20, 'FIC E');

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaboladores`
--

CREATE TABLE `colaboladores` (
  `id_colabolador` int(11) NOT NULL,
  `nome_colaborador` varchar(220) NOT NULL,
  `especialidade_colabolador` varchar(220) NOT NULL,
  `tipos_colaboradores_id_tipo_colaborador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `colaboladores`
--

INSERT INTO `colaboladores` (`id_colabolador`, `nome_colaborador`, `especialidade_colabolador`, `tipos_colaboradores_id_tipo_colaborador`) VALUES
(6, 'Nilo', 'Front-end', 7),
(7, 'Marcos', 'Back-end', 8);

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaboladores_has_turmas`
--

CREATE TABLE `colaboladores_has_turmas` (
  `Colaboladores_id_colabolador` int(11) NOT NULL,
  `Turmas_id_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `colaboladores_has_turmas`
--

INSERT INTO `colaboladores_has_turmas` (`Colaboladores_id_colabolador`, `Turmas_id_turma`) VALUES
(6, 7),
(7, 6);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id_curso` int(11) NOT NULL,
  `nome_curso` varchar(220) NOT NULL,
  `cor_curso` varchar(45) NOT NULL,
  `valor_curso` float NOT NULL,
  `categorias_cursos_id_tipo_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_curso`, `nome_curso`, `cor_curso`, `valor_curso`, `categorias_cursos_id_tipo_curso`) VALUES
(11, 'Desenvolvimento de sistemas', '#00000', 0, 15),
(12, 'I.O.T', '#fffff', 0, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias_das_semanas`
--

CREATE TABLE `dias_das_semanas` (
  `id_dia_da_semana` int(11) NOT NULL,
  `dia_da_semana` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `dias_das_semanas`
--

INSERT INTO `dias_das_semanas` (`id_dia_da_semana`, `dia_da_semana`) VALUES
(1, 'Domingo'),
(10, 'Segunda'),
(11, 'Terça'),
(12, 'Quarta'),
(13, 'Quinta'),
(14, 'Sexta'),
(15, 'Sábado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias_da_semanas_has_turmas`
--

CREATE TABLE `dias_da_semanas_has_turmas` (
  `dias_da_semanas_id_dias_da_semana` int(11) NOT NULL,
  `turmas_id_turma` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `dias_da_semanas_has_turmas`
--

INSERT INTO `dias_da_semanas_has_turmas` (`dias_da_semanas_id_dias_da_semana`, `turmas_id_turma`) VALUES
(10, 6),
(11, 7),
(12, 6),
(13, 7);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias_nao_letivos`
--

CREATE TABLE `dias_nao_letivos` (
  `id_dia_nao_letivo` int(11) NOT NULL,
  `data_dia_nao_letivo` date NOT NULL,
  `descricao_dia_nao_letivo` varchar(220) NOT NULL,
  `tipo_feriado_dia_nao_letivo` enum('Feriado Nacional','Feriado Estadual','Feriado Municipal','Ponto Facultativo') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `dias_nao_letivos`
--

INSERT INTO `dias_nao_letivos` (`id_dia_nao_letivo`, `data_dia_nao_letivo`, `descricao_dia_nao_letivo`, `tipo_feriado_dia_nao_letivo`) VALUES
(3, '2026-01-01', 'Natal', 'Feriado Nacional'),
(4, '2026-01-01', 'Ano novo', 'Feriado Nacional'),
(5, '2025-09-07', 'Dia da independência ', 'Feriado Nacional');

-- --------------------------------------------------------

--
-- Estrutura para tabela `hora_aula`
--

CREATE TABLE `hora_aula` (
  `id_tempo_curso` int(11) NOT NULL,
  `quantidade_tempo_curso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `hora_aula`
--

INSERT INTO `hora_aula` (`id_tempo_curso`, `quantidade_tempo_curso`) VALUES
(25, '5'),
(26, '10'),
(27, '15'),
(28, '20'),
(29, '25'),
(30, '30'),
(31, '35'),
(32, '40'),
(33, '45'),
(34, '50'),
(35, '55'),
(36, '60'),
(37, '65'),
(38, '70'),
(39, '75'),
(40, '80'),
(41, '85'),
(42, '90'),
(43, '95'),
(44, '100'),
(45, '105'),
(46, '110'),
(47, '115'),
(48, '120');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id_session` int(11) NOT NULL,
  `email_session` varchar(90) NOT NULL,
  `token_session` varchar(255) NOT NULL,
  `status_session` enum('0','1') NOT NULL,
  `datetime_session` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `sessions`
--

INSERT INTO `sessions` (`id_session`, `email_session`, `token_session`, `status_session`, `datetime_session`) VALUES
(1, 'arthurito@sp.senai.br', '$2y$10$tJ08V0N.1sLqJ3j1S2o4.u8i2l.X0gW1S2R3V4S5T6P.q.1', '1', '2025-09-05 15:04:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_turmas`
--

CREATE TABLE `status_turmas` (
  `id_status_turma` int(11) NOT NULL,
  `nome_status_turma` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `status_turmas`
--

INSERT INTO `status_turmas` (`id_status_turma`, `nome_status_turma`) VALUES
(8, 'Iniciada'),
(9, 'Prorrogada ');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_ambientes`
--

CREATE TABLE `tipos_ambientes` (
  `id_tipo_ambiente` int(11) NOT NULL,
  `nome_tipo_ambiente` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_ambientes`
--

INSERT INTO `tipos_ambientes` (`id_tipo_ambiente`, `nome_tipo_ambiente`) VALUES
(1, 'Automobilística '),
(2, 'Metalmecânica '),
(3, 'Tecnologia da informação'),
(4, 'Química '),
(5, 'Panificação'),
(6, 'Descentralizado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_colaboradores`
--

CREATE TABLE `tipos_colaboradores` (
  `id_tipo_colaborador` int(11) NOT NULL,
  `nome_tipo_colaborador` varchar(220) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tipos_colaboradores`
--

INSERT INTO `tipos_colaboradores` (`id_tipo_colaborador`, `nome_tipo_colaborador`) VALUES
(7, 'Gestor'),
(8, 'Secretária'),
(9, 'Coordenador');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id_turma` int(11) NOT NULL,
  `turma_nome` varchar(45) NOT NULL,
  `capacidade_turma` int(11) NOT NULL,
  `data_inicio_turma` date NOT NULL,
  `data_termino_turma` date NOT NULL,
  `Cursos_id_cursos` int(11) NOT NULL,
  `Ambientes_id_ambiente` int(11) NOT NULL,
  `status_turmas_id_status_turma` int(11) NOT NULL,
  `hora_aula_id_tempo_curso` int(11) NOT NULL,
  `turnos_id_turno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id_turma`, `turma_nome`, `capacidade_turma`, `data_inicio_turma`, `data_termino_turma`, `Cursos_id_cursos`, `Ambientes_id_ambiente`, `status_turmas_id_status_turma`, `hora_aula_id_tempo_curso`, `turnos_id_turno`) VALUES
(6, 'Dev-Reg24', 32, '2025-09-03', '2025-11-15', 11, 20, 8, 25, 8),
(7, 'Dev-Reg25', 32, '2025-09-03', '2025-12-05', 12, 19, 9, 26, 9);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL,
  `nome_turno` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `turnos`
--

INSERT INTO `turnos` (`id_turno`, `nome_turno`) VALUES
(8, 'M'),
(9, 'T'),
(10, 'N'),
(11, 'I');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alteracao_turma`
--
ALTER TABLE `alteracao_turma`
  ADD PRIMARY KEY (`id_alteracao_turma`),
  ADD KEY `fk_alteracao_turma_sessions1_idx` (`sessions_id_session`);

--
-- Índices de tabela `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`id_ambiente`),
  ADD KEY `fk_ambientes_tipos_ambientes1_idx` (`tipos_ambientes_id_tipo_ambiente`);

--
-- Índices de tabela `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  ADD PRIMARY KEY (`id_categoria_curso`);

--
-- Índices de tabela `colaboladores`
--
ALTER TABLE `colaboladores`
  ADD PRIMARY KEY (`id_colabolador`),
  ADD KEY `fk_colaboladores_tipos_colaboradores1_idx` (`tipos_colaboradores_id_tipo_colaborador`);

--
-- Índices de tabela `colaboladores_has_turmas`
--
ALTER TABLE `colaboladores_has_turmas`
  ADD PRIMARY KEY (`Colaboladores_id_colabolador`,`Turmas_id_turma`),
  ADD KEY `fk_Colaboladores_has_Turmas_Turmas1_idx` (`Turmas_id_turma`),
  ADD KEY `fk_Colaboladores_has_Turmas_Colaboladores1_idx` (`Colaboladores_id_colabolador`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_curso`),
  ADD KEY `fk_cursos_categorias_cursos1_idx` (`categorias_cursos_id_tipo_curso`);

--
-- Índices de tabela `dias_das_semanas`
--
ALTER TABLE `dias_das_semanas`
  ADD PRIMARY KEY (`id_dia_da_semana`);

--
-- Índices de tabela `dias_da_semanas_has_turmas`
--
ALTER TABLE `dias_da_semanas_has_turmas`
  ADD PRIMARY KEY (`dias_da_semanas_id_dias_da_semana`,`turmas_id_turma`),
  ADD KEY `fk_dias_da_semanas_has_turmas_turmas1_idx` (`turmas_id_turma`),
  ADD KEY `fk_dias_da_semanas_has_turmas_dias_da_semanas1_idx` (`dias_da_semanas_id_dias_da_semana`);

--
-- Índices de tabela `dias_nao_letivos`
--
ALTER TABLE `dias_nao_letivos`
  ADD PRIMARY KEY (`id_dia_nao_letivo`);

--
-- Índices de tabela `hora_aula`
--
ALTER TABLE `hora_aula`
  ADD PRIMARY KEY (`id_tempo_curso`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id_session`);

--
-- Índices de tabela `status_turmas`
--
ALTER TABLE `status_turmas`
  ADD PRIMARY KEY (`id_status_turma`);

--
-- Índices de tabela `tipos_ambientes`
--
ALTER TABLE `tipos_ambientes`
  ADD PRIMARY KEY (`id_tipo_ambiente`);

--
-- Índices de tabela `tipos_colaboradores`
--
ALTER TABLE `tipos_colaboradores`
  ADD PRIMARY KEY (`id_tipo_colaborador`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id_turma`),
  ADD KEY `fk_Turmas_Cursos1_idx` (`Cursos_id_cursos`),
  ADD KEY `fk_Turmas_Ambientes1_idx` (`Ambientes_id_ambiente`),
  ADD KEY `fk_turmas_status_turmas1_idx` (`status_turmas_id_status_turma`),
  ADD KEY `fk_turmas_hora_aula1_idx` (`hora_aula_id_tempo_curso`),
  ADD KEY `fk_turmas_turnos1_idx` (`turnos_id_turno`);

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id_turno`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alteracao_turma`
--
ALTER TABLE `alteracao_turma`
  MODIFY `id_alteracao_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `id_ambiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  MODIFY `id_categoria_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `colaboladores`
--
ALTER TABLE `colaboladores`
  MODIFY `id_colabolador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `dias_das_semanas`
--
ALTER TABLE `dias_das_semanas`
  MODIFY `id_dia_da_semana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `dias_nao_letivos`
--
ALTER TABLE `dias_nao_letivos`
  MODIFY `id_dia_nao_letivo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `hora_aula`
--
ALTER TABLE `hora_aula`
  MODIFY `id_tempo_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de tabela `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id_session` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `status_turmas`
--
ALTER TABLE `status_turmas`
  MODIFY `id_status_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `tipos_ambientes`
--
ALTER TABLE `tipos_ambientes`
  MODIFY `id_tipo_ambiente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `tipos_colaboradores`
--
ALTER TABLE `tipos_colaboradores`
  MODIFY `id_tipo_colaborador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id_turma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alteracao_turma`
--
ALTER TABLE `alteracao_turma`
  ADD CONSTRAINT `fk_alteracao_turma_sessions1` FOREIGN KEY (`sessions_id_session`) REFERENCES `sessions` (`id_session`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `ambientes`
--
ALTER TABLE `ambientes`
  ADD CONSTRAINT `fk_ambientes_tipos_ambientes1` FOREIGN KEY (`tipos_ambientes_id_tipo_ambiente`) REFERENCES `tipos_ambientes` (`id_tipo_ambiente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `colaboladores`
--
ALTER TABLE `colaboladores`
  ADD CONSTRAINT `fk_colaboladores_tipos_colaboradores1` FOREIGN KEY (`tipos_colaboradores_id_tipo_colaborador`) REFERENCES `tipos_colaboradores` (`id_tipo_colaborador`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `colaboladores_has_turmas`
--
ALTER TABLE `colaboladores_has_turmas`
  ADD CONSTRAINT `fk_Colaboladores_has_Turmas_Colaboladores1` FOREIGN KEY (`Colaboladores_id_colabolador`) REFERENCES `colaboladores` (`id_colabolador`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Colaboladores_has_Turmas_Turmas1` FOREIGN KEY (`Turmas_id_turma`) REFERENCES `turmas` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `fk_cursos_categorias_cursos1` FOREIGN KEY (`categorias_cursos_id_tipo_curso`) REFERENCES `categorias_cursos` (`id_categoria_curso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `dias_da_semanas_has_turmas`
--
ALTER TABLE `dias_da_semanas_has_turmas`
  ADD CONSTRAINT `fk_dias_da_semanas_has_turmas_dias_da_semanas1` FOREIGN KEY (`dias_da_semanas_id_dias_da_semana`) REFERENCES `dias_das_semanas` (`id_dia_da_semana`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dias_da_semanas_has_turmas_turmas1` FOREIGN KEY (`turmas_id_turma`) REFERENCES `turmas` (`id_turma`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `fk_Turmas_Ambientes1` FOREIGN KEY (`Ambientes_id_ambiente`) REFERENCES `ambientes` (`id_ambiente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Turmas_Cursos1` FOREIGN KEY (`Cursos_id_cursos`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turmas_hora_aula1` FOREIGN KEY (`hora_aula_id_tempo_curso`) REFERENCES `hora_aula` (`id_tempo_curso`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turmas_status_turmas1` FOREIGN KEY (`status_turmas_id_status_turma`) REFERENCES `status_turmas` (`id_status_turma`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_turmas_turnos1` FOREIGN KEY (`turnos_id_turno`) REFERENCES `turnos` (`id_turno`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
