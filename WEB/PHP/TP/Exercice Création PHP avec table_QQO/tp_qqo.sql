-- phpMyAdmin SQL Dump
-- version 5.2.1deb1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 03 juin 2024 à 13:20
-- Version du serveur : 10.11.6-MariaDB-0+deb12u1
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tp_qqo`
--
CREATE DATABASE IF NOT EXISTS `tp_qqo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tp_qqo`;

-- --------------------------------------------------------

--
-- Structure de la table `acteurs`
--
-- Création : ven. 31 mai 2024 à 07:28
--

DROP TABLE IF EXISTS `acteurs`;
CREATE TABLE `acteurs` (
  `id_act` int(11) NOT NULL,
  `code_lieu_depart` int(11) DEFAULT -10,
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
  `niv_acces` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `acteurs`:
--

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

-- --------------------------------------------------------

--
-- Structure de la table `acteur_equipe`
--
-- Création : ven. 31 mai 2024 à 07:28
--

DROP TABLE IF EXISTS `acteur_equipe`;
CREATE TABLE `acteur_equipe` (
  `id_acteur_equipe` int(11) NOT NULL,
  `id_act` int(11) NOT NULL,
  `id_equ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

--
-- RELATIONS POUR LA TABLE `acteur_equipe`:
--

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

-- --------------------------------------------------------

--
-- Structure de la table `acteur_role_possible`
--
-- Création : ven. 31 mai 2024 à 07:28
-- Dernière modification : lun. 03 juin 2024 à 12:50
--

DROP TABLE IF EXISTS `acteur_role_possible`;
CREATE TABLE `acteur_role_possible` (
  `id_acteur_role_possible` int(11) NOT NULL,
  `id_act` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `acteur_role_possible`:
--

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
(52, 123, 123),
(54, 117, 12),
(57, 117, 35),
(70, 1311, 4),
(71, 117, 1),
(72, 1301, 2);

-- --------------------------------------------------------

--
-- Structure de la table `actions`
--
-- Création : ven. 31 mai 2024 à 07:28
--

DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id_action` int(11) NOT NULL,
  `id_clu` int(11) NOT NULL,
  `id_equ` int(11) NOT NULL,
  `id_act` int(11) NOT NULL,
  `id_eve` int(11) NOT NULL,
  `id_veh` int(11) NOT NULL,
  `id_ld` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `actions`:
--

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

-- --------------------------------------------------------

--
-- Structure de la table `clubs`
--
-- Création : ven. 31 mai 2024 à 07:28
--

DROP TABLE IF EXISTS `clubs`;
CREATE TABLE `clubs` (
  `id_clu` int(11) NOT NULL,
  `nom` varchar(80) DEFAULT NULL,
  `numero_de_club` int(11) DEFAULT NULL,
  `adresse_logo` varchar(80) DEFAULT NULL,
  `couleur1` int(11) DEFAULT NULL,
  `couleur2` int(11) DEFAULT NULL,
  `couleur3` int(11) DEFAULT NULL,
  `adresse_photo1` varchar(60) DEFAULT NULL,
  `adresse_photo2` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `clubs`:
--

--
-- Déchargement des données de la table `clubs`
--

INSERT INTO `clubs` (`id_clu`, `nom`, `numero_de_club`, `adresse_logo`, `couleur1`, `couleur2`, `couleur3`, `adresse_photo1`, `adresse_photo2`) VALUES
(1, 'Saint-marguerite', 123, 'adresse_club', 1, 2, 3, NULL, NULL),
(2, 'Saint-Die', 101, 'adresse_club', 1, 2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `equipes`
--
-- Création : ven. 31 mai 2024 à 07:28
--

DROP TABLE IF EXISTS `equipes`;
CREATE TABLE `equipes` (
  `id_equ` int(11) NOT NULL,
  `nom_HBCSM` varchar(25) DEFAULT NULL,
  `nom_FFHB` varchar(25) DEFAULT NULL,
  `sexe` enum('homme','femme','mixte') DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `equipes`:
--

--
-- Déchargement des données de la table `equipes`
--

INSERT INTO `equipes` (`id_equ`, `nom_HBCSM`, `nom_FFHB`, `sexe`, `age`) VALUES
(5, 'Joueur -15 ans', 'Joueur - de 15 ans', NULL, NULL),
(6, 'Joueur - 12 ans', 'Joueur - 12 ans', NULL, NULL),
(13, 'Joueur -18 ans', 'Joueur -18 ans', NULL, NULL),
(14, 'Joueur +18 ans', 'Joueur +18 ans', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `lieux_depart`
--
-- Création : ven. 31 mai 2024 à 07:28
--

DROP TABLE IF EXISTS `lieux_depart`;
CREATE TABLE `lieux_depart` (
  `id_ld` int(11) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `plan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `lieux_depart`:
--

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

-- --------------------------------------------------------

--
-- Structure de la table `login`
--
-- Création : lun. 03 juin 2024 à 07:40
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `login`:
--

--
-- Déchargement des données de la table `login`
--

INSERT INTO `login` (`id`, `username`, `email`, `password`, `name`) VALUES
(1, 'gab', 'gab@propel.sh', 'gab', 'Gabin');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--
-- Création : lun. 03 juin 2024 à 12:01
-- Dernière modification : lun. 03 juin 2024 à 12:03
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nomRole` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `role`:
--

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id_role`, `nomRole`) VALUES
(1, 'Joueur'),
(2, 'Président'),
(3, 'Parent'),
(4, 'Chauffeur'),
(5, 'Entraineur'),
(6, 'Secrétaire');

