-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 mai 2024 à 12:43
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
-- Structure de la table `acteurs`
--

DROP TABLE IF EXISTS `acteurs`;
CREATE TABLE IF NOT EXISTS `acteurs` (
  `id_act` int(11) NOT NULL AUTO_INCREMENT,
  `code_lieu_depart` int(11) DEFAULT '-10',
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `numero_licence` int(11) DEFAULT NULL,
  `mention` varchar(25) DEFAULT NULL,
  `date_naissance` varchar(20) DEFAULT NULL,
  `adr_mail` varchar(80) DEFAULT NULL,
  `adresse_rue` varchar(255) DEFAULT NULL,
  `adresse_CP` varchar(255) DEFAULT NULL,
  `adresse_ville` varchar(255) DEFAULT NULL,
  `tel_por` varchar(10) DEFAULT NULL,
  `tel_fix` varchar(10) DEFAULT NULL,
  `tel_pro` varchar(10) DEFAULT NULL,
  `numero_maillot` int(11) DEFAULT NULL,
  `equipe` varchar(25) DEFAULT NULL,
  `sexe` varchar(5) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `mdp` varchar(25) DEFAULT NULL,
  `joueur` int(11) DEFAULT NULL,
  `chauffeur` int(11) DEFAULT NULL,
  `niv_acces` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_act`)
) ENGINE=InnoDB AUTO_INCREMENT=1312 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `acteurs`
--

INSERT INTO `acteurs` (`id_act`, `code_lieu_depart`, `nom`, `prenom`, `numero_licence`, `mention`, `date_naissance`, `adr_mail`, `adresse_rue`, `adresse_CP`, `adresse_ville`, `tel_por`, `tel_fix`, `tel_pro`, `numero_maillot`, `equipe`, `sexe`, `login`, `mdp`, `joueur`, `chauffeur`, `niv_acces`) VALUES
(108, 0, 'MANGINa', 'Abel', 0, '', '0000-00-00', '', '', '', '', '', '', '', -3, '', '1', 'abelmangin', '', 1, 1, 0),
(117, 0, 'PIER', 'Julien', 2047487867, 'Joueur', '0000-00-00', 'julien.pierron@gmail.com', 'la grande rue', '88780', 'bourg', '0709801225', '', '', 0, '', '1', 'julienpierron', '', 1, 1, 0),
(1300, NULL, 'KULFT', 'Antoine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'antoinekulft', '', 1, 1, 0),
(1301, NULL, 'PIR', 'Esteban', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'estebanpierson', NULL, 1, 1, 0),
(1302, NULL, 'MYER', 'Guillaume', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'guillaumemeyer', NULL, 1, 1, 0),
(1303, NULL, 'MBOI', 'James', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jamesmboiboi', NULL, 1, 1, 0),
(1305, NULL, 'AUR', 'Aurel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'aurelienaurel', NULL, 1, 1, 0),
(1306, NULL, 'CHELIER', 'Theo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'chevaliertheo', NULL, 1, 1, 0),
(1307, NULL, 'DAM', 'Massi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'damsmassi', NULL, 1, 1, 0),
(1308, NULL, 'OUAR', 'Guillaume', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'douarguillaume', NULL, 1, 1, 0),
(1309, NULL, 'HUMR', 'Alexendre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'alexandrehumdinger', NULL, 1, 1, 0),
(1310, NULL, 'HAT', 'dan', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'jordanhatt', NULL, 1, 1, 0),
(1311, NULL, 'LEFE', 'Kevin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'kevinlefebvre', NULL, 1, 1, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
