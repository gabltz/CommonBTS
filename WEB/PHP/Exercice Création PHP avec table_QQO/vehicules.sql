-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 13:41
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
-- Structure de la table `vehicules`
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE IF NOT EXISTS `vehicules` (
  `id_veh` int(11) NOT NULL AUTO_INCREMENT,
  `nbr_places` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `km_cumul` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_veh`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vehicules`
--

INSERT INTO `vehicules` (`id_veh`, `nbr_places`, `nom`, `km_cumul`) VALUES
(1, 2, 'Guillaume Moto', NULL),
(2, 5, 'Spiry berlingo', NULL),
(3, 7, 'Spiry C4', NULL),
(4, 7, 'Chartier C4', NULL),
(5, 5, 'Vero Auto', NULL),
(6, 5, 'Auto Franc', NULL),
(7, 5, 'Chantal\'s car', NULL),
(8, 5, 'Cecile Auto', NULL),
(9, 5, 'Guillaume Tracteur et remorque', 2),
(10, 5, 'Nathalie Jacques Auto', NULL),
(11, 2, 'Jacques Moto', NULL),
(12, 1, 'Bastien Mono-roue', NULL),
(13, 5, 'Chartier Berlingo', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
