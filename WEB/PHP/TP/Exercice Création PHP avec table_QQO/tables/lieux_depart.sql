-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 12:44
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
-- Structure de la table `lieux_depart`
--

DROP TABLE IF EXISTS `lieux_depart`;
CREATE TABLE IF NOT EXISTS `lieux_depart` (
  `id_ld` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `plan` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ld`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `lieux_depart`
--

INSERT INTO `lieux_depart` (`id_ld`, `nom`, `adresse`, `plan`) VALUES
(2, 'La Bourgonce', 'Gymnase 146 Allee des sports 88100 Sainte-Marguerite', 'https://www.viamichelin.fr/web/Cartes-plans?address=rue%20des%20sports%2088100%20sainte%20marguerite'),
(3, 'La Salle', ' rue des anciens combatants d\'Afrique du nord 88470 La Voivre', 'https://www.viamichelin.fr/web/Cartes-plans?address=88100%20Sainte-Marguerite'),
(4, 'La Voivre', 'Gymnase de St-Michel 132 Route de rambervillers 88470 Saint-Michel-sur-Meurthe', 'https://www.viamichelin.fr/web/Cartes-plans?address=132%20Route%20de%20rambervillers%2088470%20Saint-michel-sur-meurthe'),
(5, 'Ste-Marguerite', 'Salle des fetes   119  rue le centre 88470 La Bourgonce', 'https://www.viamichelin.fr/web/Cartes-plans?address=119%20le%20centre%20la%20bourgonce%2088'),
(6, 'St-Michel', 'Salle des fetes  1 route de Saint-Die 88470 La Salle', 'https://www.viamichelin.fr/web/Cartes-plans?address=1%20route%20de%20sint-die%20la%20salle%2088'),
(20, 'Je voyage seul', '*', '**'),
(21, 'Gymnase RAON', 'Halle des sports de Raon L\'Etape, Rue du GÃ©nÃ©ral Sarrail, 88110 Raon-l\'Ã‰tape', 'https://www.google.com/maps/dir/48.3360768,6.8386816/gymnase+Raon+l\'etape+mappy/@48.4020806,6.8290661,17.21z/data=!4m9!4m8!1m1!4e1!1m5!1m1!1s0x47938cf920bc9497:0x94d6bd3fc0bc5933!2m2!1d6.83045!2d48.4020195?entry=ttu');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