-- --------------------------------------------------------

--
-- Structure de la table `vehicules`
--
-- Création : ven. 31 mai 2024 à 07:29
--

DROP TABLE IF EXISTS `vehicules`;
CREATE TABLE `vehicules` (
  `id_veh` int(11) NOT NULL,
  `nbr_places` int(11) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `km_cumul` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELATIONS POUR LA TABLE `vehicules`:
--

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

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteurs`
--
ALTER TABLE `acteurs`
  ADD PRIMARY KEY (`id_act`);

--
-- Index pour la table `acteur_equipe`
--
ALTER TABLE `acteur_equipe`
  ADD PRIMARY KEY (`id_acteur_equipe`);

--
-- Index pour la table `acteur_role_possible`
--
ALTER TABLE `acteur_role_possible`
  ADD PRIMARY KEY (`id_acteur_role_possible`);

--
-- Index pour la table `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id_action`);

--
-- Index pour la table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id_clu`);

--
-- Index pour la table `equipes`
--
ALTER TABLE `equipes`
  ADD PRIMARY KEY (`id_equ`);

--
-- Index pour la table `lieux_depart`
--
ALTER TABLE `lieux_depart`
  ADD PRIMARY KEY (`id_ld`);

--
-- Index pour la table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Index pour la table `vehicules`
--
ALTER TABLE `vehicules`
  ADD PRIMARY KEY (`id_veh`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteurs`
--
ALTER TABLE `acteurs`
  MODIFY `id_act` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1312;

--
-- AUTO_INCREMENT pour la table `acteur_equipe`
--
ALTER TABLE `acteur_equipe`
  MODIFY `id_acteur_equipe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT pour la table `acteur_role_possible`
--
ALTER TABLE `acteur_role_possible`
  MODIFY `id_acteur_role_possible` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `actions`
--
ALTER TABLE `actions`
  MODIFY `id_action` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1887;

--
-- AUTO_INCREMENT pour la table `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id_clu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `equipes`
--
ALTER TABLE `equipes`
  MODIFY `id_equ` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `lieux_depart`
--
ALTER TABLE `lieux_depart`
  MODIFY `id_ld` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `vehicules`
--
ALTER TABLE `vehicules`
  MODIFY `id_veh` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;


--
-- Métadonnées
--
USE `phpmyadmin`;

--
-- Métadonnées pour la table acteurs
--

--
-- Métadonnées pour la table acteur_equipe
--

--
-- Métadonnées pour la table acteur_role_possible
--

--
-- Déchargement des données de la table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'tp_qqo', 'acteur_role_possible', '{\"sorted_col\":\"`acteur_role_possible`.`id_rol` DESC\"}', '2024-06-03 12:07:18');

--
-- Métadonnées pour la table actions
--

--
-- Métadonnées pour la table clubs
--

--
-- Métadonnées pour la table equipes
--

--
-- Métadonnées pour la table lieux_depart
--

--
-- Métadonnées pour la table login
--

--
-- Métadonnées pour la table role
--

--
-- Déchargement des données de la table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'tp_qqo', 'role', '{\"CREATE_TIME\":\"2024-06-03 14:01:19\",\"col_order\":[0,1],\"col_visib\":[1,1]}', '2024-06-03 12:06:25');

--
-- Métadonnées pour la table vehicules
--

--
-- Métadonnées pour la base de données tp_qqo
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
