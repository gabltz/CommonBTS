-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 12:46
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
-- Structure de la table `acteur_equipe`
--

DROP TABLE IF EXISTS `acteur_equipe`;
CREATE TABLE IF NOT EXISTS `acteur_equipe` (
  `id_acteur_equipe` int(11) NOT NULL AUTO_INCREMENT,
  `id_act` int(11) NOT NULL,
  `id_equ` int(11) NOT NULL,
  PRIMARY KEY (`id_acteur_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf16;

--
-- Déchargement des données de la table `acteur_equipe`
--

INSERT INTO `acteur_equipe` (`id_acteur_equipe`, `id_act`, `id_equ`) VALUES
(2, 78, 13),
(3, 80, 13),
(5, 88, 13),
(6, 84, 13),
(8, 77, 13),
(9, 81, 13),
(11, 79, 13),
(12, 89, 13),
(13, 91, 13),
(14, 103, 13),
(15, 112, 13),
(16, 109, 13),
(17, 110, 13),
(18, 111, 13),
(20, 108, 13),
(22, 118, 13),
(23, 107, 13),
(24, 117, 13),
(25, 1299, 13),
(26, 1300, 13),
(27, 1301, 13),
(28, 1302, 13),
(29, 1303, 13),
(30, 1305, 13),
(31, 1306, 13),
(32, 1306, 13),
(33, 1307, 13),
(34, 1308, 13),
(35, 1309, 13),
(36, 1310, 13),
(37, 1311, 13);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
