-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 06/09/2025 às 21:04
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
-- Banco de dados: `sga_senai_dev`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alteracoes_turmas`
--

CREATE TABLE `alteracoes_turmas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_hora_alteracao_turma` datetime NOT NULL,
  `descricao_alteracao_turma` varchar(220) NOT NULL,
  `justificativa_alteracao_turma` varchar(220) NOT NULL,
  `colaborador_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `alteracoes_turmas`
--

INSERT INTO `alteracoes_turmas` (`id`, `data_hora_alteracao_turma`, `descricao_alteracao_turma`, `justificativa_alteracao_turma`, `colaborador_id`, `created_at`, `updated_at`) VALUES
(1, '2025-08-29 23:30:00', 'A aula de amanhã foi movida para o laboratório 3.', 'Manutenção não prevista na sala 101.', 1, '2025-09-06 19:02:51', '2025-09-06 19:02:51');

-- --------------------------------------------------------

--
-- Estrutura para tabela `ambientes`
--

CREATE TABLE `ambientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_ambiente` varchar(220) NOT NULL,
  `num_ambiente` int(11) DEFAULT NULL,
  `capacidade_ambiente` int(11) NOT NULL,
  `status_ambiente` enum('0','1') NOT NULL,
  `tipo_ambiente_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `ambientes`
--

INSERT INTO `ambientes` (`id`, `nome_ambiente`, `num_ambiente`, `capacidade_ambiente`, `status_ambiente`, `tipo_ambiente_id`, `created_at`, `updated_at`) VALUES
(1, 'Laboratorio de ciencias', 1, 32, '1', 3, '2025-09-06 18:48:56', '2025-09-06 18:48:56'),
(2, 'Oficina', 1, 32, '1', 1, '2025-09-06 18:49:07', '2025-09-06 18:49:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias_cursos`
--

CREATE TABLE `categorias_cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_categoria_curso` varchar(220) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `categorias_cursos`
--

