-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 13:42
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
-- Structure de la table `clubs`
--

DROP TABLE IF EXISTS `clubs`;
CREATE TABLE IF NOT EXISTS `clubs` (
  `id_clu` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(80) DEFAULT NULL,
  `numero_de_club` int(11) DEFAULT NULL,
  `adresse_logo` varchar(80) DEFAULT NULL,
  `couleur1` int(11) DEFAULT NULL,
  `couleur2` int(11) DEFAULT NULL,
  `couleur3` int(11) DEFAULT NULL,
  `adresse_photo1` varchar(60) DEFAULT NULL,
  `adresse_photo2` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_clu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clubs`
--

INSERT INTO `clubs` (`id_clu`, `nom`, `numero_de_club`, `adresse_logo`, `couleur1`, `couleur2`, `couleur3`, `adresse_photo1`, `adresse_photo2`) VALUES
(1, 'Saint-marguerite', 123, 'adresse_club', 1, 2, 3, NULL, NULL),
(2, 'Saint-Die', 101, 'adresse_club', 1, 2, 3, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
