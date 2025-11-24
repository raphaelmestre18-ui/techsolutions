-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 24 nov. 2025 à 17:32
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `techsolutions`
--

-- --------------------------------------------------------

--
-- Structure de la table `components`
--

CREATE TABLE `components` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `components`
--

INSERT INTO `components` (`id`, `name`, `description`) VALUES
(1, 'Processeur i5', 'CPU 6 cœurs polyvalent'),
(2, 'RAM 16 Go', 'DDR4 2×8 Go'),
(3, 'SSD 500 Go', 'NVMe rapide'),
(4, 'Carte graphique GTX 1660', 'Jeux Full HD'),
(5, 'Boîtier + Alim 500W', 'Tour + alimentation'),
(6, 'Ryzen 9 7900X', 'CPU01'),
(7, 'Ryzen 7 7800X3D', 'CPU02'),
(8, 'Ryzen 9 7950X', 'CPU03'),
(9, 'Intel Core I9-14900K', 'CPU04'),
(10, 'Intel Core i7-14700K', 'CPU06'),
(11, 'intel Core Ultra 7 265K', 'CPU07'),
(12, 'Intel Core Ultra 9 285K', 'CPU08'),
(13, 'Intel Core i5-14600K', 'CPU09'),
(14, 'intel Core i3-14100', 'CPU10'),
(15, 'AMD Radeon RX 7800 XT', 'GPU01'),
(16, 'Geforce RTX 4060', 'GPU02'),
(17, 'PNY Quadro RTX 6000', 'GPU03'),
(18, 'RTX 3050', 'GPU04'),
(19, 'AMD Radeon RX 7600', 'GPU05'),
(20, 'Geforce RTX 5070', 'GPU06'),
(21, 'Corsair Vengeance DDR5 (2x16)go', 'RAM01'),
(22, 'G.Skill Trident Z5 32go', 'RAM02'),
(23, 'Kingston  Fury Renegade Pro DDR5 128go(4x32go)', 'RAM03'),
(24, 'Crucial DDR4 ECC 32go', 'RAM04'),
(25, 'G.Skill Ripjaws DDR5 64 go', 'RAM05'),
(26, 'Kingdton Fury Beast DDR5 (2x32)go', 'RAM06'),
(27, 'Crucial Pro DDR', 'RAM07'),
(28, 'Corsair Vengeance LPX DDR4', 'RAM08'),
(29, 'Be Quiet?! Pure Base 500', 'BT01'),
(30, 'Fractal Design Meshify C', 'BT02'),
(31, 'NZXT H510 Flow', 'BT03'),
(32, 'Thermaltake Core V21', 'BT04'),
(33, 'Lian Li PC-O11 Dynamic', 'BT05'),
(34, 'MSI MPG Gungnir 300R', 'BT06'),
(35, 'Corsair RM750e-750W-Gold', 'ALM01'),
(36, 'Pure Power 12M', 'ALM02'),
(37, 'Seasonic Focus GX-750-Gold', 'ALM03'),
(38, 'Corsair CX550M-550W-Bronze', 'ALM04'),
(39, 'System Power 10-450W-Bronze', 'ALM05'),
(40, 'Corsair HX1000i-1000W-Platinium', 'ALM06'),
(41, 'Seasonic Pime tX-850-850W ', 'ALM07');

-- --------------------------------------------------------

--
-- Structure de la table `pcs`
--

CREATE TABLE `pcs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pcs`
--

INSERT INTO `pcs` (`id`, `name`, `image_url`, `price`) VALUES
(1, 'PC_Dev', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2J6aUztWX09xF2H190IPT1kMdKFdNxgSaHw&s', 549.00),
(2, 'PC_Designer', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgvucb0UTmwctGun2S_hAc9EB4R4Y6rCPr1Q&s', 779.00),
(3, 'PC_ADMIN', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHgaivb3H9jN_8sQD-DH_EnTCnSHY_EFMzPg&s', 999.00),
(4, 'PC_RSS', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7eL6lOs97d6qYJbNvXBeIEdAPL7MGqzfN6w&s', 600.00),
(6, 'pc_direction', 'https://media.ldlc.com/r1600/ld/products/00/05/21/67/LD0005216778_2.jpg', 600.00),
(8, 'PC_DESIGNER', 'https://media.ldlc.com/r1600/ld/products/00/05/21/67/LD0005216778_2.jpg', 1500.00);

-- --------------------------------------------------------

--
-- Structure de la table `pc_components`
--

CREATE TABLE `pc_components` (
  `pc_id` int(10) UNSIGNED NOT NULL,
  `component_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pc_components`
--

INSERT INTO `pc_components` (`pc_id`, `component_id`) VALUES
(1, 6),
(1, 18),
(1, 23),
(1, 30),
(1, 40),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 13),
(4, 21),
(4, 29),
(4, 38),
(8, 7),
(8, 16),
(8, 23),
(8, 40);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pcs`
--
ALTER TABLE `pcs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pc_components`
--
ALTER TABLE `pc_components`
  ADD PRIMARY KEY (`pc_id`,`component_id`),
  ADD KEY `component_id` (`component_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `components`
--
ALTER TABLE `components`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `pcs`
--
ALTER TABLE `pcs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `pc_components`
--
ALTER TABLE `pc_components`
  ADD CONSTRAINT `pc_components_ibfk_1` FOREIGN KEY (`pc_id`) REFERENCES `pcs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pc_components_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
