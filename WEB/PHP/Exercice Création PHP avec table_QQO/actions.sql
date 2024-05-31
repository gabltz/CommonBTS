-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 12:47
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
-- Structure de la table `actions`
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE IF NOT EXISTS `actions` (
  `id_action` int(11) NOT NULL AUTO_INCREMENT,
  `id_clu` int(11) NOT NULL,
  `id_equ` int(11) NOT NULL,
  `id_act` int(11) NOT NULL,
  `id_eve` int(11) NOT NULL,
  `id_veh` int(11) NOT NULL,
  `id_ld` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`id_action`)
) ENGINE=InnoDB AUTO_INCREMENT=1887 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `actions`
--

INSERT INTO `actions` (`id_action`, `id_clu`, `id_equ`, `id_act`, `id_eve`, `id_veh`, `id_ld`, `id_rol`) VALUES
(1747, 1, 13, 80, 30, 1, 4, 1),
(1764, 1, 13, 80, 31, 0, 4, 1),
(1862, 1, 13, 1299, 31, 0, -1, 1),
(1863, 1, 13, 1299, 32, 0, -1, 1),
(1864, 1, 13, 1299, 33, 0, -1, 1),
(1865, 1, 13, 1299, 30, 0, -1, 1),
(1867, 1, 13, 81, 33, 0, -1, 1),
(1868, 1, 13, 80, 31, 0, 0, 5),
(1869, 1, 13, 80, 32, 0, 0, 8),
(1872, 1, 13, 80, 32, 0, 5, 2),
(1873, 1, 13, 80, 33, 0, 4, 2),
(1874, 1, 13, 80, 30, 0, 5, 2),
(1875, 1, 13, 80, 32, 0, 0, 6),
(1878, 1, 13, 80, 34, 0, 20, 2),
(1879, 1, 13, 80, 34, 0, 0, 11),
(1880, 1, 13, 80, 34, 0, 0, 9),
(1886, 1, 13, 80, 31, 0, 20, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
