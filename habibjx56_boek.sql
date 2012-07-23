-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 12, 2012 at 09:59 PM
-- Server version: 5.1.62-log
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `habibjx56_boek`
--

-- --------------------------------------------------------

--
-- Table structure for table `boeken`
--

CREATE TABLE IF NOT EXISTS `boeken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leerling_id` int(11) DEFAULT NULL,
  `boek_id` int(11) DEFAULT NULL,
  `staat` int(11) DEFAULT NULL,
  `leerjaar` int(11) DEFAULT NULL,
  `notitie` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `leerling_id` (`leerling_id`),
  KEY `boek_id` (`boek_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `boektypes`
--

CREATE TABLE IF NOT EXISTS `boektypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vak_id` int(11) DEFAULT NULL,
  `soort` int(11) DEFAULT NULL,
  `koop` tinyint(1) DEFAULT NULL,
  `aantal` int(11) DEFAULT NULL,
  `titel` varchar(64) DEFAULT NULL,
  `isbn` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vak_id` (`vak_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `leerlingen`
--

CREATE TABLE IF NOT EXISTS `leerlingen` (
  `id` int(11) NOT NULL,
  `voornaam` varchar(64) DEFAULT NULL,
  `achternaam` varchar(64) DEFAULT NULL,
  `tussenvoegsel` varchar(16) NOT NULL,
  `jaar` int(11) DEFAULT NULL,
  `klas` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `leerling_vak`
--

CREATE TABLE IF NOT EXISTS `leerling_vak` (
  `leerling_id` int(11) DEFAULT NULL,
  `vak_id` int(11) DEFAULT NULL,
  KEY `leerling_id` (`leerling_id`),
  KEY `vak_id` (`vak_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `TABLE 6`
--

CREATE TABLE IF NOT EXISTS `TABLE 6` (
  `klas` int(1) NOT NULL,
  `vakid` int(2) NOT NULL,
  `boekid` int(2) NOT NULL,
  `naam` varchar(63) NOT NULL,
  `isbn` varchar(13) NOT NULL,
  `koopdatum` date NOT NULL,
  `koopprijs` float NOT NULL,
  `refundprijs` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE 6`
--

INSERT INTO `TABLE 6` (`klas`, `vakid`, `boekid`, `naam`, `isbn`, `koopdatum`, `koopprijs`, `refundprijs`) VALUES
(1, 1, 0, 'Op niveau (cyg) 1hv basisboek modulair', '9789006104325', '0000-00-00', 51, 15),
(2, 1, 1, 'NE_Op niveau 2hv (cyg)  basisboek modulair', '9789006104394', '0000-00-00', 51, 15),
(3, 1, 2, 'NE_Op niveau 3v basisboek modulair', '9789006104530', '0000-00-00', 51, 15),
(4, 1, 3, 'Nieuw nederlands 4e editie 4v', '9789001704421', '0000-00-00', 53, 16),
(4, 1, 4, 'Laagland vwo informatieboek', '9789006102451', '0000-00-00', 42, 12),
(4, 1, 5, 'Laagland vwo verwerkingsboek 1', '9789006102475', '0000-00-00', 16, 5),
(5, 1, 6, 'Nieuw nederlands 4e editie 5/6v', '9789001704308', '0000-00-00', 78, 23),
(5, 1, 6, 'Laagland vwo informatieboek', '9789006102451', '0000-00-00', 42, 12),
(6, 1, 7, 'Nieuw nederlands 4e editie 5/6v', '9789001704308', '0000-00-00', 78, 23),
(6, 1, 8, 'Laagland vwo informatieboek', '9789006102451', '0000-00-00', 42, 12),
(1, 2, 0, 'Salzgitter heute plus arbeitsbuch 1vh', '9789006211023', '0000-00-00', 25, 7),
(2, 2, 1, 'DU_Salzgitter heute plus textbuch 1vh', '9789006211009', '0000-00-00', 33, 10),
(2, 2, 2, 'DU_Salzgitter heute plus arbeitsbuch 1vh', '9789006211023', '0000-00-00', 25, 7),
(3, 2, 3, 'DU_Salzgitter heute plus textbuch 2vh', '9789006211108', '0000-00-00', 35, 10),
(3, 2, 4, 'DU_Salzgitter heute plus arbeitsb 2vh', '9789006211122', '0000-00-00', 28, 8),
(4, 2, 5, 'DU_V4 Na klar! 4v arbeitsbuch deel a+b', '9789034540775', '0000-00-00', 26, 7),
(4, 2, 6, 'DU_V4 Na klar! 4v bronnenboek', '9789034533920', '0000-00-00', 38, 11),
(6, 2, 7, 'Essenz bovenbouw havo/vwo', '9789066752962', '0000-00-00', 17, 5),
(6, 2, 8, 'Examenidioom duits vwo', '9789042536777', '0000-00-00', 22, 6),
(1, 3, 0, 'AIM Histoire en action DVD', '9780000000118', '0000-00-00', 23, 6),
(2, 3, 1, 'AIM methode francais: Jeunesse en action 2A dvd', '971897795101', '0000-00-00', 17, 5),
(3, 3, 2, 'AIM methode francais: Jeunesse en action 3A dvd', '9781926732046', '0000-00-00', 19, 5),
(4, 3, 3, 'Belleville 2 Méthode de français', '9782090336702', '0000-00-00', 0, 0),
(4, 3, 4, 'Belleville 2 Cahier d''exercices, incl. audio CD', '9782090336986', '0000-00-00', 0, 0),
(5, 3, 5, 'Libre service 3e ed. 5 vwo leerlingenhandleiding', '9789006182729', '0000-00-00', 20, 6),
(5, 3, 6, 'Libre service 3e ed. 5 vwo leer-/werkboek (Franse editie)', '9789006182743', '0000-00-00', 43, 13),
(6, 3, 7, 'Libre Service 6 VWO Manuel ', '9789006182828', '0000-00-00', 20, 6),
(6, 3, 8, 'Libre Service 6 VWO Manuel', '9789006182828', '0000-00-00', 20, 6),
(6, 3, 9, 'HCE examenidioom ', '9789042536692', '0000-00-00', 22, 6),
(1, 4, 0, 'Disco 1 (Klas 1&2)', '9789059971189', '0000-00-00', 28, 8),
(2, 4, 1, 'LA_Disco 1 (Klas 1&2)', '9789074310956', '0000-00-00', 28, 8),
(3, 4, 2, 'LA_Disco 2', '9789059970151', '0000-00-00', 28, 8),
(4, 4, 3, 'LA_Disco 2', '9789059970151', '0000-00-00', 28, 8),
(4, 4, 4, 'LA_Studeo gym 4/5/6', '9789059970311', '0000-00-00', 16, 5),
(4, 4, 5, 'LA_Lego voor de vierde klas leesboek + hulpboek', '9789059970748', '0000-00-00', 16, 5),
(5, 4, 6, 'LA_Studeo gym 4/5/6', '9789059970311', '0000-00-00', 16, 5),
(5, 4, 7, 'LA_Lego leesboek gym5', '9789059970410', '0000-00-00', 35, 10),
(5, 4, 8, 'LA_Lego hulpboek gym5', '9789059970458', '0000-00-00', 18, 5),
(6, 4, 9, 'LA_Studeo gym 4/5/6', '9789059970311', '0000-00-00', 16, 5),
(1, 5, 0, 'Pallas 1 lesboek (klas 1, 2 en 3)', '9789076589466', '0000-00-00', 32, 9),
(2, 5, 1, 'GR_Pallas 1 lesboek (klas 1, 2 en 3)', '9789076589466', '0000-00-00', 32, 9),
(3, 5, 2, 'GR_Pallas 2 lesboek', '9789076589558', '0000-00-00', 32, 9),
(4, 5, 3, 'GR_Pallas 2 lesboek', '9789076589558', '0000-00-00', 32, 9),
(5, 5, 4, 'GR_PALLAS 4 GRIEKSE GRAMMATICA (klas 5&6)', '9789076589268', '0000-00-00', 0, 0),
(6, 5, 5, 'GR_PALLAS 4 GRIEKSE GRAMMATICA (klas 5&6)', '9789076589268', '0000-00-00', 0, 0),
(1, 6, 0, 'Go for it 1thv textbook (2007)', '9789006144543', '0000-00-00', 37, 11),
(2, 6, 1, 'EN_Go for it 2thv textbook (2008)', '9789006144666', '0000-00-00', 38, 11),
(3, 6, 2, 'EN_Go for it 3hv textbook (2009)', '9789006144789', '0000-00-00', 39, 11),
(4, 6, 3, 'EN_H4V45 English grammar in use (without answers) third edition', '9780521532907', '0000-00-00', 25, 7),
(1, 7, 0, 'Moderne wiskunde 1v deel b (2008)', '9789001601096', '0000-00-00', 43, 13),
(1, 7, 1, 'Moderne wi30unde 1v antwoorden deel b (2008)', '9789001601348', '0000-00-00', 10, 3),
(1, 7, 2, 'WI_Moderne wi30unde 1v deel a (2008)', '9789001601584', '0000-00-00', 43, 13),
(1, 7, 3, 'WI_Moderne wi30unde 1v antwoorden deel a (2008)', '9789001601782', '0000-00-00', 10, 3),
(2, 7, 4, 'WI_Moderne wi30unde 9e editie 2v deel b', '9789001602284', '0000-00-00', 43, 13),
(2, 7, 5, 'WI_Moderne wi30unde 2v deel a', '9789001604257', '0000-00-00', 43, 13),
(2, 7, 6, 'WI_Moderne wi30unde 2v antwoorden deel a', '9789001604530', '0000-00-00', 10, 3),
(2, 7, 7, 'WI_Moderne wi30unde 2v antwoorden deel b', '9789001604554', '0000-00-00', 10, 3),
(3, 7, 8, 'WI_Moderne wi30unde 9e editie 3v deel a', '9789001606183', '0000-00-00', 43, 13),
(3, 7, 9, 'WI Moderne wi30unde 9e editie 3v antwoordenboek deel b', '9789001606930', '0000-00-00', 10, 3),
(3, 7, 10, 'WI Moderne wi30unde 9e editie 3v antwoordenboek deel a', '9789001606947', '0000-00-00', 10, 3),
(3, 7, 11, 'WI Moderne wi30unde 9e editie 3v deel b', '9789001606978', '0000-00-00', 43, 13),
(4, 9, 0, 'WB_Getal en ruimte wi30unde-b deel2 vwo uitwerkingen (2007)', '9789011098343', '0000-00-00', 14, 4),
(4, 9, 1, 'WB_Getal en ruimte wi30unde-b deel1 vwo uitwerkingen (2007)', '9789011098350', '0000-00-00', 14, 4),
(4, 9, 2, 'WB_Getal en ruimte wi30unde-b deel1 vwo (2007)', '9789011098893', '0000-00-00', 52, 15),
(4, 9, 3, 'WB_Getal en ruimte WisB deel2 vwo', '9789011098923', '0000-00-00', 52, 15),
(5, 9, 4, 'WB_Getal en ruimte wi30unde-b deel2 vwo uitwerkingen (2007)', '9789011098343', '0000-00-00', 14, 4),
(5, 9, 5, 'WB_Getal en ruimte wi30unde-b deel3 vwo uitwerkingen (2007)', '9789011098374', '0000-00-00', 14, 4),
(5, 9, 6, 'WB_Getal en ruimte WisB deel2 vwo', '9789011098923', '0000-00-00', 52, 15),
(5, 9, 7, 'WB_Getal en ruimte wi30unde-b deel3 vwo (2007)', '9789011098947', '0000-00-00', 57, 17),
(6, 9, 8, 'WB_Getal en ruimte wi30unde-b deel2 vwo uitwerkingen (2007)', '9789011098343', '0000-00-00', 14, 4),
(6, 9, 9, 'WB_Getal en ruimte wi30unde-b deel1 vwo uitwerkingen (2007)', '9789011098350', '0000-00-00', 14, 4),
(6, 9, 10, 'WB_Getal en ruimte wi30unde-b deel4 vwo uitwerkingen (2007)', '9789011098367', '0000-00-00', 14, 4),
(6, 9, 11, 'WB_Getal en ruimte wi30unde-b deel3 vwo uitwerkingen (2007)', '9789011098374', '0000-00-00', 14, 4),
(6, 9, 12, 'WB_Getal en ruimte wi30unde-b deel4 vwo (2007)', '9789011098589', '0000-00-00', 57, 17),
(6, 9, 13, 'WB_Getal en ruimte wi30unde-b deel1 vwo (2007)', '9789011098893', '0000-00-00', 52, 15),
(6, 9, 14, 'WB_Getal en ruimte WisB deel2 vwo', '9789011098923', '0000-00-00', 52, 15),
(6, 9, 15, 'WB_Getal en ruimte wi30unde-b deel3 vwo (2007)', '9789011098947', '0000-00-00', 57, 17),
(4, 10, 0, 'WAC_Getal en ruimte WisAC deel2 vwo uitwerkingen', '9789011098428', '0000-00-00', 14, 4),
(4, 10, 1, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo uitwerkingen', '9789011098435', '0000-00-00', 14, 4),
(4, 10, 2, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo', '9789011098848', '0000-00-00', 52, 15),
(4, 10, 3, 'WAC_Getal en ruimte WisAC deel2 vwo', '9789011098879', '0000-00-00', 52, 15),
(5, 10, 4, 'WC_Getal en ruimte wi30unde-c deel3 vwo (2007)', '9789011098220', '0000-00-00', 57, 17),
(5, 10, 5, 'WC_Getal en ruimte wi30unde-c deel3 vwo uitwerkingen (2007)', '9789011098381', '0000-00-00', 14, 4),
(5, 10, 6, 'WAC_Getal en ruimte WisAC deel2 vwo uitwerkingen', '9789011098428', '0000-00-00', 14, 4),
(5, 10, 7, 'WAC_Getal en ruimte WisAC deel2 vwo', '9789011098879', '0000-00-00', 52, 15),
(6, 10, 8, 'WC_Getal en ruimte wi30unde-c deel3 vwo (2007)', '9789011098220', '0000-00-00', 57, 17),
(6, 10, 9, 'WC_Getal en ruimte wi30unde-c deel3 vwo uitwerkingen (2007)', '9789011098381', '0000-00-00', 14, 4),
(6, 10, 10, 'WC_Getal en ruimte wi30unde-c deel4 vwo uitwerkingen (2007)', '9789011098398', '0000-00-00', 14, 4),
(6, 10, 11, 'WAC_Getal en ruimte WisAC deel2 vwo uitwerkingen', '9789011098428', '0000-00-00', 14, 4),
(6, 10, 12, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo uitwerkingen', '9789011098435', '0000-00-00', 14, 4),
(6, 10, 13, 'WC_Getal en ruimte wi30unde-c deel4 vwo (2007)', '9789011098626', '0000-00-00', 57, 17),
(6, 10, 14, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo', '9789011098848', '0000-00-00', 52, 15),
(6, 10, 15, 'WAC_Getal en ruimte WisAC deel2 vwo', '9789011098879', '0000-00-00', 52, 15),
(4, 11, 0, 'WD Getal & Ruimte deel 1 havo/vwo D', '9789011102781', '0000-00-00', 52, 15),
(4, 11, 1, 'WD Getal & Ruimte deel 1 havo/vwo D uitwerkingen', '9789011102798', '0000-00-00', 14, 4),
(4, 11, 2, 'WD Getal & Ruimte deel 2 havo/vwo D', '9789011102910', '0000-00-00', 52, 15),
(4, 11, 3, 'WD Getal & Ruimte deel 2 havo/vwo D uitwerkingen', '9789011102927', '0000-00-00', 14, 4),
(5, 11, 4, 'WD Getal & Ruimte deel 2 havo/vwo D', '9789011102910', '0000-00-00', 52, 15),
(5, 11, 5, 'WD Getal & Ruimte deel 2 havo/vwo D uitwerkingen', '9789011102927', '0000-00-00', 14, 4),
(5, 11, 6, 'WD Getal & Ruimte deel 3 vwo D', '9789011102965', '0000-00-00', 57, 17),
(5, 11, 7, 'WD Getal & Ruimte deel 3 vwo D uitwerkingen', '9789011102972', '0000-00-00', 57, 17),
(5, 11, 8, 'WD Getal & Ruimte deel 4 vwo D', '9789011102996', '0000-00-00', 57, 17),
(5, 11, 9, 'WD Getal & Ruimte deel 4 vwo D uitwerkingen', '9789011103009', '0000-00-00', 14, 4),
(4, 12, 0, 'WAC_Getal en ruimte WisAC deel2 vwo uitwerkingen', '9789011098428', '0000-00-00', 14, 4),
(4, 12, 1, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo uitwerkingen', '9789011098435', '0000-00-00', 14, 4),
(4, 12, 2, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo', '9789011098848', '0000-00-00', 52, 15),
(4, 12, 3, 'WAC_Getal en ruimte WisAC deel2 vwo', '9789011098879', '0000-00-00', 52, 15),
(6, 12, 4, 'WA_Getal en ruimte wi30unde-a deel4 vwo uitwerkingen (2007)', '9789011098404', '0000-00-00', 14, 4),
(6, 12, 5, 'WA_Getal en ruimte wi30unde-a deel3 vwo uitwerkingen (2007)', '9789011098411', '0000-00-00', 14, 4),
(6, 12, 6, 'WAC_Getal en ruimte WisAC deel2 vwo uitwerkingen', '9789011098428', '0000-00-00', 14, 4),
(6, 12, 7, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo uitwerkingen', '9789011098435', '0000-00-00', 14, 4),
(6, 12, 8, 'WA_Getal en ruimte wi30unde-a deel3 vwo (2007)', '9789011098794', '0000-00-00', 57, 17),
(6, 12, 9, 'WA_Getal en ruimte wi30unde-a deel4 vwo (2007)', '9789011098824', '0000-00-00', 57, 17),
(6, 12, 10, 'WAC_Getal en ruimte wi30unde-a/c deel1 vwo', '9789011098848', '0000-00-00', 52, 15),
(6, 12, 11, 'WAC_Getal en ruimte WisAC deel2 vwo', '9789011098879', '0000-00-00', 52, 15),
(5, 12, 12, 'WA_Getal en ruimte wi30unde-a deel3 vwo uitwerkingen (2007)', '9789011098411', '0000-00-00', 14, 4),
(5, 12, 13, 'WAC_Getal en ruimte WisAC deel2 vwo uitwerkingen', '9789011098428', '0000-00-00', 14, 4),
(5, 12, 14, 'WA_Getal en ruimte wi30unde-a deel3 vwo (2007)', '9789011098794', '0000-00-00', 57, 17),
(5, 12, 15, 'WAC_Getal en ruimte WisAC deel2 vwo', '9789011098879', '0000-00-00', 52, 15),
(1, 14, 0, 'Biologie voor jou 1hv deel a', '9789034547583', '0000-00-00', 22, 6),
(1, 14, 1, 'Biologie voor jou 1hv deel b', '9789034547590', '0000-00-00', 22, 6),
(2, 14, 2, 'BI_Biologie voor jou 2hv deel a', '9789034547644', '0000-00-00', 22, 6),
(3, 14, 3, 'BI_Biologie voor jou 2hv deel b', '9789034547651', '0000-00-00', 22, 6),
(4, 14, 4, 'BI_V456 Biologie interactief 1v werkboek (3 jr gebruiken)', '9789042528659', '0000-00-00', 24, 7),
(4, 14, 5, 'Binas informatieboek vwo-havo', '9789001893804', '0000-00-00', 34, 10),
(4, 14, 6, 'Binas informatieboek vwo-havo ', '9789001893804', '0000-00-00', 34, 10),
(4, 14, 7, 'BI_V456 Biologie interactief 1v informatieboek', '9789042528642', '0000-00-00', 49, 14),
(4, 14, 8, 'BI_V456 Biologie interactief 1v antwoordenboek', '9789042528666', '0000-00-00', 11, 3),
(5, 14, 9, 'Binas informatieboek vwo-havo', '9789001893804', '0000-00-00', 34, 10),
(5, 14, 10, 'Binas informatieboek vwo-havo', '9789001893804', '0000-00-00', 34, 10),
(5, 14, 11, 'BI_V456 Biologie interactief 1v informatieboek', '9789042528642', '0000-00-00', 49, 14),
(5, 14, 12, 'BI_V456 Biologie interactief 1v antwoordenboek', '9789042528666', '0000-00-00', 11, 3),
(5, 14, 13, 'BI_V56_Biologie interactief 2v informatieboek', '9789042528697', '0000-00-00', 49, 14),
(5, 14, 14, 'BI_V56_Biologie interactief 2v informatieboek', '9789042528697', '0000-00-00', 49, 14),
(5, 14, 15, 'BI_V56_Biologie interactief 2v antwoordenboek', '9789042528710', '0000-00-00', 11, 3),
(6, 14, 16, 'Binas informatieboek vwo-havo', '9789001893804', '0000-00-00', 34, 10),
(6, 14, 17, 'Examenbundel vwo biologie 10/11', '9789006076219', '0000-00-00', 12, 6),
(6, 14, 18, 'BI_V456 Biologie interactief 1v informatieboek', '9789042528642', '0000-00-00', 49, 14),
(6, 14, 19, 'BI_V456 Biologie interactief 1v antwoordenboek', '9789042528666', '0000-00-00', 11, 3),
(6, 14, 20, 'BI_V456 Biologie interactief 1v antwoordenboek', '9789042528666', '0000-00-00', 11, 3),
(6, 14, 21, 'BI_V56_Biologie interactief 2v informatieboek', '9789042528697', '0000-00-00', 49, 14),
(6, 14, 22, 'BI_V56_Biologie interactief 2v antwoordenboek', '9789042528710', '0000-00-00', 11, 3),
(6, 14, 23, 'BI_V56_Biologie interactief 2v antwoordenboek', '9789042528710', '0000-00-00', 11, 3),
(1, 15, 0, 'Techniek om je heen informatieboek 1hv', '9789006390582', '0000-00-00', 39, 1),
(1, 15, 1, 'Sensor 1hv deel a', '9789034505552', '0000-00-00', 31, 1),
(1, 15, 2, 'Sensor 1hv deel b', '9789034505576', '0000-00-00', 31, 1),
(1, 15, 3, 'Sensor werkboek 1hv deel a', '9789034519887', '0000-00-00', 18, 0),
(1, 15, 4, 'Sensor werkboek 1hv deel b', '9789034519900', '0000-00-00', 18, 0),
(1, 15, 5, 'TECHNIEK in Beweging', '9789074368483', '0000-00-00', 19, 1),
(1, 16, 0, 'Bijbel NBV (klassikaal)', '9789061268659', '0000-00-00', 32, 1),
(1, 16, 1, 'Perspectief 1 vmbo-t/hv', '9789006481679', '0000-00-00', 20, 6),
(2, 16, 2, 'LV_Bijbel NBV (klassikaal)', '9789061268659', '0000-00-00', 32, 1),
(2, 16, 3, 'LV_Perspectief 2 vmbo-t/hv', '9789006481815', '0000-00-00', 38, 11),
(4, 16, 4, 'LV_Bijbel NBV (klassikaal)', '9789061268659', '0000-00-00', 32, 1),
(4, 16, 5, 'LV_Perspectief 2e fase (leer- en opdrachtenboek hv)', '9789006481990', '0000-00-00', 37, 11),
(4, 16, 6, 'LV_Perspectief 2e fase (leer- en opdrachtenboek hv)   ', '9789006481990', '0000-00-00', 37, 11),
(5, 16, 7, 'LV_Bijbel NBV (klassikaal)', '9789061268659', '0000-00-00', 32, 1),
(5, 16, 8, 'LV_Perspectief 2e fase (leer- en opdrachtenboek hv)', '9789006481990', '0000-00-00', 37, 11),
(1, 17, 0, 'Geschiedeniswerkplaats 1v informatieboek', '9789001956035', '0000-00-00', 50, 15),
(2, 17, 1, 'GS-geschiedenis Werkplaats informatieboek 2 VWO', '9789001708191', '0000-00-00', 51, 15),
(3, 17, 2, 'GWP vwo 3 werkboek', '9789001708207', '0000-00-00', 20, 6),
(3, 17, 3, 'GWP vwo 3 informatieboek ', '9789001708269', '0000-00-00', 51, 15),
(4, 17, 4, 'GS_V4 GWP rechtsstaat en democr (of twee delen met TAPE)', '9789001707378', '0000-00-00', 19, 5),
(4, 17, 5, 'GS_GWP 2e fase vwo china en europa', '9789001707705', '0000-00-00', 19, 5),
(4, 17, 6, 'GS_GWP vwo Vietnam (Wissel V4 -> V6)', '9789001772642', '0000-00-00', 26, 7),
(4, 17, 7, 'GS_V5 GWP historisch overzicht vwo opdrachtenboek', '9789001954741', '0000-00-00', 21, 6),
(4, 17, 8, 'GS_V5 GWP historisch overzicht vwo handboek', '9789001954758', '0000-00-00', 56, 16),
(5, 17, 9, 'GS_V5 GWP historisch overzicht vwo opdrachtenboek', '9789001954741', '0000-00-00', 21, 6),
(5, 17, 10, 'GS_V5 GWP historisch overzicht vwo handboek', '9789001954758', '0000-00-00', 56, 16),
(6, 17, 11, 'GS_Gwp vwo de republiek in een tijd van vorsten.', '9789001807313', '0000-00-00', 26, 7),
(6, 17, 12, 'Verenigde Staten en hun federale overheid 1865-1965', '9789006464771', '0000-00-00', 19, 5),
(6, 17, 13, 'GS_V5 GWP historisch overzicht vwo opdrachtenboek', '9789001954741', '0000-00-00', 21, 6),
(6, 17, 14, 'GS_V5 GWP historisch overzicht vwo handboek', '9789001954758', '0000-00-00', 56, 16),
(1, 20, 0, 'Wereldwijs 1hv handboek', '9789034552891', '0000-00-00', 41, 12),
(1, 20, 1, 'Wereldwijs 1v werkboek', '9789034555236', '0000-00-00', 18, 5),
(2, 20, 2, 'AK_Wereldwijs handboek 2hv', '9789020852707', '0000-00-00', 49, 14),
(2, 20, 3, 'AK_Wereldwijs werkboek 2hv  ', '9789020853001', '0000-00-00', 24, 7),
(3, 20, 4, 'AK_Wereldwijs handboek 3v (4e druk)', '978903458756', '0000-00-00', 41, 12),
(3, 20, 5, 'AK_Wereldwijs opdrachtenboek 3v  ', '9789034558763', '0000-00-00', 25, 7),
(4, 20, 6, 'De geo 4e ed. vwo arm en rijk leer-/opdrachtenboek', '9789006436303', '0000-00-00', 34, 10),
(4, 20, 7, 'De geo 4e ed. vwo klimaatvraagstukken leer-/opdrachtenboek', '9789006436464', '0000-00-00', 33, 9),
(5, 20, 8, 'AK_V5 De geo leer/opdr gebieden/zo azie in beeld (d1)', '9789006433203', '0000-00-00', 31, 10),
(5, 20, 9, 'AK_V56 De geo leer/opdr leefomgeving/wonen in Nederland (e1)', '9789006436709', '0000-00-00', 31, 10),
(5, 20, 10, 'AK_V56 De geo leer/opdr wereld/globalisering (b1)', '9789006436228', '0000-00-00', 31, 10),
(6, 20, 11, 'Buitenland 6v', '9789011073296', '0000-00-00', 57, 17),
(6, 20, 12, 'AK_Samengevat vwo aardrijk30unde (2009)', '9789006073768', '0000-00-00', 10, 3),
(6, 20, 13, 'AK_V6 De geo leer/opdr aarde/systeem aarde (vierde druk)', '9789006436389', '0000-00-00', 37, 11),
(6, 20, 14, 'AK_V5 De geo leer/opdr gebieden/zo azie actueel (d2)', '9789006433210', '0000-00-00', 37, 11),
(1, 24, 0, 'Intro 1thv (+ cd+ict)', '9789006487411', '0000-00-00', 29, 8),
(2, 24, 1, 'MU_Intro 2hv', '9789006481075', '0000-00-00', 37, 11),
(2, 24, 2, 'MU_Intro werkmap 2hv + leerlingen-cd', '9789006481099', '0000-00-00', 24, 7),
(3, 24, 3, 'MU_Intro 3hv', '9789006481143', '0000-00-00', 37, 11),
(3, 24, 4, 'MU_Intro werkmap 3hv + cd-rom', '9789006481167', '0000-00-00', 24, 7),
(4, 25, 5, 'KU_ De bespiegeling vwo', '9789011109025', '0000-00-00', 70, 21),
(5, 26, 0, 'EC_Praktische Economie Handboek VWO Economie voor de 2e fase', '9789034556400', '0000-00-00', 67, 20),
(4, 27, 0, 'MO_V456 in balans 1v antwoordenboek', '9789042533370', '0000-00-00', 14, 4),
(4, 27, 1, 'MO_V456 in balans 1v antwoordenboek', '9789042533370', '0000-00-00', 14, 4),
(4, 27, 2, 'MO_V456 in balans 1v theorieboek deel a', '9789042537743', '0000-00-00', 34, 10),
(4, 27, 3, 'MO_V456 in balans 1v theorieboek deel a', '9789042537743', '0000-00-00', 34, 10),
(4, 27, 4, 'MO_V56 in balans 1v theorieboek deel b', '9789042537750', '0000-00-00', 23, 7),
(5, 27, 5, 'MO_V456 in balans 1v antwoordenboek', '9789042533370', '0000-00-00', 14, 4),
(5, 27, 6, 'MO_V56 in balans 2v antwoordenboek', '9789042533417', '0000-00-00', 12, 3),
(5, 27, 7, 'MO_V456 in balans 1v theorieboek deel a', '9789042537743', '0000-00-00', 34, 10),
(5, 27, 8, 'MO_V56 in balans 1v theorieboek deel b', '9789042537750', '0000-00-00', 23, 7),
(5, 27, 9, 'MO_V56 in balans 2v theorieboek deel a', '9789042537798', '0000-00-00', 32, 9),
(6, 27, 10, 'MO_V456 in balans 1v antwoordenboek', '9789042533370', '0000-00-00', 14, 4),
(6, 27, 11, 'MO_V56 in balans 2v antwoordenboek', '9789042533417', '0000-00-00', 12, 3),
(6, 27, 12, 'MO_V456 in balans 1v theorieboek deel a', '9789042537743', '0000-00-00', 34, 10),
(6, 27, 13, 'MO_V56 in balans 1v theorieboek deel b', '9789042537750', '0000-00-00', 23, 7),
(6, 27, 14, 'MO_V56 in balans 2v theorieboek deel a', '9789042537798', '0000-00-00', 32, 9),
(6, 27, 15, 'MO_V6 in balans 2v theorieboek deel b', '9789042537804', '0000-00-00', 20, 6),
(4, 28, 0, 'FI_V456 Het oog in de storm 1 handboek', '9789085060642', '0000-00-00', 21, 6),
(4, 28, 1, 'FI_V456 Het oog in de storm 2 handboek', '9789085060659', '0000-00-00', 21, 6),
(5, 28, 2, 'FI_V456 Het oog in de storm 1 handboek', '9789085060642', '0000-00-00', 21, 6),
(5, 28, 3, 'FI_V456 Het oog in de storm 2 handboek', '9789085060659', '0000-00-00', 21, 6),
(6, 28, 4, 'Examencahier filosofie vwo 2012 t/m 2014 - vrije wil', '9789047703303', '0000-00-00', 24, 7),
(6, 28, 5, 'FI_V456 Het oog in de storm 1 handboek', '9789085060642', '0000-00-00', 21, 6),
(6, 28, 6, 'FI_V456 Het oog in de storm 2 handboek', '9789085060659', '0000-00-00', 21, 6),
(3, 29, 0, 'NA_NOVA nwe natuurkunde opdrachtenboek', '9789034557841', '0000-00-00', 22, 6),
(3, 29, 1, 'NA_NOVA nwe natuurkunde 3v/gymnasium handboek', '9789034560049', '0000-00-00', 39, 11),
(4, 29, 2, 'NA_Newton 1v informatieboek', '9789006311822', '0000-00-00', 45, 13),
(4, 29, 3, 'NA_Newton 1v informatieboek', '9789006311822', '0000-00-00', 45, 13),
(4, 29, 4, 'NA_Newton 1v verwerkingsboek', '9789006311839', '0000-00-00', 32, 9),
(4, 29, 5, 'NA_Newton 1v verwerkingsboek', '9789006311839', '0000-00-00', 32, 9),
(4, 29, 6, 'NA_Newton 1v uitwerkingen', '9789006311846', '0000-00-00', 15, 4),
(4, 29, 7, 'NA_Newton 1v uitwerkingen', '9789006311846', '0000-00-00', 15, 4),
(5, 29, 8, 'NA_Newton 2v informatieboek', '9789006311884', '0000-00-00', 45, 13),
(5, 29, 9, 'NA_Newton 2v verwerkingsboek', '9789006311891', '0000-00-00', 32, 9),
(5, 29, 10, 'NA_Newton 2v uitwerkingen', '9789006311907', '0000-00-00', 15, 4),
(6, 29, 11, 'NA_Samengevat vwo 2e fase natuurkunde 2008', '9789006073805', '0000-00-00', 10, 3),
(6, 29, 12, 'NA_Newton 3v informatieboek', '9789006311945', '0000-00-00', 45, 13),
(6, 29, 13, 'NA_Newton 3v verwerkingsboek', '9789006311952', '0000-00-00', 32, 9),
(6, 29, 14, 'NA_Newton 3v uitwerkingen', '9789006311969', '0000-00-00', 15, 4),
(3, 30, 0, '30_NOVA 3 VWO/Gymn scheikunde opdrachten', '9789034557889', '0000-00-00', 22, 6),
(3, 30, 1, '30_NOVA 3 VWO/Gymn scheikunde handboek', '9789034560063', '0000-00-00', 39, 11),
(4, 30, 2, '30_Curie 1v informatieboek', '9789006340204', '0000-00-00', 47, 14),
(4, 30, 3, '30_Curie 1v informatieboek', '9789006340204', '0000-00-00', 47, 14),
(4, 30, 4, '30_Curie 1v verwerkingsboek', '9789006340228', '0000-00-00', 34, 10),
(4, 30, 5, '30_Curie 1v verwerkingsboek', '9789006340228', '0000-00-00', 34, 10),
(4, 30, 6, '30_Curie 1v uitwerkingenboek', '9789006340266', '0000-00-00', 16, 4),
(4, 30, 7, '30_Curie 1v uitwerkingenboek', '9789006340266', '0000-00-00', 16, 4),
(5, 30, 8, '30_Curie 2v informatieboek', '9789006340211', '0000-00-00', 46, 14),
(5, 30, 9, '30_Curie 2v verwerkingsboek deel a', '9789006340235', '0000-00-00', 34, 10),
(5, 30, 10, '30_Curie 2v verwerkingsboek deel b', '9789006340242', '0000-00-00', 23, 7),
(5, 30, 11, '30_Curie 2v uitwerkingen deel a', '9789006340273', '0000-00-00', 16, 4),
(5, 30, 12, '30_Curie 2v uitwerkingen deel b', '9789006340280', '0000-00-00', 10, 3),
(6, 30, 13, '30_Samengevat vwo 2e fase scheikunde', '9789006073812', '0000-00-00', 10, 3),
(6, 30, 14, '30_Curie 1v informatieboek', '9789006340204', '0000-00-00', 47, 14),
(6, 30, 15, '30_Curie 2v informatieboek', '9789006340211', '0000-00-00', 46, 14),
(6, 30, 16, '30_Curie 1v verwerkingsboek', '9789006340228', '0000-00-00', 34, 10),
(6, 30, 17, '30_Curie 2v verwerkingsboek deel a', '9789006340235', '0000-00-00', 34, 10),
(6, 30, 18, '30_Curie 2v verwerkingsboek deel b', '9789006340242', '0000-00-00', 23, 7),
(6, 30, 19, '30_Curie 1v uitwerkingenboek', '9789006340266', '0000-00-00', 16, 4),
(6, 30, 20, '30_Curie 2v uitwerkingen deel a', '9789006340273', '0000-00-00', 16, 4),
(6, 30, 21, '30_Curie 2v uitwerkingen deel b', '9789006340280', '0000-00-00', 10, 3),
(6, 30, 22, '30_Curie 2v verwerkingsboek deel c', '9789006340419', '0000-00-00', 23, 7),
(6, 30, 23, '30_Curie 2v uitwerkingen deel c', '9789006340426', '0000-00-00', 5, 1),
(2, 31, 0, 'Nova nieuwe natuur- en scheikunde 1/2hv', '9789034554109', '0000-00-00', 37, 11),
(2, 31, 1, 'Nova nieuwe natuur- en scheikunde 1/2hv werkboek 3-uurs dl a', '9789034554178', '0000-00-00', 13, 3),
(2, 31, 2, 'Nova nieuwe natuur- en scheikunde 1/2hv werkboek 3-uurs dl b', '9789034554185', '0000-00-00', 13, 3),
(2, 31, 3, 'Nova nieuwe na30 1/2hv 3-uurs uitwerkingenboek deel a+b', '9789034557674', '0000-00-00', 21, 6),
(4, 34, 0, 'MA_V4 Impuls werkboek 2e fase vwo', '9789001940720', '0000-00-00', 14, 4),
(4, 34, 1, 'MA_V4 Impuls 2e fase vwo', '9789001940751', '0000-00-00', 30, 9),
(4, 35, 0, 'Rome leven met het verleden themaboek kcv', '9789050271141', '0000-00-00', 19, 0),
(4, 35, 1, 'KC_Forum basisboek klassieke culturele vorming', '9789050270939', '0000-00-00', 27, 8),
(5, 35, 2, 'Rome leven met het verleden themaboek kcv', '9789050271141', '0000-00-00', 19, 0),
(0, 0, 0, 'Boek', 'ISBN', '0000-00-00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `TABLE 8`
--

CREATE TABLE IF NOT EXISTS `TABLE 8` (
  `lln` varchar(6) NOT NULL,
  `anaam` varchar(64) NOT NULL,
  `vnaam` varchar(64) NOT NULL,
  `tussenv` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `TABLE 8`
--

INSERT INTO `TABLE 8` (`lln`, `anaam`, `vnaam`, `tussenv`) VALUES
('101907', 'Abdelbaki', 'Basim', ''),
('102108', 'Abdeluaret', 'Soulï', ''),
('102156', 'Abrahamse', 'Ruben', ''),
('101843', 'Andrawes', 'Timy', ''),
('102051', 'Aoui Amar', 'Ilias', ''),
('101775', 'Apontoweil', 'Kolja', ''),
('101774', 'Bakker', 'Marit', ''),
('101918', 'Balvers', 'Max', ''),
('101952', 'Beek', 'Jasper', 'te'),
('102121', 'Boahemaa', 'Dylan', ''),
('101838', 'Borkelmans', 'Dominic', ''),
('101839', 'Brouwer', 'Toon', ''),
('101826', 'Bult', 'Mila', ''),
('101963', 'Chellit', 'Jacguy', ''),
('102081', 'Cock', 'Florine', 'de'),
('101822', 'Contrera Arias', 'Friso', ''),
('102171', 'Cordes', 'Dennis', ''),
('101771', 'Cornelissen', 'Bas', ''),
('101646', 'Declerieux', 'Jules', ''),
('101934', 'Doel', 'Hannah', 'van den'),
('102057', 'Duchhart', 'Pim', ''),
('101950', 'Ekker', 'Lies', ''),
('102147', 'Elders', 'Fée', ''),
('102148', 'Ende', 'Agnes', 'van den'),
('102150', 'Essen', 'Elize', 'van'),
('102118', 'Geijsel', 'Robin', ''),
('101830', 'Gimbergh', 'Pim', ''),
('102151', 'Gool', 'Roman', 'van'),
('102115', 'Gorgels', 'Zeno', ''),
('101946', 'Gözüm', 'Daan', ''),
('101823', 'Grevengoed', 'Merijn', 'van'),
('102106', 'Groenewoud', 'Elisa', 'van het'),
('102073', 'Groenveld', 'Max', ''),
('101947', 'Groot', 'Lex', 'de'),
('101924', 'Gruijters', 'Marike', ''),
('101841', 'Hiebsch', 'Alexander', ''),
('102159', 'Hobrecker', 'Francesca', ''),
('101840', 'Hoedt', 'Max', 'Ten'),
('102157', 'Hoekstra', 'Jip', ''),
('102129', 'Hofs', 'Felix', ''),
('101824', 'Hosny Abd-Alla', 'Haidy', ''),
('102061', 'Huijers', 'Marijn', ''),
('101930', 'Husain Cornelissen', 'Adnan', ''),
('101837', 'IJlst', 'Marloes', ''),
('101833', 'Imming', 'Suzanne', ''),
('102134', 'Ismail', 'Omar', ''),
('102142', 'Ismail', 'Amine', ''),
('101827', 'Jones', 'Dionisia', ''),
('102173', 'Kemperman', 'Job', ''),
('101842', 'Kharchouch', 'Souhaila', ''),
('102055', 'Kho', 'Li Ming', ''),
('101902', 'Knapen', 'Sophie', ''),
('101831', 'Kok', 'Ares', ''),
('102162', 'Kool', 'Rutger', ''),
('101647', 'Lancel', 'Tobias', ''),
('101966', 'Langenberg', 'Ebbe', ''),
('101972', 'Loenen', 'Ella', 'van'),
('101935', 'Loos', 'Tijn', ''),
('102053', 'Luntz', 'Tessa', ''),
('101916', 'Maartens', 'Caitlin', ''),
('102154', 'Marijnen', 'Todias', ''),
('101939', 'Massier', 'Tijmen', ''),
('101825', 'Melad', 'Souf', ''),
('101906', 'Mioch', 'Mira', ''),
('102146', 'Mohammad', 'Tahira', ''),
('101828', 'Muhammad', 'Ifaan', ''),
('101944', 'Mulder', 'Arun', ''),
('102123', 'Nasr', 'Mariam', ''),
('102076', 'Nienhaus', 'Isa', ''),
('102177', 'Ogenia', 'Raquil', ''),
('101844', 'Ouss', 'Dmitry', ''),
('101836', 'Pellegrom', 'Jules', ''),
('101951', 'Ploem Kempkes', 'Midas', ''),
('101933', 'Polak', 'Mick', ''),
('102168', 'Pürzel', 'Charlotte', ''),
('101772', 'Reedijk', 'Bram', ''),
('102155', 'Rehman', 'Rabdaah', ''),
('102179', 'Reina', 'Elias', ''),
('102181', 'Remkes', 'Raphaël', ''),
('101931', 'Riessen', 'Tom', 'van'),
('102059', 'Rijn', 'Sophie', 'van'),
('102085', 'Ronde', 'Sven', 'de'),
('102170', 'Saatrübe', 'Beer', ''),
('101786', 'Sahit', 'Kristy', ''),
('102132', 'Scheffer', 'Mees', ''),
('101784', 'Schrofer', 'Noor', ''),
('101941', 'Sindram', 'Merlijn', ''),
('101911', 'Sluis', 'Gabriël', 'van den'),
('101964', 'Smidi', 'Caio', ''),
('102110', 'Sow', 'Khady', ''),
('102149', 'Steinfort', 'David', ''),
('102033', 'Stol', 'Melle', ''),
('102127', 'Stolwyk', 'Jan', ''),
('102031', 'Stork', 'Milan', ''),
('101932', 'Taha', 'Ahmed', ''),
('101965', 'Tdlohreg', 'Susanna', ''),
('101829', 'Thijs', 'Hillebrand', ''),
('102158', 'Thoen', 'Marit', ''),
('101845', 'Varossieau', 'Etienne', ''),
('102178', 'Velland', 'Owen', ''),
('101835', 'Vis', 'Ian', ''),
('101834', 'Vliet', 'Camille', 'van'),
('101922', 'Wan', 'Henry', ''),
('102180', 'Wolff', 'Mädchen', ''),
('101967', 'Wolters', 'Raul', ''),
('102112', 'Ypenga', 'Femke', ''),
('101832', 'Zonneveld', 'Ilse', ''),
('101881', 'Zonneveld', 'Lotte', ''),
('98805', 'Swatman', 'Stephen', ''),
('98789', 'Vermeulen', 'Willem', '');

-- --------------------------------------------------------

--
-- Table structure for table `vakken`
--

CREATE TABLE IF NOT EXISTS `vakken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `naam` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `boeken`
--
ALTER TABLE `boeken`
  ADD CONSTRAINT `boeken_ibfk_1` FOREIGN KEY (`leerling_id`) REFERENCES `leerlingen` (`id`),
  ADD CONSTRAINT `boeken_ibfk_2` FOREIGN KEY (`boek_id`) REFERENCES `boektypes` (`id`);

--
-- Constraints for table `boektypes`
--
ALTER TABLE `boektypes`
  ADD CONSTRAINT `boektypes_ibfk_1` FOREIGN KEY (`vak_id`) REFERENCES `vakken` (`id`);

--
-- Constraints for table `leerling_vak`
--
ALTER TABLE `leerling_vak`
  ADD CONSTRAINT `leerling_vak_ibfk_1` FOREIGN KEY (`leerling_id`) REFERENCES `leerlingen` (`id`),
  ADD CONSTRAINT `leerling_vak_ibfk_2` FOREIGN KEY (`vak_id`) REFERENCES `vakken` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