INSERT INTO `categorias_cursos` (`id`, `nome_categoria_curso`, `created_at`, `updated_at`) VALUES
(1, 'CAI', '2025-09-06 18:50:04', '2025-09-06 18:50:04'),
(2, 'TEC', '2025-09-06 18:50:07', '2025-09-06 18:50:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaboradores`
--

CREATE TABLE `colaboradores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_colaborador` varchar(220) NOT NULL,
  `email_colaborador` varchar(220) NOT NULL,
  `especialidade_colaborador` varchar(220) NOT NULL,
  `tipo_colaborador_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `colaboradores`
--

INSERT INTO `colaboradores` (`id`, `nome_colaborador`, `email_colaborador`, `especialidade_colaborador`, `tipo_colaborador_id`, `created_at`, `updated_at`) VALUES
(1, 'Ana', 'ana.@email.com', 'Desenvolvimento de Sistemas', 1, '2025-09-06 18:51:23', '2025-09-06 18:51:23'),
(2, 'Ana', 'ana.@email.com', 'Desenvolvimento de Sistemas', 1, '2025-09-06 18:51:47', '2025-09-06 18:51:47'),
(3, 'Ana', 'ana.@email.com', 'Desenvolvimento de Sistemas', 1, '2025-09-06 18:52:42', '2025-09-06 18:52:42'),
(4, 'Ana Carolina', 'anacarolina.@email.com', 'Desenvolvimento de Software', 2, '2025-09-06 18:53:01', '2025-09-06 18:53:01');

-- --------------------------------------------------------

--
-- Estrutura para tabela `colaborador_turma`
--

CREATE TABLE `colaborador_turma` (
  `colaborador_id` bigint(20) UNSIGNED NOT NULL,
  `turma_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `colaborador_turma`
--

INSERT INTO `colaborador_turma` (`colaborador_id`, `turma_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 1, NULL, NULL),
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_curso` varchar(220) NOT NULL,
  `cor_curso` varchar(45) NOT NULL,
  `valor_curso` decimal(10,2) NOT NULL,
  `categoria_curso_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id`, `nome_curso`, `cor_curso`, `valor_curso`, `categoria_curso_id`, `created_at`, `updated_at`) VALUES
(1, 'Power B.I', '#ffffff', 0.00, 2, '2025-09-06 18:50:20', '2025-09-06 18:50:20'),
(2, 'A.D.S', '#ffffff', 0.00, 1, '2025-09-06 18:50:31', '2025-09-06 18:50:31');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias_das_semanas`
--

CREATE TABLE `dias_das_semanas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_dia_da_semana` varchar(220) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `dias_das_semanas`
--

INSERT INTO `dias_das_semanas` (`id`, `nome_dia_da_semana`, `created_at`, `updated_at`) VALUES
(1, 'Segunda', '2025-09-06 18:50:53', '2025-09-06 18:50:53'),
(2, 'Terça', '2025-09-06 18:50:59', '2025-09-06 18:50:59');

-- --------------------------------------------------------

--
-- Estrutura para tabela `dias_nao_letivos`
--

CREATE TABLE `dias_nao_letivos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_dia_nao_letivo` date NOT NULL,
  `descricao_dia_nao_letivo` varchar(220) NOT NULL,
  `tipo_feriado_dia_nao_letivo` enum('Municipal','Estadual','Nacional','Emenda','Ponto Facultativo') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dia_da_semana_turma`
--

CREATE TABLE `dia_da_semana_turma` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dia_da_semana_id` bigint(20) UNSIGNED NOT NULL,
  `turma_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `dia_da_semana_turma`
--

INSERT INTO `dia_da_semana_turma` (`id`, `dia_da_semana_id`, `turma_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_08_28_193510_create_tipos_colaboradores_table', 1),
(5, '2025_08_28_193624_create_dias_nao_letivos_table', 1),
(6, '2025_08_28_193919_create_categorias_cursos_table', 1),
(7, '2025_08_28_194008_create_dias_das_semanas_table', 1),
(8, '2025_08_28_194139_create_minutos_aulas_table', 1),
(9, '2025_08_28_194214_create_turnos_table', 1),
(10, '2025_08_28_194253_create_status_turmas_table', 1),
(11, '2025_08_28_194345_create_colaboradores_table', 1),
(12, '2025_08_28_195116_create_alteracoes_turmas_table', 1),
(13, '2025_08_28_195949_create_cursos_table', 1),
(14, '2025_08_29_181414_create_personal_access_tokens_table', 1),
(15, '2025_09_06_120951_create_tipos_ambientes_table', 1),
(16, '2025_09_06_122144_create_ambientes_table', 1),
(17, '2025_09_06_122314_create_turmas_table', 1),
(18, '2025_09_06_153723_create_colaborador_turma_table', 1),
(19, '2025_09_06_153742_create_dia_da_semana_turma_table', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `minutos_aulas`
--

CREATE TABLE `minutos_aulas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quant_minuto_aula` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `minutos_aulas`
--

INSERT INTO `minutos_aulas` (`id`, `quant_minuto_aula`, `created_at`, `updated_at`) VALUES
(1, 5, '2025-09-06 18:49:50', '2025-09-06 18:49:50'),
(2, 10, '2025-09-06 18:49:52', '2025-09-06 18:49:52'),
(3, 15, '2025-09-06 18:49:53', '2025-09-06 18:49:53'),
(4, 20, '2025-09-06 18:49:55', '2025-09-06 18:49:55');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `status_turmas`
--

CREATE TABLE `status_turmas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_status_turma` varchar(220) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `status_turmas`
--

INSERT INTO `status_turmas` (`id`, `nome_status_turma`, `created_at`, `updated_at`) VALUES
(1, 'Iniciado', '2025-09-06 18:49:22', '2025-09-06 18:49:22'),
(2, 'Prorrogado', '2025-09-06 18:49:29', '2025-09-06 18:49:29');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_ambientes`
--

CREATE TABLE `tipos_ambientes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_tipo_ambiente` varchar(220) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `tipos_ambientes`
--

INSERT INTO `tipos_ambientes` (`id`, `nome_tipo_ambiente`, `created_at`, `updated_at`) VALUES
(1, 'Oficina', '2025-09-06 18:47:37', '2025-09-06 18:47:37'),
(2, 'T.I', '2025-09-06 18:48:13', '2025-09-06 18:48:13'),
(3, 'Química', '2025-09-06 18:48:21', '2025-09-06 18:48:21');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_colaboradores`
--

CREATE TABLE `tipos_colaboradores` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_tipo_colaborador` varchar(220) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `tipos_colaboradores`
--

INSERT INTO `tipos_colaboradores` (`id`, `nome_tipo_colaborador`, `created_at`, `updated_at`) VALUES
(1, 'Gestor', '2025-09-06 18:51:08', '2025-09-06 18:51:08'),
(2, 'Secretária', '2025-09-06 18:51:13', '2025-09-06 18:51:13');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_turma` varchar(220) NOT NULL,
  `capacidade_turma` int(11) NOT NULL,
  `data_inicio_turma` date NOT NULL,
  `data_termino_turma` date NOT NULL,
  `curso_id` bigint(20) UNSIGNED NOT NULL,
  `ambiente_id` bigint(20) UNSIGNED NOT NULL,
  `status_turma_id` bigint(20) UNSIGNED NOT NULL,
  `minuto_aula_id` bigint(20) UNSIGNED NOT NULL,
  `turno_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `nome_turma`, `capacidade_turma`, `data_inicio_turma`, `data_termino_turma`, `curso_id`, `ambiente_id`, `status_turma_id`, `minuto_aula_id`, `turno_id`, `created_at`, `updated_at`) VALUES
(1, 'Turma de Laravel Avançado - 2026.1', 20, '2026-02-09', '2026-07-10', 1, 1, 1, 1, 1, '2025-09-06 18:54:20', '2025-09-06 18:54:20'),
(2, 'Turma de Laravel Avançado - 2026.1', 20, '2026-02-09', '2026-07-10', 1, 1, 1, 1, 1, '2025-09-06 18:54:47', '2025-09-06 18:54:47');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome_turno` varchar(100) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `turnos`
--

INSERT INTO `turnos` (`id`, `nome_turno`, `created_at`, `updated_at`) VALUES
(1, 'M', '2025-09-06 18:49:41', '2025-09-06 18:49:41'),
(2, 'T', '2025-09-06 18:49:43', '2025-09-06 18:49:43'),
(3, 'N', '2025-09-06 19:02:48', '2025-09-06 19:02:48');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alteracoes_turmas`
--
ALTER TABLE `alteracoes_turmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `alteracoes_turmas_colaborador_id_foreign` (`colaborador_id`);

--
-- Índices de tabela `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ambientes_tipo_ambiente_id_foreign` (`tipo_ambiente_id`);

--
-- Índices de tabela `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Índices de tabela `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colaboradores_tipo_colaborador_id_foreign` (`tipo_colaborador_id`);

--
-- Índices de tabela `colaborador_turma`
--
ALTER TABLE `colaborador_turma`
  ADD KEY `colaborador_turma_colaborador_id_foreign` (`colaborador_id`),
  ADD KEY `colaborador_turma_turma_id_foreign` (`turma_id`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cursos_categoria_curso_id_foreign` (`categoria_curso_id`);

--
-- Índices de tabela `dias_das_semanas`
--
ALTER TABLE `dias_das_semanas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `dias_nao_letivos`
--
ALTER TABLE `dias_nao_letivos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `dia_da_semana_turma`
--
ALTER TABLE `dia_da_semana_turma`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dia_da_semana_turma_dia_da_semana_id_foreign` (`dia_da_semana_id`),
  ADD KEY `dia_da_semana_turma_turma_id_foreign` (`turma_id`);

--
-- Índices de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Índices de tabela `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Índices de tabela `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `minutos_aulas`
--
ALTER TABLE `minutos_aulas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Índices de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Índices de tabela `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Índices de tabela `status_turmas`
--
ALTER TABLE `status_turmas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipos_ambientes`
--
ALTER TABLE `tipos_ambientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipos_colaboradores`
--
ALTER TABLE `tipos_colaboradores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `turmas_curso_id_foreign` (`curso_id`),
  ADD KEY `turmas_ambiente_id_foreign` (`ambiente_id`),
  ADD KEY `turmas_status_turma_id_foreign` (`status_turma_id`),
  ADD KEY `turmas_minuto_aula_id_foreign` (`minuto_aula_id`),
  ADD KEY `turmas_turno_id_foreign` (`turno_id`);

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alteracoes_turmas`
--
ALTER TABLE `alteracoes_turmas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `categorias_cursos`
--
ALTER TABLE `categorias_cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `colaboradores`
--
ALTER TABLE `colaboradores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `dias_das_semanas`
--
ALTER TABLE `dias_das_semanas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `dias_nao_letivos`
--
ALTER TABLE `dias_nao_letivos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dia_da_semana_turma`
--
ALTER TABLE `dia_da_semana_turma`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de tabela `minutos_aulas`
--
ALTER TABLE `minutos_aulas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `status_turmas`
--
ALTER TABLE `status_turmas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tipos_ambientes`
--
ALTER TABLE `tipos_ambientes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tipos_colaboradores`
--
ALTER TABLE `tipos_colaboradores`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `turnos`
--
ALTER TABLE `turnos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alteracoes_turmas`
--
ALTER TABLE `alteracoes_turmas`
  ADD CONSTRAINT `alteracoes_turmas_colaborador_id_foreign` FOREIGN KEY (`colaborador_id`) REFERENCES `colaboradores` (`id`);

--
-- Restrições para tabelas `ambientes`
--
ALTER TABLE `ambientes`
  ADD CONSTRAINT `ambientes_tipo_ambiente_id_foreign` FOREIGN KEY (`tipo_ambiente_id`) REFERENCES `tipos_ambientes` (`id`);

--
-- Restrições para tabelas `colaboradores`
--
ALTER TABLE `colaboradores`
  ADD CONSTRAINT `colaboradores_tipo_colaborador_id_foreign` FOREIGN KEY (`tipo_colaborador_id`) REFERENCES `tipos_colaboradores` (`id`);

--
-- Restrições para tabelas `colaborador_turma`
--
ALTER TABLE `colaborador_turma`
  ADD CONSTRAINT `colaborador_turma_colaborador_id_foreign` FOREIGN KEY (`colaborador_id`) REFERENCES `colaboradores` (`id`),
  ADD CONSTRAINT `colaborador_turma_turma_id_foreign` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_categoria_curso_id_foreign` FOREIGN KEY (`categoria_curso_id`) REFERENCES `categorias_cursos` (`id`);

--
-- Restrições para tabelas `dia_da_semana_turma`
--
ALTER TABLE `dia_da_semana_turma`
  ADD CONSTRAINT `dia_da_semana_turma_dia_da_semana_id_foreign` FOREIGN KEY (`dia_da_semana_id`) REFERENCES `dias_das_semanas` (`id`),
  ADD CONSTRAINT `dia_da_semana_turma_turma_id_foreign` FOREIGN KEY (`turma_id`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ambiente_id_foreign` FOREIGN KEY (`ambiente_id`) REFERENCES `ambientes` (`id`),
  ADD CONSTRAINT `turmas_curso_id_foreign` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `turmas_minuto_aula_id_foreign` FOREIGN KEY (`minuto_aula_id`) REFERENCES `minutos_aulas` (`id`),
  ADD CONSTRAINT `turmas_status_turma_id_foreign` FOREIGN KEY (`status_turma_id`) REFERENCES `status_turmas` (`id`),
  ADD CONSTRAINT `turmas_turno_id_foreign` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
