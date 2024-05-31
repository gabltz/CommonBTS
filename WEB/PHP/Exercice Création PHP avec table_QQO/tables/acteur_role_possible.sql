-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 12:45
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd_qqo3`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteur_role_possible`
--

DROP TABLE IF EXISTS `acteur_role_possible`;
CREATE TABLE IF NOT EXISTS `acteur_role_possible` (
  `id_acteur_role_possible` int(11) NOT NULL AUTO_INCREMENT,
  `id_act` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_acteur_role_possible`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acteur_role_possible`
--

INSERT INTO `acteur_role_possible` (`id_acteur_role_possible`, `id_act`, `id_rol`) VALUES
(1, 78, 1),
(2, 78, 4),
(3, 78, 8),
(4, 78, 9),
(5, 78, 10),
(6, 78, 11),
(7, 91, 1),
(8, 91, 4),
(9, 91, 8),
(10, 91, 9),
(11, 91, 10),
(12, 91, 11),
(13, 80, 2),
(14, 80, 4),
(15, 80, 6),
(16, 80, 7),
(17, 80, 9),
(18, 80, 10),
(19, 80, 11),
(20, 88, 2),
(21, 88, 4),
(22, 88, 6),
(23, 88, 9),
(24, 88, 10),
(25, 88, 11),
(26, 89, 2),
(27, 89, 3),
(28, 89, 4),
(29, 89, 5),
(30, 89, 6),
(31, 89, 7),
(32, 89, 8),
(33, 89, 9),
(34, 89, 10),
(35, 89, 11),
(38, 104, 5),
(39, 114, 1),
(41, 118, 1),
(42, 107, 2),
(44, 107, 3),
(45, 81, 4),
(46, 103, 2),
(47, 81, 2),
(48, 107, 1),
(49, 117, 1),
(50, 117, 2),
(51, 117, 3),
(52, 123, 123),
(54, 117, 12),
(57, 117, 35);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
