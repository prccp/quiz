-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  Dim 27 mai 2018 à 07:07
-- Version du serveur :  10.1.32-MariaDB
-- Version de PHP :  7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `quizzes`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Testes');

-- --------------------------------------------------------

--
-- Structure de la table `options`
--

CREATE TABLE `options` (
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `text` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Déchargement des données de la table `options`
--

INSERT INTO `options` (`quiz_id`, `question_id`, `id`, `text`, `value`) VALUES
(1, 2, 1, 'Front-end', 'front-end'),
(1, 2, 2, 'Back-end', 'back-end');

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

CREATE TABLE `questions` (
  `quiz_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `text` varchar(255) CHARACTER SET latin1 NOT NULL,
  `type` varchar(10) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`quiz_id`, `id`, `text`, `type`) VALUES
(1, 1, 'Qual o seu nome?', 'text'),
(1, 2, 'Para qual área você está aplicando?', 'select');

-- --------------------------------------------------------

--
-- Structure de la table `quiz`
--

CREATE TABLE `quiz` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `category` tinyint(10) NOT NULL,
  `basePoints` smallint(6) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `alreadyAnswered` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Déchargement des données de la table `quiz`
--

INSERT INTO `quiz` (`id`, `name`, `description`, `category`, `basePoints`, `startDate`, `endDate`, `isActive`, `alreadyAnswered`) VALUES
(1, 'Teste de desenvolvimento', 'Teste para desenvolvedor back-end', 1, 100, '2018-02-15 00:00:00', '2018-02-22 00:00:00', 1, 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `options`
--
ALTER TABLE `options`
  ADD UNIQUE KEY `index` (`quiz_id`,`question_id`,`id`);

--
-- Index pour la table `questions`
--
ALTER TABLE `questions`
  ADD UNIQUE KEY `index` (`quiz_id`,`id`);

--
-- Index pour la table `quiz`
--
ALTER TABLE `quiz`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `quiz`
--
ALTER TABLE `quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
