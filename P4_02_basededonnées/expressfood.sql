-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 09, 2020 at 01:21 PM
-- Server version: 5.7.30
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `expressfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse`
--

CREATE TABLE `adresse` (
  `adresse_id` int(10) UNSIGNED NOT NULL,
  `ligne_adresse_1` varchar(200) NOT NULL,
  `ligne_adresse_2` varchar(200) DEFAULT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adresse`
--

INSERT INTO `adresse` (`adresse_id`, `ligne_adresse_1`, `ligne_adresse_2`, `ville`, `code_postal`, `latitude`, `longitude`) VALUES
(1, '30 rue des domeliers', NULL, 'Compiègne', '60200', '49.414902', '2.824527'),
(2, '3 Rue Georges Gouigoux', NULL, 'Compiègne ', '60200', '49.412337', '2.828638'),
(3, '220 rue des coutures', 'Société Gourmet', 'Jaux', '60880', '49.399339', '2.779202');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `raison_sociale` varchar(100) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `adresse_facturation_id` int(10) UNSIGNED NOT NULL,
  `adresse_livraison_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `nom`, `prenom`, `raison_sociale`, `email`, `mot_de_passe`, `telephone`, `adresse_facturation_id`, `adresse_livraison_id`) VALUES
(2, 'Doe', 'John', NULL, 'doej@gmail.com', '997be2e1455b3f8e94c8fe38115b2a9a', '0634257611', 1, 1),
(3, 'Doe', 'Jane', NULL, 'doejane@yahoo.com', '997be2e1455b3f8e94c8fe38115b2a9a', '+33(0)788652789', 2, 2),
(4, 'Géfin', 'Edouard', 'Société Gourmet', 'contact@gourmet.fr', '997be2e1455b3f8e94c8fe38115b2a9a', '06.32.15.47.37', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `commande_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `livreur_id` int(10) UNSIGNED NOT NULL,
  `date_commande` datetime NOT NULL,
  `statut_commande` int(1) NOT NULL,
  `prix_ttc` decimal(6,2) NOT NULL,
  `moyen_paiement` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`commande_id`, `client_id`, `livreur_id`, `date_commande`, `statut_commande`, `prix_ttc`, `moyen_paiement`) VALUES
(1, 2, 1, '2020-10-22 16:06:53', 2, '69.60', 1),
(2, 3, 2, '2020-10-22 14:06:53', 2, '124.50', 1),
(3, 4, 1, '2020-10-12 16:14:42', 2, '69.70', 2);

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `commande_id` int(10) UNSIGNED NOT NULL,
  `produit_id` int(20) UNSIGNED NOT NULL,
  `quantite` int(2) NOT NULL,
  `prix` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_id`, `produit_id`, `quantite`, `prix`) VALUES
(1, 1, 2, '49.80'),
(1, 2, 2, '19.80'),
(2, 3, 3, '104.70'),
(2, 4, 2, '19.80'),
(3, 1, 1, '24.90'),
(3, 3, 1, '34.90'),
(3, 4, 1, '9.90');

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `livreur_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `statut` int(1) NOT NULL,
  `latitude` decimal(8,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`livreur_id`, `nom`, `prenom`, `telephone`, `statut`, `latitude`, `longitude`) VALUES
(1, 'Uber', 'Franck', '0743271843', 1, '49.406883', '2.817927'),
(2, 'Deliveroo', 'Patrick', '+33(0)698987654', 2, '49.401858', '2.801768');

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `produit_id` int(20) UNSIGNED NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prix_unitaire` decimal(5,2) NOT NULL,
  `descriptif` varchar(200) NOT NULL,
  `photo` varchar(20) NOT NULL,
  `date_creation` datetime NOT NULL,
  `type_produit` int(1) NOT NULL,
  `plat_jour` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`produit_id`, `nom`, `prix_unitaire`, `descriptif`, `photo`, `date_creation`, `type_produit`, `plat_jour`) VALUES
(1, 'Saumon d’Écosse IGP', '24.90', 'Saumon d’Écosse IGP Label rouge snacké, salade d\'épeautre bio, poireaux et carottes vapeur, mayonnaise citronnelle.', '', '2020-10-22 15:36:48', 1, 0),
(2, 'Tartelette citron vert', '9.90', 'Tartelette citron vert Bastian style, coulis de fruits exotiques.', '', '2020-10-20 09:07:45', 2, 0),
(3, 'Médaillon de cuisse de volaille fermière', '34.90', 'Médaillon de cuisse de volaille fermière en farce fine de truffes, polenta Taragna aux truffes et légumes racines en parure, mayonnaise à l\'huile de Truffe.', '', '2020-10-22 15:42:16', 1, 1),
(4, 'Miroir chocolat Guanaja', '9.90', 'Miroir chocolat Guanaja, cacahuètes et struesel cacao.', '', '2020-10-20 15:43:13', 2, 1),
(5, 'Rouget grondin', '29.90', 'Rouget grondin, pomme de terre ratte du Touquet, oeufs de saumon et de truite, salade tétragone, aïoli d’Azaïs Polito.', '', '2020-10-23 13:12:56', 1, 1),
(6, 'Eclair vanille Bourbon', '9.90', 'Eclair vanille Bourbon, crème légère aux marron glacés.', '', '2020-10-23 13:12:56', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stock_livreur`
--

CREATE TABLE `stock_livreur` (
  `livreur_id` int(10) UNSIGNED NOT NULL,
  `produit_id` int(20) UNSIGNED NOT NULL,
  `quantite` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stock_livreur`
--

INSERT INTO `stock_livreur` (`livreur_id`, `produit_id`, `quantite`) VALUES
(1, 3, 5),
(1, 4, 3),
(2, 3, 6),
(2, 4, 5),
(1, 5, 4),
(1, 6, 7),
(2, 5, 5),
(2, 6, 3),
(1, 1, 0),
(2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `utilisateur_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `utilisateur`
--

INSERT INTO `utilisateur` (`utilisateur_id`, `nom`, `prenom`, `email`, `mot_de_passe`, `role`) VALUES
(1, 'Laniaque', 'Cyril', 'laniaque.cyril@bonnebouffe.fr', 'nbcdhu4ceh5§', 0),
(2, 'Isthebest', 'Philippe', 'p.isthebest@gefin.com', 'dgh36dx:fr!', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse`
--
ALTER TABLE `adresse`
  ADD PRIMARY KEY (`adresse_id`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_adresse_facturation` (`adresse_facturation_id`),
  ADD KEY `fk_adresse_livraison` (`adresse_livraison_id`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`commande_id`),
  ADD KEY `fk_client_id` (`client_id`),
  ADD KEY `fk_livreur_id` (`livreur_id`);

--
-- Indexes for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD KEY `fk_commande_id` (`commande_id`),
  ADD KEY `fk_produit_id` (`produit_id`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`livreur_id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`produit_id`);

--
-- Indexes for table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD KEY `fk_stock_livreur_id` (`livreur_id`),
  ADD KEY `fk_stock_produit_id` (`produit_id`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adresse`
--
ALTER TABLE `adresse`
  MODIFY `adresse_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `commande_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `livreur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `produit_id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `utilisateur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_adresse_facturation` FOREIGN KEY (`adresse_facturation_id`) REFERENCES `adresse` (`adresse_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_adresse_livraison` FOREIGN KEY (`adresse_livraison_id`) REFERENCES `adresse` (`adresse_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_livreur_id` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`livreur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`commande_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_produit_id` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`produit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `fk_stock_livreur_id` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`livreur_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stock_produit_id` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`produit_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
