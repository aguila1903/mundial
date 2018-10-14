-- MySQL dump 10.16  Distrib 10.1.34-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: mundialdb
-- ------------------------------------------------------
-- Server version	10.1.34-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `begleiter`
--

DROP TABLE IF EXISTS `begleiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `begleiter` (
  `begleiter_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(264) NOT NULL,
  `geb_datum` date DEFAULT NULL,
  `spitzname` varchar(264) DEFAULT NULL,
  PRIMARY KEY (`begleiter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `begleiter`
--

LOCK TABLES `begleiter` WRITE;
/*!40000 ALTER TABLE `begleiter` DISABLE KEYS */;
INSERT INTO `begleiter` VALUES (1,'SUAT','1981-08-24','El Turco'),(5,'TORBEN','1900-01-01',NULL),(6,'TINA','1979-12-20','Schnucki'),(7,'MAJA','2010-03-17','Mein kleines Ungeheuer'),(8,'PATRICK POLLOK','1900-01-01','Tischlehne'),(9,'PATRICK WILHELM','1900-01-01','Patsy'),(10,'CLAUS','1900-01-01','Clauswärtssieg'),(11,'SASCHA','1979-12-20','Fori'),(12,'SCHILDKRÖTE','1900-01-01',NULL),(13,'MARCEL','1975-12-17','MW'),(14,'TIMM GEPPERT','1900-01-01','Woody'),(15,'SVEN','1900-01-01',NULL),(16,'BENNI','1900-01-01',NULL),(17,'KRILLE KOLB','1900-01-01',NULL),(18,'BJÖRN MEIER','1900-01-01','Muddi'),(19,'WINNI MEIER','1900-01-01',NULL),(20,'TIMM MEIER','1900-01-01',NULL),(21,'SAMS','1900-01-01',NULL),(22,'CLAAS','1900-01-01',NULL),(23,'FINN','1980-11-25',NULL),(24,'STEFAN RICHTER','1900-01-01',NULL),(25,'HARZER','1900-01-01',NULL),(26,'JÜRGEN PAVONE','1900-01-01','Goslar-Jürgen'),(27,'TURBO','1900-01-01',NULL),(28,'AXEL FOLEY','1900-01-01','(Mitfahrer bei Goslar-Jürgen)'),(29,'MARVIN','1900-01-01','(Mitfahrer bei Goslar-Jürgen)'),(30,'HORST','1900-01-01',NULL),(31,'RAIK','1900-01-01',NULL);
/*!40000 ALTER TABLE `begleiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bundeslaender`
--

DROP TABLE IF EXISTS `bundeslaender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bundeslaender` (
  `bundesland_id` varchar(2) NOT NULL,
  `name` varchar(200) NOT NULL,
  `land` char(2) NOT NULL,
  PRIMARY KEY (`bundesland_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bundeslaender`
--

LOCK TABLES `bundeslaender` WRITE;
/*!40000 ALTER TABLE `bundeslaender` DISABLE KEYS */;
INSERT INTO `bundeslaender` VALUES ('BB','Brandenburg','DE'),('BE','Berlin','DE'),('BW','Baden-Württemberg','DE'),('BY','Bayern','DE'),('HB','Bremen','DE'),('HE','Hessen','DE'),('HH','Hamburg','DE'),('MV','Mecklenburg-Vorpommern','DE'),('NI','Niedersachsen','DE'),('NW','Nordrhein-Westfalen','DE'),('RP','Rheinland-Pfalz','DE'),('SH','Schleswig-Holstein','DE'),('SL','Saarland','DE'),('SN','Sachsen','DE'),('ST','Sachsen-Anhalt','DE'),('TH','Thüringen','DE');
/*!40000 ALTER TABLE `bundeslaender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laender`
--

DROP TABLE IF EXISTS `laender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laender` (
  `code` char(2) NOT NULL,
  `en` varchar(50) NOT NULL DEFAULT '',
  `de` varchar(50) NOT NULL DEFAULT '',
  `code2` varchar(3) DEFAULT NULL,
  `erstbesuch` date DEFAULT '1900-01-01',
  `laenderpunkt_nr` int(11) DEFAULT NULL,
  `codeMap` char(2) DEFAULT NULL,
  `latitude` decimal(8,4) DEFAULT NULL,
  `longitude` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `de` (`de`),
  KEY `en` (`en`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laender`
--

LOCK TABLES `laender` WRITE;
/*!40000 ALTER TABLE `laender` DISABLE KEYS */;
INSERT INTO `laender` VALUES ('AD','Andorra','Andorra',NULL,'1900-01-01',NULL,'AD',42.5000,1.5000),('AE','United Arab Emirates','Vereinigte Arabische Emirate',NULL,'1900-01-01',NULL,'AE',24.0000,54.0000),('AF','Afghanistan','Afghanistan','AFG','1900-01-01',NULL,'AF',33.0000,65.0000),('AG','Antigua and Barbuda','Antigua und Barbuda',NULL,'1900-01-01',NULL,'AG',17.0500,-61.8000),('AI','Anguilla','Anguilla',NULL,'1900-01-01',NULL,'AI',18.2500,-63.1667),('AL','Albania','Albanien','ALB','1900-01-01',NULL,'AL',41.0000,20.0000),('AM','Armenia','Armenien','ARM','1900-01-01',NULL,'AM',40.0000,45.0000),('AN','Netherlands Antilles','Niederländische Antillen',NULL,'1900-01-01',NULL,'AN',12.2500,-68.7500),('AO','Angola','Angola','ANG','1900-01-01',NULL,'AO',-12.5000,18.5000),('AQ','Antarctica','Antarktis',NULL,'1900-01-01',NULL,'AQ',-90.0000,0.0000),('AR','Argentina','Argentinien','ARG','1900-01-01',NULL,'AR',-34.0000,-64.0000),('AS','American Samoa','Amerikanisch-Samoa',NULL,'1900-01-01',NULL,'AS',-14.3333,-170.0000),('AT','Austria','Österreich','A','1900-01-01',NULL,'AT',47.3333,13.3333),('AU','Australia','Australien','AUS','1900-01-01',NULL,'AU',-27.0000,133.0000),('AW','Aruba','Aruba',NULL,'1900-01-01',NULL,'AW',12.5000,-69.9667),('AX','Aland Islands','Åland',NULL,'1900-01-01',NULL,'',NULL,NULL),('AZ','Azerbaijan','Aserbaidschan',NULL,'1900-01-01',NULL,'AZ',40.5000,47.5000),('BA','Bosnia and Herzegovina','Bosnien und Herzegowina','BOS','1900-01-01',NULL,'BA',44.0000,18.0000),('BB','Barbados','Barbados',NULL,'1900-01-01',NULL,'BB',13.1667,-59.5333),('BD','Bangladesh','Bangladesch',NULL,'1900-01-01',NULL,'BD',24.0000,90.0000),('BE','Belgium','Belgien','B','1900-01-01',NULL,'BE',50.8333,4.0000),('BF','Burkina Faso','Burkina Faso','BFA','1900-01-01',NULL,'BF',13.0000,-2.0000),('BG','Bulgaria','Bulgarien','BUL','1900-01-01',NULL,'BG',43.0000,25.0000),('BH','Bahrain','Bahrain',NULL,'1900-01-01',NULL,'BH',26.0000,50.5500),('BI','Burundi','Burundi',NULL,'1900-01-01',NULL,'BI',-3.5000,30.0000),('BJ','Benin','Benin',NULL,'1900-01-01',NULL,'BJ',9.5000,2.2500),('BM','Bermuda','Bermuda',NULL,'1900-01-01',NULL,'BM',32.3333,-64.7500),('BN','Brunei','Brunei Darussalam',NULL,'1900-01-01',NULL,'BN',4.5000,114.6667),('BO','Bolivia','Bolivien',NULL,'1900-01-01',NULL,'BO',-17.0000,-65.0000),('BR','Brazil','Brasilien','BRA','1900-01-01',NULL,'BR',-10.0000,-55.0000),('BS','Bahamas','Bahamas',NULL,'1900-01-01',NULL,'BS',24.2500,-76.0000),('BT','Bhutan','Bhutan',NULL,'1900-01-01',NULL,'BT',27.5000,90.5000),('BV','Bouvet Island','Bouvetinsel',NULL,'1900-01-01',NULL,'',-54.4333,3.4000),('BW','Botswana','Botswana',NULL,'1900-01-01',NULL,'BW',-22.0000,24.0000),('BY','Belarus','Weißrussland',NULL,'1900-01-01',NULL,'BY',53.0000,28.0000),('BZ','Belize','Belize',NULL,'1900-01-01',NULL,'BZ',17.2500,-88.7500),('CA','Canada','Kanada','CAN','1900-01-01',NULL,'CA',54.0000,-100.0000),('CC','Cocos (Keeling) Islands','Kokosinseln (Keelinginseln)',NULL,'1900-01-01',NULL,'',-12.5000,96.8333),('CD','Congo (Kinshasa)','Kongo','COD','1900-01-01',NULL,'CD',0.0000,25.0000),('CF','Central African Republic','Zentralafrikanische Republik',NULL,'1900-01-01',NULL,'CF',7.0000,21.0000),('CG','Congo (Brazzaville)','Republik Kongo','CGO','1900-01-01',NULL,'CG',-1.0000,15.0000),('CH','Switzerland','Schweiz','CH','1900-01-01',NULL,'CH',47.0000,8.0000),('CI','Ivory Coast','Elfenbeinküste','CIV','1900-01-01',NULL,'CI',8.0000,-5.0000),('CK','Cook Islands','Cookinseln',NULL,'1900-01-01',NULL,'',-21.2333,-159.7667),('CL','Chile','Chile','RCH','1900-01-01',NULL,'CL',-30.0000,-71.0000),('CM','Cameroon','Kamerun','CMR','1900-01-01',NULL,'CM',6.0000,12.0000),('CN','China','China, Volksrepublik',NULL,'1900-01-01',NULL,'CN',35.0000,105.0000),('CO','Colombia','Kolumbien','KOL','1900-01-01',NULL,'CO',4.0000,-72.0000),('CR','Costa Rica','Costa Rica','COS','1900-01-01',NULL,'CR',10.0000,-84.0000),('CS','Serbia','Serbien','SER','1900-01-01',NULL,'RS',44.7872,20.4573),('CU','Cuba','Kuba',NULL,'1900-01-01',NULL,'CU',21.5000,-80.0000),('CV','Cape Verde','Kap Verde',NULL,'1900-01-01',NULL,'CV',16.0000,-24.0000),('CX','Christmas Island','Weihnachtsinsel',NULL,'1900-01-01',NULL,'',-10.5000,105.6667),('CY','Cyprus','Zypern',NULL,'1900-01-01',0,'CY',35.0000,33.0000),('CZ','Czech Republic','Tschechische Republik','CZE','2006-03-18',3,'CZ',49.7500,15.5000),('DE','Germany','Deutschland','D','1985-01-02',1,'DE',51.0000,9.0000),('DJ','Djibouti','Dschibuti',NULL,'1900-01-01',NULL,'DJ',11.5000,43.0000),('DK','Denmark','Dänemark','DEN','1900-01-01',0,'DK',56.0000,10.0000),('DM','Dominica','Dominica',NULL,'1900-01-01',NULL,'DM',15.4167,-61.3333),('DO','Dominican Republic','Dominikanische Republik',NULL,'1900-01-01',NULL,'DO',19.0000,-70.6667),('DZ','Algeria','Algerien','ALG','1900-01-01',NULL,'DZ',28.0000,3.0000),('EC','Ecuador','Ecuador','ECU','1900-01-01',NULL,'EC',-2.0000,-77.5000),('EE','Estonia','Estland','EST','1900-01-01',NULL,'EE',59.0000,26.0000),('EG','Egypt','Ägypten','EGY','1900-01-01',NULL,'EG',27.0000,30.0000),('EH','Western Sahara','Westsahara',NULL,'1900-01-01',NULL,'EH',24.5000,-13.0000),('EN','England','England','ENG','1900-01-01',NULL,'GB',51.5085,-0.0761),('ER','Eritrea','Eritrea',NULL,'1900-01-01',NULL,'ER',15.0000,39.0000),('ES','Spain','Spanien','E','1900-01-01',0,'ES',40.0000,-4.0000),('ET','Ethiopia','Äthiopien',NULL,'1900-01-01',NULL,'ET',8.0000,38.0000),('FI','Finland','Finnland','FIN','1900-01-01',NULL,'FI',62.0000,26.0000),('FJ','Fiji','Fidschi',NULL,'1900-01-01',NULL,'FJ',-18.0000,175.0000),('FK','Falkland Islands','Falklandinseln',NULL,'1900-01-01',NULL,'FK',-51.7500,-59.0000),('FM','Micronesia','Mikronesien',NULL,'1900-01-01',NULL,'FM',6.9167,158.2500),('FO','Faroe Islands','Färöer',NULL,'1900-01-01',NULL,'FO',62.0000,-7.0000),('FR','France','Frankreich','F','1900-01-01',1,'FR',46.0000,2.0000),('GA','Gabon','Gabun','GAB','1900-01-01',NULL,'GA',-1.0000,11.7500),('GB','United Kingdom','Großbritannien und Nordirland',NULL,'1900-01-01',NULL,'GB',54.0000,-2.0000),('GD','Grenada','Grenada',NULL,'1900-01-01',NULL,'GD',12.1167,-61.6667),('GE','Georgia','Georgien',NULL,'1900-01-01',NULL,'GE',42.0000,43.5000),('GF','French Guiana','Französisch-Guayana',NULL,'1900-01-01',NULL,'GF',4.0000,-53.0000),('GG','Guernsey','Guernsey (Kanalinsel)',NULL,'1900-01-01',NULL,'QI',NULL,NULL),('GH','Ghana','Ghana','GHA','1900-01-01',NULL,'GH',8.0000,-2.0000),('GI','Gibraltar','Gibraltar',NULL,'1900-01-01',NULL,'GI',36.1833,-5.3667),('GL','Greenland','Grönland',NULL,'1900-01-01',NULL,'GL',72.0000,-40.0000),('GM','Gambia','Gambia',NULL,'1900-01-01',NULL,'GM',13.4667,-16.5667),('GN','Guinea','Guinea',NULL,'1900-01-01',NULL,'GW',11.0000,-10.0000),('GP','Guadeloupe','Guadeloupe',NULL,'1900-01-01',NULL,'GP',16.2500,-61.5833),('GQ','Equatorial Guinea','Äquatorialguinea',NULL,'1900-01-01',NULL,'GQ',2.0000,10.0000),('GR','Greece','Griechenland','GR','1900-01-01',NULL,'GR',39.0000,22.0000),('GS','South Georgia and the South Sandwich Islands','Südgeorgien und die Südl. Sandwichinseln',NULL,'1900-01-01',NULL,'',-54.5000,-37.0000),('GT','Guatemala','Guatemala',NULL,'1900-01-01',NULL,'GT',15.5000,-90.2500),('GU','Guam','Guam',NULL,'1900-01-01',NULL,'GU',13.4667,144.7833),('GW','Guinea-Bissau','Guinea-Bissau',NULL,'1900-01-01',NULL,'GW',12.0000,-15.0000),('GY','Guyana','Guyana',NULL,'1900-01-01',NULL,'GY',5.0000,-59.0000),('HK','Hong Kong S.A.R., China','Hongkong',NULL,'1900-01-01',NULL,'CN',22.2500,114.1667),('HM','Heard Island and McDonald Islands','Heard- und McDonald-Inseln',NULL,'1900-01-01',NULL,'',-53.1000,72.5167),('HN','Honduras','Honduras',NULL,'1900-01-01',NULL,'HN',15.0000,-86.5000),('HR','Croatia','Kroatien','CRO','1900-01-01',NULL,'HR',45.1667,15.5000),('HT','Haiti','Haiti',NULL,'1900-01-01',NULL,'HT',19.0000,-72.4167),('HU','Hungary','Ungarn','HUN','1900-01-01',NULL,'HU',47.0000,20.0000),('ID','Indonesia','Indonesien',NULL,'1900-01-01',NULL,'ID',-5.0000,120.0000),('IE','Ireland','Irland','IRL','1900-01-01',NULL,'IE',53.0000,-8.0000),('IL','Israel','Israel','ISR','1900-01-01',NULL,'IL',31.5000,34.7500),('IM','Isle of Man','Insel Man',NULL,'1900-01-01',NULL,'',NULL,NULL),('IN','India','Indien',NULL,'1900-01-01',NULL,'IN',20.0000,77.0000),('IO','British Indian Ocean Territory','Britisches Territorium im Indischen Ozean',NULL,'1900-01-01',NULL,'',-6.0000,71.5000),('IQ','Iraq','Irak',NULL,'1900-01-01',NULL,'IQ',33.0000,44.0000),('IR','Iran','Iran',NULL,'1900-01-01',NULL,'IR',32.0000,53.0000),('IS','Iceland','Island',NULL,'1900-01-01',NULL,'IS',65.0000,-18.0000),('IT','Italy','Italien','I','1900-01-01',NULL,'IT',42.8333,12.8333),('JE','Jersey','Jersey (Kanalinsel)',NULL,'1900-01-01',NULL,'QI',NULL,NULL),('JM','Jamaica','Jamaika',NULL,'1900-01-01',NULL,'JM',18.2500,-77.5000),('JO','Jordan','Jordanien',NULL,'1900-01-01',NULL,'JO',31.0000,36.0000),('JP','Japan','Japan','JAP','1900-01-01',NULL,'JP',36.0000,138.0000),('KD','Montenegro','Montenegro','MON','1900-01-01',NULL,'ME',42.4426,19.2686),('KE','Kenya','Kenia',NULL,'1900-01-01',NULL,'KE',1.0000,38.0000),('KG','Kyrgyzstan','Kirgisistan',NULL,'1900-01-01',NULL,'KG',41.0000,75.0000),('KH','Cambodia','Kambodscha',NULL,'1900-01-01',NULL,'KH',13.0000,105.0000),('KI','Kiribati','Kiribati',NULL,'1900-01-01',NULL,'KI',1.4167,173.0000),('KM','Comoros','Komoren',NULL,'1900-01-01',NULL,'KM',-12.1667,44.2500),('KN','Saint Kitts and Nevis','St. Kitts und Nevis',NULL,'1900-01-01',NULL,'KK',17.3333,-62.7500),('KP','North Korea','Nordkorea',NULL,'1900-01-01',NULL,'KP',40.0000,127.0000),('KR','South Korea','Südkorea','KOR','1900-01-01',NULL,'KR',37.0000,127.5000),('KS','Kosovo','Kosovo','KSV','1900-01-01',NULL,'RS',42.6675,21.1662),('KW','Kuwait','Kuwait',NULL,'1900-01-01',NULL,'KW',29.3375,47.6581),('KY','Cayman Islands','Kaimaninseln',NULL,'1900-01-01',NULL,'CQ',19.5000,-80.5000),('KZ','Kazakhstan','Kasachstan',NULL,'1900-01-01',NULL,'KZ',48.0000,68.0000),('LA','Laos','Laos',NULL,'1900-01-01',NULL,'LA',18.0000,105.0000),('LB','Lebanon','Libanon',NULL,'1900-01-01',NULL,'LB',33.8333,35.8333),('LC','Saint Lucia','St. Lucia',NULL,'1900-01-01',NULL,'LC',13.8833,-61.1333),('LI','Liechtenstein','Liechtenstein',NULL,'1900-01-01',NULL,'LI',47.1667,9.5333),('LK','Sri Lanka','Sri Lanka',NULL,'1900-01-01',NULL,'LK',7.0000,81.0000),('LR','Liberia','Liberia',NULL,'1900-01-01',NULL,'LR',6.5000,-9.5000),('LS','Lesotho','Lesotho',NULL,'1900-01-01',NULL,'LS',-29.5000,28.5000),('LT','Lithuania','Litauen','LIT','1900-01-01',NULL,'LT',55.0000,24.0000),('LU','Luxembourg','Luxemburg','LUX','1900-01-01',NULL,'LU',49.7500,6.0000),('LV','Latvia','Lettland','LAT','1900-01-01',NULL,'LV',57.0000,25.0000),('LY','Libya','Libyen',NULL,'1900-01-01',NULL,'LY',25.0000,17.0000),('MA','Morocco','Marokko','MAR','1900-01-01',NULL,'MA',32.0000,-5.0000),('MC','Monaco','Monaco',NULL,'1900-01-01',NULL,'MC',43.7333,7.4000),('MD','Moldova','Moldawien',NULL,'1900-01-01',NULL,'MD',47.0000,29.0000),('MG','Madagascar','Madagaskar',NULL,'1900-01-01',NULL,'MG',-20.0000,47.0000),('MH','Marshall Islands','Marshallinseln',NULL,'1900-01-01',NULL,'MH',9.0000,168.0000),('MK','Macedonia','Mazedonien','MKD','1900-01-01',NULL,'MK',41.8333,22.0000),('ML','Mali','Mali',NULL,'1900-01-01',NULL,'ML',17.0000,-4.0000),('MM','Myanmar','Myanmar (Burma)',NULL,'1900-01-01',NULL,'MM',22.0000,98.0000),('MN','Mongolia','Mongolei',NULL,'1900-01-01',NULL,'MN',46.0000,105.0000),('MO','Macao S.A.R., China','Macao',NULL,'1900-01-01',NULL,'',22.1667,113.5500),('MP','Northern Mariana Islands','Nördliche Marianen',NULL,'1900-01-01',NULL,'MP',15.2000,145.7500),('MQ','Martinique','Martinique',NULL,'1900-01-01',NULL,'MQ',14.6667,-61.0000),('MR','Mauritania','Mauretanien',NULL,'1900-01-01',NULL,'MR',20.0000,-12.0000),('MS','Montserrat','Montserrat',NULL,'1900-01-01',NULL,'',16.7500,-62.2000),('MT','Malta','Malta','MLT','1900-01-01',NULL,'MT',35.8333,14.5833),('MU','Mauritius','Mauritius',NULL,'1900-01-01',NULL,'MU',-20.2833,57.5500),('MV','Maldives','Malediven',NULL,'1900-01-01',NULL,'MV',3.2500,73.0000),('MW','Malawi','Malawi',NULL,'1900-01-01',NULL,'MW',-13.5000,34.0000),('MX','Mexico','Mexiko',NULL,'1900-01-01',NULL,'MX',23.0000,-102.0000),('MY','Malaysia','Malaysia',NULL,'1900-01-01',NULL,'MY',2.5000,112.5000),('MZ','Mozambique','Mosambik',NULL,'1900-01-01',NULL,'MZ',-18.2500,35.0000),('NA','Namibia','Namibia','NAM','1900-01-01',NULL,'NA',-22.0000,17.0000),('nb','nicht bekannt','nicht bekannt',NULL,'1900-01-01',NULL,'',NULL,NULL),('NC','New Caledonia','Neukaledonien',NULL,'1900-01-01',NULL,'NC',-21.5000,165.5000),('NE','Niger','Niger',NULL,'1900-01-01',NULL,'NE',16.0000,8.0000),('NF','Norfolk Island','Norfolkinsel',NULL,'1900-01-01',NULL,'NF',-29.0333,167.9500),('NG','Nigeria','Nigeria','NGA','1900-01-01',NULL,'NG',10.0000,8.0000),('NI','Nicaragua','Nicaragua',NULL,'1900-01-01',NULL,'NI',13.0000,-85.0000),('NL','Netherlands','Niederlande','NL','1900-01-01',NULL,'NL',52.5000,5.7500),('nn','North Ireland','Nordirland',NULL,'1900-01-01',NULL,'GB',54.4533,-6.4043),('NO','Norway','Norwegen','NOR','1900-01-01',NULL,'NO',62.0000,10.0000),('NP','Nepal','Nepal',NULL,'1900-01-01',NULL,'NP',28.0000,84.0000),('NR','Nauru','Nauru',NULL,'1900-01-01',NULL,'NR',-0.5333,166.9167),('NU','Niue','Niue',NULL,'1900-01-01',NULL,'NU',-19.0333,-169.8667),('NZ','New Zealand','Neuseeland','NZL','1900-01-01',NULL,'NZ',-41.0000,174.0000),('OM','Oman','Oman',NULL,'1900-01-01',NULL,'OM',21.0000,57.0000),('PA','Panama','Panama',NULL,'1900-01-01',NULL,'PA',9.0000,-80.0000),('PE','Peru','Peru','PER','1900-01-01',NULL,'PE',-10.0000,-76.0000),('PF','French Polynesia','Französisch-Polynesien',NULL,'1900-01-01',NULL,'PF',-15.0000,-140.0000),('PG','Papua New Guinea','Papua-Neuguinea',NULL,'1900-01-01',NULL,'PG',-6.0000,147.0000),('PH','Philippines','Philippinen',NULL,'1900-01-01',NULL,'PH',13.0000,122.0000),('PK','Pakistan','Pakistan',NULL,'1900-01-01',NULL,'PK',30.0000,70.0000),('PL','Poland','Polen','PL','1900-01-01',NULL,'PL',52.0000,20.0000),('PM','Saint Pierre and Miquelon','St. Pierre und Miquelon',NULL,'1900-01-01',NULL,'',46.8333,-56.3333),('PN','Pitcairn','Pitcairninseln',NULL,'1900-01-01',NULL,'PN',NULL,NULL),('PR','Puerto Rico','Puerto Rico',NULL,'1900-01-01',NULL,'PR',18.2500,-66.5000),('PS','Palestinian Authority','Palästinensische Autonomiegebiete',NULL,'1900-01-01',NULL,'PQ',32.0000,35.2500),('PT','Portugal','Portugal','POR','1900-01-01',NULL,'PT',39.5000,-8.0000),('PW','Palau','Palau',NULL,'1900-01-01',NULL,'PW',7.5000,134.5000),('PY','Paraguay','Paraguay','PAR','1900-01-01',NULL,'PY',-23.0000,-58.0000),('QA','Qatar','Katar',NULL,'1900-01-01',NULL,'QA',25.5000,51.2500),('RE','Reunion','Réunion',NULL,'1900-01-01',NULL,'RE',-21.1000,55.6000),('RO','Romania','Rumänien','ROM','1900-01-01',NULL,'RO',46.0000,25.0000),('RU','Russia','Russland','RUS','1900-01-01',NULL,'RU',60.0000,100.0000),('RW','Rwanda','Ruanda',NULL,'1900-01-01',NULL,'RW',-2.0000,30.0000),('SA','Saudi Arabia','Saudi-Arabien',NULL,'1900-01-01',NULL,'SA',25.0000,45.0000),('SB','Solomon Islands','Salomonen-Inseln',NULL,'1900-01-01',NULL,'SB',-8.0000,159.0000),('SC','Seychelles','Seychellen',NULL,'1900-01-01',NULL,'SC',-4.5833,55.6667),('SD','Sudan','Sudan',NULL,'1900-01-01',NULL,'SD',15.0000,30.0000),('SE','Sweden','Schweden','SWE','1900-01-01',NULL,'SE',62.0000,15.0000),('SG','Singapore','Singapur',NULL,'1900-01-01',NULL,'SG',1.3667,103.8000),('SH','Saint Helena','Sankt Helena',NULL,'1900-01-01',NULL,'',-15.9333,-5.7000),('SI','Slovenia','Slowenien','SLO','1900-01-01',NULL,'SI',46.0000,15.0000),('SJ','Svalbard and Jan Mayen','Svalbard und Jan Mayen',NULL,'1900-01-01',NULL,'',78.0000,20.0000),('SK','Slovakia','Slowakei','SVK','1900-01-01',NULL,'SK',48.6667,19.5000),('SL','Sierra Leone','Sierra Leone','SLE','1900-01-01',NULL,'SL',8.5000,-11.5000),('SM','San Marino','San Marino',NULL,'1900-01-01',NULL,'SM',43.7667,12.4167),('SN','Senegal','Senegal','SEN','1900-01-01',NULL,'SN',14.0000,-14.0000),('SO','Somalia','Somalia',NULL,'1900-01-01',NULL,'SO',10.0000,49.0000),('SR','Suriname','Suriname',NULL,'1900-01-01',NULL,'SR',4.0000,-56.0000),('SS','Schottland','Schottland',NULL,'1900-01-01',NULL,'GB',55.3914,-4.1861),('ST','Sao Tome and Principe','São Tomé und Príncipe',NULL,'1900-01-01',NULL,'ST',1.0000,7.0000),('SV','El Salvador','El Salvador',NULL,'1900-01-01',NULL,'SV',13.8333,-88.9167),('SY','Syria','Syrien',NULL,'1900-01-01',NULL,'SY',35.0000,38.0000),('SZ','Swaziland','Swasiland',NULL,'1900-01-01',NULL,'SZ',-26.5000,31.5000),('TC','Turks and Caicos Islands','Turks- und Caicosinseln',NULL,'1900-01-01',NULL,'TQ',21.7500,-71.5833),('TD','Chad','Tschad',NULL,'1900-01-01',NULL,'TD',15.0000,19.0000),('TF','French Southern Territories','Französische Süd- und Antarktisgebiete',NULL,'1900-01-01',NULL,'',-43.0000,67.0000),('TG','Togo','Togo',NULL,'1900-01-01',NULL,'TG',8.0000,1.1667),('TH','Thailand','Thailand',NULL,'1900-01-01',NULL,'TH',15.0000,100.0000),('TJ','Tajikistan','Tadschikistan',NULL,'1900-01-01',NULL,'TJ',39.0000,71.0000),('TK','Tokelau','Tokelau',NULL,'1900-01-01',NULL,'',-9.0000,-172.0000),('TL','East Timor','Timor-Leste',NULL,'1900-01-01',NULL,'TP',NULL,NULL),('TM','Turkmenistan','Turkmenistan',NULL,'1900-01-01',NULL,'TM',40.0000,60.0000),('TN','Tunisia','Tunesien','TUN','1900-01-01',NULL,'TN',34.0000,9.0000),('TO','Tonga','Tonga',NULL,'1900-01-01',NULL,'TO',-20.0000,-175.0000),('TR','Turkey','Türkei','TUR','1986-06-06',2,'TR',39.0000,35.0000),('TT','Trinidad and Tobago','Trinidad und Tobago',NULL,'1900-01-01',NULL,'TT',11.0000,-61.0000),('TV','Tuvalu','Tuvalu',NULL,'1900-01-01',NULL,'TV',-8.0000,178.0000),('TW','Taiwan','Taiwan',NULL,'1900-01-01',NULL,'TW',23.5000,121.0000),('TZ','Tanzania','Tansania',NULL,'1900-01-01',NULL,'TZ',-6.0000,35.0000),('UA','Ukraine','Ukraine','UKR','1900-01-01',NULL,'UA',49.0000,32.0000),('UG','Uganda','Uganda',NULL,'1900-01-01',NULL,'UG',1.0000,32.0000),('UM','United States Minor Outlying Islands','Amerikanisch-Ozeanien',NULL,'1900-01-01',NULL,'',19.2833,166.6000),('US','United States','Vereinigte Staaten von Amerika','USA','1900-01-01',NULL,'US',38.0000,-97.0000),('UY','Uruguay','Uruguay',NULL,'1900-01-01',NULL,'UY',-33.0000,-56.0000),('UZ','Uzbekistan','Usbekistan',NULL,'1900-01-01',NULL,'UZ',41.0000,64.0000),('VA','Vatican','Vatikanstadt',NULL,'1900-01-01',NULL,'VA',41.9000,12.4500),('VC','Saint Vincent and the Grenadines','St. Vincent und die Grenadinen',NULL,'1900-01-01',NULL,'VC',13.2500,-61.2000),('VE','Venezuela','Venezuela','VEN','1900-01-01',NULL,'VE',8.0000,-66.0000),('VG','British Virgin Islands','Britische Jungferninseln',NULL,'1900-01-01',NULL,'UV',18.5000,-64.5000),('VI','U.S. Virgin Islands','Amerikanische Jungferninseln',NULL,'1900-01-01',NULL,'',18.3333,-64.8333),('VN','Vietnam','Vietnam',NULL,'1900-01-01',NULL,'VN',16.0000,106.0000),('VU','Vanuatu','Vanuatu',NULL,'1900-01-01',NULL,'VU',-16.0000,167.0000),('WD','International','International',NULL,'1900-01-01',NULL,'',NULL,NULL),('WF','Wallis and Futuna','Wallis und Futuna',NULL,'1900-01-01',NULL,'',-13.3000,-176.2000),('WS','Samoa','Samoa',NULL,'1900-01-01',NULL,'WS',-13.5833,-172.3333),('WW','Wales','Wales',NULL,'1900-01-01',NULL,'GB',53.3406,-1.2816),('XX','doppelt','doppelt',NULL,'1900-01-01',NULL,NULL,NULL,NULL),('YE','Yemen','Jemen',NULL,'1900-01-01',NULL,'YE',15.0000,48.0000),('YT','Mayotte','Mayotte',NULL,'1900-01-01',NULL,'',-12.8333,45.1667),('ZA','South Africa','Südafrika','RSA','1900-01-01',NULL,'ZA',-29.0000,24.0000),('ZM','Zambia','Sambia',NULL,'1900-01-01',NULL,'ZM',-15.0000,30.0000),('ZW','Zimbabwe','Simbabwe',NULL,'1900-01-01',NULL,'ZW',-20.0000,30.0000);
/*!40000 ALTER TABLE `laender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligen`
--

DROP TABLE IF EXISTS `ligen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligen` (
  `liga_id` int(11) NOT NULL AUTO_INCREMENT,
  `liga_bez` varchar(264) NOT NULL,
  `land` char(2) NOT NULL,
  `zusatz` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`liga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligen`
--

LOCK TABLES `ligen` WRITE;
/*!40000 ALTER TABLE `ligen` DISABLE KEYS */;
INSERT INTO `ligen` VALUES (1,'1. Bundesliga ','DE','DE 1'),(2,'2. Bundesliga','DE','DE 2'),(3,'3. Liga','DE','DE 3'),(4,'1. Liga Türkei','TR','Spor Toto Süper Lig'),(7,'DFB-Pokal','DE',NULL),(8,'UEFA Champions League','WD',NULL),(9,'UEFA Europa League','WD',NULL),(10,'Fußball-Weltmeisterschaft','WD',NULL),(11,'Fußball-Europameisterschaft','WD',NULL),(12,'DFL-Supercup','DE',NULL),(13,'DFL-Ligapokal','DE',NULL),(14,'Freundschaftsspiel','WD',NULL),(15,'Oberliga','DE','DE 5'),(16,'HFV-Pokal','DE','Oddset-Pokal (ehemals Toto-Pokal)'),(17,'C-Klasse 3 Zugspitze','DE','DE 12'),(18,'Otto Hacke-Pokal','DE',NULL),(19,'Testspiel','DE',NULL),(20,'HFV-Zweitligapokal','DE','Holsten-Pokal'),(21,'Relegation zur gemeinsamen Kreisliga Oldesloe/Ratzeburg','DE',NULL),(22,'Oberliga Hamburg','DE','DE 5'),(23,'Kreisklasse C Stormarn','DE','DE 10'),(24,'Kreisklasse C Lübeck','DE','DE 10'),(25,'Regionalliga Bayern','DE','DE 4'),(26,'Regionalliga West','DE','DE 4'),(27,'Kreisklasse Nordfriesland B-Süd','DE','DE 9'),(28,'1. Liga Dänemark','DK','Superligaen'),(29,'Kreisklasse 4 Hamburg','DE','DE 9'),(30,'Regionalliga Nord','DE','DE 4'),(31,'Bezirksliga Weser-Ems 2','DE','DE 7'),(32,'Bezirksliga Hamburg-West','DE','DE 7'),(33,'Berlin-Liga','DE','DE 6'),(34,'UEFA Youth League','WD',NULL),(35,'2. Liga Niederlande','NL','Eerste Divisie'),(36,'Oberliga Nord','DE','DE 3'),(37,'Kreisklasse B Stormarn','DE','DE 9'),(38,'Kreispokal Kiel','DE',NULL),(39,'DBU Landspokal','DK',NULL),(40,'1. Liga Polen','PL','Ekstraklasa'),(41,'Kypello Elladas','GR',NULL),(42,'Testspiel (nicht öffentlich)','DE',NULL),(43,'Kreisliga 4 Hamburg','DE','DE 8'),(44,'A-Junioren-Bundesliga Süd/Südwest','DE','DE 1'),(45,'Landesliga Hammonia','DE','DE 6'),(46,'\"No Contest\" Testspiel','DE',NULL),(47,'Landesliga Lüneburg','DE','DE 6'),(48,'Telekom Cup','DE','Vorbereitungsturnier'),(49,'Kreispokal Segeberg','DE',NULL),(50,'HFV-Pokal der 1. A-Junioren','DE','Oddset-Pokal (früher Toto-Pokal)'),(51,'Bezirksliga Lüneburg, Staffel 1','DE','DE 7'),(52,'Kreisklasse 9 Hamburg','DE','DE 9'),(53,'Regionalliga Nordost','DE','DE 4'),(54,'Oberliga Nord','DE','DE 4'),(55,'DFB-Junioren-Vereinspokal','DE',NULL),(56,'Kreisklasse 3 Hamburg','DE','DE 9'),(57,'1. Liga Italien','IT','Serie A'),(58,'Bezirksliga Hamburg-Nord','DE','DE 7'),(59,'U 19 Kreisliga München','DE',NULL),(60,'Bayernliga Nord','DE','DE 5'),(61,'Kreisliga Segeberg','DE','DE 7'),(62,'FIFA Klub-Weltmeisterschaft','WD',NULL),(63,'Kreisklasse 11 Hamburg','DE','DE 9'),(64,'3, Liga Tschechien','CZ','Ceska fotbalova liga'),(65,'C-Klasse 4 München','DE','DE 12'),(66,'Kreisliga 6 Hamburg','DE','DE 8'),(67,'Kreisliga Neumünster','DE','DE 7'),(68,'UEFA-Supercup','WD',NULL),(69,'2. Liga-Pokal','DE',NULL),(70,'Kreisliga 1 Hamburg','DE','DE 8'),(71,'Kreisliga 5 Hamburg','DE','DE 8'),(72,'Landesliga Südwest','DE','DE 6'),(73,'B-Klasse 1 München','DE','DE 11'),(74,'Verbandsliga Mecklenburg-Vorpommern','DE','DE 6'),(75,'3. Bundesliga','DE','DE 3'),(76,'Kreisklasse A Segeberg','DE','DE 8'),(77,'Kreisliga 2 Hamburg','DE','DE 8'),(78,'Landesliga Braunschweig','DE','DE 6'),(79,'Kreisklasse 5 Hamburg','DE','DE 9'),(80,'Kreispokal Stormarn','DE',NULL),(81,'Kreisliga 3 Hamburg','DE','DE 8'),(82,'Kreisklasse 1 Hamburg','DE','DE 9'),(83,'B-Junioren-Bundesliga Süd/Südwest','DE','DE 1'),(84,'Liga total! Cup','DE','Vorbereitungs-Turnier'),(85,'The great wall cup','WD',NULL),(86,'China League Two, North division','CN','CH 3'),(87,'Chinese Super League','CN','CH 1'),(88,'2. Bundesliga Süd (Frauen)','DE','DE 2 (Frauen)'),(89,'Bayernliga','DE','DE 5'),(90,'Brandenburg-Liga','DE','DE 6'),(91,'Landesliga Hansa','DE','DE 6'),(92,'Kreisliga West','DE','DE 7'),(93,'Bezirksliga Weser-Ems 1','DE','DE 7'),(94,'A-Junioren-Bundesliga Nord/Nordost','DE','DE 1'),(95,'Kreisoberliga Friedberg','DE','DE 8'),(96,'Frauen-Bundesliga','DE','DE 1'),(97,'A-Junioren Bezirksliga 1 Mittelrhein','DE','DE 5'),(98,'C-Junioren Regionalliga West','DE','DE 2'),(99,'Kreisliga 7 Hamburg','DE','DE 8'),(100,'Kreisliga Stormarn','DE','DE 7'),(101,'Verbandsliga Hessen (Gruppe Süd)','DE','DE 6'),(102,'Kreisliga Herzogtum Lauenburg','DE','DE 7'),(103,'Regionalliga Süd','DE','DE 4'),(104,'Verbandsliga Nord-West','DE','DE 6'),(105,'Serie D, Girone C','IT','IT 5'),(106,'Kreisliga Rendsburg-Eckernförde 2','DE','DE 7'),(107,'Landesliga Süd','DE','DE 6'),(108,'Bezirksliga Hamburg-Ost','DE','DE 7'),(109,'Relegation zur Kreisliga (Soltau-Fallingbostel)','DE','DE 8'),(110,'Schleswig-Holstein-Liga','DE','DE 5'),(111,'Bezirksliga Weser-Ems 3','DE','DE 7'),(112,'Rheinlandliga','DE','DE 5'),(113,'Landesliga West','DE','DE 7'),(114,'2011 AFC Asian Cup','WD',NULL),(115,'16th Asia Games','CN',NULL),(116,'HKFA 2nd Division','HK','HGK 2'),(117,'2. Liga Litauen','LT','1 Lyga (LTU 2)'),(118,'Kreisklasse 2 Hamburg','DE','DE 9'),(120,'B-Klasse Augsburg Südwest','DE','DE 12'),(121,'Kreisliga Plön','DE','DE 7'),(122,'NOFV Oberliga-Nord','DE','DE 5'),(123,'Bezirksliga Berlin, Staffel 1','DE','DE 8'),(124,'Hessenliga','DE','DE 5'),(125,'Bezirksliga Oberpfalz Nord','DE','DE 8'),(126,'Druha Liga','CZ','CZE 2'),(127,'B-Junioren Meisterschaft','DE','DE 1'),(128,'SHFV-Pokal','DE',NULL),(129,'1. Liga Tunesien','TN','Ligue 1'),(130,'2009 Gulf Cup of Nations','WD',NULL),(132,'WM-Qualifikation','WD',NULL),(133,'Kreisliga 8 Hamburg','DE',NULL),(134,'Hamburg-Liga','DE','DE 5'),(135,'Kreisliga Soltau-Fallingbostel','DE','DE 7'),(136,'Niedersachsenpokal','DE',NULL),(137,'Verbandsliga Berlin','DE','DE 5'),(138,'Regionalliga Nord','DE','DE 3'),(139,'1. Liga Slowakei','SK','Corgon Liga'),(140,'UEFA-Pokal','WD',NULL),(141,'Kreispokal München','DE',NULL),(142,'Bezirksliga Westfalen, Staffel 1','DE','DE 8'),(143,'1. Liga USA','US','Major League Soccer (Eastern Conference)'),(144,'DFB-Ligapokal','DE',NULL),(145,'NordWestCup','DE',NULL),(146,'Deutsche Meisterschaft A-Junioren','DE',NULL),(147,'Bezirksoberliga Schleswig-Holstein (Ost)','DE','DE 6'),(148,'Landesklasse Brandenburg Süd','DE',NULL),(149,'Bezirksliga Hamburg-Süd','DE','DE 7'),(150,'U. A. E Vice President Cup','AE',NULL),(151,'Niedersachsenliga Ost','DE','DE 5'),(152,'Kreispokal Lübeck','DE',NULL),(153,'Kreisklasse 7 Hamburg','DE',NULL),(154,'Niedersachsenliga West','DE','DE 5'),(155,'EM-Qualifikation 2008','WD',NULL),(156,'FIFA Weltmeisterschaft 2006','WD',NULL),(157,'Verbandsliga Hamburg','DE','DE 5'),(158,'3. Liga USA','US','USL Second Division'),(159,'Verbandsliga Brandenburg','DE',NULL),(160,'Pokal Tunesien','TN','Coupe de Tunisie'),(161,'CAF Champions League','WD',NULL),(163,'Bezirksoberliga Schleswig-Holstein (West)','DE','DE 6'),(164,'Africa Cup of Nations','WD',NULL),(165,'Verbandsliga Schleswig-Holstein','DE','DE 5'),(166,'Bezirksoberliga Lüneburg','DE','DE 6'),(167,'Verbandsliga Bremen','DE',NULL),(168,'1. Liga Australien (Hyundai A-League)','AU',NULL),(169,'Bezirkspokal Schleswig-Holstein','DE',NULL),(170,'Relegation zur Bezirksliga','DE',NULL),(171,'2. Liga Irland (First division)','IE','IRL 2'),(172,'U 21 EM-Qualifikation 2004/2005','WD',NULL),(173,'Oberliga Westfalen','DE',NULL),(174,'DfB-Pokal (Frauen)','DE',NULL),(175,'1. Liga Niederlande (Ehrendivisie)','NL',NULL),(176,'Kreisklasse 6 Hamburg','DE',NULL),(177,'1. Liga Tschechien (SYNOT Liga)','CZ','CZE 1'),(179,'Aufstiegsrunde zur Oberliga Nord','DE',NULL),(180,'1. Liga Irland (Eircom Premier League Division)','IE','IRL 1'),(181,'Regionalliga Ost','AT','AUT 3'),(182,'1. Liga Türkei (Süperlig)','TR','TUR 1'),(183,'1. Liga Luxemburg (National Division)','LU','LUX 1'),(184,'1. Liga Malta (Premier League)','MT','MAL 1'),(185,'Kreisliga Harburg','DE','DE 8'),(186,'Oberliga Hessen','DE','DE 5'),(187,'EM-Qualifikation 2004','WD',NULL),(188,'Regionalliga West','AT','AUT 3'),(189,'Kreispokal Harburg','DE',NULL),(190,'1. Liga Bulgarien (A grupa)','BG','BG 1');
/*!40000 ALTER TABLE `ligen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `media_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) NOT NULL,
  `ref` char(2) NOT NULL,
  `dateiname` varchar(200) NOT NULL,
  `art` char(2) NOT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,164,'tr','tr_Andrea Mandorlini.jpg','fr'),(2,165,'tr','tr_Mauricio Andrés Pellegrino.jpg','fr'),(3,113,'sr','sr_Carmine Russo.jpg','fr'),(4,117,'sr','sr_roman potemkin.jpg','fr'),(5,192,'tr','tr_Marcello Lippi.jpg','fr'),(6,271,'tr','tr_Stefan Bergmann.jpg','fr'),(7,276,'tr','tr_Mehmet Scholl.jpg','fr'),(8,244,'tr','tr_Mike Bueskens.jpg','fr'),(9,252,'vn','vn_CIMG0962.JPG','ga'),(10,652,'st','st_CIMG0965.JPG','ga'),(11,418,'vn','vn_sc pinneberg.jpg','ga'),(12,131,'vn','vn_st pauli.jpg','ga'),(13,657,'st','st_AOK-Stadion.jpg','ga'),(14,642,'st','st_Stadion-Essen.jpg','fr'),(15,256,'vn','vn_Chemnitzer-FC.jpg','fr'),(16,664,'vn','vn_Erzgebirge-Aue.jpg','fr'),(17,116,'vn','vn_Eintracht-Bamberg.jpg','fr'),(18,673,'vn','vn_Australien-team.jpg','fr'),(19,675,'vn','vn_Sydney-FC.jpg','fr'),(20,677,'vn','vn_Melbourne-Victory.jpg','fr'),(21,653,'vn','vn_Club-Brugge-KV.jpg','fr'),(22,544,'vn','vn_RSC-Anderlecht.jpg','fr'),(23,189,'vn','vn_Atletico-Mineiro.jpg','fr'),(24,760,'vn','vn_Elazigspor.jpg','fr'),(25,759,'vn','vn_Istanbulspor.jpg','fr'),(26,54,'vn','vn_Besiktas.jpg','fr'),(27,40,'vn','vn_Esbjerg-fB.jpg','fr'),(28,89,'vn','vn_Vejle-Boldklub-Kolding.jpg','fr'),(29,609,'vn','vn_AC-Horsens.jpg','fr'),(30,107,'sp','sp_René-Adler.jpg','fr'),(31,302,'tr','tr_Achim-Beierlorzer.jpg','fr'),(32,109,'tr','tr_Alexander-Zorniger.jpg','fr'),(33,484,'tr','tr_Andre-Trulsen.jpg','fr'),(34,437,'tr','tr_Andreas-Bergmann.jpg','fr'),(35,464,'tr','tr_Andreas-Reinke.jpg','fr'),(36,78,'sr','sr_Cueneyt-Cakir.jpg','fr'),(37,97,'sp','sp_97_Holger-Badstuber.jpg','fr'),(38,219,'sp','sp_219_Florian-Ballas.jpg','fr'),(39,271,'sp','sp_271_Markus-Ballmert.jpg','fr'),(40,205,'sp','sp_205_Philipp-Ziereis.jpg','fr'),(41,648,'vn','vn_648_Aegypten-team.jpg','fr'),(42,690,'vn','vn_690_Athlone-Town.jpg','fr'),(43,691,'vn','vn_691_Cobh-Ramblers.jpg','fr'),(44,748,'vn','vn_748_Shelbourne-FC.jpg','fr'),(45,692,'vn','vn_692_Irland-team.jpg','fr'),(46,557,'tr','tr_557_Wolfgang-Wolf.jpg','fr'),(47,611,'tr','tr_611_Wolfgang-Steinbach.jpg','fr'),(48,533,'tr','tr_533_Winfried-Schaefer.jpg','fr'),(49,575,'tr','tr_575_Uwe-Rapolder.jpg','fr'),(50,75,'tr','tr_75_Uwe-Neuhaus.jpg','fr'),(51,213,'tr','tr_213_Uwe-Koschinat.jpg','fr'),(52,442,'tr','tr_442_Uwe-Fuchs.jpg','fr'),(53,463,'tr','tr_463_Uwe-Erkenbrecher.jpg','fr'),(54,166,'tr','tr_166_Torsten-Lieberknecht.jpg','fr'),(55,656,'tr','tr_656_Torsten-Guetschow.jpg','fr'),(56,76,'tr','tr_76_Torsten-Froehling.jpg','fr'),(57,261,'tr','tr_261_Tomas-Oral.jpg','fr'),(58,258,'tr','tr_258_Thorsten-Fink.jpg','fr'),(60,57,'sr','sr_57_Bastian-Dankert.jpg','fr'),(61,342,'sr','sr_342_Bibiana-Steinhaus.jpg','fr'),(62,75,'sr','sr_75_Felix-Zwayer.jpg','fr'),(63,308,'sr','sr_308_Massimo-Busacca.jpg','fr'),(64,427,'sr','sr_427_Peter-Froejdfeldt.jpg','fr'),(65,62,'sr','sr_62_Jonas-Eriksson.jpg','fr'),(66,16,'sp','sp_16_Arjen-Robben.jpg','fr'),(67,530,'vn','vn_530_HSV-Barmbek-Uhlenhorst.jpg','fr'),(68,125,'sr','sr_125_Knut-Kircher.jpg','fr'),(69,393,'sp','sp_393_Stefan-Aigner.jpg','fr'),(70,210,'sp','sp_210_Enis-Alushi.jpg','fr'),(71,133,'sp','sp_133_Nadiem-Amiri.jpg','fr'),(72,265,'sp','sp_265_Fynn-Arkenberg.jpg','fr'),(73,286,'sp','sp_286_Maximilian-Arnold.jpg','fr'),(74,266,'sp','sp_266_Janik-Bachmann.jpg','fr'),(75,24,'sp','sp_24_Lionel-Messi.jpg','fr'),(76,391,'sp','sp_391_David-Abraham.jpg','fr'),(77,529,'tr','tr_529_Falko-Goetz.jpg','fr'),(78,374,'tr','tr_374_Felix-Magath.jpg','fr'),(79,395,'sr','sr_395_Dr-Markus-Merk.jpg','fr'),(80,269,'sr','sr_269_Florian-Lechner.jpg','fr'),(81,105,'sr','sr_105_Florian-Meyer.jpg','fr'),(82,657,'st','st_657_AOK-Stadion.jpg','ga'),(83,108,'sp','sp_108_Dennis-Diekmeier.jpg','fr'),(84,272,'sp','sp_272_Tim-Dierssen.jpg','fr'),(85,106,'tr','tr_106_Ewald-Lienen.jpg','fr'),(87,323,'sr','sr_323_Babak-Rafati.jpg','fr'),(88,9,'st','st_9_Allianz-Arena-Muenchen.jpg','fr'),(90,53,'vn','vn_53_Hannover-96.jpg','fr'),(91,174,'vn','vn_174_Hamburger-SV.jpg','fr'),(96,336,'sp','sp_336_472_Andre-Albers.jpg','fr'),(99,1,'sr','sr_1_842_Deniz-Aytekin.jpg','fr'),(100,23,'bg','bg_23_531_FILE1915.jpg','fr');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobil`
--

DROP TABLE IF EXISTS `mobil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mobil` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `spiel_id` int(11) NOT NULL,
  `routenpunkt1` varchar(250) CHARACTER SET utf8 NOT NULL,
  `ort_id1` int(11) DEFAULT NULL,
  `land1` char(2) CHARACTER SET utf8 DEFAULT NULL,
  `routenpunkt2` varchar(250) CHARACTER SET utf8 NOT NULL,
  `ort_id2` int(11) DEFAULT NULL,
  `land2` char(2) CHARACTER SET utf8 DEFAULT NULL,
  `entfernung_km` decimal(12,2) DEFAULT NULL,
  `verkehrsmittel` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `verkehrsmittel_zus` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `map_lnk` longtext CHARACTER SET utf8,
  PRIMARY KEY (`lfd_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobil`
--

LOCK TABLES `mobil` WRITE;
/*!40000 ALTER TABLE `mobil` DISABLE KEYS */;
INSERT INTO `mobil` VALUES (1,223,'Aurikelstieg 21',235,'DE','Heschredder 28',449,'DE',8.30,'eigener PKW',NULL,'<iframe src=\'https://www.google.com/maps/embed?pb=!1m28!1m12!1m3!1d75657.39509772179!2d9.930246746727676!3d53.6595668158173!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m13!3e6!4m5!1s0x47b228751007d4a7%3A0x5ba7641a4203ae94!2sAurikelstieg+21%2C+22850+Norderstedt!3m2!1d53.6919745!2d9.988659!4m5!1s0x47b18853fcd0593d%3A0x89168c61d3e7ad2b!2sHeschredder+28%2C+22335+Hamburg!3m2!1d53.627688899999995!2d10.020997!5e0!3m2!1sde!2sde!4v1451423668210\' width=\'100%\' height=\'100%\' frameborder=\'0\' style=\'border:0\' allowfullscreen></iframe>'),(2,407,'Aurikelstieg 21',235,'DE','Langenhorst 6',449,'DE',12.10,'PKW (Torben)',NULL,'null'),(3,407,'Langenhorst 6',449,'DE','Aurikelstieg 21',235,'DE',12.10,'PKW (Torben)',NULL,'null'),(4,225,'Aurikelstieg 21',235,'DE','Am Zainer Berg 2',1165,'DE',232.00,'eigener PKW',NULL,'null'),(5,175,'Aurikelstieg 21',235,'DE','An der Rennbahn 6',81,'DE',48.90,'eigener PKW (OPEL ASTRA G)',NULL,'null'),(6,175,'An der Rennbahn 6',81,'DE','Aurikelstieg 21',235,'DE',48.90,'eigener PKW (OPEL ASTRA G)',NULL,'null'),(7,225,'Am Zainer Berg 2',1165,'DE','Aurikelstieg 21',235,'DE',232.00,'eigener PKW',NULL,'null'),(8,225,'Am Zainer Berg 2',1165,'DE','Freisinger Landstraße (Höhe ALLIANZ Arena)',220,'DE',555.00,'Mietwagen',NULL,'null'),(9,225,'Freisinger Landstraße (Höhe ALLIANZ Arena)',220,'DE','Am Zainer Berg 2',1165,'DE',555.00,'Mietwagen',NULL,'null'),(10,438,'Wohldorfer Straße 38',449,'DE','Steilshooper Straße 210',449,'DE',2.90,'zu Fuß (mit Kinderwagen)',NULL,'null'),(11,438,'Steilshooper Straße 210',449,'DE','Wohldorfer Straße 38',449,'DE',2.90,'zu Fuß (mit Kinderwagen)',NULL,'null'),(12,462,'Aurikelstieg 21',235,'DE','Dieselstraße 6',449,'DE',15.60,'PKW (Tina)',NULL,'https://www.google.de/maps/dir/Aurikelstieg+21,+22850+Norderstedt/Dieselstra%C3%9Fe+6,+22307+Hamburg/@53.6411411,9.9447262,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x47b228751007d4a7:0x5ba7641a4203ae94!2m2!1d9.988659!2d53.6919745!1m5!1m1!1s0x47b18943de9fcfa1:0x1bcff382a1355415!2m2!1d10.0534207!2d53.5925769'),(13,462,'Dieselstraße 6',449,'DE','Aurikelstieg 21',235,'DE',15.60,'PKW (Tina)',NULL,'https://www.google.de/maps/dir/Aurikelstieg+21,+22850+Norderstedt/Dieselstra%C3%9Fe+6,+22307+Hamburg/@53.6411411,9.9447262,12z/data=!3m1!4b1!4m13!4m12!1m5!1m1!1s0x47b228751007d4a7:0x5ba7641a4203ae94!2m2!1d9.988659!2d53.6919745!1m5!1m1!1s0x47b18943de9fcfa1:0x1bcff382a1355415!2m2!1d10.0534207!2d53.5925769'),(14,468,'Aurikelstieg 21',235,'DE','Stadionstraße 10',449,'DE',19.20,'PKW (Tina)',NULL,'null'),(15,468,'Stadionstraße 10',449,'DE','Aurikelstieg 21',235,'DE',19.20,'PKW (Tina)',NULL,'null'),(16,501,'Hamburg (Dammtor)',449,'DE','München',220,'DE',782.00,'Zug',NULL,'null'),(17,501,'München (Hauptbahnhof)',220,'DE','Hamburg (Hauptbahnhof)',449,'DE',781.00,'Zug',NULL,'null'),(18,501,'Aurikelstieg 21',235,'DE','Hamburg-Dammtor',449,'DE',18.40,'eigener PKW',NULL,'null'),(19,508,'Wohldorfer Straße 38',449,'DE','Bahnhof Hamburg-Harburg',449,'DE',17.30,'eigener PKW',NULL,'null'),(20,508,'Bahnhof Hamburg-Harburg',449,'DE','Porschestadion (Berliner Ring 45)',333,'DE',213.00,'PKW (Winni Meier)',NULL,'null'),(21,508,'Porschestadion (Berliner Ring 45)',333,'DE','Bahnhof Hamburg-Harburg',449,'DE',213.00,'PKW (Winni Meier)',NULL,'null'),(22,508,'Bahnhof Hamburg-Harburg',449,'DE','Wohldorfer Straße 38',449,'DE',17.30,'eigener PKW',NULL,'null'),(23,527,'Zuhause (Aurikelstieg 21)',235,'DE','Rewirpowerstadion (Krümmede 3)',53,'DE',366.00,'Mietwagen',NULL,'null'),(24,527,'Rewirpowerstadion (Krümmede 3)',53,'DE','Zuhause (Aurikelstieg 21)',235,'DE',366.00,'Mietwagen',NULL,'null'),(25,583,'Brödermsnnsweg 60',449,'DE','Karolinenstraße 35',449,'DE',6.20,'PKW (Tina)',NULL,'null'),(26,583,'Karolinenstraße 35',449,'DE','Aurikelstieg 21',235,'DE',18.50,'PKW (Tina)',NULL,'null'),(27,584,'Aurikelstieg 21',235,'DE','Am Zainer Berg 3 (Rasthof)',1165,'DE',232.00,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(28,584,'Am Zainer Berg 3 (Rasthof)',1165,'DE','Aurikelstieg 21',235,'DE',232.00,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(29,584,'Am Zainer Berg 3 (Rasthof)',1165,'DE','Lappenweg (Kieferngarten)',220,'DE',558.00,'Mietwagen',NULL,'null'),(30,584,'Lappenweg (Kieferngarten)',220,'DE','Am Zainer Berg 3 (Rasthof)',1165,'DE',558.00,'Mietwagen',NULL,'null'),(31,612,'Zuhause (Aurikelstieg 21)',235,'DE','HERTZ Aurovermietung (Mühlenweg 145)',235,'DE',7.20,'PKW (Tina)',NULL,'null'),(32,612,'HERTZ Autovermietung (Mühlenweg 145)',235,'DE','U-Bahn Hagenbecks Tierpark (Lokstedter Grenzstraße 2)',449,'DE',20.90,'Mietwagen',NULL,'null'),(33,612,'U-Bahn Hagenbecks Tierpark (Lokstedter Grenzstraße 2)',449,'DE','AOK Stadion Wolfsburg (in den Allerwiesen 1)',333,'DE',233.00,'Mietwagen',NULL,'null'),(35,613,'VOLKSWAGEN-ARENA (In den Allerwiesen 1)',333,'DE','U-Bahn Hagenbecks Tierpark (Lokstedter Grenzstraße 2)',449,'DE',233.00,'Mietwagen',NULL,'null'),(36,613,'U-Bahn Hagenbecks Tierpark (Lokstedter Grenzstraße 2)',449,'DE','HERTZ Autovermietung (Mühlenweg 145)',235,'DE',20.90,'Mietwagen',NULL,'null'),(37,613,'HERTZ Autovermietung (Mühlenweg 145)',235,'DE','Zuhause (Aurikelstieg 21)',235,'DE',7.20,'PKW (Tina)',NULL,'null'),(38,638,'Zuhause (Aurikelstieg 145)',235,'DE','HERTZ Autovermietung (Mühlenweg 145)',235,'DE',7.20,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(39,638,'HERTZ Autovermietung (Mühlenweg 145)',235,'DE','Sportpark Höhenberg (Frankfurter Straße)',178,'DE',435.00,'Mietwagen',NULL,'null'),(40,639,'Sportpark Höhenberg (Frankfurter Straße)',178,'DE','HERTZ Autovermietung (Mühlenweg 145)',235,'DE',435.00,'Mietwagen',NULL,'null'),(41,639,'HERTZ Autovermietung (Mühlenweg 145)',235,'DE','Zuhause (Aurikelstieg 21)',235,'DE',7.20,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(42,810,'Büsum (Parkplatz bei Feuerwehr)',80,'DE','Sportplatz Reher',1200,'DE',63.00,'PKW (Tina)',NULL,'null'),(43,810,'Sportplatz Reher',80,'DE','Büsum (Parkplatz bei Feuerwehr)',80,'DE',63.00,'PKW (Tina)',NULL,'null'),(44,1010,'Aurikelstieg 21',235,'DE','Bullenredder 9',24,'DE',16.90,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(45,1010,'Bullenredder 9',24,'DE','Aurikelstieg 21',235,'DE',15.90,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(46,1011,'Aurikelstieg 21',235,'DE','Dammtor (Bahnhof-Bahnhof)',449,'DE',18.40,'eigener PKW (OPEL ASTRA H)',NULL,'null'),(47,1011,'Hamburg-Dammtor',449,'DE','München (Hauptbahnhof)',220,'DE',782.00,'Zug',NULL,'null'),(48,1011,'München (Hauptbahnhof)',220,'DE','Hamburg (Dammtor)',449,'DE',782.00,'Zug',NULL,'null'),(49,1011,'Hamburg (Dammtor-Bahnhof)',449,'DE','Aurikelstieg 21',235,'DE',18.40,'eigener PKW (OPEL ASTRA H)',NULL,'null');
/*!40000 ALTER TABLE `mobil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orte`
--

DROP TABLE IF EXISTS `orte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orte` (
  `ort_id` int(11) NOT NULL AUTO_INCREMENT,
  `ort` varchar(200) NOT NULL,
  `code` char(2) NOT NULL,
  `bundesland_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`ort_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1229 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orte`
--

LOCK TABLES `orte` WRITE;
/*!40000 ALTER TABLE `orte` DISABLE KEYS */;
INSERT INTO `orte` VALUES (1,'Alexandria','EG',NULL),(2,'Kairo','EG',NULL),(3,'Heidenheim an der Brenz','DE','BW'),(4,'Sydney','AU',NULL),(5,'Brügge','BE',NULL),(6,'Bruxelles','BE',NULL),(7,'Sarajevo','BA',NULL),(8,'Beijing','CN',NULL),(10,'Aalen','DE','BW'),(11,'Leipzig','DE','SN'),(12,'Guangzhou','CN',NULL),(13,'Aarhus','DK',NULL),(14,'Bröndby','DK',NULL),(15,'Horsens','DK',NULL),(16,'Köge','DK',NULL),(18,'Aachen','DE','NW'),(19,'Ahlen','DE','NW'),(20,'Ahrensburg','DE','SH'),(22,'Alfeld (Leine)','DE','NI'),(23,'Altenholz','DE','SH'),(24,'Ammersbek','DE','SH'),(25,'Appen','DE','SH'),(26,'Aschheim','DE','BY'),(27,'Aue','DE','SN'),(28,'Auerbach/Vogtl.','DE','SN'),(29,'Augsburg','DE','BY'),(31,'Aumühle','DE','SH'),(32,'Aurich','DE','NI'),(34,'Bad Fallingbostel','DE','NI'),(35,'Bad Kreuznach','DE','RP'),(36,'Bad Lippspringe','DE','NW'),(37,'Bad Oldesloe','DE','SH'),(38,'Bargteheide','DE','SH'),(39,'Barsbüttel','DE','SH'),(41,'Barsbüttel-Willinghusen','DE','SH'),(42,'Berlin','DE','BE'),(51,'Bielefeld','DE','NW'),(52,'Bobingen','DE','BY'),(53,'Bochum','DE','NW'),(54,'Sandhausen','DE','BW'),(55,'Bönningstedt','DE','SH'),(56,'Chemnitz','DE','SN'),(57,'Börnsen','DE','SH'),(58,'Boizenburg a. d. Elbe','DE','MV'),(59,'Bokel','DE','SH'),(60,'Bokholt-Hanredder','DE','SH'),(61,'Bonn','DE','NW'),(62,'Bordesholm','DE','SH'),(64,'Borstel-Hohenraden','DE','SH'),(65,'Bottrop','DE','NW'),(66,'Braunschweig','DE','NI'),(68,'Breitenfelde','DE','SH'),(70,'Bremen','DE','HB'),(71,'Dresden','DE','SN'),(72,'Aspach','DE','BW'),(73,'Halle (Saale)','DE','ST'),(75,'Bremerhaven','DE','HB'),(76,'Brunsbüttel','DE','SH'),(77,'Buchholz i. d. Nordheide','DE','NI'),(78,'Büdelsdorf','DE','SH'),(80,'Büsum','DE','SH'),(81,'Buxtehude','DE','NI'),(83,'Celle','DE','NI'),(85,'Cloppenburg','DE','NI'),(86,'Cottbus','DE','BB'),(88,'Crailsheim','DE','BW'),(89,'Cuxhaven','DE','NI'),(90,'Dassendorf','DE','SH'),(91,'Dormagen','DE','NW'),(92,'Dortmund','DE','NW'),(94,'Drochtersen','DE','NI'),(95,'Duisburg','DE','NW'),(98,'Düsseldorf','DE','NW'),(101,'Eching','DE','BY'),(102,'Rosengarten-Eckel','DE','NI'),(103,'Eckernförde','DE','SH'),(104,'Steinburg-Eichede','DE','SH'),(105,'Elmshorn','DE','SH'),(108,'Emden','DE','NI'),(109,'Erfurt','DE','TH'),(110,'Eschborn','DE','HE'),(111,'Escheburg','DE','SH'),(112,'Esens','DE','NI'),(113,'Falkensee','DE','BB'),(114,'Flensburg','DE','SH'),(115,'Flieden','DE','HE'),(116,'Frankfurt a. Main','DE','HE'),(120,'Freiburg i. Breisgau','DE','BW'),(121,'Friesoythe','DE','NI'),(122,'Fürth','DE','BY'),(124,'Geesthacht','DE','SH'),(128,'Gelsenkirchen','DE','NW'),(130,'Ginsheim','DE','HE'),(131,'Glinde','DE','SH'),(132,'Göttingen','DE','NI'),(134,'Grabau','DE','SH'),(135,'Grevesmühlen','DE','MV'),(136,'Groß Grönau','DE','SH'),(137,'Gütersloh','DE','NW'),(138,'Hagenow','DE','MV'),(139,'Halstenbek','DE','SH'),(140,'Hamm','DE','NW'),(141,'Hannover','DE','NI'),(146,'Hasloh','DE','SH'),(147,'Heeslingen','DE','NI'),(148,'Heide','DE','SH'),(149,'Hemdingen','DE','SH'),(150,'Henstedt-Ulzburg','DE','SH'),(151,'Herford','DE','NW'),(152,'Herne','DE','NW'),(153,'Herzlake','DE','NI'),(154,'Hoisdorf','DE','SH'),(155,'Holm','DE','SH'),(156,'Homburg/Saar','DE','SL'),(157,'Horst','DE','SH'),(158,'Husum','DE','SH'),(159,'Ingolstadt','DE','BY'),(160,'Ismaning','DE','BY'),(161,'Itzehoe','DE','SH'),(162,'Jena','DE','TH'),(163,'Jersbek','DE','SH'),(164,'Jesteburg','DE','NI'),(165,'Jevenstedt','DE','SH'),(166,'Kaiserslautern','DE','RP'),(167,'Kaltenkirchen','DE','SH'),(168,'Karlsruhe','DE','BW'),(169,'Kassel','DE','HE'),(170,'Kellinghusen','DE','SH'),(171,'Kiel','DE','SH'),(175,'Kisdorf','DE','SH'),(176,'Klein Nordende','DE','SH'),(177,'Koblenz','DE','RP'),(178,'Köln','DE','NW'),(182,'Krefeld','DE','NW'),(183,'Kropp','DE','SH'),(184,'Pewsum','DE','NI'),(185,'Kummerfeld','DE','SH'),(186,'Lägerdorf','DE','SH'),(187,'Langenhagen','DE','NI'),(188,'Langenhagen-Engelbostel','DE','NI'),(189,'Lauenburg/Elbe','DE','SH'),(190,'Leck','DE','SH'),(192,'Leverkusen','DE','NW'),(194,'Lotte','DE','NW'),(195,'Lübeck','DE','SH'),(202,'Lüneburg','DE','NI'),(204,'Magdeburg','DE','ST'),(205,'Mainz','DE','RP'),(207,'Maschen','DE','NI'),(208,'Manching','DE','BY'),(209,'Melbeck','DE','NI'),(210,'Meppen','DE','NI'),(211,'Meuselwitz','DE','TH'),(212,'Mölln','DE','SH'),(213,'Mönchengladbach','DE','NW'),(215,'Moorrege','DE','SH'),(217,'Müden (Aller)','DE','NI'),(218,'Mülheim-Kärlich','DE','RP'),(220,'München','DE','BY'),(227,'Münster','DE','NW'),(229,'Neuenkirchen','DE','NI'),(230,'Neumünster','DE','SH'),(233,'Neuruppin','DE','BB'),(234,'Niddatal-Ilbenstadt','DE','HE'),(235,'Norderstedt','DE','SH'),(245,'Nordhorn','DE','NI'),(246,'Nürnberg','DE','BY'),(247,'Oberhausen','DE','NW'),(248,'Offenbach','DE','HE'),(249,'Offenbüttel','DE','SH'),(250,'Oldenburg','DE','NI'),(251,'Osnabrück','DE','NI'),(252,'Osterode am Harz','DE','NI'),(253,'Oststeinbek','DE','SH'),(255,'Paderborn','DE','NW'),(257,'Pampow','DE','MV'),(258,'Ratekau-Pansdorf','DE','SH'),(259,'Pinneberg','DE','SH'),(262,'Plön','DE','SH'),(263,'Polz','DE','MV'),(264,'Potsdam','DE','BB'),(266,'Preetz','DE','SH'),(267,'Quickborn','DE','SH'),(270,'Rastede-Lehmden','DE','NI'),(271,'Rathenow','DE','BB'),(272,'Regensburg','DE','BY'),(274,'Reinbek','DE','SH'),(275,'Reinbek-Ohe','DE','SH'),(276,'Rellingen','DE','SH'),(279,'Rendsburg','DE','SH'),(280,'Rostock','DE','MV'),(284,'Rotenburg a. d. Wümme','DE','NI'),(285,'Rüdinghausen','DE','NW'),(286,'Saarbrücken','DE','SL'),(287,'Sande','DE','NI'),(288,'Schafflund','DE','SH'),(289,'Schenefeld','DE','SH'),(291,'Schillsdorf-Bokhorst','DE','SH'),(292,'Schmalfeld','DE','SH'),(293,'Schneverdingen','DE','NI'),(294,'Schönberg','DE','MV'),(295,'Schöneiche','DE','BB'),(296,'Schwarzenbek','DE','SH'),(297,'Schwerin','DE','MV'),(298,'Schwetzingen','DE','BW'),(299,'Sedelsberg / Saterland','DE','NI'),(300,'Seestermühe','DE','SH'),(301,'Seth','DE','SH'),(303,'Sinsheim','DE','BW'),(304,'Sittensen','DE','NI'),(305,'Soltau','DE','NI'),(306,'Stade','DE','NI'),(307,'Stapelfeld','DE','SH'),(308,'Stelle','DE','NI'),(309,'Stuhr','DE','NI'),(310,'Stuttgart','DE','BW'),(312,'Tangstedt','DE','SH'),(313,'Tewel','DE','NI'),(314,'Timmendorfer Strand','DE','SH'),(315,'Todesfelde','DE','SH'),(316,'Tremsbüttel','DE','SH'),(317,'Trittau','DE','SH'),(318,'Uetersen','DE','SH'),(319,'Unterhaching','DE','BY'),(320,'Unterschleißheim','DE','BY'),(321,'Verl','DE','NW'),(322,'Vollersode-Bornreihe','DE','NI'),(323,'Wedel','DE','SH'),(324,'Wendisch Evern','DE','NI'),(325,'Wentorf b. Hamburg','DE','SH'),(327,'Wernberg-Köblitz','DE','BY'),(328,'Westerrade','DE','SH'),(329,'Wiesbaden','DE','HE'),(330,'Wilhelmshaven','DE','NI'),(332,'Wismar','DE','MV'),(333,'Wolfsburg','DE','NI'),(336,'Worms','DE','RP'),(337,'Wuppertal','DE','NW'),(338,'Zarpen','DE','SH'),(339,'London','EN',NULL),(342,'Manchester','EN',NULL),(344,'Tallin','EE',NULL),(345,'Helsinki','FI',NULL),(346,'Bordeaux','FR',NULL),(347,'Lyon','FR',NULL),(348,'Marseille','FR',NULL),(349,'Monaco','FR',NULL),(350,'Saint-Denis','FR',NULL),(352,'Neu-Delhi','IN',NULL),(353,'Kolkata','IN',NULL),(354,'Teheran','IR',NULL),(355,'Athlone','IE',NULL),(356,'Dublin','IE',NULL),(358,'Longford','IE',NULL),(359,'Tel Aviv','IL',NULL),(360,'Arco','IT',NULL),(361,'Firenze','IT',NULL),(362,'Milano','IT',NULL),(363,'Napoli','IT',NULL),(364,'Roma','IT',NULL),(365,'Torino','IT',NULL),(367,'Venezia','IT',NULL),(368,'Tokio','JP',NULL),(369,'Toronto','CA',NULL),(370,'Al Khor','QA',NULL),(371,'Doha','QA',NULL),(372,'Kuwait City','KW',NULL),(373,'Vaduz','LI',NULL),(374,'Riga','LV',NULL),(375,'Kaunas','LT',NULL),(376,'Grevenmacher','LU',NULL),(377,'Attard','MT',NULL),(378,'Marrakesch','MA',NULL),(379,'Rabat','MA',NULL),(380,'North Shore','NZ',NULL),(381,'Amsterdam','NL',NULL),(382,'Enschede','NL',NULL),(383,'Rotterdam','NL',NULL),(384,'Sittard','NL',NULL),(385,'Zwolle','NL',NULL),(386,'Belfast','nn',NULL),(387,'Feldkirch','AT',NULL),(388,'Hard am Bodensee','AT',NULL),(389,'Wals-Siezenheim','AT',NULL),(390,'Wien','AT',NULL),(391,'Maskat','OM',NULL),(392,'Chorzow','PL',NULL),(393,'Warszawa','PL',NULL),(394,'Braga','PT',NULL),(395,'Lisboa','PT',NULL),(398,'Chimki','RU',NULL),(399,'Moskwa','RU',NULL),(401,'St. Petersburg','RU',NULL),(402,'Cluj-Napoca','RO',NULL),(403,'Bukarest','RO',NULL),(404,'Honiara','SB',NULL),(405,'Serravalle','SM',NULL),(406,'Dschiddah','SA',NULL),(407,'Spanga','SE',NULL),(408,'Basel','CH',NULL),(409,'Schaffhausen','CH',NULL),(410,'Aberdeen','SS',NULL),(411,'Beograd','CS',NULL),(412,'Maribor','SI',NULL),(413,'Bratislava','SK',NULL),(414,'Barcelona','ES',NULL),(415,'Madrid','ES',NULL),(416,'Palma de Mallorca','ES',NULL),(417,'Praha','CZ',NULL),(421,'Sokolov','CZ',NULL),(422,'Istanbul','TR',NULL),(423,'Bizerta','TN',NULL),(424,'Sfax','TN',NULL),(425,'Tunis','TN',NULL),(426,'Dnjpropetrovsk','UA',NULL),(427,'Györ','HU',NULL),(428,'East Hartford','US',NULL),(429,'East Rutherford','US',NULL),(430,'Uniondale','US',NULL),(431,'Dubai','AE',NULL),(434,'Cardiff','WW',NULL),(435,'Minsk','BY',NULL),(436,'Nikosia','CY',NULL),(449,'Hamburg','DE','HH'),(1025,'Auswahl','WD',NULL),(1038,'Icking','DE','BY'),(1040,'Valencia','ES',NULL),(1041,'Elmenhorst','DE','SH'),(1042,'Weidach','DE','BY'),(1043,'Rümpel','DE','SH'),(1044,'Garching bei  München','DE','BY'),(1045,'Passau','DE','BY'),(1046,'Rödinghausen','DE','NW'),(1047,'Porto','PT',NULL),(1048,'St. Peter-Ording','DE','SH'),(1049,'Hattstedt','DE','SH'),(1050,'Hobro','DK',NULL),(1051,'Esbjerg','DK',NULL),(1052,'Brande-Hörnerkirchen','DE','SH'),(1053,'Garbsen-Havelse','DE','NI'),(1054,'Delmenhorst','DE','NI'),(1055,'Liverpool','EN',NULL),(1056,'Lwiw','UA',NULL),(1057,'Donezk','UA',NULL),(1058,'Haderslev','DK',NULL),(1059,'Hyde','EN',NULL),(1060,'Pyrbaum (OT Seligenporten)','DE','BY'),(1061,'Venlo','NL',NULL),(1062,'Waalwijk','NL',NULL),(1063,'Todendorf','DE','SH'),(1064,'Tralau','DE','SH'),(1065,'Hvidovre','DK',NULL),(1066,'Laboe','DE','SH'),(1067,'Vejle','DK',NULL),(1068,'Gdansk','PL',NULL),(1069,'Kielce','PL',NULL),(1070,'Agios Ioannis Rentis','GR',NULL),(1071,'Athina','GR',NULL),(1072,'Tripoli','GR',NULL),(1073,'Pireas','GR',NULL),(1074,'Darmstadt','DE','HE'),(1075,'Evosmos ','GR',NULL),(1076,'Heidenau','DE','NI'),(1077,'Ta Qali','MT',NULL),(1078,'Ramat Gan','IL',NULL),(1079,'Munster','DE','NI'),(1080,'New Territories','HK',NULL),(1081,'Witten','DE','NW'),(1082,'Erlangen','DE','BY'),(1083,'Dachau','DE','BY'),(1084,'Verona','IT',NULL),(1085,'Goslar','DE','NI'),(1086,'Bardowick','DE','NI'),(1087,'Szczecin','PL',NULL),(1088,'Fahrenkrug','DE','SH'),(1089,'Memmingen','DE','BY'),(1090,'Haseldorf','DE','SH'),(1091,'Nützen','DE','SH'),(1093,'Essen','DE','NW'),(1094,'Ahlerstedt','DE','NI'),(1095,'Heimstetten','DE','BY'),(1096,'Almelo','NL',NULL),(1097,'Bamberg','DE',NULL),(1098,'Heidgraben','DE','SH'),(1099,'Almaty','KZ',NULL),(1100,'Dietmannsried','DE','BY'),(1101,'Uelzen','DE','NI'),(1102,'Plauen','DE','SN'),(1103,'Catania','IT',NULL),(1104,'Schweinfurt','DE','BY'),(1105,'Erdweg','DE','BY'),(1106,'Weiden in der Oberpfalz','DE','BY'),(1107,'Hartenholm','DE','SH'),(1108,'Reinfeld','DE','SH'),(1109,'Casablanca','MA',NULL),(1111,'Belo Horizonte','BR',NULL),(1112,'Gülzow','DE','SH'),(1113,'Strakonice','CZ',NULL),(1115,'Lippstadt','DE','NW'),(1116,'Sprockhövel','DE','NW'),(1117,'Varel','DE','NI'),(1118,'Kaufbeuren','DE','BY'),(1119,'Zagreb','HR',NULL),(1120,'Kollbach','DE','BY'),(1121,'Weddelbrook','DE','SH'),(1122,'Baryssau','BY',NULL),(1123,'Dandenong','AU',NULL),(1124,'Changsha','CN',NULL),(1125,'Melbourne','AU',NULL),(1126,'Tsu','JP',NULL),(1127,'Shijiazhuang','CN',NULL),(1128,'Hangzhou','CN',NULL),(1130,'Heiligenstedtenerkamp','DE','SH'),(1131,'Hamwarde','DE','SH'),(1132,'Würzburg','DE','BY'),(1133,'Eisenhüttenstadt','DE','BB'),(1134,'Eggstedt','DE','SH'),(1135,'Friedberg','DE','HE'),(1136,'Niederkassel','DE','NW'),(1137,'Fahrdorf','DE','SH'),(1138,'Pölitz','DE','SH'),(1139,'Usingen','DE','HE'),(1140,'Steinhorst','DE','SH'),(1141,'San Vito al Tagliamento','IT',NULL),(1142,'Fockbek','DE','SH'),(1143,'Glasgow','SS',NULL),(1144,'Zürich','CH',NULL),(1145,'Burghausen','DE','BY'),(1146,'Ahlden','DE','NI'),(1147,'Neuenhaus','DE','NI'),(1148,'Salmtal','DE','RP'),(1149,'Ellscheid','DE','RP'),(1150,'Groß Stieten','DE','MV'),(1151,'al-Wakra','QA',NULL),(1152,'Katar','QA',NULL),(1153,'Usbekistan','UZ',NULL),(1154,'Südkorea','KR',NULL),(1155,'China','CN',NULL),(1158,'Hongkong','HK',NULL),(1159,'Litauen','LT',NULL),(1160,'Untermeitingen','DE','BY'),(1161,'Schleswig','DE','SH'),(1162,'Sofia','BG',NULL),(1163,'Raisdorf','DE','SH'),(1164,'Ludwigsfelde','DE','BB'),(1165,'Seesen','DE','NI'),(1166,'Neckarelz','DE','BW'),(1167,'Aschaffenburg','DE','BY'),(1168,'Mannheim','DE','BW'),(1169,'Rötz','DE','BY'),(1170,'Oberweikertshofen','DE','BY'),(1171,'Pullach im Isartal','DE','BY'),(1172,'Mekka','SA',NULL),(1173,'V. A. E.','AE',NULL),(1174,'Saudi-Arabien','SA',NULL),(1175,'Marl','DE','NW'),(1176,'Lütjensee','DE','SH'),(1177,'Valladolid','ES',NULL),(1178,'Kuba','CU',NULL),(1179,'Bomlitz','DE','NI'),(1180,'Trnava','SK',NULL),(1181,'Foxborough','US',NULL),(1182,'Bad Bodenteich','DE','NI'),(1183,'Erndtebrück','DE','NW'),(1184,'Kronshagen','DE','SH'),(1185,'Forst','DE','BB'),(1186,'Heist','DE','SH'),(1187,'Sharjah City','AE',NULL),(1188,'Kiew','UA',NULL),(1189,'Mexiko City','MX',NULL),(1190,'Washington DC','US',NULL),(1191,'Richmond (Virginia)','US',NULL),(1192,'Harrison','US',NULL),(1193,'Velten','DE','BB'),(1194,'Sambia','ZM',NULL),(1195,'Togo','TG',NULL),(1196,'Kongo','CD',NULL),(1197,'Libyen','LY',NULL),(1199,'Auckland','NZ',NULL),(1200,'Reher','DE','SH'),(1201,'Melbourne','AU',NULL),(1202,'Cobh','IE',NULL),(1203,'Brandenburg an der Havel','DE','BB'),(1204,'Schermbeck','DE','NW'),(1205,'Klein Offenseth-Sparrieshoop','DE','SH'),(1206,'Doetinchem','NL',NULL),(1207,'Salzburg','AT',NULL),(1208,'Nairobi','KE',NULL),(1209,'Sörup','DE','SH'),(1210,'Olomouc','CZ',NULL),(1211,'Leezen','DE','SH'),(1212,'Monaco','MC',NULL),(1213,'Oldenburg in Holstein','DE','SH'),(1214,'Elazig','TR',NULL),(1215,'Luxemburg','LU',NULL),(1216,'Hamrun','MT',NULL),(1217,'Valetta','MT',NULL),(1218,'Toppenstedt','DE','NI'),(1219,'Marburg','DE','HE'),(1220,'Ankara','TR',NULL),(1221,'Seekirchen am Wallersee','AT',NULL),(1222,'Bregenz','AT',NULL),(1223,'Gifhorn','DE','NI'),(1224,'Moisburg','DE','SH'),(1225,'Seevetal','DE','NI'),(1226,'Meckelfeld','DE','NI'),(1228,'Plowdiw','BG',NULL);
/*!40000 ALTER TABLE `orte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_bez`
--

DROP TABLE IF EXISTS `pos_bez`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pos_bez` (
  `pos_id` char(2) NOT NULL,
  `pos_bez` varchar(64) NOT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_bez`
--

LOCK TABLES `pos_bez` WRITE;
/*!40000 ALTER TABLE `pos_bez` DISABLE KEYS */;
INSERT INTO `pos_bez` VALUES ('an','Angriff'),('aw','Abwehr'),('mi','Mittelfeld'),('tw','Torwart');
/*!40000 ALTER TABLE `pos_bez` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schiris`
--

DROP TABLE IF EXISTS `schiris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schiris` (
  `schiri_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(264) NOT NULL,
  `land` char(2) NOT NULL,
  `geb_datum` date DEFAULT NULL,
  `ort_id` int(11) DEFAULT NULL,
  `verein_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`schiri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schiris`
--

LOCK TABLES `schiris` WRITE;
/*!40000 ALTER TABLE `schiris` DISABLE KEYS */;
INSERT INTO `schiris` VALUES (1,'Deniz Aytekin','DE','1900-01-01',NULL,NULL),(2,'Pierluigi Collina','IT','1900-01-01',NULL,NULL),(3,'Nicola Rizzoli','IT','1900-01-01',NULL,NULL),(10,'Pedro Proenca','PT','1900-01-01',NULL,NULL),(11,'Dennis Krohn','DE','1900-01-01',274,10),(12,'Ömer Osmanoglu','TR','1900-01-01',NULL,NULL),(13,'Hasan Olgun','TR','1900-01-01',NULL,NULL),(15,'Stephan Cornehl','DE','1900-01-01',NULL,NULL),(16,'Jouri Savitchev','DE','1900-01-01',NULL,NULL),(17,'Osman Özmen','TR','1900-01-01',NULL,NULL),(18,'Marco Rinneberg','DE','1900-01-01',NULL,NULL),(20,'Alfred Kahn','DE','1900-01-01',NULL,NULL),(21,'Thorsten Kinhöfer','DE','1900-01-01',NULL,NULL),(22,'Fabian Porsch','DE','1900-01-01',NULL,NULL),(23,'Omar Amarkhel','DE','1900-01-01',NULL,NULL),(24,'Herbert Schönbeck','DE','1900-01-01',NULL,NULL),(25,'Guido Winkmann','DE','1900-01-01',NULL,NULL),(26,'Christopher Schwarzmann','DE','1900-01-01',NULL,NULL),(27,'Cetin Sevinc','DE','1900-01-01',NULL,NULL),(28,'Carlos Velasco Carballo','ES','1900-01-01',NULL,NULL),(29,'Holger Matthies','DE','1900-01-01',NULL,NULL),(30,'Markus Schmidt','DE','1900-01-01',NULL,NULL),(31,'Peter Kjaersgaard-Andersen','DK','1900-01-01',NULL,NULL),(33,'Philip Roedig','DE','1900-01-01',NULL,NULL),(34,'Kevin Rosin','DE','1900-01-01',NULL,NULL),(35,'Patrick Langer','DE','1900-01-01',NULL,NULL),(36,'Thorsten Bliesch','DE','1900-01-01',NULL,NULL),(37,'Eric Müller','DE','1900-01-01',NULL,NULL),(38,'Jorrit Friedrich Eckstein-Staben','DE','1900-01-01',NULL,NULL),(39,'Jan-Bernd Hohnhorst','DE','1900-01-01',NULL,NULL),(40,'Stephan Timm','DE','1900-01-01',NULL,NULL),(41,'Tobias Welz','DE','1977-07-11',329,NULL),(42,'Marco Kulawiak','DE','1900-01-01',NULL,NULL),(43,'Damir Skomina','SI','1900-01-01',NULL,NULL),(44,'Alberto Undiano Mallenco','ES','1973-10-09',NULL,NULL),(45,'Michael Weiner','DE','1969-03-21',NULL,NULL),(46,'Steffen Mix','DE','1900-01-01',NULL,NULL),(47,'Sven Waschitzki','DE','1900-01-01',NULL,NULL),(48,'Johannes Mayer-Lindenberg','DE','1900-01-01',NULL,NULL),(49,'Alexander Kahl','DE','1900-01-01',NULL,NULL),(50,'Christian Dingert','DE','1900-01-01',NULL,NULL),(51,'Manuel Gieseler','DE','1900-01-01',NULL,NULL),(52,'Mads-Kristoffer Kristoffersen','DK','1900-01-01',NULL,NULL),(53,'Pavel Kralovec','CZ','1900-01-01',NULL,NULL),(54,'Mervyn Smyth','EN','1900-01-01',NULL,NULL),(55,'Marcel Hass','DE','1900-01-01',NULL,NULL),(56,'Manuel Gräfe','DE','1973-09-21',NULL,NULL),(57,'Bastian Dankert','DE','1980-06-09',NULL,NULL),(58,'Rene Rohde','DE','1900-01-01',NULL,NULL),(59,'Luka Beretic','DE','1966-07-05',NULL,NULL),(60,'Marco Fritz','DE','1977-10-03',NULL,NULL),(61,'Martin van den Kerkhof','NL','1983-12-07',NULL,NULL),(62,'Jonas Eriksson','SE','1974-03-28',NULL,NULL),(63,'Winfried Brückner','DE','1900-01-01',NULL,NULL),(65,'Hartmut Strampe','DE','1966-03-03',NULL,NULL),(66,'Philipp Steiner','DE','1900-01-01',NULL,NULL),(67,'Matthias Burmeister','DE','1900-01-01',NULL,NULL),(68,'Falko Göttsche','DE','1900-01-01',NULL,NULL),(69,'Jens Maae','DK','1900-01-01',NULL,NULL),(70,'Benjamin Brand','DE','1900-01-01',NULL,NULL),(71,'Daniel Stefanski ','PL','1977-07-07',NULL,NULL),(72,'Adrian Azzopardi','MT','1900-01-01',NULL,NULL),(73,'Giorgos Foukakis','GR','1900-01-01',NULL,NULL),(74,'Marijo Strahonja','HR','1900-01-01',NULL,NULL),(75,'Felix Zwayer','DE','1981-05-19',NULL,NULL),(76,'Patrick Schwengers','DE','1900-01-01',NULL,NULL),(77,'Daniel Siebert','DE','1984-05-04',NULL,NULL),(78,'Cüneyt Cakir','TR','1976-11-23',NULL,NULL),(79,'Patrick Ittrich','DE','1979-01-03',NULL,NULL),(80,'Dirk Förster','DE','1900-01-01',NULL,108),(81,'Pascal Kinzig','DE','1990-10-28',NULL,NULL),(82,'Michael Ehrenfort','DE','1900-01-01',NULL,NULL),(83,'Benjamin Lindner','DE','1900-01-01',NULL,NULL),(84,'Stefan Bloch','DE','1900-01-01',NULL,NULL),(85,'Thomas Bauer','DE','1900-01-01',NULL,NULL),(86,'Andreas Steffens','DE','1900-01-01',NULL,NULL),(87,'Ralph Vollmers','DE','1900-01-01',NULL,NULL),(88,'Peter Gagelmann','DE','1968-06-09',NULL,NULL),(89,'Martin Höper','DE','1900-01-01',NULL,NULL),(90,'Lahcen Rast','nb','1900-01-01',NULL,NULL),(91,'Thorsten Kaisen','DE','1900-01-01',NULL,NULL),(92,'Florian Kunz','DE','1900-01-01',NULL,NULL),(93,'André Schönheit','DE','1987-09-24',202,NULL),(94,'Hartmut Gertig','DE','1900-01-01',NULL,NULL),(95,'Dennis Antamo','FI','1982-02-18',NULL,NULL),(96,'Tobias Schultes','DE','1990-10-25',NULL,NULL),(97,'Timo Bödiker','DE','1900-01-01',NULL,NULL),(98,'Christopher Haase','DE','1900-01-01',NULL,NULL),(99,'Jens Braun','DE','1964-10-15',449,41),(100,'Thore Holst','DE','1900-01-01',NULL,NULL),(102,'Patrick Wichmann','DE','1900-01-01',NULL,NULL),(104,'Lütfü Dagci','TR','1900-01-01',NULL,NULL),(105,'Florian Meyer','DE','1968-11-21',NULL,NULL),(106,'Patrick Kluge','DE','1984-05-27',NULL,NULL),(107,'Sascha Stegemann','DE','1984-12-06',NULL,NULL),(108,'Arne Aarnink','DE','1985-01-31',NULL,NULL),(110,'Sönke Müller','DE','1900-01-01',NULL,NULL),(111,'Adrian Höhns','DE','1900-01-01',NULL,NULL),(112,'Aref Babaei Mehr','IR','1900-01-01',NULL,NULL),(113,'Carmine Russo','IT','1976-09-29',NULL,NULL),(114,'David Freundlich','DE','1900-01-01',NULL,NULL),(115,'Andreas Hartl','DE','1984-12-04',NULL,NULL),(116,'n. n.','nb','1900-01-01',NULL,NULL),(117,'Roman Potemkin','DE','1990-09-11',NULL,NULL),(118,'Jan-Erik Sternke','DE','1900-01-01',NULL,NULL),(119,'Ralf Ehlert','DE','1900-01-01',NULL,NULL),(120,'Max Beyer','DE','1900-01-01',NULL,NULL),(122,'Andreas Ewen','DE','1900-01-01',NULL,NULL),(123,'Dr. Riem Hussein','DE','1980-07-26',NULL,NULL),(124,'Kurt Garling','DE','1900-01-01',NULL,NULL),(125,'Knut Kircher','DE','1969-02-02',NULL,NULL),(126,'Max Rosenthal','DE','1900-01-01',NULL,NULL),(127,'Christian Scheper','DE','1990-07-05',NULL,NULL),(128,'Kevin Mayer','DE','1900-01-01',NULL,NULL),(129,'Konrad Oldhaver','DE','1900-01-01',NULL,NULL),(130,'Thomas Piotraschke','DE','1900-01-01',NULL,NULL),(132,'Torsten Rauchhaupt','DE','1900-01-01',NULL,NULL),(133,'Ali Mahmoud','KW','1974-01-01',NULL,NULL),(134,'Sandro Ricci','IT','1974-11-19',NULL,NULL),(135,'Alireza Faghani','IR','1978-03-21',NULL,NULL),(136,'Tobias Stieler','DE','1981-07-02',449,NULL),(137,'Evran Celik','DE','1900-01-01',NULL,NULL),(138,'Antony Gautier','FR','1977-11-19',NULL,NULL),(139,'Aliyar Aghayev','AZ','1900-01-01',NULL,NULL),(140,'Paul Dühring','DE','1900-01-01',NULL,NULL),(141,'Wolfgang Labitzke','DE','1900-01-01',NULL,NULL),(142,'Carsten Moll','DE','1900-01-01',NULL,NULL),(143,'Dion Seehasse','DE','1900-01-01',NULL,NULL),(144,'Murat Yilmaz','DE','1983-05-06',NULL,NULL),(145,'Felix Schmitz','DE','1988-06-24',NULL,NULL),(146,'Thorsten Mundt','DE','1900-01-01',NULL,NULL),(147,'Martin Erhardt','DE','1900-01-01',NULL,NULL),(148,'Thomas Sander','DE','1900-01-01',NULL,NULL),(149,'Björn Kuipers','NL','1973-03-28',NULL,NULL),(150,'Dominik Jolk','DE','1989-09-29',NULL,NULL),(151,'Florian Heinze','DE','1900-01-01',NULL,NULL),(152,'Sebastian Born','DE','1900-01-01',NULL,NULL),(154,'Matthias Bastian','DE','1900-01-01',NULL,NULL),(155,'Fabian Mihaly','HU','1980-03-05',NULL,NULL),(157,'Marcel Schwarze','DE','1900-01-01',NULL,NULL),(158,'Dr. Jochen Drees','DE','1970-03-15',NULL,NULL),(159,'Erwin Jantsch','DE','1900-01-01',NULL,NULL),(161,'Mirka Derlin','DE','1984-11-25',NULL,NULL),(162,'Marco Hinze','DE','1900-01-01',NULL,NULL),(163,'Alexandro D`Andrea','nb','1900-01-01',NULL,NULL),(164,'Dennis Hohmann','DE','1900-01-01',NULL,NULL),(165,'Björn Lassen','DE','1900-01-01',NULL,NULL),(166,'Mirco Böck','DE','1900-01-01',NULL,NULL),(167,'Helge Hanekamp','DE','1900-01-01',NULL,NULL),(168,'Benjamin Reiser','DE','1900-01-01',NULL,NULL),(169,'Claus-Dieter Köhler','DE','1900-01-01',NULL,NULL),(170,'Viktor Kassai','HU','1975-09-10',NULL,NULL),(171,'Jörg Oliczewski','DE','1900-01-01',NULL,NULL),(172,'Till Kunze','DE','1900-01-01',NULL,NULL),(173,'Michael Brandt','DE','1900-01-01',NULL,NULL),(174,'Mark Clattenburg','EN','1975-05-13',NULL,NULL),(175,'Christoph Stühler','DE','1989-12-22',NULL,NULL),(176,'Robert Kempter','DE','1988-03-22',NULL,NULL),(177,'Martin Strömbergsson','SE','1977-04-01',NULL,NULL),(178,'Alexander Harkam','AT','1981-11-17',NULL,NULL),(179,'Alexander Rau','DE','1985-06-17',NULL,NULL),(180,'Jonas Weickenmeier','DE','1988-12-31',NULL,NULL),(181,'David Fila','nb','1900-01-01',NULL,NULL),(182,'Svein Oddvar Moen','NO','1979-01-22',NULL,NULL),(183,'Abilio Fernandes Araujo','PT','1900-01-01',NULL,NULL),(184,'Patrick Schult','DE','1986-02-18',NULL,NULL),(185,'Bubacar Djalo','nb','1900-01-01',NULL,NULL),(186,'Lothar Ostheimer','DE','1983-08-17',NULL,NULL),(187,'Olaf Brüning','DE','1900-01-01',NULL,NULL),(188,'Sven Schlickmann','DE','1982-08-30',NULL,NULL),(189,'Martin Thomsen','DE','1985-10-01',NULL,NULL),(190,'Birger Sebastian Stülten','DE','1900-01-01',NULL,NULL),(191,'John-David Ladiges','DE','1984-09-27',NULL,NULL),(192,'Stephan Schamuhn','DE','1973-01-19',NULL,NULL),(193,'Frederik Listner','DE','1985-10-21',NULL,NULL),(194,'Florian Pötter','DE','1993-12-04',NULL,NULL),(195,'Aleksandar Stavrev','MK','1977-03-30',NULL,NULL),(196,'Fabian Schulz','DE','1900-01-01',NULL,NULL),(197,'Dr. Uwe Strohbach','DE','1900-01-01',NULL,NULL),(198,'Helmut Glißmann','DE','1900-01-01',NULL,NULL),(199,'Asmir Osmanagic','DE','1991-10-31',NULL,NULL),(200,'Björn Stein','DE','1900-01-01',NULL,NULL),(201,'Frank Schnehagen','DE','1900-01-01',NULL,NULL),(202,'Turjalai Habib','nb','1900-01-01',NULL,NULL),(203,'Hursit Köse','TR','1900-01-01',NULL,NULL),(204,'Dominic Kintgen','DE','1900-01-01',NULL,NULL),(205,'Fan Qi','CN','1971-04-18',NULL,NULL),(206,'Tang Kun','CN','1983-06-16',NULL,NULL),(208,'Detlef Kowitz','DE','1900-01-01',NULL,NULL),(209,'Ulrich Haß','DE','1900-01-01',NULL,NULL),(211,'Sabine Stadler','DE','1979-02-06',NULL,NULL),(212,'Benjamin Cortus','DE','1981-12-13',NULL,NULL),(213,'Thomas Förster','DE','1900-01-01',NULL,NULL),(214,'Daniel Gawron','DE','1900-01-01',NULL,NULL),(216,'Mathes Ledtje','DE','1900-01-01',NULL,NULL),(217,'Marco Müller','DE','1900-01-01',NULL,NULL),(218,'Franz Bokop','DE','1990-01-28',NULL,NULL),(219,'Jassine Ouali','DE','1900-01-01',NULL,NULL),(220,'Robert Wessel','DE','1985-10-19',NULL,NULL),(221,'Stanislav Milanovic','BA','1946-08-31',NULL,NULL),(222,'Dennis Voß','DE','1900-01-01',NULL,NULL),(223,'Verena-Kordula Schultz','DE','1982-02-08',NULL,NULL),(224,'Frank Lemcke','DE','1900-01-01',NULL,NULL),(225,'Robin Schlömer','DE','1900-01-01',NULL,NULL),(226,'Peter Düßeldorf','DE','1900-01-01',NULL,NULL),(227,'Thorsten Kittendorf','DE','1900-01-01',NULL,NULL),(228,'Muringothumalil Santosh Kumar','IN','1975-05-12',NULL,NULL),(229,'Björn Gustke','DE','1900-01-01',NULL,NULL),(230,'Andreas Putz','DE','1985-01-22',NULL,NULL),(231,'Tanja Krause','DE','1900-01-01',NULL,NULL),(232,'Thomas Fehring','DE','1900-01-01',NULL,NULL),(233,'Marc Frömel','DE','1900-01-01',NULL,NULL),(234,'Olegario Benquerenca','PT','1969-10-18',NULL,NULL),(235,'Serdar Türker','TR','1900-01-01',NULL,NULL),(236,'Joachim Schlossarek','DE','1900-01-01',NULL,NULL),(237,'Dr. Benjamin Raue','DE','1900-01-01',NULL,NULL),(238,'Lars Thiemann','DE','1982-05-28',NULL,NULL),(239,'Pierantonio Perotti di Legnano','IT','1900-01-01',NULL,NULL),(240,'Tim Milinovic','DE','1900-01-01',NULL,NULL),(241,'Daniel Burmester','DE','1900-01-01',NULL,NULL),(242,'Patrick Hahn','DE','1900-01-01',NULL,NULL),(243,'Björn Krüger','DE','1986-01-01',NULL,NULL),(244,'Daniel Leyhr','DE','1988-05-10',NULL,NULL),(245,'Tobias Reichel','DE','1985-08-18',NULL,NULL),(246,'Aleksei Nikolaev','RU','1971-08-01',NULL,NULL),(247,'Stefan Stangl','DE','1987-11-27',NULL,NULL),(248,'Paul Jennerjahn','DE','1900-01-01',NULL,NULL),(249,'Aykut Kartal','TR','1900-01-01',NULL,NULL),(250,'Carsten von der Reith','DE','1900-01-01',NULL,NULL),(251,'Andreas Bandt','DE','1900-01-01',NULL,NULL),(252,'Thomas Sieg','DE','1900-01-01',NULL,NULL),(253,'Arwit Kumeth','nb','1953-11-17',NULL,NULL),(254,'Lucjan Zaranek','nb','1900-01-01',NULL,NULL),(255,'David Guttmann','DE','1900-01-01',NULL,NULL),(256,'Thomas Kruse','DE','1900-01-01',NULL,NULL),(257,'Thorsten Balsam','DE','1900-01-01',NULL,NULL),(258,'Natascha Mohr','DE','1900-01-01',NULL,NULL),(259,'Amir Amirjan','DE','1981-01-23',NULL,NULL),(260,'Marcel Unger','DE','1965-06-06',NULL,NULL),(261,'Viatcheslav Paltchikov','DE','1987-07-23',NULL,NULL),(262,'Johann Pfeifer','DE','1900-01-01',NULL,NULL),(263,'Hamid Rostamzada','nb','1974-04-16',NULL,NULL),(264,'Martin Petersen','DE','1985-02-28',NULL,NULL),(266,'Henrik Bramlage','DE','1900-01-01',NULL,NULL),(267,'Dietmar Tackmann','DE','1900-01-01',NULL,NULL),(268,'Ramazan Özen','nb','1900-01-01',NULL,NULL),(269,'Florian Lechner','DE','1981-03-03',NULL,NULL),(270,'Sandra Pansch','DE','1985-04-03',NULL,NULL),(271,'Yuichi Nishimura','JP','1972-04-17',NULL,NULL),(272,'Mai Hoang Trang','VN','1900-01-01',NULL,NULL),(273,'Serge Gumienny','BE','1972-04-14',NULL,NULL),(274,'Frederik Glowatzka','DE','1900-01-01',NULL,NULL),(275,'Isabelle Herrmann','DE','1988-07-05',NULL,NULL),(276,'Craig Thomson','SS','1972-06-20',NULL,NULL),(277,'Benjamin Buth','DE','1900-01-01',NULL,NULL),(278,'Arne Prior','DE','1900-01-01',NULL,NULL),(279,'Luca Jürgensen','DE','1900-01-01',NULL,NULL),(280,'Florian Kirsch','DE','1900-01-01',NULL,NULL),(281,'Torsten Lübke','DE','1900-01-01',NULL,NULL),(282,'Dr. Michael Mond','DE','1900-01-01',NULL,NULL),(283,'Andreas Stuck','DE','1900-01-01',NULL,NULL),(284,'Brian Averhoff','DE','1900-01-01',NULL,NULL),(285,'Nils Samoray','DE','1900-01-01',NULL,NULL),(286,'Jan Hittig','DE','1900-01-01',NULL,NULL),(287,'Robert Stölk','DE','1900-01-01',NULL,NULL),(288,'Hendrik Holsten','DE','1900-01-01',NULL,NULL),(289,'Howard Webb','EN','1971-07-14',NULL,NULL),(290,'Kevin Bock','DE','1900-01-01',NULL,NULL),(291,'Marcel Riemer','DE','1900-01-01',NULL,NULL),(292,'Christian Soltow','DE','1975-05-14',NULL,NULL),(293,'Inka Müller-Schmäh','DE','1976-04-03',NULL,NULL),(294,'Alexander Teuscher','DE','1979-05-06',NULL,NULL),(295,'Markus Sinn','DE','1979-02-02',NULL,NULL),(296,'Robert Kampka','DE','1982-02-21',NULL,NULL),(297,'Thomas Gorniak','DE','1980-07-25',NULL,NULL),(298,'Yavuz Yilmaz','nb','1900-01-01',NULL,NULL),(299,'Daniel Riehl','DE','1900-01-01',NULL,NULL),(300,'Daniel Niemeyer','DE','1900-01-01',NULL,NULL),(301,'Alexander Nehls','DE','1900-01-01',NULL,NULL),(302,'Malte Jonas','DE','1900-01-01',NULL,NULL),(303,'Henry Wagner','DE','1900-01-01',NULL,NULL),(304,'Ali Karaduman','DE','1900-01-01',NULL,NULL),(305,'Bastian Zimmermann','DE','1900-01-01',NULL,NULL),(307,'Claudio Circhetta','CH','1970-11-18',NULL,NULL),(308,'Massimo Busacca','CH','1969-02-06',NULL,NULL),(309,'Marina Wozniak','DE','1979-09-07',NULL,NULL),(310,'Sven Reinhart','DE','1900-01-01',NULL,NULL),(311,'Roman Rehfeldt','DE','1900-01-01',NULL,NULL),(312,'Christian Okun','DE','1979-06-10',NULL,NULL),(313,'Robert Schröder','DE','1900-01-01',NULL,NULL),(314,'Sebastian Hübner','DE','1900-01-01',NULL,NULL),(315,'Teufik Mujkic','nb','1900-01-01',NULL,NULL),(316,'Terje Hauge','NO','1965-10-05',NULL,NULL),(317,'Lennart Wicke','DE','1900-01-01',NULL,NULL),(318,'Bruno Brito da Rocha','DE','1988-07-18',NULL,NULL),(320,'Michael Kempter','DE','1983-01-28',NULL,NULL),(321,'Julian Löptien','DE','1900-01-01',NULL,NULL),(322,'Lars Blunck','DE','1900-01-01',NULL,NULL),(323,'Babak Rafati','DE','1970-05-28',NULL,NULL),(324,'Thomas Münch','DE','1979-04-04',NULL,NULL),(325,'Marc Richter','DE','1900-01-01',NULL,NULL),(326,'Markus Wingenbach','DE','1978-11-26',NULL,NULL),(327,'Kilian Sauerwein','DE','1900-01-01',NULL,NULL),(328,'Sonja Kuttelwascher','DE','1986-12-27',NULL,NULL),(329,'Sebastian Fritzsch','DE','1987-06-29',NULL,NULL),(330,'Martin Bärmann','DE','1983-10-13',NULL,NULL),(331,'Ralf Reinke','DE','1900-01-01',NULL,NULL),(332,'Markus Dahms','DE','1900-01-01',NULL,NULL),(333,'Stefan Appel','DE','1900-01-01',NULL,NULL),(334,'Marija Kurtes','nb','1986-10-29',NULL,NULL),(335,'Ben Haverkort','NL','1961-10-27',NULL,NULL),(336,'Kathrin Meingast','DE','1978-09-04',NULL,NULL),(337,'Sascha Thielert','DE','1981-01-25',NULL,NULL),(338,'Alex Kauter','DE','1900-01-01',NULL,NULL),(339,'Sebastian Schiller','DE','1900-01-01',NULL,NULL),(340,'Tobias Christ','DE','1976-06-26',NULL,NULL),(341,'Michael Lübke','DE','1900-01-01',NULL,NULL),(342,'Bibiana Steinhaus','DE','1979-03-24',NULL,NULL),(343,'Arno Blos','DE','1979-05-03',NULL,NULL),(344,'Sirko Ortner','DE','1900-01-01',NULL,NULL),(345,'Michael Zibull','DE','1900-01-01',NULL,NULL),(346,'Bertrand Layec','FR','1965-07-03',NULL,NULL),(349,'Andreas Schönfelder','DE','1980-09-16',NULL,NULL),(350,'Marc Szymscak','DE','1900-01-01',NULL,NULL),(351,'Sven Ehlert','DE','1900-01-01',NULL,NULL),(352,'Nicolas Pommerenke','DE','1900-01-01',NULL,NULL),(353,'Arne Jochimsen','DE','1900-01-01',NULL,NULL),(354,'Matthias Borzym','DE','1900-01-01',NULL,NULL),(355,'Norbert Grudzinski','DE','1977-05-12',NULL,NULL),(356,'Sebastian Kirsch','DE','1900-01-01',NULL,NULL),(357,'Tim Becker','DE','1900-01-01',NULL,NULL),(358,'Patrick Silvester','DE','1900-01-01',NULL,NULL),(359,'Benjamin Prösch','DE','1900-01-01',NULL,NULL),(360,'Dirk Hamerich','DE','1900-01-01',NULL,NULL),(361,'Björn Renter','DE','1900-01-01',NULL,NULL),(362,'Subrata Sarkar','IN','1962-12-06',NULL,NULL),(363,'Marcel Barrabas','DE','1900-01-01',NULL,NULL),(364,'Bernd Hanneberg','DE','1900-01-01',NULL,NULL),(365,'Lubos Michel','SK','1968-05-16',NULL,NULL),(366,'Rene Hammer','DE','1980-01-03',NULL,NULL),(368,'Oliver Schmidt','DE','1900-01-01',NULL,NULL),(369,'Monique Klauß','DE','1900-01-01',NULL,NULL),(370,'Lutz Wagner','DE','1963-05-27',NULL,NULL),(371,'Eduardo Iturralde Gonzalez','ES','1967-02-20',NULL,NULL),(372,'Yalcin Arlioglu','TR','1900-01-01',NULL,NULL),(373,'Josef Maier','DE','1962-08-13',NULL,NULL),(374,'Steven DePiero','CA','1970-01-24',NULL,NULL),(375,'Jacek Granat','PL','1966-02-22',NULL,NULL),(376,'Markus Wollenweber','DE','1990-05-23',NULL,NULL),(377,'Wolfgang Stark','DE','1969-11-20',NULL,NULL),(378,'Christian Jahnke','DE','1900-01-01',NULL,NULL),(379,'Manuel Enrique Mejuto González','ES','1965-04-16',NULL,NULL),(380,'Raphael Seiwert','DE','1982-06-20',NULL,NULL),(381,'Rene Rogalla','CH','1963-12-19',NULL,NULL),(382,'Andre Stachowiak','DE','1970-12-26',NULL,NULL),(383,'Volker Kleenlof','DE','1970-11-13',NULL,NULL),(384,'Tarek Khemiri','nb','1900-01-01',NULL,NULL),(385,'Björn Förster','DE','1981-11-02',NULL,NULL),(386,'Jurij Baskakov','RU','1964-05-10',NULL,NULL),(387,'Herbert Fandel','DE','1964-03-09',NULL,NULL),(388,'Frank de Bleeckere','BE','1966-07-01',NULL,NULL),(389,'Matthias Anklam','DE','1968-10-05',NULL,NULL),(390,'Mike Otte','DE','1973-07-12',NULL,NULL),(391,'Martina Storch-Schäfer','DE','1966-06-29',NULL,NULL),(392,'Jürgen Ruesch','DE','1900-01-01',NULL,NULL),(393,'Victor Daubner','DE','1900-01-01',NULL,NULL),(394,'Frank Behrmann','DE','1900-01-01',NULL,NULL),(395,'Dr. Markus Merk','DE','1962-03-15',NULL,NULL),(397,'Michael Frede','DE','1900-01-01',NULL,NULL),(398,'Dietmar Voss','DE','1900-01-01',NULL,NULL),(399,'Selcuk Dereli','TR','1969-06-06',NULL,NULL),(400,'Henrik Kragh','DK','1973-04-05',NULL,NULL),(401,'Normn Laws','DE','1977-10-14',NULL,NULL),(402,'Marc Seemann','DE','1973-04-20',NULL,NULL),(403,'Alex Prus','US','1964-02-06',NULL,NULL),(404,'Thomas Schmidt','DE','1900-01-01',NULL,NULL),(405,'Mike Gielow','DE','1963-08-21',NULL,NULL),(406,'Lars Althans','DE','1900-01-01',NULL,NULL),(407,'Lassina Pare','BF','1964-08-27',NULL,NULL),(408,'Mourad Daami','TN','1962-08-15',NULL,NULL),(409,'Eddy Maillet','SC','1967-10-19',NULL,NULL),(410,'Christian Schößling','DE','1973-04-26',NULL,NULL),(411,'Christian Henkel','DE','1900-01-01',NULL,NULL),(412,'Laurent Duhamel','FR','1968-10-10',NULL,NULL),(413,'Andre Neumann','DE','1983-09-17',NULL,NULL),(414,'Shamsul Maidin','SG','1966-04-16',NULL,NULL),(415,'Peter O\'Leary','NZ','1972-03-03',NULL,NULL),(416,'Torben Nesch','DE','1900-01-01',NULL,NULL),(417,'Charlie Richmond','SS','1968-05-13',NULL,NULL),(419,'Björn Hinrichs','DE','1979-04-26',NULL,NULL),(421,'Lutz Michael Fröhlich','DE','1957-10-02',NULL,NULL),(422,'Norbert Richter','DE','1900-01-01',NULL,NULL),(424,'Michael Helms','DE','1900-01-01',NULL,NULL),(425,'Kuno Fischer','DE','1900-01-01',NULL,NULL),(427,'Peter Fröjdfeldt','SE','1963-11-14',NULL,NULL),(428,'Tobias Helwig','DE','1980-07-26',NULL,NULL),(430,'Wahid Tamuni','LY','1974-05-29',NULL,NULL),(431,'Joerg Hielscher','DE','1972-04-29',NULL,NULL),(432,'Marek Preuß','DE','1982-02-23',NULL,NULL),(433,'Muharrem Demirci','nb','1982-11-27',NULL,NULL),(434,'Malte Dittrich','DE','1983-02-03',NULL,NULL),(435,'Radek Matejek','CZ','1975-02-05',NULL,NULL),(436,'Marco Schmidt','DE','1971-09-05',NULL,NULL),(437,'Rainer Bippen','DE','1976-05-31',NULL,NULL),(438,'Lars Becker','DE','1976-08-03',NULL,NULL),(439,'Jan Kohlmann','DE','1900-01-01',NULL,NULL),(440,'Stephen Bennett','EN','1961-01-17',NULL,NULL),(441,'Detlef Thomßen','DE','1965-05-14',NULL,NULL),(442,'Markus Meyer','DE','1980-09-23',NULL,NULL),(443,'Jürgen Jansen','DE','1960-10-16',NULL,NULL),(444,'Christine Frai','DE','1965-09-25',NULL,NULL),(445,'Jaroslav Jara','CZ','1964-02-21',NULL,NULL),(446,'Jan Bormann','DE','1900-01-01',NULL,NULL),(448,'Mag. Alain Hoxha','AT','1973-08-02',NULL,NULL),(449,'Roberto Rosetti','IT','1967-09-18',NULL,NULL),(450,'Jörg Schoss','DE','1966-08-14',NULL,NULL),(451,'Erol Ersoy','TR','1962-04-15',NULL,NULL),(452,'Francis Crelo','LU','1963-02-27',NULL,NULL),(453,'Oliver Schmäl','DE','1900-01-01',NULL,NULL),(454,'Kevin Oje','DE','1979-02-04',NULL,NULL),(455,'Marco Hogrefe','DE','1900-01-01',NULL,NULL),(456,'Douglas McDonald','SS','1965-10-08',NULL,NULL),(457,'Lothar Weix ','DE','1900-01-01',NULL,NULL),(458,'Dick Van Egmond','NL','1961-05-13',NULL,NULL),(459,'Thorsten Schriever','DE','1976-03-07',NULL,NULL),(460,'Peter Kohlert','DE','1900-01-01',NULL,NULL),(461,'Nikolay Jordanov','BG','1975-01-13',NULL,NULL);
/*!40000 ALTER TABLE `schiris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_begleiter_spiel_tabelle`
--

DROP TABLE IF EXISTS `sp_begleiter_spiel_tabelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_begleiter_spiel_tabelle` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `spiel_id` int(11) NOT NULL,
  `begleiter_id` int(11) NOT NULL,
  PRIMARY KEY (`lfd_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_begleiter_spiel_tabelle`
--

LOCK TABLES `sp_begleiter_spiel_tabelle` WRITE;
/*!40000 ALTER TABLE `sp_begleiter_spiel_tabelle` DISABLE KEYS */;
INSERT INTO `sp_begleiter_spiel_tabelle` VALUES (1,407,5),(2,438,6),(3,438,7),(4,468,24),(5,501,8),(6,508,19),(7,508,13),(8,508,20),(9,527,22),(10,527,25),(11,527,9),(12,527,13),(17,583,30),(18,584,28),(19,584,26),(20,584,29),(21,584,27),(22,612,15),(23,612,13),(26,612,14),(28,612,31),(29,613,31),(30,613,15),(31,613,14),(32,613,13),(33,638,13),(34,638,21),(35,638,22),(36,638,9),(37,639,13),(38,639,21),(39,639,9),(40,639,22),(41,1011,14);
/*!40000 ALTER TABLE `sp_begleiter_spiel_tabelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_besuche`
--

DROP TABLE IF EXISTS `sp_besuche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_besuche` (
  `spiel_id` int(11) NOT NULL AUTO_INCREMENT,
  `zusch_anzahl` int(11) DEFAULT NULL,
  `gaestefans` int(11) DEFAULT NULL,
  `bes_vork` mediumtext,
  `sp_bericht` longtext,
  `schiri_id` int(11) DEFAULT NULL,
  `sp_datum` date NOT NULL,
  `ort` int(11) NOT NULL,
  `land` char(2) NOT NULL,
  `liga_id` int(11) NOT NULL,
  `verein_id_h` int(11) NOT NULL,
  `verein_id_a` int(11) NOT NULL,
  `trainer_id_h` int(11) DEFAULT NULL,
  `trainer_id_a` int(11) DEFAULT NULL,
  `stadion_id` int(11) DEFAULT NULL,
  `zeit` varchar(5) NOT NULL,
  `stadion_id_alt` int(11) DEFAULT NULL,
  `ergebnis` varchar(5) NOT NULL,
  `erg_halb` varchar(5) NOT NULL,
  `erg_zusatz` char(5) DEFAULT NULL,
  `sprit` decimal(8,2) DEFAULT NULL,
  `bahn` decimal(8,2) DEFAULT NULL,
  `flieger` decimal(8,2) DEFAULT NULL,
  `uebernachtung` decimal(8,2) DEFAULT NULL,
  `verpflegung` decimal(8,2) DEFAULT NULL,
  `sonstige` decimal(8,2) DEFAULT NULL,
  `wettbewerb_zusatz` varchar(200) DEFAULT NULL,
  `erg_elfer` varchar(5) DEFAULT NULL,
  `ausverkauft` bit(1) DEFAULT b'0',
  `eintrittskarte` decimal(8,2) DEFAULT NULL,
  `nr` int(11) DEFAULT NULL,
  `handy` decimal(8,2) DEFAULT NULL,
  `taxi` decimal(8,2) DEFAULT NULL,
  `sprit_anteilig` decimal(8,2) DEFAULT NULL,
  `schiff` decimal(8,2) DEFAULT NULL,
  `souvenir` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`spiel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_besuche`
--

LOCK TABLES `sp_besuche` WRITE;
/*!40000 ALTER TABLE `sp_besuche` DISABLE KEYS */;
INSERT INTO `sp_besuche` VALUES (1,49000,51,NULL,NULL,NULL,'2015-07-18',8,'CN',19,1,2,1,2,1,'19:35',NULL,'4:1','2:0',NULL,0.00,0.00,708.00,0.00,0.00,130.00,'Testspiel',NULL,'\0',0.00,934,NULL,NULL,NULL,NULL,NULL),(2,100,0,NULL,NULL,16,'2015-07-22',449,'DE',19,3,4,4,3,2,'18:45',NULL,'2:4','1:1',NULL,2.60,0.00,0.00,0.00,2.50,0.00,'Testspiel',NULL,'\0',0.00,935,NULL,NULL,NULL,NULL,NULL),(3,25,0,NULL,NULL,15,'2015-06-23',449,'DE',19,5,6,5,6,3,'19:30',NULL,'5:1','2:0',NULL,7.10,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,933,NULL,NULL,0.00,0.00,0.00),(4,4700,1500,'BU erstmals Hamburger Pokalsieger!',NULL,11,'2015-05-25',449,'DE',16,9,8,7,8,4,'16:00',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,930,NULL,NULL,NULL,NULL,NULL),(5,100,8,'Die Alten Herren von BU verieren zum zweiten Mal in meinem Beisein das Finale um den Otto-Hacke-Pokal\nSpielzeit: 2 x 40 Minuten',NULL,13,'2015-06-14',449,'DE',18,11,12,9,10,5,'13:00',NULL,'3:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,932,NULL,NULL,NULL,NULL,NULL),(7,750,0,NULL,NULL,17,'2015-07-25',449,'DE',16,13,14,12,11,6,'12:00',NULL,'3:0','1:0',NULL,4.64,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',2.00,936,NULL,NULL,NULL,NULL,NULL),(8,50,0,NULL,NULL,18,'2015-07-26',235,'DE',20,17,16,13,14,7,'15:00',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,937,NULL,NULL,NULL,NULL,NULL),(9,70,0,NULL,NULL,20,'2015-06-05',37,'DE',21,18,19,15,16,8,'19:30',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,931,NULL,NULL,NULL,NULL,NULL),(10,75000,0,NULL,NULL,21,'2015-05-23',220,'DE',1,1,20,1,17,9,'15:30',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'',0.00,929,NULL,NULL,NULL,NULL,NULL),(11,80,0,NULL,NULL,12,'2015-05-23',1038,'DE',17,21,22,18,19,10,'11:00',NULL,'5:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,928,NULL,NULL,NULL,NULL,NULL),(12,512,50,NULL,NULL,22,'2015-05-22',90,'DE',22,23,8,20,8,11,'19:00',NULL,'6:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'\0',0.00,927,NULL,NULL,NULL,NULL,NULL),(13,95639,5000,NULL,NULL,3,'2015-05-06',414,'ES',8,24,1,21,1,12,'20:45',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale (Hinspiel)',NULL,'',0.00,925,NULL,NULL,NULL,NULL,NULL),(14,850,400,NULL,NULL,23,'2015-05-01',449,'DE',16,25,8,22,8,13,'15:00',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'\0',0.00,924,NULL,NULL,NULL,NULL,NULL),(15,20,0,NULL,NULL,24,'2015-04-26',154,'DE',23,26,27,23,24,14,'12:30',NULL,'7:0','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,923,NULL,NULL,NULL,NULL,NULL),(16,11,0,NULL,NULL,NULL,'2015-04-26',195,'DE',24,28,29,25,26,15,'10:00',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,922,NULL,NULL,NULL,NULL,NULL),(17,75000,3000,NULL,NULL,25,'2015-04-25',220,'DE',1,1,30,1,27,9,'18:30',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'',0.00,921,NULL,NULL,NULL,NULL,NULL),(18,350,0,NULL,NULL,26,'2015-04-25',1044,'DE',25,31,32,28,29,16,'14:00',NULL,'2:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,920,NULL,NULL,NULL,NULL,NULL),(19,1271,0,NULL,NULL,27,'2015-04-24',1046,'DE',26,33,34,30,31,17,'19:00',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,919,NULL,NULL,NULL,NULL,NULL),(20,50092,3000,NULL,NULL,28,'2015-04-15',1047,'PT',8,35,1,32,1,18,'20:45',NULL,'3:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Hinspiel)',NULL,'',0.00,918,NULL,NULL,NULL,NULL,NULL),(21,30,0,NULL,NULL,29,'2015-04-12',1048,'DE',27,36,37,33,34,19,'11:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,917,NULL,NULL,NULL,NULL,NULL),(22,75000,4000,NULL,NULL,30,'2015-04-11',220,'DE',1,1,38,1,35,9,'15:30',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'',0.00,916,NULL,NULL,NULL,NULL,NULL),(23,2743,50,NULL,NULL,31,'2015-04-10',1050,'DK',28,39,40,36,37,20,'18:30',NULL,'3:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,915,NULL,NULL,NULL,NULL,NULL),(24,580,30,NULL,NULL,33,'2015-04-06',449,'DE',16,8,41,8,38,21,'14:00',NULL,'2:2','2:1','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale','6:4','\0',0.00,914,NULL,NULL,NULL,NULL,NULL),(25,560,30,NULL,NULL,34,'2015-04-06',449,'DE',16,9,7,7,39,22,'11:30',NULL,'2:2','1:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale','4:3','\0',0.00,913,NULL,NULL,NULL,NULL,NULL),(27,3500,1000,NULL,NULL,36,'2015-07-31',449,'DE',22,8,44,8,40,21,'19:00',NULL,'3:0','2:0',NULL,2.94,0.00,0.00,0.00,5.42,0.00,'1. Spieltag',NULL,'',6.00,938,NULL,NULL,0.00,0.00,14.00),(28,682,70,NULL,NULL,37,'2015-08-02',1053,'DE',30,45,46,41,42,24,'14:00',NULL,'5:3','3:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',13.00,940,NULL,NULL,8.00,0.00,0.00),(29,42,0,NULL,NULL,35,'2015-08-01',1052,'DE',29,48,43,43,44,23,'19:00',NULL,'2:4','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',1.00,939,NULL,NULL,0.00,0.00,0.00),(30,206,0,NULL,NULL,38,'2015-04-02',449,'DE',22,8,47,8,45,21,'18:00',NULL,'3:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,912,NULL,NULL,NULL,NULL,NULL),(31,360,0,'Atlas verliert das erste Spiel der Saison gegen defensives und destruktives STV Voslapp durch zwei Kontergegentore',NULL,39,'2015-03-28',1054,'DE',31,49,50,46,47,26,'14:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,911,NULL,NULL,NULL,NULL,NULL),(32,270,0,NULL,NULL,40,'2015-03-15',449,'DE',22,8,51,8,49,21,'14:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,910,NULL,NULL,NULL,NULL,NULL),(33,42100,5000,NULL,NULL,21,'2015-03-14',70,'DE',1,52,1,50,1,27,'15:30',NULL,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'',0.00,909,NULL,NULL,NULL,NULL,NULL),(34,49000,8000,NULL,NULL,41,'2015-03-07',141,'DE',1,53,1,51,1,63,'15:30',17,'1:3','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'',0.00,908,NULL,NULL,0.00,0.00,0.00),(35,175,0,NULL,NULL,42,'2015-03-01',449,'DE',22,8,41,8,38,21,'14:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,907,NULL,NULL,NULL,NULL,NULL),(36,63324,1500,NULL,NULL,43,'2015-02-26',422,'TR',9,54,55,52,53,29,'19:00',NULL,'1:0','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'1/16-Finale (Rückspiel)','5:4','\0',0.00,906,NULL,NULL,NULL,NULL,NULL),(37,34187,3000,NULL,NULL,44,'2015-02-17',1056,'UA',8,56,1,54,1,30,'20:45',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1/8-Finale (Hinspiel)',NULL,'',0.00,905,NULL,NULL,NULL,NULL,NULL),(38,75000,4000,NULL,NULL,45,'2015-02-14',220,'DE',1,1,57,1,55,9,'15:30',NULL,'8:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'',0.00,904,NULL,NULL,NULL,NULL,NULL),(39,4600,500,NULL,NULL,46,'2015-08-09',235,'DE',7,8,58,8,56,31,'14:30',NULL,'0:5','0:2',NULL,0.00,0.00,0.00,0.00,15.00,0.00,'1. Runde',NULL,'\0',30.00,941,NULL,NULL,NULL,NULL,NULL),(40,15,0,NULL,NULL,NULL,'2015-01-31',235,'DE',19,59,60,NULL,NULL,32,'14:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,903,NULL,NULL,NULL,NULL,NULL),(41,30000,5000,NULL,NULL,41,'2015-01-30',333,'DE',1,61,1,57,1,33,'20:30',NULL,'4:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'',0.00,902,NULL,NULL,NULL,NULL,NULL),(42,29299,5000,NULL,NULL,47,'2015-01-23',53,'DE',19,62,1,58,1,34,'18:00',NULL,'1:5','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,901,NULL,NULL,NULL,NULL,NULL),(43,634,70,NULL,NULL,48,'2014-12-07',449,'DE',22,44,8,40,8,35,'14:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,900,NULL,NULL,NULL,NULL,NULL),(44,150,0,NULL,NULL,49,'2014-11-30',449,'DE',32,63,64,60,61,36,'10:45',NULL,'5:1','4:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,899,NULL,NULL,NULL,NULL,NULL),(45,76197,10000,NULL,NULL,50,'2014-11-29',42,'DE',1,30,1,63,1,37,'15:30',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'',0.00,898,NULL,NULL,NULL,NULL,NULL),(46,60,0,NULL,NULL,51,'2014-11-29',42,'DE',33,65,66,64,65,38,'13:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,897,NULL,NULL,NULL,NULL,NULL),(47,2609,100,NULL,NULL,52,'2014-11-28',1058,'DK',28,67,40,67,37,39,'18:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,896,NULL,NULL,NULL,NULL,NULL),(49,44510,2500,NULL,NULL,53,'2014-11-25',342,'EN',8,68,1,NULL,NULL,41,'19:45',NULL,'3:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 5. Spieltag',NULL,'\0',0.00,895,NULL,NULL,NULL,NULL,NULL),(50,1462,800,NULL,NULL,54,'2014-11-25',1059,'EN',34,69,70,69,70,42,'16:00',NULL,'6:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 5. Spieltag',NULL,'\0',0.00,894,NULL,NULL,NULL,NULL,NULL),(51,383,0,NULL,NULL,55,'2014-11-23',449,'DE',22,8,23,8,20,21,'14:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,893,NULL,NULL,NULL,NULL,NULL),(53,295,0,NULL,NULL,36,'2014-11-09',449,'DE',22,8,71,72,71,21,'14:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,892,NULL,NULL,0.00,0.00,0.00),(54,71000,5000,NULL,NULL,56,'2014-11-01',220,'DE',1,1,72,1,73,9,'18:30',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'',0.00,891,NULL,NULL,NULL,NULL,NULL),(55,75000,5000,NULL,NULL,57,'2015-08-14',220,'DE',1,1,57,1,74,9,'20:30',NULL,'5:0','1:0',NULL,52.58,0.00,0.00,0.00,4.34,73.00,'1. Spieltag',NULL,'',22.00,942,NULL,NULL,28.00,0.00,0.00),(56,30730,3000,NULL,NULL,58,'2015-08-17',71,'DE',19,73,1,75,1,43,'18:00',NULL,'1:3','0:1',NULL,0.00,0.00,59.99,0.00,13.31,0.00,'Testspiel',NULL,'',18.00,943,NULL,NULL,36.00,0.00,0.00),(57,970,5,NULL,NULL,59,'2014-11-01',220,'DE',25,74,76,76,77,44,'14:00',NULL,'3:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,890,NULL,NULL,NULL,NULL,NULL),(58,57000,5000,NULL,NULL,60,'2014-10-29',449,'DE',7,57,1,55,1,45,'20:30',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'',0.00,889,NULL,NULL,NULL,NULL,NULL),(59,6950,30,NULL,NULL,61,'2014-10-25',1061,'NL',35,77,78,78,79,46,'16:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,888,NULL,NULL,NULL,NULL,NULL),(61,70544,5000,NULL,NULL,62,'2014-10-21',364,'IT',8,79,1,80,1,47,'20:45',NULL,'1:7','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 3. Spieltag',NULL,'',0.00,887,NULL,NULL,NULL,NULL,NULL),(62,3000,0,'Elfmeterschießen Esener Jugendspieler gegen Uwe Kamps im Gladbacher Tor während der Halbzeit. Mein erster Fußballbesuch, an den ich mich erinnern kann. Ich war mit meinem Onkel Jörg und meinem Vater vor Ort und wir standen in der Kurve hinter dem Tor  (Eingangsbereich)',NULL,63,'1989-03-26',112,'DE',19,80,81,82,81,48,'15:00',NULL,'1:9','1:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,1,NULL,NULL,NULL,NULL,NULL),(66,360,120,NULL,NULL,65,'1989-08-20',449,'DE',36,83,80,NULL,NULL,50,'15:00',NULL,'6:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,2,NULL,NULL,NULL,NULL,NULL),(67,480,300,NULL,NULL,66,'2014-10-19',449,'DE',22,84,8,87,8,51,'10:45',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,886,NULL,NULL,NULL,NULL,NULL),(69,24,0,NULL,NULL,67,'2014-10-07',1063,'DE',37,85,86,88,89,52,'19:30',NULL,'4:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9.Spieltag',NULL,'\0',0.00,885,NULL,NULL,NULL,NULL,NULL),(70,100,25,NULL,NULL,48,'2014-10-05',449,'DE',22,47,8,45,8,53,'15:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,884,NULL,NULL,NULL,NULL,NULL),(71,80,0,NULL,NULL,68,'2015-09-01',171,'DE',38,87,88,90,91,166,'18:30',NULL,'3:2','0:1',NULL,0.00,0.00,0.00,0.00,3.99,0.00,'2. Runde',NULL,'\0',3.50,944,NULL,NULL,8.00,0.00,0.00),(72,1547,3,NULL,NULL,69,'2015-09-02',1067,'DK',39,89,39,92,36,167,'17:45',NULL,'0:0','0:0','nvUiE',0.00,0.00,0.00,0.00,6.93,0.00,'2. Runde','2:4','\0',10.77,945,NULL,NULL,39.06,0.00,0.00),(73,15224,1500,NULL,NULL,70,'2015-09-03',272,'DE',19,90,1,94,1,168,'18:00',NULL,'3:1','3:1',NULL,62.72,0.00,0.00,0.00,3.98,0.00,'Testspiel',NULL,'',16.90,946,NULL,NULL,39.00,0.00,0.00),(74,11170,0,NULL,NULL,71,'2015-09-11',1068,'PL',40,91,92,95,96,169,'18:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,947,NULL,NULL,NULL,NULL,NULL),(75,310,20,NULL,NULL,72,'2015-09-16',1070,'GR',34,93,70,NULL,NULL,170,'11:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,948,NULL,NULL,NULL,NULL,NULL),(76,33300,1700,NULL,NULL,28,'2015-09-16',1073,'GR',8,98,1,99,1,172,'21:45',NULL,'0:3','0:0',NULL,0.00,0.00,138.88,30.60,40.10,5.00,'Vorrunde, 1. Spieltag',NULL,'',53.50,950,NULL,NULL,0.00,0.00,17.50),(77,450,4,NULL,NULL,73,'2015-09-16',1071,'GR',41,94,95,100,101,171,'16:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,5.00,2.00,'Qualifikation (Rückspiel)',NULL,'\0',10.00,949,NULL,NULL,0.00,0.00,0.00),(78,2984,80,NULL,NULL,74,'2015-09-17',1072,'GR',9,96,99,103,102,173,'22:05',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,2.80,0.00,'Vorrunde, 1. Spieltag',NULL,'\0',25.00,951,NULL,NULL,44.80,0.00,0.00),(79,17000,1700,NULL,NULL,75,'2015-09-19',1074,'DE',1,97,1,104,1,174,'15:30',NULL,'0:3','0:1',NULL,0.00,39.00,0.00,0.00,11.86,2.65,'5. Spieltag',NULL,'',18.50,952,NULL,NULL,0.00,0.00,5.00),(80,500,400,NULL,NULL,76,'2015-10-07',314,'DE',19,100,101,105,106,175,'18:30',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,4.23,0.00,'Testspiel',NULL,'\0',10.00,953,NULL,NULL,0.00,0.00,0.00),(81,317,0,NULL,NULL,11,'2015-10-11',449,'DE',22,8,102,8,107,25,'14:00',NULL,'8:0','4:0',NULL,0.00,0.00,0.00,0.00,3.50,0.00,'10. Spieltag',NULL,'\0',6.00,954,NULL,NULL,0.00,0.00,0.00),(82,42100,5000,NULL,NULL,50,'2015-10-17',70,'DE',1,52,1,50,1,27,'15:30',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,12.00,0.00,'9.Spieltag',NULL,'',41.00,955,NULL,NULL,10.00,0.00,0.00),(83,59824,3000,NULL,NULL,78,'2015-10-20',339,'EN',8,103,1,108,1,206,'19:45',NULL,'2:0','0:0',NULL,1.02,33.71,89.85,0.00,45.27,0.00,'Vorrunde, 3. Spieltag',NULL,'',89.00,956,NULL,NULL,0.00,0.00,0.00),(84,75000,5000,NULL,NULL,57,'2015-11-07',220,'DE',1,1,104,1,109,9,'15:30',NULL,'4:0','4:0',NULL,4.54,57.00,0.00,0.00,24.22,5.47,'12. Spieltag',NULL,'',11.70,957,0.00,0.00,0.00,0.00,0.00),(85,416,0,NULL,NULL,34,'2015-11-08',449,'DE',22,8,9,8,7,25,'14:00',NULL,'3:0','3:0',NULL,3.78,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,958,NULL,NULL,0.00,0.00,0.00),(86,100,0,NULL,NULL,79,'2015-11-12',449,'DE',42,57,105,74,110,647,'15:00',NULL,'5:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel (nicht öffentlich)',NULL,'\0',0.00,959,NULL,NULL,0.00,0.00,0.00),(87,50,0,NULL,NULL,80,'2014-10-05',253,'DE',43,106,107,112,113,648,'12:30',NULL,'0:6','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,883,NULL,NULL,0.00,0.00,0.00),(88,71000,3000,NULL,NULL,77,'2014-10-04',220,'DE',2,1,53,1,51,9,'15:30',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,882,NULL,NULL,0.00,0.00,0.00),(89,200,0,NULL,NULL,81,'2014-10-04',1095,'DE',44,70,109,70,114,644,'13:00',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,881,NULL,NULL,0.00,0.00,0.00),(90,150,0,NULL,NULL,66,'2014-10-03',235,'DE',45,111,110,116,115,285,'19:30',NULL,'3:0','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,880,NULL,NULL,0.00,0.00,0.00),(91,289,30,NULL,NULL,82,'2014-09-21',449,'DE',22,8,112,8,117,21,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,879,NULL,NULL,0.00,0.00,0.00),(92,160,0,NULL,NULL,83,'2014-09-20',1094,'DE',47,113,114,118,119,643,'19:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,878,NULL,NULL,0.00,0.00,0.00),(93,57000,6000,NULL,NULL,50,'2014-09-20',449,'DE',1,57,1,55,1,45,'15:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'',0.00,877,NULL,NULL,0.00,0.00,0.00),(94,68000,2000,NULL,NULL,44,'2014-09-17',220,'DE',8,1,68,1,NULL,9,'20:45',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 1. Spieltag',NULL,'',0.00,876,NULL,NULL,0.00,0.00,0.00),(95,71000,4000,NULL,NULL,21,'2014-09-13',220,'DE',1,1,104,1,121,9,'15:30',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'',0.00,875,NULL,NULL,0.00,0.00,0.00),(96,706,5,NULL,NULL,84,'2014-09-12',220,'DE',25,115,116,122,123,44,'19:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,874,NULL,NULL,0.00,0.00,0.00),(97,260,0,NULL,NULL,11,'2014-09-07',449,'DE',22,8,117,8,124,21,'14:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,873,NULL,NULL,0.00,0.00,0.00),(98,120,50,NULL,NULL,85,'2014-08-31',449,'DE',22,41,8,125,8,230,'14:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,872,NULL,NULL,0.00,0.00,0.00),(99,61000,6000,NULL,NULL,60,'2014-08-30',128,'DE',1,118,1,126,1,338,'18:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'',0.00,871,NULL,NULL,0.00,0.00,0.00),(100,11077,3000,NULL,NULL,86,'2014-08-30',1093,'DE',26,119,120,127,128,642,'14:00',NULL,'4:4','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,870,NULL,NULL,0.00,0.00,0.00),(101,393,0,NULL,NULL,87,'2014-08-24',449,'DE',22,8,121,NULL,NULL,21,'14:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,869,NULL,NULL,0.00,0.00,0.00),(103,42000,15000,NULL,NULL,88,'2014-07-27',449,'DE',48,61,1,57,1,45,'18:15',NULL,'0:3','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,868,NULL,NULL,0.00,0.00,0.00),(104,50,0,NULL,NULL,89,'2014-07-27',449,'DE',16,122,123,130,131,384,'16:00',NULL,'2:6','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,867,NULL,NULL,0.00,0.00,0.00),(105,60,0,NULL,NULL,90,'2014-07-27',124,'DE',16,124,125,132,133,641,'13:00',NULL,'1:5','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,866,NULL,NULL,0.00,0.00,0.00),(106,30,0,NULL,NULL,91,'2014-07-27',449,'DE',16,126,127,135,134,481,'10:30',NULL,'0:9','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,865,NULL,NULL,0.00,0.00,0.00),(107,50000,15000,NULL,NULL,88,'2014-07-26',449,'DE',48,1,81,1,136,45,'18:15',NULL,'2:2','2:0','i. E.',0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale','5:4','\0',0.00,864,NULL,NULL,0.00,0.00,0.00),(108,70,0,NULL,NULL,92,'2014-07-26',1091,'DE',49,128,129,137,138,640,'18:00',NULL,'1:10','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,863,NULL,NULL,0.00,0.00,0.00),(109,812,100,NULL,NULL,93,'2014-07-26',114,'DE',30,130,131,139,140,639,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,862,NULL,NULL,0.00,0.00,0.00),(110,60,0,NULL,NULL,94,'2014-07-25',1090,'DE',16,132,133,141,142,638,'19:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,861,NULL,NULL,0.00,0.00,0.00),(111,5522,30,NULL,NULL,95,'2014-07-24',1051,'DK',9,40,135,37,143,637,'19:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Qualifikation 2. Runde (Rückspiel)',NULL,'\0',0.00,860,NULL,NULL,0.00,0.00,0.00),(112,11150,11150,NULL,NULL,96,'2014-07-18',1089,'DE',19,136,1,144,1,636,'18:00',NULL,'0:3','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,859,NULL,NULL,0.00,0.00,0.00),(113,41,2,NULL,NULL,97,'2014-06-29',1088,'DE',19,137,16,145,14,635,'14:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,858,NULL,NULL,0.00,0.00,0.00),(115,2230,2000,'Spielbesuch mit Maja',NULL,98,'2014-06-22',267,'DE',19,138,101,146,147,131,'16:00',NULL,'1:16','0:11',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,857,NULL,NULL,0.00,0.00,0.00),(116,4317,1000,NULL,NULL,99,'2014-05-29',449,'DE',16,84,9,87,7,4,'16:00',NULL,'0:0','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Finale','3:2','\0',0.00,856,NULL,NULL,0.00,0.00,0.00),(117,300,0,NULL,NULL,100,'2014-05-29',449,'DE',50,140,139,148,149,5,'11:00',NULL,'2:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,855,NULL,NULL,0.00,0.00,0.00),(118,11248,100,NULL,NULL,71,'2014-05-28',1087,'PL',40,141,142,150,151,634,'20:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'36. Spieltag (Playoffs)',NULL,'\0',0.00,854,NULL,NULL,0.00,0.00,0.00),(119,130,0,'Das Stadion in Bardowick dient dem Lüneburger SK Hansa als Heimstätte für die Partien in der Regionalliga Nord, da das Stadion am Wilschenbruch abgerissen wurde.',NULL,102,'2014-05-25',1086,'DE',47,143,144,152,153,633,'15:00',NULL,'4:3','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,853,NULL,NULL,0.00,0.00,0.00),(120,20,3,NULL,NULL,NULL,'2014-05-18',449,'DE',52,145,146,NULL,NULL,632,'10:45',NULL,'6:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,852,NULL,NULL,0.00,0.00,0.00),(121,76197,20000,NULL,NULL,105,'2015-05-17',42,'DE',7,72,1,73,1,37,'20:00',NULL,'0:2','0:0','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,926,NULL,NULL,0.00,0.00,0.00),(122,76197,20000,NULL,NULL,105,'2014-05-17',42,'DE',7,72,1,73,1,37,'20:00',NULL,'0:2','0:0','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,851,NULL,NULL,0.00,0.00,0.00),(123,222,5,NULL,NULL,106,'2014-05-17',42,'DE',53,147,148,155,156,631,'13:30',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,850,NULL,NULL,0.00,0.00,0.00),(124,4500,1500,NULL,NULL,107,'2014-05-17',42,'DE',55,149,150,157,158,629,'11:00',NULL,'0:0','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Finale','7:6','\0',0.00,849,NULL,NULL,0.00,0.00,0.00),(125,800,200,NULL,NULL,108,'2014-05-16',1085,'DE',30,151,152,159,50,628,'18:00',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'\0',0.00,848,NULL,NULL,0.00,0.00,0.00),(126,80,6,NULL,NULL,42,'2014-05-13',105,'DE',22,112,8,160,8,84,'19:30',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,847,NULL,NULL,0.00,0.00,0.00),(127,270,30,NULL,NULL,110,'2014-05-06',449,'DE',30,83,152,161,50,72,'16:00',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,846,NULL,NULL,0.00,0.00,0.00),(128,183,0,NULL,NULL,111,'2014-05-04',449,'DE',22,8,153,8,162,21,'14:00',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,845,NULL,NULL,0.00,0.00,0.00),(129,7,0,NULL,NULL,112,'2014-05-04',235,'DE',56,154,156,154,154,630,'10:45',NULL,'4:3','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,844,NULL,NULL,0.00,0.00,0.00),(130,57000,6000,NULL,NULL,60,'2014-05-03',449,'DE',1,57,1,163,1,45,'15:30',NULL,'1:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,843,NULL,NULL,0.00,0.00,0.00),(131,19856,30,NULL,NULL,113,'2014-04-27',1084,'IT',57,157,158,164,165,627,'12:30',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'35. Spieltag',NULL,'\0',0.00,842,NULL,NULL,0.00,0.00,0.00),(132,23325,2500,NULL,NULL,77,'2014-04-19',66,'DE',1,159,1,166,1,129,'15:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'',0.00,841,NULL,NULL,0.00,0.00,0.00),(133,53,20,NULL,NULL,114,'2014-04-13',449,'DE',58,160,16,167,14,320,'11:30',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,840,NULL,NULL,0.00,0.00,0.00),(134,71000,6000,NULL,NULL,75,'2014-04-12',220,'DE',1,1,72,1,73,9,'18:30',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'',0.00,839,NULL,NULL,0.00,0.00,0.00),(135,1251,80,NULL,NULL,115,'2014-04-12',220,'DE',25,115,161,122,168,44,'14:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,838,NULL,NULL,0.00,0.00,0.00),(136,50,0,NULL,NULL,116,'2014-04-12',1083,'DE',59,162,163,154,154,626,'11:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,837,NULL,NULL,0.00,0.00,0.00),(137,200,0,NULL,NULL,117,'2014-04-11',1082,'DE',60,164,165,144,170,625,'19:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,836,NULL,NULL,0.00,0.00,0.00),(138,75199,3700,NULL,NULL,28,'2014-04-01',342,'EN',8,167,1,171,1,92,'19:45',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Hinspiel)',NULL,'\0',0.00,835,NULL,NULL,0.00,0.00,0.00),(139,76197,20000,NULL,NULL,60,'2014-03-25',42,'DE',1,30,1,63,1,37,'20:00',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'',0.00,834,NULL,NULL,0.00,0.00,0.00),(140,160,50,NULL,NULL,118,'2014-03-23',449,'DE',22,168,8,173,1,520,'15:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,833,NULL,NULL,0.00,0.00,0.00),(141,70,0,NULL,NULL,119,'2014-03-15',175,'DE',61,169,170,174,175,624,'16:00',NULL,'3:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,832,NULL,NULL,0.00,0.00,0.00),(142,100,0,NULL,NULL,120,'2014-03-15',449,'DE',58,16,171,14,176,21,'13:30',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,831,NULL,NULL,0.00,0.00,0.00),(143,30000,10000,NULL,NULL,41,'2014-03-08',333,'DE',1,61,1,57,1,33,'15:30',NULL,'1:6','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'',0.00,830,NULL,NULL,0.00,0.00,0.00),(144,15,0,NULL,NULL,122,'2014-02-27',301,'DE',19,172,173,177,178,623,'19:30',NULL,'4:1','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,829,NULL,NULL,0.00,0.00,0.00),(145,196,25,NULL,NULL,123,'2014-02-26',449,'DE',30,131,174,140,179,4,'19:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,828,NULL,NULL,0.00,0.00,0.00),(146,75,0,NULL,NULL,124,'2014-02-25',292,'DE',61,175,169,181,174,622,'20:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,827,NULL,NULL,0.00,0.00,0.00),(147,49000,8000,NULL,NULL,125,'2014-02-23',141,'DE',1,53,1,51,1,63,'17:30',17,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'',0.00,826,0.00,0.00,0.00,0.00,0.00),(148,823,30,NULL,NULL,87,'2014-02-23',449,'DE',22,44,8,40,8,35,'14:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,825,NULL,NULL,0.00,0.00,0.00),(149,12,0,NULL,NULL,126,'2014-02-20',195,'DE',19,176,177,182,183,621,'19:15',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,824,NULL,NULL,0.00,0.00,0.00),(150,59911,3000,NULL,NULL,3,'2014-02-19',339,'EN',8,103,1,108,1,206,'19:45',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,823,NULL,NULL,0.00,0.00,0.00),(151,406,20,NULL,NULL,127,'2014-02-18',66,'DE',30,178,152,184,50,620,'19:30',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,822,NULL,NULL,0.00,0.00,0.00),(152,27,0,NULL,NULL,128,'2014-02-13',171,'DE',19,179,180,185,186,619,'19:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,821,NULL,NULL,0.00,0.00,0.00),(153,57000,8000,NULL,NULL,75,'2014-02-12',449,'DE',7,57,1,187,1,45,'20:30',NULL,'0:5','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale',NULL,'',0.00,820,NULL,NULL,0.00,0.00,0.00),(154,36,0,NULL,NULL,NULL,'2014-02-08',449,'DE',19,8,181,8,188,509,'14:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,819,NULL,NULL,0.00,0.00,0.00),(155,21,0,NULL,NULL,100,'2014-02-04',449,'DE',19,8,51,8,49,370,'19:30',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,818,NULL,NULL,0.00,0.00,0.00),(156,16,0,NULL,NULL,130,'2014-01-26',267,'DE',19,183,182,154,154,618,'13:30',NULL,'4:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,817,NULL,NULL,0.00,0.00,0.00),(157,8,0,NULL,NULL,132,'2014-01-26',235,'DE',19,184,185,154,154,581,'11:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,816,NULL,NULL,0.00,0.00,0.00),(158,16000,26,NULL,NULL,133,'2014-01-13',372,'KW',19,186,1,190,1,617,'18:00',NULL,'0:8','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,815,NULL,NULL,0.00,0.00,0.00),(159,37774,2000,NULL,NULL,134,'2013-12-21',378,'MA',62,1,187,1,191,616,'20:30',NULL,'2:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,814,NULL,NULL,0.00,0.00,0.00),(160,35219,4000,NULL,NULL,135,'2013-12-21',378,'MA',62,188,189,192,193,616,'17:30',NULL,'2:3','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Spiel um Platz 3',NULL,'\0',0.00,813,NULL,NULL,0.00,0.00,0.00),(161,71000,7000,NULL,NULL,41,'2013-12-14',220,'DE',1,1,57,1,187,9,'15:30',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'',0.00,812,NULL,NULL,0.00,0.00,0.00),(162,42100,6000,NULL,NULL,60,'2013-12-07',70,'DE',1,52,1,194,1,27,'15:30',NULL,'0:7','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'',0.00,811,NULL,NULL,0.00,0.00,0.00),(163,71000,4000,NULL,NULL,136,'2013-11-30',220,'DE',1,1,159,1,166,9,'15:30',NULL,'2:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'',0.00,810,NULL,NULL,0.00,0.00,0.00),(164,30,0,NULL,NULL,137,'2013-11-29',449,'DE',63,190,191,197,196,615,'19:30',NULL,'3:5','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,809,NULL,NULL,0.00,0.00,0.00),(165,14000,800,NULL,NULL,138,'2013-11-27',398,'RU',8,192,1,198,1,614,'18:00',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 5. Spieltag',NULL,'\0',0.00,808,NULL,NULL,0.00,0.00,0.00),(166,700,50,NULL,NULL,139,'2013-11-27',399,'RU',34,193,70,200,70,613,'10:00',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 5. Spieltag',NULL,'\0',0.00,807,NULL,NULL,0.00,0.00,0.00),(167,130,0,NULL,NULL,116,'2013-11-23',417,'CZ',64,194,195,201,154,612,'13:30',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,806,NULL,NULL,0.00,0.00,0.00),(168,222,20,NULL,NULL,140,'2013-10-27',449,'DE',22,8,121,8,129,21,'14:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,805,NULL,NULL,0.00,0.00,0.00),(169,71000,2000,NULL,NULL,21,'2013-10-19',220,'DE',1,1,20,1,202,9,'15:30',NULL,'4:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'',0.00,804,NULL,NULL,0.00,0.00,0.00),(170,5,0,NULL,NULL,141,'2013-10-19',220,'DE',65,196,197,203,204,611,'12:45',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,803,NULL,NULL,0.00,0.00,0.00),(171,107,20,NULL,NULL,142,'2013-10-18',235,'DE',66,198,199,206,207,610,'19:30',NULL,'1:5','1:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,802,NULL,NULL,0.00,0.00,0.00),(172,40,0,NULL,NULL,143,'2013-10-06',449,'DE',32,200,201,208,209,649,'16:45',NULL,'7:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,801,NULL,NULL,0.00,0.00,0.00),(173,245,0,NULL,NULL,144,'2013-10-06',449,'DE',22,8,202,8,210,21,'14:00',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,800,NULL,NULL,0.00,0.00,0.00),(174,30210,3000,NULL,NULL,125,'2013-10-05',192,'DE',1,203,1,211,1,67,'18:30',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'',0.00,799,NULL,NULL,0.00,0.00,0.00),(175,100,30,NULL,NULL,42,'2015-11-29',81,'DE',22,51,8,212,8,650,'14:00',NULL,'1:1','0:0',NULL,12.34,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,960,0.00,0.00,0.00,0.00,0.00),(178,1743,15,NULL,NULL,145,'2013-10-05',178,'DE',26,204,34,213,214,609,'14:00',NULL,'1:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,798,NULL,NULL,0.00,0.00,0.00),(179,80,10,NULL,NULL,146,'2013-10-04',449,'DE',32,205,206,215,216,608,'19:00',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,797,NULL,NULL,0.00,0.00,0.00),(180,275,10,NULL,NULL,147,'2013-10-03',259,'DE',16,207,208,217,218,607,'15:00',NULL,'2:2','0:1','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde','7:8','\0',0.00,796,NULL,NULL,0.00,0.00,0.00),(181,96,0,NULL,NULL,NULL,'2013-10-03',291,'DE',67,209,210,219,220,606,'12:00',NULL,'0:6','0:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,795,NULL,NULL,0.00,0.00,0.00),(182,45021,2500,NULL,NULL,149,'2013-10-02',342,'EN',8,68,1,68,1,41,'19:45',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 2. Spieltag',NULL,'\0',0.00,794,NULL,NULL,0.00,0.00,0.00),(183,380,50,NULL,NULL,55,'2013-09-29',77,'DE',22,211,8,221,72,232,'15:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,793,NULL,NULL,0.00,0.00,0.00),(184,61973,6000,NULL,NULL,56,'2013-09-21',128,'DE',1,118,1,126,1,338,'18:30',NULL,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'',0.00,792,NULL,NULL,0.00,0.00,0.00),(185,450,80,NULL,NULL,150,'2013-09-21',65,'DE',26,214,215,223,224,605,'14:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,791,NULL,NULL,0.00,0.00,0.00),(186,40,0,NULL,NULL,151,'2013-09-20',111,'DE',63,216,217,225,226,604,'19:30',NULL,'2:3','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,790,NULL,NULL,0.00,0.00,0.00),(187,200,40,NULL,NULL,152,'2013-09-01',449,'DE',22,41,8,227,8,230,'15:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,789,NULL,NULL,0.00,0.00,0.00),(188,17686,6000,NULL,NULL,62,'2013-08-30',417,'CZ',68,1,218,1,228,603,'20:45',NULL,'2:2','0:1','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Finale','5:4','',0.00,788,NULL,NULL,0.00,0.00,0.00),(189,810,400,NULL,NULL,154,'2013-08-25',449,'DE',22,8,44,8,40,21,'14:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,787,NULL,NULL,0.00,0.00,0.00),(190,16000,400,NULL,NULL,155,'2013-08-11',427,'HU',19,219,1,230,1,602,'16:00',NULL,'1:4','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,786,NULL,NULL,0.00,0.00,0.00),(191,200,30,NULL,NULL,129,'2013-08-06',235,'DE',16,111,8,116,8,285,'18:30',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,785,NULL,NULL,0.00,0.00,0.00),(192,650,70,NULL,NULL,157,'2013-08-02',253,'DE',22,220,8,231,8,648,'19:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,784,NULL,NULL,0.00,0.00,0.00),(193,80,2,NULL,NULL,93,'2013-08-02',81,'DE',19,174,221,179,232,601,'14:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,783,NULL,NULL,0.00,0.00,0.00),(194,80645,8000,NULL,NULL,158,'2013-07-27',92,'DE',12,72,1,73,1,55,'20:30',NULL,'4:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,782,NULL,NULL,0.00,0.00,0.00),(195,13,0,NULL,NULL,159,'2013-07-27',1081,'DE',19,222,223,233,154,600,'17:00',NULL,'4:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,781,NULL,NULL,0.00,0.00,0.00),(196,2598,1000,NULL,NULL,47,'2013-07-27',53,'DE',26,224,225,234,235,599,'14:00',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,780,NULL,NULL,0.00,0.00,0.00),(197,200,9,NULL,NULL,161,'2013-07-14',134,'DE',19,226,8,236,8,598,'15:00',NULL,'4:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,779,NULL,NULL,0.00,0.00,0.00),(198,90,0,NULL,NULL,162,'2013-07-14',138,'DE',19,227,228,237,238,597,'11:00',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,778,NULL,NULL,0.00,0.00,0.00),(199,40,0,NULL,NULL,163,'2013-07-13',330,'DE',19,229,230,154,239,596,'17:00',NULL,'2:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,777,NULL,NULL,0.00,0.00,0.00),(200,20,0,NULL,NULL,164,'2013-07-13',287,'DE',19,232,80,242,241,595,'15:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,776,NULL,NULL,0.00,0.00,0.00),(201,50,0,NULL,NULL,165,'2013-07-12',449,'DE',19,8,233,72,8,509,'15:00',NULL,'4:2','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,775,NULL,NULL,0.00,0.00,0.00),(202,60,10,NULL,NULL,166,'2013-07-07',20,'DE',19,234,16,145,14,594,'17:00',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,774,NULL,NULL,0.00,0.00,0.00),(203,1500,800,NULL,NULL,167,'2013-06-25',112,'DE',19,80,235,241,244,48,'18:30',NULL,'0:7','0:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,773,NULL,NULL,0.00,0.00,0.00),(204,47,0,NULL,NULL,168,'2013-06-16',449,'DE',19,236,9,245,7,187,'14:00',NULL,'3:8','2:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,772,NULL,NULL,0.00,0.00,0.00),(205,86298,25000,NULL,NULL,3,'2013-05-25',339,'EN',8,72,1,73,246,417,'19:45',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,771,NULL,NULL,0.00,0.00,0.00),(206,71000,4000,NULL,NULL,60,'2013-05-11',220,'DE',1,1,237,246,247,9,'15:30',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,770,NULL,NULL,0.00,0.00,0.00),(207,200,0,NULL,NULL,85,'2013-05-09',449,'DE',22,8,168,8,248,21,'14:00',NULL,'2:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,769,NULL,NULL,0.00,0.00,0.00),(208,295,100,NULL,NULL,140,'2013-05-07',449,'DE',22,8,44,8,40,21,'19:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,768,NULL,NULL,0.00,0.00,0.00),(209,65,10,NULL,NULL,169,'2013-05-02',259,'DE',69,110,16,115,14,101,'18:15',NULL,'1:1','1:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale','3:4','\0',0.00,767,NULL,NULL,0.00,0.00,0.00),(210,6075,2500,NULL,NULL,107,'2013-04-27',116,'DE',2,238,73,249,250,593,'13:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,766,NULL,NULL,0.00,0.00,0.00),(211,68000,3400,NULL,NULL,170,'2013-04-23',220,'DE',8,1,24,246,251,9,'20:45',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale (Hinspiel)',NULL,'',0.00,765,NULL,NULL,0.00,0.00,0.00),(212,180,0,NULL,NULL,157,'2013-04-21',449,'DE',22,8,47,8,252,21,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,764,NULL,NULL,0.00,0.00,0.00),(213,220,100,NULL,NULL,36,'2013-04-16',449,'DE',22,84,8,87,8,51,'19:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,763,NULL,NULL,0.00,0.00,0.00),(214,71000,5000,NULL,NULL,45,'2013-04-13',220,'DE',1,1,239,NULL,253,9,'15:30',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'',0.00,762,NULL,NULL,0.00,0.00,0.00),(215,30,0,NULL,NULL,171,'2013-04-07',449,'DE',70,240,241,154,254,592,'11:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,761,NULL,NULL,0.00,0.00,0.00),(217,25,0,NULL,NULL,172,'2013-04-06',449,'DE',71,242,243,255,256,190,'18:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,759,NULL,NULL,0.00,0.00,0.00),(218,20,0,NULL,NULL,173,'2013-04-06',105,'DE',29,244,245,154,154,591,'19:30',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,760,NULL,NULL,0.00,0.00,0.00),(219,68000,3400,NULL,NULL,174,'2013-04-02',220,'DE',8,1,246,246,257,9,'20:45',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Hinspiel)',NULL,'',0.00,758,NULL,NULL,0.00,0.00,0.00),(220,71000,7100,NULL,NULL,25,'2013-03-30',220,'DE',1,1,57,246,258,9,'18:30',NULL,'9:2','5:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'',0.00,757,NULL,NULL,0.00,0.00,0.00),(221,60,0,NULL,NULL,175,'2013-03-30',208,'DE',72,247,248,259,260,590,'15:00',NULL,'3:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,756,NULL,NULL,0.00,0.00,0.00),(222,5546,800,NULL,NULL,176,'2013-03-30',159,'DE',2,249,250,261,262,589,'13:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,755,NULL,NULL,0.00,0.00,0.00),(223,19681,4000,NULL,NULL,177,'2015-12-09',1119,'HR',8,252,1,263,1,652,'20:45',NULL,'0:2','0:0',NULL,0.00,0.00,264.89,37.05,28.14,38.96,'Vorrunde, 6. Spieltag',NULL,'\0',44.71,962,NULL,NULL,0.00,0.00,8.36),(224,2060,150,NULL,NULL,178,'2015-12-09',1119,'HR',34,251,70,264,98,651,'14:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 6. Spieltag',NULL,'\0',6.96,961,NULL,NULL,0.00,0.00,0.00),(225,75000,5000,NULL,NULL,45,'2015-12-12',220,'DE',1,1,249,1,265,9,'15:30',NULL,'2:0','0:0',NULL,58.46,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'',10.00,963,0.00,1.00,31.00,0.00,0.00),(226,71000,6000,NULL,NULL,136,'2013-03-09',220,'DE',1,1,235,246,266,9,'15:30',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'',0.00,754,NULL,NULL,0.00,0.00,0.00),(227,40,0,'um 20 Minuten verspätet am Ground',NULL,116,'2013-03-09',320,'DE',73,254,253,154,154,588,'12:45',NULL,'5:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,753,NULL,NULL,0.00,0.00,0.00),(228,512,0,NULL,NULL,179,'2013-03-08',257,'DE',74,228,255,238,267,587,'19:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,752,NULL,NULL,0.00,0.00,0.00),(229,3950,10,NULL,NULL,180,'2013-03-02',56,'DE',75,256,257,NULL,NULL,586,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,751,NULL,NULL,0.00,0.00,0.00),(230,35,15,NULL,NULL,181,'2013-02-22',235,'DE',58,17,16,270,14,585,'20:00',NULL,'1:4','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,750,NULL,NULL,0.00,0.00,0.00),(231,59974,3500,NULL,NULL,182,'2013-02-19',339,'EN',8,103,1,108,1,206,'19:45',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,749,NULL,NULL,0.00,0.00,0.00),(233,19,0,NULL,NULL,183,'2013-02-08',449,'DE',19,258,259,271,272,584,'19:30',NULL,'2:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,748,NULL,NULL,0.00,0.00,0.00),(234,300,30,NULL,NULL,184,'2013-02-01',449,'DE',16,260,8,273,8,481,'19:30',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,747,NULL,NULL,0.00,0.00,0.00),(235,5,1,'Abbruch des Testspiels in der 78. Spielminute wegen unbespielbarkeit des Kunstrasenplatzes an der Snitgerreihe (durchgängiger Schneematsch)',NULL,185,'2013-01-27',449,'DE',19,261,8,274,NULL,481,'15:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,746,NULL,NULL,0.00,0.00,0.00),(237,71000,4000,NULL,NULL,30,'2013-01-19',220,'DE',1,1,262,246,244,9,'15:30',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'',0.00,745,NULL,NULL,0.00,0.00,0.00),(238,84,0,'Auf Grund des knappen Zeitfensters zum Huptspiel habe ich die Anlage um 14:30 verlassen',NULL,186,'2013-01-19',220,'DE',19,115,263,276,275,583,'13:00',NULL,'4:1','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,744,NULL,NULL,0.00,0.00,0.00),(239,250,0,NULL,NULL,57,'2013-01-05',280,'DE',19,264,181,127,277,582,'13:00',NULL,'14:0','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,743,NULL,NULL,0.00,0.00,0.00),(240,71000,7100,NULL,NULL,88,'2012-12-01',220,'DE',1,1,72,246,73,9,'18:30',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'',0.00,742,NULL,NULL,0.00,0.00,0.00),(241,7,0,NULL,NULL,187,'2012-11-30',235,'DE',76,265,266,278,279,581,'20:00',NULL,'4:1','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,741,NULL,NULL,0.00,0.00,0.00),(242,100,0,NULL,NULL,188,'2012-11-30',235,'DE',46,83,267,161,280,31,'18:00',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Nichtwertung nach Rückzug während laufendem Spielbetriebs',NULL,'\0',0.00,740,NULL,NULL,0.00,0.00,0.00),(243,71000,4000,NULL,NULL,75,'2012-11-24',220,'DE',1,1,53,246,163,9,'15:30',NULL,'5:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'',0.00,739,NULL,NULL,0.00,0.00,0.00),(244,1800,800,'Ca. 15 Minuten verspätet im Stadion',NULL,189,'2012-11-23',319,'DE',75,263,256,275,268,580,'19:00',NULL,'4:3','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,738,NULL,NULL,0.00,0.00,0.00),(245,42,10,NULL,NULL,190,'2012-11-18',149,'DE',77,268,269,281,282,579,'14:00',NULL,'3:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,737,NULL,NULL,0.00,0.00,0.00),(246,290,30,NULL,NULL,191,'2012-11-04',235,'DE',22,270,8,283,8,31,'14:00',NULL,'3:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,736,NULL,NULL,0.00,0.00,0.00),(248,57000,8000,NULL,NULL,125,'2012-11-03',449,'DE',1,57,1,258,246,45,'18:30',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'',0.00,735,NULL,NULL,0.00,0.00,0.00),(249,170,30,NULL,NULL,98,'2012-10-21',449,'DE',22,47,8,252,8,53,'15:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,734,NULL,NULL,0.00,0.00,0.00),(250,150,0,NULL,NULL,192,'2012-10-10',252,'DE',78,271,272,284,285,578,'19:00',NULL,'2:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,733,NULL,NULL,0.00,0.00,0.00),(251,2200,0,'\n\nGelungener Einstand für St. Paulis neuen Trainer Michael Frontzeck. Der Zweitligist hat bei einem Testspiel Bundesligist Fürth mit 1 zu 0 besiegt.\n\nDer FC St. Pauli hat sein erstes Spiel unter dem neuen Coach Michael Frontzeck gewonnen. Der Fußball-Zweitligist bestand am Dienstagabend den Härtetest gegen den allerdings nicht in bester Besetzung angetretenen Bundesliga-Letzten SpVgg Greuther Fürth mit 1:0 (1:0).\nSchachten erzielt Sieg-Tor\n\nVor 2.200 Zuschauern in Kellinghusen erzielte Abwehrspieler Sebastian Schachten in der 22. Minute aus Nahdistanz den Treffer für den zuletzt kriselnden Kiez-Club. Fürths Michael Hefele (84.) hatte den Ausgleich auf dem Fuß, traf per Freistoß aber nur den Innenpfosten des diesmal von Benedikt Pliquett gehüteten St. Pauli-Tores. Die Partie fand im Stadion des VfL Kellinghusen statt, der kürzlich seinen 150. Geburtstag gefeiert hat.\n\nIn dieser wegen der EM-Qualifikation punktspielfreien Zeit trit der FC St. Pauli am Wochenende noch zu einem zweiten Freundschaftsspiel an. Gegner der Braun-Weißen ist am Samstag (14:30 Uhr) in der österreichischen Hauptstadt Toni Polsters Club SC Viktoria Wien.\n',NULL,193,'2012-10-09',170,'DE',19,101,262,286,244,577,'17:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,732,NULL,NULL,0.00,0.00,0.00),(252,90,30,NULL,NULL,55,'2012-10-07',259,'DE',22,273,8,287,72,101,'15:00',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,731,NULL,NULL,0.00,0.00,0.00),(253,52,0,NULL,NULL,116,'2012-10-07',449,'DE',79,274,275,288,154,576,'12:00',NULL,'7:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,730,NULL,NULL,0.00,0.00,0.00),(254,71000,2000,NULL,NULL,136,'2012-10-06',220,'DE',1,1,276,246,289,9,'15:30',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,729,NULL,NULL,0.00,0.00,0.00),(255,80,0,NULL,NULL,194,'2012-10-05',235,'DE',45,277,63,291,292,32,'20:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,728,NULL,NULL,0.00,0.00,0.00),(256,24636,1500,NULL,NULL,195,'2012-10-02',435,'BY',8,278,1,293,246,575,'21:45',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 2. Spieltag',NULL,'\0',0.00,727,NULL,NULL,0.00,0.00,0.00),(257,42100,5000,NULL,NULL,45,'2012-09-29',70,'DE',1,52,1,35,246,27,'15:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'',0.00,726,NULL,NULL,0.00,0.00,0.00),(258,662,50,NULL,NULL,11,'2012-09-23',449,'DE',22,44,8,40,8,35,'14:00',NULL,'3:3','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,725,NULL,NULL,0.00,0.00,0.00),(259,25,0,NULL,NULL,196,'2012-09-20',163,'DE',80,279,280,154,295,574,'19:30',NULL,'0:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,724,NULL,NULL,0.00,0.00,0.00),(260,280,20,NULL,NULL,NULL,'2012-09-16',449,'DE',22,8,281,8,296,21,'14:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,723,NULL,NULL,0.00,0.00,0.00),(261,210,0,NULL,NULL,197,'2012-09-09',176,'DE',45,282,63,297,292,573,'15:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,722,NULL,NULL,0.00,0.00,0.00),(262,150,0,NULL,NULL,116,'2012-09-09',325,'DE',81,127,283,134,299,572,'11:00',NULL,'4:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,721,NULL,NULL,0.00,0.00,0.00),(263,185,30,NULL,NULL,48,'2012-09-07',449,'DE',22,168,8,300,8,520,'19:30',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,720,NULL,NULL,0.00,0.00,0.00),(264,32,0,NULL,NULL,198,'2012-08-26',276,'DE',82,284,285,154,154,571,'10:00',NULL,'2:7','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,719,NULL,NULL,0.00,0.00,0.00),(265,18000,3000,NULL,NULL,88,'2012-08-25',122,'DE',1,262,1,244,246,570,'15:30',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'',0.00,718,NULL,NULL,0.00,0.00,0.00),(266,300,11,NULL,NULL,85,'2015-12-19',449,'DE',16,8,153,8,162,509,'14:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,964,NULL,NULL,0.00,0.00,0.00),(267,250,0,NULL,NULL,199,'2012-08-25',122,'DE',83,286,287,302,301,569,'12:30',NULL,'3:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,717,NULL,NULL,0.00,0.00,0.00),(268,51,0,NULL,NULL,200,'2012-08-24',449,'DE',32,201,288,209,303,568,'19:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,716,NULL,NULL,0.00,0.00,0.00),(269,97,40,NULL,NULL,201,'2012-08-07',449,'DE',16,289,8,304,8,182,'18:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,715,NULL,NULL,0.00,0.00,0.00),(270,40000,10000,'Spielzeit je zwei Hälften zu 30 Minuten',NULL,77,'2012-08-05',449,'DE',84,57,1,258,246,45,'16:45',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Spiel um Platz 3',NULL,'\0',0.00,714,NULL,NULL,0.00,0.00,0.00),(271,34,0,NULL,NULL,202,'2012-08-02',449,'DE',16,290,291,305,306,567,'18:30',NULL,'2:2','1:1','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde','5:4','\0',0.00,713,NULL,NULL,0.00,0.00,0.00),(272,70,0,NULL,NULL,203,'2012-08-01',449,'DE',16,292,258,308,271,566,'18:30',NULL,'4:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,712,NULL,NULL,0.00,0.00,0.00),(273,70,0,'verspätetes Eintreffen am Sportpltz (ca. 10 Minuten)',NULL,204,'2012-07-29',449,'DE',69,293,294,154,309,335,'17:30',NULL,'0:5','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,711,NULL,NULL,0.00,0.00,0.00),(274,42000,25,NULL,NULL,205,'2012-07-24',8,'CN',19,295,1,310,246,562,'19:30',NULL,'0:6','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,710,NULL,NULL,0.00,0.00,0.00),(275,20,0,NULL,NULL,116,'2012-07-24',8,'CN',85,296,297,154,154,565,'14:00',NULL,'3:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,709,NULL,NULL,0.00,0.00,0.00),(276,15,0,NULL,NULL,116,'2012-07-24',8,'CN',85,298,299,154,154,564,'12:00',NULL,'5:2','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,708,NULL,NULL,0.00,0.00,0.00),(277,400,100,NULL,NULL,116,'2012-07-22',8,'CN',86,300,301,154,154,563,'16:00',NULL,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,707,NULL,NULL,0.00,0.00,0.00),(278,21909,10,NULL,NULL,206,'2012-07-21',8,'CN',87,295,302,310,311,562,'20:30',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,706,NULL,NULL,0.00,0.00,0.00),(279,15,0,NULL,NULL,208,'2012-07-14',449,'DE',19,303,284,154,154,561,'11:00',NULL,'5:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,705,NULL,NULL,0.00,0.00,0.00),(280,30,0,NULL,NULL,209,'2012-07-13',59,'DE',19,304,305,154,154,560,'19:30',NULL,'8:4','6:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,704,NULL,NULL,0.00,0.00,0.00),(281,70,0,NULL,NULL,87,'2012-07-10',449,'DE',19,8,306,8,312,509,'19:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,703,NULL,NULL,0.00,0.00,0.00),(282,20,0,NULL,NULL,185,'2012-07-08',449,'DE',19,25,307,22,313,559,'15:00',NULL,'2:5','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,702,NULL,NULL,0.00,0.00,0.00),(283,115,0,NULL,NULL,211,'2012-05-20',26,'DE',88,308,309,314,315,558,'14:00',NULL,'2:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,701,NULL,NULL,0.00,0.00,0.00),(284,62500,15000,NULL,NULL,10,'2012-05-19',220,'DE',8,1,218,246,316,9,'20:45',NULL,'1:1','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Finale','3:4','',0.00,700,NULL,NULL,0.00,0.00,0.00),(285,500,20,NULL,NULL,212,'2012-05-19',160,'DE',89,310,311,317,318,557,'15:00',NULL,'3:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'\0',0.00,699,NULL,NULL,0.00,0.00,0.00),(286,75708,20000,NULL,NULL,88,'2012-05-12',42,'DE',7,72,1,73,246,37,'20:00',NULL,'5:2','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,698,NULL,NULL,0.00,0.00,0.00),(287,111,4,NULL,NULL,213,'2012-05-12',113,'DE',90,312,313,319,320,556,'15:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,697,NULL,NULL,0.00,0.00,0.00),(288,203,0,NULL,NULL,214,'2012-05-06',449,'DE',91,8,314,8,321,21,'14:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,696,NULL,NULL,0.00,0.00,0.00),(289,50000,5000,NULL,NULL,105,'2012-05-05',178,'DE',1,315,1,322,246,65,'15:30',0,'1:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'',0.00,695,NULL,NULL,0.00,0.00,0.00),(290,300,0,NULL,NULL,216,'2012-04-30',249,'DE',92,316,317,323,324,555,'18:45',NULL,'1:3','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,694,NULL,NULL,0.00,0.00,0.00),(291,170,40,NULL,NULL,42,'2012-04-29',449,'DE',91,318,8,325,8,554,'15:00',NULL,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,693,NULL,NULL,0.00,0.00,0.00),(292,42100,5000,NULL,NULL,56,'2012-04-21',70,'DE',1,52,1,35,246,27,'15:30',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'',0.00,692,NULL,NULL,0.00,0.00,0.00),(293,130,40,NULL,NULL,118,'2012-04-13',449,'DE',91,306,8,326,8,553,'19:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,691,NULL,NULL,0.00,0.00,0.00),(294,80720,9000,NULL,NULL,125,'2012-04-11',92,'DE',1,72,1,73,246,55,'20:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'',0.00,690,NULL,NULL,0.00,0.00,0.00),(295,80,50,NULL,NULL,87,'2012-04-05',449,'DE',91,319,8,327,8,158,'19:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,688,NULL,NULL,0.00,0.00,0.00),(296,100,10,NULL,NULL,217,'2012-04-07',32,'DE',93,320,80,329,241,552,'14:00',NULL,'1:4','1:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,689,NULL,NULL,0.00,0.00,0.00),(297,150,0,NULL,NULL,218,'2012-04-05',449,'DE',94,140,321,148,330,85,'17:00',NULL,'0:3','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,687,NULL,NULL,0.00,0.00,0.00),(298,80,0,'verstätete Ankunft Am Sportplatz (ca. 15 Min.)',NULL,219,'2012-03-31',234,'DE',95,322,323,154,154,551,'20:15',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,686,NULL,NULL,0.00,0.00,0.00),(299,48548,5000,NULL,NULL,75,'2012-03-31',246,'DE',1,239,1,57,246,68,'15:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'',0.00,685,NULL,NULL,0.00,0.00,0.00),(300,31683,4000,'Zugausfall durch Brand eines Zuges auf der Strecke zwischen Toulon und Marseille. In Toulon gestrandet. Mitfahrt mit Malgo und ihrer Familie in deren privatem PKW. Malgo saß neben mir im Flugzeug und sie gab mir ihre Nummer falls Probleme bestehen. So brachte uns Familie Malgo nach Marseille (wo sie selber wohnte). Im Stadion kurz nach dem Führungstreffer durch Mario Gomez vor dem Halbzeitpfiff.',NULL,28,'2012-03-28',348,'FR',8,324,1,331,246,550,'20:45',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Hinspiel)',NULL,'\0',0.00,684,NULL,NULL,0.00,0.00,0.00),(301,375,15,NULL,NULL,220,'2012-03-21',235,'DE',30,83,325,161,250,31,'16:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,683,NULL,NULL,0.00,0.00,0.00),(302,11,0,NULL,NULL,221,'2012-03-18',449,'DE',79,327,326,154,154,549,'10:45',NULL,'2:4','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,681,NULL,NULL,0.00,0.00,0.00),(303,158,0,NULL,NULL,222,'2012-03-18',449,'DE',91,8,328,8,332,21,'14:00',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,682,NULL,NULL,0.00,0.00,0.00),(304,280,1,NULL,NULL,223,'2012-03-14',449,'DE',96,329,330,333,334,72,'15:00',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,680,NULL,NULL,0.00,0.00,0.00),(305,350,100,NULL,NULL,144,'2012-03-04',449,'DE',91,8,260,8,273,21,'14:00',NULL,'3:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,679,NULL,NULL,0.00,0.00,0.00),(306,40,10,NULL,NULL,224,'2012-03-04',449,'DE',58,331,16,335,14,548,'11:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,678,NULL,NULL,0.00,0.00,0.00),(307,25,0,NULL,NULL,225,'2012-03-03',192,'DE',97,332,333,336,337,547,'17:30',NULL,'3:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,677,NULL,NULL,0.00,0.00,0.00),(308,30210,4000,NULL,NULL,56,'2012-03-03',192,'DE',1,203,1,194,246,67,'15:30',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'',0.00,676,NULL,NULL,0.00,0.00,0.00),(309,40,0,NULL,NULL,226,'2012-03-03',178,'DE',98,334,335,338,339,546,'12:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,675,NULL,NULL,0.00,0.00,0.00),(310,80,0,NULL,NULL,227,'2012-03-02',449,'DE',99,336,337,340,341,545,'19:30',NULL,'4:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,674,NULL,NULL,0.00,0.00,0.00),(311,33,0,NULL,NULL,116,'2012-02-26',449,'DE',19,44,338,40,342,299,'14:00',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,673,NULL,NULL,0.00,0.00,0.00),(312,70,0,NULL,NULL,49,'2012-02-26',449,'DE',45,107,64,344,343,544,'12:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,672,NULL,NULL,0.00,0.00,0.00),(313,57000,6000,NULL,NULL,125,'2012-02-04',449,'DE',1,57,1,258,246,45,'18:30',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'',0.00,671,NULL,NULL,0.00,0.00,0.00),(314,7549,500,NULL,NULL,176,'2012-02-03',255,'DE',2,339,340,345,75,543,'18:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,670,NULL,NULL,0.00,0.00,0.00),(315,18,0,NULL,NULL,116,'2012-01-24',449,'DE',19,8,269,8,282,509,'19:30',NULL,'5:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,669,NULL,NULL,0.00,0.00,0.00),(316,35000,80,NULL,NULL,228,'2012-01-10',352,'IN',19,341,1,346,246,542,'22:30',NULL,'0:4','0:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,668,NULL,NULL,0.00,0.00,0.00),(318,50,0,NULL,NULL,229,'2011-12-01',316,'DE',100,342,343,154,154,541,'20:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,667,NULL,NULL,0.00,0.00,0.00),(319,34000,5000,NULL,NULL,125,'2011-11-27',205,'DE',1,20,1,202,246,540,'17:30',NULL,'3:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'',0.00,666,NULL,NULL,0.00,0.00,0.00),(320,100,0,NULL,NULL,230,'2011-11-27',130,'DE',101,344,345,347,348,539,'14:30',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,665,NULL,NULL,0.00,0.00,0.00),(321,100,40,NULL,NULL,231,'2011-10-30',296,'DE',91,314,8,321,8,538,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,664,NULL,NULL,0.00,0.00,0.00),(322,26,0,NULL,NULL,232,'2011-10-30',68,'DE',102,346,347,349,350,537,'11:30',NULL,'1:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,663,NULL,NULL,0.00,0.00,0.00),(323,3200,250,NULL,NULL,233,'2011-10-21',169,'DE',103,348,115,351,352,536,'19:00',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,662,NULL,NULL,0.00,0.00,0.00),(324,60074,3000,NULL,NULL,234,'2011-10-18',363,'IT',8,82,1,353,246,535,'20:45',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 3. Spieltag',NULL,'',0.00,661,NULL,NULL,0.00,0.00,0.00),(325,20,0,NULL,NULL,235,'2011-10-16',449,'DE',52,350,351,154,154,534,'11:00',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,660,NULL,NULL,0.00,0.00,0.00),(326,70,0,NULL,NULL,236,'2011-10-15',190,'DE',104,352,353,354,355,533,'14:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,659,NULL,NULL,0.00,0.00,0.00),(327,189,50,NULL,NULL,22,'2011-09-30',31,'DE',91,354,8,327,72,401,'19:30',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,658,NULL,NULL,0.00,0.00,0.00),(328,225,25,NULL,NULL,237,'2011-09-25',449,'DE',91,8,355,8,356,21,'14:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,657,NULL,NULL,0.00,0.00,0.00),(329,61673,7000,NULL,NULL,105,'2011-09-18',128,'DE',1,118,1,357,246,338,'17:30',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'',0.00,656,NULL,NULL,0.00,0.00,0.00),(330,230,10,NULL,NULL,238,'2011-09-18',98,'DE',26,356,214,358,223,532,'14:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,655,NULL,NULL,0.00,0.00,0.00),(331,1198,15,'Das Stadion erst mit zwanzigminütiger Verspätung betreten',NULL,239,'2011-09-11',367,'IT',105,357,358,359,360,531,'15:00',NULL,'0:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,654,NULL,NULL,0.00,0.00,0.00),(333,483,1000,NULL,NULL,240,'2011-09-02',449,'DE',91,260,8,273,8,221,'19:30',NULL,'2:3','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,653,NULL,NULL,0.00,0.00,0.00),(334,210,0,NULL,NULL,241,'2011-08-28',449,'DE',91,8,359,8,361,21,'14:00',NULL,'6:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,652,NULL,NULL,0.00,0.00,0.00),(335,120,0,NULL,NULL,242,'2011-08-21',165,'DE',106,360,361,154,154,530,'17:00',NULL,'5:2','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,651,NULL,NULL,0.00,0.00,0.00),(336,230,0,NULL,NULL,243,'2011-08-21',449,'DE',91,8,319,8,87,21,'14:00',NULL,'5:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,650,NULL,NULL,0.00,0.00,0.00),(337,25,0,NULL,NULL,241,'2011-08-21',449,'DE',77,362,363,362,363,337,'10:45',NULL,'2:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,649,NULL,NULL,0.00,0.00,0.00),(338,69000,6900,NULL,NULL,45,'2011-08-20',220,'DE',1,1,57,246,364,9,'15:30',NULL,'5:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'',0.00,648,NULL,NULL,0.00,0.00,0.00),(339,280,0,NULL,NULL,244,'2011-08-20',220,'DE',83,365,364,365,366,485,'11:00',NULL,'5:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,647,NULL,NULL,0.00,0.00,0.00),(340,531,10,NULL,NULL,245,'2011-08-19',220,'DE',103,115,366,352,367,44,'19:00',NULL,'2:5','2:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,646,NULL,NULL,0.00,0.00,0.00),(341,10912,800,NULL,NULL,56,'2011-08-18',412,'SI',9,367,368,368,369,529,'20:45',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Playoffs (Hinspiel)',NULL,'\0',0.00,645,NULL,NULL,0.00,0.00,0.00),(342,66000,3300,NULL,NULL,246,'2011-08-17',220,'DE',8,1,369,246,370,9,'20:45',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Playoffs (Hinspiel)',NULL,'',0.00,644,NULL,NULL,0.00,0.00,0.00),(343,130,0,'Verspätetes Eintreffen um ca. 15 Miuten am Stadion.',NULL,247,'2011-08-17',101,'DE',107,370,371,371,372,528,'18:30',NULL,'0:4','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,643,NULL,NULL,0.00,0.00,0.00),(344,40,0,NULL,NULL,16,'2011-08-16',449,'DE',16,372,200,154,208,527,'18:00',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,642,NULL,NULL,0.00,0.00,0.00),(345,200,50,NULL,NULL,248,'2011-08-14',90,'DE',91,23,8,373,8,11,'15:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,641,NULL,NULL,0.00,0.00,0.00),(346,17,0,NULL,NULL,249,'2011-08-14',449,'DE',43,373,216,154,154,526,'12:00',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,640,NULL,NULL,0.00,0.00,0.00),(347,30000,10000,NULL,NULL,125,'2011-08-13',333,'DE',1,61,1,374,246,33,'15:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'',0.00,639,NULL,NULL,0.00,0.00,0.00),(348,150,0,'Verspätete Ankunft mit Maja am WRP (ca. 25 Minuten)',NULL,55,'2011-08-07',449,'DE',91,8,125,8,375,21,'14:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,638,NULL,NULL,0.00,0.00,0.00),(349,23645,3000,NULL,NULL,75,'2011-08-01',66,'DE',7,159,1,166,246,129,'20:30',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'',0.00,637,NULL,NULL,0.00,0.00,0.00),(350,22,0,NULL,NULL,250,'2011-07-31',449,'DE',77,374,375,154,154,525,'11:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,636,NULL,NULL,0.00,0.00,0.00),(351,200,50,NULL,NULL,251,'2011-07-30',449,'DE',91,208,8,116,8,108,'16:00',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,635,NULL,NULL,0.00,0.00,0.00),(352,50,0,'Spiel zur 75. Spielminute verlassen um zur Ellernreihe zu gelangen.',NULL,34,'2011-07-30',449,'DE',58,16,376,14,376,509,'14:00',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,634,NULL,NULL,0.00,0.00,0.00),(354,80,3,NULL,NULL,100,'2011-07-29',449,'DE',108,377,378,377,378,524,'19:15',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,633,NULL,NULL,0.00,0.00,0.00),(355,12641,6000,NULL,NULL,88,'2011-07-14',162,'DE',19,379,1,379,246,523,'18:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,632,NULL,NULL,0.00,0.00,0.00),(356,50,0,NULL,NULL,98,'2011-07-10',449,'DE',19,8,112,8,300,509,'11:00',NULL,'5:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,631,NULL,NULL,0.00,0.00,0.00),(357,31,0,NULL,NULL,252,'2011-07-03',449,'DE',19,8,380,8,154,509,'11:00',NULL,'9:1','6:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,630,NULL,NULL,0.00,0.00,0.00),(358,25,0,NULL,NULL,253,'2011-07-02',449,'DE',19,277,381,380,154,522,'11:00',NULL,'4:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,629,NULL,NULL,0.00,0.00,0.00),(359,100,0,NULL,NULL,254,'2011-06-19',449,'DE',18,12,382,154,154,159,'12:00',NULL,'0:0','0:0','i. E.',0.00,0.00,0.00,0.00,0.00,0.00,'Finale','2:4','\0',0.00,628,NULL,NULL,0.00,0.00,0.00),(360,90,0,NULL,NULL,255,'2011-06-11',34,'DE',109,383,384,154,154,521,'15:30',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Entscheidungsspiel',NULL,'\0',0.00,627,NULL,NULL,0.00,0.00,0.00),(361,250,50,'BU steigt in die Landesliga ab. Pöbeleien nach Abpfiff Richtung Schnelsener Mannschaft',NULL,48,'2011-05-27',449,'DE',22,168,8,381,382,520,'19:00',NULL,'5:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'\0',0.00,626,NULL,NULL,0.00,0.00,0.00),(362,330,0,NULL,NULL,256,'2011-05-22',449,'DE',22,8,270,382,383,21,'14:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'\0',0.00,625,NULL,NULL,0.00,0.00,0.00),(363,100,0,'Verspätetes Eintreffen am Stadion (auf dem Rückweg von Fehmarn; Hilfe bei Aufbau Campingplatz Arne) um ca. 15-20 Minuten',NULL,257,'2011-05-21',314,'DE',110,100,385,105,385,175,'15:00',NULL,'4:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,624,NULL,NULL,0.00,0.00,0.00),(364,250,0,NULL,NULL,116,'2011-05-20',153,'DE',111,387,388,386,387,519,'19:30',NULL,'1:4','1:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,623,NULL,NULL,0.00,0.00,0.00),(365,24487,2500,NULL,NULL,21,'2011-05-07',449,'DE',1,101,1,388,352,54,'15:30',NULL,'1:8','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,622,NULL,NULL,0.00,0.00,0.00),(366,45,10,NULL,NULL,258,'2011-05-01',449,'DE',58,363,16,390,391,128,'14:00',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,621,NULL,NULL,0.00,0.00,0.00),(367,80,0,NULL,NULL,259,'2011-04-30',218,'DE',112,389,390,392,393,518,'16:00',NULL,'2:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,620,NULL,NULL,0.00,0.00,0.00),(368,5075,200,NULL,NULL,260,'2011-04-30',177,'DE',3,391,115,395,394,517,'14:00',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'36. Spieltag',NULL,'\0',0.00,619,NULL,NULL,0.00,0.00,0.00),(369,178,80,NULL,NULL,99,'2011-04-29',449,'DE',22,355,8,356,382,158,'19:30',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,618,NULL,NULL,0.00,0.00,0.00),(370,192,15,NULL,NULL,144,'2011-04-25',449,'DE',22,8,281,382,396,21,'15:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,617,NULL,NULL,0.00,0.00,0.00),(371,337,20,NULL,NULL,261,'2011-04-19',449,'DE',22,121,8,39,382,294,'18:30',NULL,'4:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,616,NULL,NULL,0.00,0.00,0.00),(372,305,0,NULL,NULL,188,'2011-04-17',449,'DE',22,8,208,382,291,21,'14:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,615,NULL,NULL,0.00,0.00,0.00),(373,360,17,NULL,NULL,262,'2011-04-05',449,'DE',22,44,8,283,382,35,'18:15',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,614,NULL,NULL,0.00,0.00,0.00),(374,100,0,NULL,NULL,263,'2011-04-02',218,'DE',112,389,392,392,397,516,'18:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,613,NULL,NULL,0.00,0.00,0.00),(375,4423,150,NULL,NULL,264,'2011-04-02',329,'DE',75,393,115,398,399,515,'14:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,612,NULL,NULL,0.00,0.00,0.00),(376,1343,0,NULL,NULL,145,'2011-04-01',194,'DE',26,34,395,400,401,514,'19:00',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,611,NULL,NULL,0.00,0.00,0.00),(377,300,100,NULL,NULL,87,'2011-03-27',449,'DE',22,84,8,125,382,51,'10:45',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,610,NULL,NULL,0.00,0.00,0.00),(378,284,15,NULL,NULL,266,'2011-03-20',449,'DE',22,8,7,382,402,21,'14:00',NULL,'3:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,609,NULL,NULL,0.00,0.00,0.00),(379,69000,6900,NULL,NULL,45,'2011-03-12',220,'DE',1,1,57,403,121,9,'15:30',NULL,'6:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'',0.00,608,NULL,NULL,0.00,0.00,0.00),(380,145,5,NULL,NULL,267,'2011-03-11',233,'DE',90,396,313,404,320,512,'19:30',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,607,NULL,NULL,0.00,0.00,0.00),(381,40,0,NULL,NULL,268,'2011-03-08',449,'DE',108,397,398,406,236,511,'19:30',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,606,NULL,NULL,0.00,0.00,0.00),(382,49000,9000,NULL,NULL,158,'2011-03-05',141,'DE',1,53,1,163,403,63,'15:30',18,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'',0.00,605,NULL,NULL,0.00,0.00,0.00),(383,50,0,NULL,NULL,269,'2011-02-26',135,'DE',113,399,400,154,154,510,'14:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,604,NULL,NULL,0.00,0.00,0.00),(384,75925,7000,NULL,NULL,170,'2011-02-23',362,'IT',8,401,1,407,403,99,'20:45',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,603,NULL,NULL,0.00,0.00,0.00),(385,69000,2000,NULL,NULL,88,'2011-02-12',220,'DE',1,1,276,403,408,9,'15:30',NULL,'4:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'',0.00,602,NULL,NULL,0.00,0.00,0.00),(387,37,0,NULL,NULL,270,'2011-01-23',449,'DE',19,8,129,382,409,509,'11:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,601,NULL,NULL,0.00,0.00,0.00),(388,1500,70,NULL,NULL,116,'2011-01-08',370,'QA',19,402,1,410,403,508,'19:00',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,600,NULL,NULL,0.00,0.00,0.00),(390,47143,0,NULL,NULL,271,'2011-01-07',371,'QA',114,403,404,411,412,507,'19:15',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Eröffnungsspiel (1. Spiel)',NULL,'\0',0.00,599,NULL,NULL,0.00,0.00,0.00),(391,42789,5000,NULL,NULL,44,'2010-11-23',364,'IT',8,79,1,413,403,47,'20:45',NULL,'3:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 5. Spieltag',NULL,'\0',0.00,598,NULL,NULL,0.00,0.00,0.00),(392,28700,0,NULL,NULL,272,'2010-11-22',12,'CN',115,405,406,414,154,506,'15:30',NULL,'2:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Spiel um die Bronzemedaille',NULL,'\0',0.00,597,NULL,NULL,0.00,0.00,0.00),(393,40,0,NULL,NULL,116,'2010-11-21',1080,'HK',116,407,410,154,154,505,'13:30',NULL,'4:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,595,NULL,NULL,0.00,0.00,0.00),(394,40,0,NULL,NULL,116,'2010-11-21',1080,'HK',116,408,409,154,154,505,'15:15',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,596,NULL,NULL,0.00,0.00,0.00),(395,14097,1200,NULL,NULL,273,'2010-11-03',402,'RO',8,411,1,415,403,504,'20:45',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,594,NULL,NULL,0.00,0.00,0.00),(396,325,40,NULL,NULL,111,'2010-10-31',449,'DE',22,131,8,416,382,188,'14:00',NULL,'3:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,593,NULL,NULL,0.00,0.00,0.00),(397,57000,6000,NULL,NULL,56,'2010-10-22',449,'DE',1,57,1,121,403,45,'20:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'',0.00,592,NULL,NULL,0.00,0.00,0.00),(398,562,250,NULL,NULL,274,'2010-10-17',449,'DE',22,8,44,382,283,21,'14:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,591,NULL,NULL,0.00,0.00,0.00),(400,20,2,NULL,NULL,22,'2010-10-12',449,'DE',19,412,8,417,382,503,'19:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,590,NULL,NULL,0.00,0.00,0.00),(401,600,10,NULL,NULL,275,'2010-10-10',449,'DE',96,329,330,333,334,72,'14:00',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,589,NULL,NULL,0.00,0.00,0.00),(402,37500,2000,NULL,NULL,276,'2010-09-28',408,'CH',8,413,1,258,403,479,'20:45',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 2. Spieltag',NULL,'',0.00,588,NULL,NULL,0.00,0.00,0.00),(403,203,0,NULL,NULL,277,'2010-09-18',449,'DE',22,8,84,382,125,21,'17:00',NULL,'3:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,587,NULL,NULL,0.00,0.00,0.00),(404,200,0,'Mit etwa zwanzigminütiger Verspätung im Stadion (Anreise auf Vilnius mit privatem Fahrer vom Hotel)',NULL,116,'2010-09-10',375,'LT',117,414,415,154,154,502,'16:00',NULL,'5:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,586,NULL,NULL,0.00,0.00,0.00),(405,224,5,NULL,NULL,48,'2010-09-05',449,'DE',22,8,416,382,297,21,'14:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,585,NULL,NULL,0.00,0.00,0.00),(406,20,0,NULL,NULL,278,'2010-08-29',449,'DE',46,417,350,154,154,273,'11:00',NULL,'5:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,584,NULL,NULL,0.00,0.00,0.00),(407,30,4,NULL,NULL,279,'2016-01-10',449,'DE',19,131,418,419,418,653,'14:00',NULL,'7:0','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,965,NULL,NULL,0.00,0.00,0.00),(408,187,10,NULL,NULL,11,'2010-08-28',55,'DE',22,117,8,124,382,154,'15:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,583,NULL,NULL,0.00,0.00,0.00),(409,285,0,NULL,NULL,280,'2010-08-22',449,'DE',22,8,211,382,221,21,'14:00',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,582,NULL,NULL,0.00,0.00,0.00),(410,280,30,NULL,NULL,193,'2010-08-15',449,'DE',22,281,8,396,382,183,'15:00',NULL,'5:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,581,NULL,NULL,0.00,0.00,0.00),(411,300,0,NULL,NULL,140,'2010-08-08',449,'DE',22,8,121,382,39,21,'14:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,580,NULL,NULL,0.00,0.00,0.00),(412,50,0,NULL,NULL,281,'2010-08-08',449,'DE',52,419,420,154,154,501,'10:45',NULL,'5:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,579,NULL,NULL,0.00,0.00,0.00),(413,30662,1000,NULL,NULL,56,'2010-08-07',29,'DE',12,1,118,403,374,500,'17:45',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Deutscher Supercup',NULL,'',0.00,578,NULL,NULL,0.00,0.00,0.00),(414,30,0,NULL,NULL,116,'2010-08-07',52,'DE',120,421,422,154,154,499,'13:30',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,577,NULL,NULL,0.00,0.00,0.00),(415,816,0,NULL,NULL,282,'2010-08-06',103,'DE',110,423,424,420,421,498,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,576,NULL,NULL,0.00,0.00,0.00),(416,27,0,NULL,NULL,283,'2010-08-05',449,'DE',69,425,426,154,154,200,'19:00',NULL,'5:4','4:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,575,NULL,NULL,0.00,0.00,0.00),(417,210,30,NULL,NULL,284,'2010-08-01',449,'DE',22,9,8,422,382,497,'10:45',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,574,NULL,NULL,0.00,0.00,0.00),(418,2500,800,NULL,NULL,116,'2010-07-24',360,'IT',19,427,1,154,403,496,'17:00',NULL,'1:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,573,NULL,NULL,0.00,0.00,0.00),(420,105,0,NULL,NULL,285,'2010-07-23',215,'DE',16,428,112,154,154,495,'18:30',NULL,'0:13','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,572,NULL,NULL,0.00,0.00,0.00),(421,23,6,NULL,NULL,286,'2010-07-04',55,'DE',19,117,8,124,382,494,'11:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,571,NULL,NULL,0.00,0.00,0.00),(422,150,0,NULL,NULL,116,'2010-07-03',140,'DE',19,429,430,154,423,493,'14:00',NULL,'0:6','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,570,NULL,NULL,0.00,0.00,0.00),(423,40,0,NULL,NULL,287,'2010-07-02',300,'DE',19,431,432,154,154,491,'18:00',NULL,'4:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,568,NULL,NULL,0.00,0.00,0.00),(424,500,2,NULL,NULL,NULL,'2010-07-03',36,'DE',19,433,434,425,424,492,'11:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,569,NULL,NULL,0.00,0.00,0.00),(425,2500,2000,NULL,NULL,116,'2010-07-01',202,'DE',19,435,101,154,388,490,'19:15',NULL,'0:8','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,567,NULL,NULL,0.00,0.00,0.00),(426,200,0,NULL,NULL,288,'2010-06-30',217,'DE',19,436,430,154,426,489,'18:30',NULL,'0:9','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Jubiläumsspiel \"100 Jahre TSV Müden-Dieckhorst\"',NULL,'\0',0.00,566,0.00,0.00,0.00,0.00,0.00),(427,443,30,'Victoria ist Hamburger Meister mit Meisterfeier',NULL,144,'2010-05-28',449,'DE',22,8,7,382,300,21,'19:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'\0',0.00,565,0.00,0.00,0.00,0.00,0.00),(428,74954,17000,NULL,NULL,289,'2010-05-22',220,'DE',8,1,401,403,228,9,'20:45',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,564,0.00,0.00,0.00,0.00,0.00),(430,60,0,NULL,NULL,290,'2010-05-20',266,'DE',121,437,438,154,154,488,'19:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,563,0.00,0.00,0.00,0.00,0.00),(431,75420,30000,NULL,NULL,21,'2010-05-15',42,'DE',7,52,1,35,403,37,'20:00',NULL,'0:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,562,0.00,0.00,0.00,0.00,0.00),(432,75,0,NULL,NULL,291,'2010-05-15',271,'DE',122,439,440,427,428,487,'14:00',NULL,'2:4','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,561,0.00,0.00,0.00,0.00,0.00),(433,338,120,NULL,NULL,292,'2010-05-04',449,'DE',22,8,44,382,283,21,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,560,0.00,0.00,0.00,0.00,0.00),(434,587,40,NULL,NULL,293,'2010-05-02',449,'DE',96,329,330,333,429,72,'14:00',NULL,'1:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,559,0.00,0.00,0.00,0.00,0.00),(435,124,0,NULL,NULL,294,'2010-05-02',449,'DE',45,441,138,154,154,486,'10:45',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,558,0.00,0.00,0.00,0.00,0.00),(436,69000,6000,'etwas verspätet im stadion, da Probleme mit Karteneinlass (strobel gab mir die falsche Karte)',NULL,30,'2010-05-01',220,'DE',1,1,62,403,430,9,'15:30',NULL,'3:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,557,0.00,0.00,0.00,0.00,0.00),(437,150,0,NULL,NULL,295,'2010-05-01',220,'DE',83,365,442,365,51,485,'11:00',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,556,0.00,0.00,0.00,0.00,0.00),(438,150,5,'1. Spielbesuch mit Maja (38 Tage jung)',NULL,87,'2010-04-25',449,'DE',22,8,416,382,297,21,'14:00',NULL,'2:3','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',5.00,555,0.00,0.00,0.00,0.00,0.00),(439,16420,20,NULL,NULL,296,'2010-04-24',66,'DE',75,159,115,166,276,129,'14:00',NULL,'3:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'36. Spieltag',NULL,'\0',0.00,554,0.00,0.00,0.00,0.00,0.00),(440,4754,150,NULL,NULL,297,'2010-04-13',171,'DE',75,221,115,431,276,77,'19:00',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'\0',0.00,553,0.00,0.00,0.00,0.00,0.00),(441,143,0,NULL,NULL,298,'2010-04-11',449,'DE',22,8,102,382,432,21,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,552,0.00,0.00,0.00,0.00,0.00),(442,243,0,NULL,NULL,299,'2010-04-07',449,'DE',22,8,121,382,39,21,'18:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,551,0.00,0.00,0.00,0.00,0.00),(443,130,25,NULL,NULL,256,'2010-04-05',449,'DE',22,181,8,243,382,249,'15:00',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,550,0.00,0.00,0.00,0.00,0.00),(444,80,6,NULL,NULL,284,'2010-04-01',318,'DE',22,443,8,433,382,484,'19:30',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,549,0.00,0.00,0.00,0.00,0.00),(445,166,0,NULL,NULL,300,'2010-03-28',449,'DE',22,8,9,382,327,21,'14:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,548,0.00,0.00,0.00,0.00,0.00),(446,223,0,NULL,NULL,301,'2010-03-21',449,'DE',22,8,355,382,434,21,'14:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,547,0.00,0.00,0.00,0.00,0.00),(447,60,0,NULL,NULL,268,'2010-03-21',449,'DE',58,444,3,154,154,326,'10:45',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,546,0.00,0.00,0.00,0.00,0.00),(448,40,0,'Nur der 1. Halbzeit beigewohnt..',NULL,302,'2010-03-20',274,'DE',81,445,446,154,154,483,'15:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,545,0.00,0.00,0.00,0.00,0.00),(449,50,15,NULL,NULL,22,'2010-03-16',449,'DE',19,208,8,154,382,482,'19:15',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,544,0.00,0.00,0.00,0.00,0.00),(450,13,3,NULL,NULL,303,'2010-03-14',449,'DE',19,447,8,154,382,481,'10:00',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,543,0.00,0.00,0.00,0.00,0.00),(451,50,10,NULL,NULL,91,'2010-03-13',449,'DE',19,448,8,154,382,105,'14:00',NULL,'1:8','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,542,0.00,0.00,0.00,0.00,0.00),(452,40,2,NULL,NULL,304,'2010-03-02',449,'DE',19,449,8,154,382,480,'19:00',NULL,'2:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,541,0.00,0.00,0.00,0.00,0.00),(453,18,1,NULL,NULL,252,'2010-02-07',449,'DE',19,8,7,382,154,455,'16:30',NULL,'2:4','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,539,0.00,0.00,0.00,0.00,0.00),(454,20,3,NULL,NULL,305,'2010-02-09',449,'DE',19,47,8,154,382,455,'20:00',NULL,'2:3','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,540,0.00,0.00,0.00,0.00,0.00),(455,20087,1000,NULL,NULL,307,'2010-01-12',408,'CH',19,413,1,258,403,479,'19:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,538,0.00,0.00,0.00,0.00,0.00),(456,30748,8000,NULL,NULL,105,'2009-12-12',53,'DE',1,62,1,435,403,34,'15:30',NULL,'1:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'',0.00,537,0.00,0.00,0.00,0.00,0.00),(457,27044,1500,NULL,NULL,308,'2009-12-08',365,'IT',8,246,1,436,403,478,'20:45',NULL,'1:4','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 6. Spieltag',NULL,'',0.00,536,0.00,0.00,0.00,0.00,0.00),(458,49000,10000,NULL,NULL,21,'2009-11-29',141,'DE',1,53,1,437,403,63,'17:30',18,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'',0.00,535,0.00,0.00,0.00,0.00,0.00),(459,1100,100,NULL,NULL,260,'2009-11-28',70,'DE',75,152,115,438,276,146,'14:00',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,534,0.00,0.00,0.00,0.00,0.00),(460,20,0,NULL,NULL,285,'2009-11-27',449,'DE',77,450,362,154,154,649,'19:30',NULL,'4:3','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,533,0.00,0.00,0.00,0.00,0.00),(461,242,20,NULL,NULL,309,'2009-11-22',42,'DE',96,451,330,439,429,192,'14:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,532,0.00,0.00,0.00,0.00,0.00),(462,150,7,'erstes Spiel im neuen Stadion.',NULL,310,'2016-01-21',449,'DE',19,8,452,72,440,654,'19:30',NULL,'3:0','1:0',NULL,3.86,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,966,0.00,0.00,0.00,0.00,0.00),(463,50,0,NULL,NULL,311,'2009-11-22',42,'DE',123,453,454,154,154,477,'10:45',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,531,0.00,0.00,0.00,0.00,0.00),(464,271,60,NULL,NULL,312,'2009-11-20',449,'DE',22,7,8,300,8,4,'19:00',NULL,'6:2','3:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,530,0.00,0.00,0.00,0.00,0.00),(465,308,0,NULL,NULL,11,'2009-11-15',449,'DE',22,8,220,8,231,21,'14:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,529,0.00,0.00,0.00,0.00,0.00),(466,155,20,NULL,NULL,313,'2009-11-08',449,'DE',22,281,8,396,8,119,'12:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,528,0.00,0.00,0.00,0.00,0.00),(467,248,0,NULL,NULL,314,'2009-11-01',449,'DE',22,8,270,8,87,21,'14:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,527,0.00,0.00,0.00,0.00,0.00),(468,57000,8000,NULL,NULL,75,'2016-01-22',449,'DE',1,57,1,74,1,45,'20:30',NULL,'1:2','0:1',NULL,4.44,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'',43.00,967,0.00,0.00,0.00,0.00,0.00),(469,4,0,NULL,NULL,315,'2009-11-01',449,'DE',56,455,456,154,154,476,'10:45',NULL,'0:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,526,0.00,0.00,0.00,0.00,0.00),(470,34000,5000,NULL,NULL,316,'2009-10-21',346,'FR',8,457,1,441,403,475,'20:45',NULL,'2:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 3. Spieltag',NULL,'',0.00,525,0.00,0.00,0.00,0.00,0.00),(471,24000,3000,NULL,NULL,56,'2009-10-17',120,'DE',1,58,1,194,403,69,'15:30',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'',0.00,524,0.00,0.00,0.00,0.00,0.00),(472,180,40,NULL,NULL,243,'2009-10-11',449,'DE',22,102,8,432,8,73,'15:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,523,0.00,0.00,0.00,0.00,0.00),(473,150,30,NULL,NULL,119,'2009-09-27',449,'DE',22,9,8,327,8,22,'10:45',NULL,'2:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,522,0.00,0.00,0.00,0.00,0.00),(474,57000,6000,NULL,NULL,45,'2009-09-26',449,'DE',1,57,1,74,403,45,'18:30',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,521,0.00,0.00,0.00,0.00,0.00),(475,70,0,NULL,NULL,222,'2009-09-26',449,'DE',58,16,331,376,154,21,'14:00',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,520,0.00,0.00,0.00,0.00,0.00),(476,248,0,NULL,NULL,317,'2009-09-13',449,'DE',22,8,211,8,221,21,'14:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,519,0.00,0.00,0.00,0.00,0.00),(477,120,0,NULL,NULL,243,'2009-09-06',449,'DE',45,458,117,154,154,474,'16:45',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,518,0.00,0.00,0.00,0.00,0.00),(478,593,50,NULL,NULL,318,'2009-09-06',449,'DE',22,44,8,283,8,35,'14:00',NULL,'3:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,517,0.00,0.00,0.00,0.00,0.00),(479,69000,3000,NULL,NULL,320,'2009-08-29',220,'DE',1,1,61,403,121,9,'18:30',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'',0.00,516,0.00,0.00,0.00,0.00,0.00),(480,1800,50,NULL,NULL,60,'2009-08-29',220,'DE',75,115,459,276,442,44,'14:00',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,515,0.00,0.00,0.00,0.00,0.00),(481,65,0,NULL,NULL,321,'2009-08-28',449,'DE',108,205,283,154,154,473,'19:30',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,514,0.00,0.00,0.00,0.00,0.00),(482,20300,2000,NULL,NULL,21,'2009-08-22',205,'DE',1,20,1,202,403,313,'15:30',NULL,'2:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'',0.00,513,0.00,0.00,0.00,0.00,0.00),(483,30,0,NULL,NULL,322,'2009-08-09',449,'DE',71,460,461,154,154,472,'10:45',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,512,0.00,0.00,0.00,0.00,0.00),(484,30150,5000,NULL,NULL,323,'2009-08-08',303,'DE',1,276,1,357,403,458,'18:30',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'',0.00,511,0.00,0.00,0.00,0.00,0.00),(486,1901,10,NULL,NULL,324,'2009-08-08',336,'DE',26,462,463,443,444,471,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,510,0.00,0.00,0.00,0.00,0.00),(487,60,0,NULL,NULL,302,'2009-08-07',449,'DE',66,464,465,154,154,470,'19:30',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,509,0.00,0.00,0.00,0.00,0.00),(488,50,0,NULL,NULL,325,'2009-08-06',449,'DE',16,466,283,154,154,153,'19:00',NULL,'3:9','3:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,508,0.00,0.00,0.00,0.00,0.00),(489,108,60,NULL,NULL,252,'2009-08-04',449,'DE',16,467,8,154,8,324,'18:30',NULL,'3:5','2:3','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,507,0.00,0.00,0.00,0.00,0.00),(490,30017,10000,NULL,NULL,326,'2009-08-02',303,'DE',7,468,1,445,403,458,'17:30',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,506,0.00,0.00,0.00,0.00,0.00),(491,300,50,NULL,NULL,327,'2009-08-02',116,'DE',124,469,470,446,447,469,'14:00',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,505,0.00,0.00,0.00,0.00,0.00),(492,80,0,NULL,NULL,328,'2009-08-02',298,'DE',19,471,472,154,154,468,'11:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,504,0.00,0.00,0.00,0.00,0.00),(493,150,0,NULL,NULL,116,'2009-08-01',327,'DE',125,473,474,154,154,467,'18:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,503,0.00,0.00,0.00,0.00,0.00),(494,1250,30,NULL,NULL,329,'2009-08-01',28,'DE',19,475,115,154,276,466,'14:00',NULL,'3:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,502,0.00,0.00,0.00,0.00,0.00),(495,2351,70,NULL,NULL,330,'2009-07-31',211,'DE',19,476,1,154,276,464,'18:00',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,500,0.00,0.00,0.00,0.00,0.00),(496,2030,0,NULL,NULL,116,'2009-08-01',421,'CZ',126,478,477,154,154,465,'10:15',NULL,'4:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,501,0.00,0.00,0.00,0.00,0.00),(497,130,40,NULL,NULL,253,'2009-07-26',235,'DE',16,198,8,154,8,655,'15:00',NULL,'1:3','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,499,0.00,0.00,0.00,0.00,0.00),(498,40,0,NULL,NULL,331,'2009-07-21',449,'DE',19,16,466,376,154,370,'19:30',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Heiner-Stacklies-Pokal',NULL,'\0',0.00,498,0.00,0.00,0.00,0.00,0.00),(499,60,25,NULL,NULL,332,'2009-07-16',449,'DE',19,479,8,154,154,51,'19:30',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'\"Paloma-Cup\", Vorrunde',NULL,'\0',0.00,497,0.00,0.00,0.00,0.00,0.00),(500,100,0,'Gespielt wurde 45 Minuten im Turniermodus',NULL,116,'2009-07-13',324,'DE',19,8,480,8,154,463,'11:00',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Jubiläumsturnier \"25 Jahre SV Wendisch Evern\"',NULL,'\0',0.00,494,0.00,0.00,0.00,0.00,0.00),(501,75000,1000,NULL,NULL,158,'2016-01-31',220,'DE',1,1,276,1,448,9,'17:30',NULL,'2:0','1:0',NULL,2.18,64.40,0.00,0.00,22.27,0.00,'19. Spieltag',NULL,'',21.40,970,0.00,0.00,0.00,0.00,0.00),(502,30,0,NULL,NULL,116,'2016-01-29',220,'DE',19,481,482,154,449,656,'12:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,968,0.00,0.00,0.00,0.00,0.00),(503,27,6,NULL,NULL,116,'2016-01-31',220,'DE',19,484,483,451,317,656,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,969,0.00,0.00,0.00,0.00,0.00),(504,100,0,'Gespielt wurde im Turniermodus a 45 Minuten',NULL,116,'2009-07-13',324,'DE',19,485,480,154,154,463,'12:00',NULL,'2:2','2:2','i. E.',0.00,0.00,0.00,0.00,0.00,0.00,'Jubiläumsturnier \"25 Jahre SV Wendisch Evern\"','5:4','\0',0.00,495,0.00,0.00,0.00,0.00,0.00),(505,100,9,NULL,NULL,116,'2009-07-13',324,'DE',19,485,8,154,8,463,'13:00',NULL,'0:3','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Jubiläumsturnier \"25 Jahre SV Wendisch Evern\"',NULL,'\0',0.00,496,0.00,0.00,0.00,0.00,0.00),(506,70,20,NULL,NULL,333,'2009-07-05',39,'DE',19,398,8,154,8,346,'14:00',NULL,'3:3','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,493,0.00,0.00,0.00,0.00,0.00),(507,65,30,NULL,NULL,116,'2009-06-28',235,'DE',19,138,8,154,8,282,'15:00',NULL,'6:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,492,0.00,0.00,0.00,0.00,0.00),(508,632,100,NULL,NULL,75,'2009-06-21',333,'DE',127,486,365,453,365,462,'11:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale (Rückspiel)',NULL,'\0',0.00,491,0.00,0.00,0.00,0.00,0.00),(509,1700,700,NULL,NULL,334,'2009-06-07',88,'DE',96,487,330,454,429,461,'14:00',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,490,0.00,0.00,0.00,0.00,0.00),(510,9000,500,NULL,NULL,335,'2009-05-31',384,'NL',19,488,1,455,246,460,'15:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Benefizspiel',NULL,'\0',0.00,489,0.00,0.00,0.00,0.00,0.00),(511,69000,6900,NULL,NULL,105,'2009-05-23',220,'DE',1,1,104,246,289,9,'15:30',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'',0.00,488,0.00,0.00,0.00,0.00,0.00),(512,700,300,NULL,NULL,336,'2009-05-20',212,'DE',128,489,46,154,154,459,'18:30',NULL,'0:5','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'\0',0.00,487,0.00,0.00,0.00,0.00,0.00),(513,171,0,NULL,NULL,292,'2009-05-17',449,'DE',22,8,41,188,456,21,'15:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,486,0.00,0.00,0.00,0.00,0.00),(514,30150,5000,NULL,NULL,45,'2009-05-16',303,'DE',1,276,1,357,246,458,'15:30',NULL,'2:2','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,485,0.00,0.00,0.00,0.00,0.00),(515,500,30,NULL,NULL,334,'2009-05-10',449,'DE',96,329,330,333,429,72,'14:00',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,484,0.00,0.00,0.00,0.00,0.00),(516,22500,3000,NULL,NULL,125,'2009-05-09',86,'DE',1,490,1,457,246,178,'15:30',NULL,'1:3','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'',0.00,483,0.00,0.00,0.00,0.00,0.00),(517,150,50,NULL,NULL,256,'2009-05-08',449,'DE',22,452,8,434,188,25,'19:30',NULL,'1:5','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,482,0.00,0.00,0.00,0.00,0.00),(518,148,0,NULL,NULL,337,'2009-05-05',449,'DE',22,8,71,188,71,21,'18:45',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,481,0.00,0.00,0.00,0.00,0.00),(519,204,0,NULL,NULL,262,'2009-05-03',449,'DE',22,8,449,188,458,21,'15:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,480,0.00,0.00,0.00,0.00,0.00),(520,267,15,NULL,NULL,140,'2009-04-21',77,'DE',22,211,8,221,188,232,'18:30',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,479,0.00,0.00,0.00,0.00,0.00),(522,27300,3000,NULL,NULL,105,'2009-04-18',51,'DE',1,433,1,286,NULL,56,'15:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'',0.00,478,0.00,0.00,0.00,0.00,0.00),(523,120,0,NULL,NULL,338,'2009-04-15',449,'DE',91,491,314,154,154,162,'18:00',NULL,'2:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,477,0.00,0.00,0.00,0.00,0.00),(524,618,300,NULL,NULL,339,'2009-04-13',449,'DE',22,8,131,188,416,21,'15:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,476,0.00,0.00,0.00,0.00,0.00),(525,2200,30,NULL,NULL,340,'2009-04-11',108,'DE',75,492,90,460,247,279,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,475,0.00,0.00,0.00,0.00,0.00),(526,93219,5000,NULL,NULL,289,'2009-04-08',414,'ES',8,24,1,1,459,12,'20:45',NULL,'4:0','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Hinspiel)',NULL,'\0',0.00,474,0.00,0.00,0.00,0.00,0.00),(527,28000,3000,NULL,NULL,57,'2016-02-10',53,'DE',7,62,1,58,1,34,'20:30',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,6.70,0.00,'Viertelfinale',NULL,'',40.50,971,0.00,0.00,0.00,0.00,0.00),(528,288,0,NULL,NULL,341,'2009-04-05',449,'DE',22,8,9,188,461,21,'15:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,473,0.00,0.00,0.00,0.00,0.00),(529,35000,500,NULL,NULL,116,'2009-03-22',425,'TN',129,493,494,154,154,457,'16:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,472,0.00,0.00,0.00,0.00,0.00),(530,100,0,NULL,NULL,342,'2009-03-18',70,'DE',30,267,495,462,463,223,'16:00',NULL,'2:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,471,0.00,0.00,0.00,0.00,0.00),(531,800,100,NULL,NULL,343,'2009-03-13',70,'DE',75,152,115,438,399,146,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,470,0.00,0.00,0.00,0.00,0.00),(532,218,0,NULL,NULL,40,'2009-03-08',449,'DE',22,8,355,188,464,21,'15:00',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,469,0.00,0.00,0.00,0.00,0.00),(533,30,5,NULL,NULL,344,'2009-03-04',25,'DE',69,496,16,154,376,148,'19:30',NULL,'2:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,468,0.00,0.00,0.00,0.00,0.00),(534,130,15,NULL,NULL,184,'2009-03-03',276,'DE',22,108,8,465,188,392,'19:30',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,467,0.00,0.00,0.00,0.00,0.00),(535,150,30,NULL,NULL,345,'2009-03-01',449,'DE',22,497,8,396,188,119,'15:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,466,0.00,0.00,0.00,0.00,0.00),(536,35163,4000,NULL,NULL,346,'2009-02-25',395,'PT',8,498,1,466,459,456,'20:45',NULL,'0:5','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,465,0.00,0.00,0.00,0.00,0.00),(537,50,6,NULL,NULL,116,'2009-02-22',449,'DE',19,47,8,154,188,455,'15:00',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,464,0.00,0.00,0.00,0.00,0.00),(538,74244,8000,NULL,NULL,105,'2009-02-14',42,'DE',1,30,1,136,459,37,'15:30',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'',0.00,463,0.00,0.00,0.00,0.00,0.00),(539,180,0,NULL,NULL,314,'2009-02-08',449,'DE',22,8,102,188,432,21,'15:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,462,0.00,0.00,0.00,0.00,0.00),(540,20,9,NULL,NULL,116,'2009-01-24',449,'DE',19,181,8,154,188,299,'14:00',NULL,'2:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,461,0.00,0.00,0.00,0.00,0.00),(541,20,8,NULL,NULL,116,'2009-01-20',317,'DE',19,280,8,154,188,454,'19:30',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,460,0.00,0.00,0.00,0.00,0.00),(542,12000,27,NULL,NULL,116,'2009-01-12',406,'SA',19,499,1,NULL,NULL,453,'18:45',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,459,0.00,0.00,0.00,0.00,0.00),(543,6000,50,NULL,NULL,116,'2009-01-11',391,'OM',130,500,501,467,469,452,'18:00',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spiel (Gruppenphase)',NULL,'\0',0.00,458,0.00,0.00,0.00,0.00,0.00),(544,105,0,NULL,NULL,144,'2008-12-13',449,'DE',16,8,211,188,221,21,'13:00',NULL,'1:2','0:1','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,456,0.00,0.00,0.00,0.00,0.00),(545,38349,4000,NULL,NULL,289,'2008-12-10',347,'FR',8,502,1,468,459,451,'20:45',NULL,'2:3','2:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 6. Spieltag',NULL,'\0',0.00,455,0.00,0.00,0.00,0.00,0.00),(546,100,3,NULL,NULL,349,'2008-12-06',42,'DE',30,495,503,463,470,450,'14:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,454,0.00,0.00,0.00,0.00,0.00),(547,10,0,NULL,NULL,350,'2008-11-28',449,'DE',77,504,505,154,154,449,'19:00',NULL,'6:2','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,453,0.00,0.00,0.00,0.00,0.00),(548,54067,5400,NULL,NULL,45,'2008-12-15',213,'DE',1,81,1,471,459,275,'15:30',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'',0.00,457,0.00,0.00,0.00,0.00,0.00),(549,54067,5400,NULL,NULL,45,'2008-11-15',213,'DE',1,81,1,471,459,275,'15:30',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'',0.00,452,0.00,0.00,0.00,0.00,0.00),(550,280,0,NULL,NULL,351,'2008-11-09',449,'DE',22,8,7,188,300,21,'14:00',NULL,'1:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,451,0.00,0.00,0.00,0.00,0.00),(551,37034,2000,NULL,NULL,44,'2008-11-05',361,'IT',8,506,1,472,459,448,'20:45',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'',0.00,450,0.00,0.00,0.00,0.00,0.00),(552,66000,3300,NULL,NULL,234,'2008-10-21',220,'DE',8,1,506,459,472,9,'20:45',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 3. Spieltag',NULL,'',0.00,448,0.00,0.00,0.00,0.00,0.00),(553,150,0,NULL,NULL,87,'2008-10-26',449,'DE',22,8,452,188,434,21,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,449,0.00,0.00,0.00,0.00,0.00),(554,245,50,NULL,NULL,36,'2008-10-19',449,'DE',22,449,8,458,188,135,'15:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,447,0.00,0.00,0.00,0.00,0.00),(555,30,0,NULL,NULL,352,'2008-10-19',307,'DE',71,507,381,154,154,447,'12:30',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,446,0.00,0.00,0.00,0.00,0.00),(556,30500,5000,NULL,NULL,105,'2008-10-18',168,'DE',1,508,1,473,459,446,'15:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'',0.00,445,0.00,0.00,0.00,0.00,0.00),(557,260,0,NULL,NULL,193,'2008-10-12',449,'DE',22,8,153,188,474,21,'15:00',NULL,'3:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,444,0.00,0.00,0.00,0.00,0.00),(558,210,100,NULL,NULL,353,'2008-09-28',449,'DE',22,9,8,461,188,22,'10:45',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,443,0.00,0.00,0.00,0.00,0.00),(559,49000,5000,NULL,NULL,125,'2008-09-27',141,'DE',1,53,1,57,459,63,'15:30',18,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'',0.00,442,0.00,0.00,0.00,0.00,0.00),(560,40,0,NULL,NULL,354,'2008-09-23',154,'DE',80,509,510,154,154,14,'19:00',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,441,0.00,0.00,0.00,0.00,0.00),(561,310,0,NULL,NULL,294,'2008-09-21',449,'DE',22,8,211,188,221,21,'15:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,440,0.00,0.00,0.00,0.00,0.00),(562,250,30,NULL,NULL,345,'2008-09-12',275,'DE',22,233,8,20,188,238,'19:30',NULL,'2:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,439,0.00,0.00,0.00,0.00,0.00),(563,38000,3000,NULL,NULL,170,'2008-09-10',345,'FI',132,511,512,475,476,445,'19:35',NULL,'3:3','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Europa (Gruppe 4), Spiel 2',NULL,'\0',0.00,438,0.00,0.00,0.00,0.00,0.00),(564,350,0,NULL,NULL,355,'2008-09-07',449,'DE',22,8,121,188,39,21,'15:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,437,0.00,0.00,0.00,0.00,0.00),(565,30,0,NULL,NULL,356,'2008-09-05',146,'DE',133,514,513,154,154,444,'19:30',NULL,'4:1','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,436,0.00,0.00,0.00,0.00,0.00),(566,320,0,NULL,NULL,251,'2008-08-24',449,'DE',22,8,497,188,477,21,'15:00',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,435,0.00,0.00,0.00,0.00,0.00),(567,250,30,NULL,NULL,337,'2008-08-19',449,'DE',16,121,8,39,188,294,'18:00',NULL,'1:3','1:1','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,434,0.00,0.00,0.00,0.00,0.00),(568,69000,6900,NULL,NULL,21,'2008-08-15',220,'DE',1,1,57,459,478,9,'20:30',NULL,'2:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'',0.00,433,0.00,0.00,0.00,0.00,0.00),(569,170,40,NULL,NULL,286,'2008-08-12',449,'DE',16,515,8,154,188,130,'18:15',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,432,0.00,0.00,0.00,0.00,0.00),(570,230,0,NULL,NULL,357,'2008-08-10',449,'DE',22,8,108,188,124,21,'15:00',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,431,0.00,0.00,0.00,0.00,0.00),(571,130,50,NULL,NULL,358,'2008-08-03',449,'DE',16,516,8,154,188,214,'15:00',NULL,'0:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,430,0.00,0.00,0.00,0.00,0.00),(572,40,0,NULL,NULL,359,'2008-08-03',189,'DE',16,517,380,154,154,443,'12:00',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,429,0.00,0.00,0.00,0.00,0.00),(573,20,0,NULL,NULL,254,'2008-08-03',449,'DE',16,373,518,154,154,442,'09:30',NULL,'0:6','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,428,0.00,0.00,0.00,0.00,0.00),(574,600,0,NULL,NULL,116,'2008-08-02',152,'DE',19,224,519,479,154,441,'18:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Cranger-Kirmes-Cup, Finale',NULL,'\0',0.00,427,0.00,0.00,0.00,0.00,0.00),(575,150,0,NULL,NULL,116,'2008-08-02',152,'DE',19,520,521,154,480,441,'16:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Cranger-Kirmes-Cup, Spiel um Platz 3',NULL,'\0',0.00,426,0.00,0.00,0.00,0.00,0.00),(576,6281,200,NULL,NULL,21,'2008-08-02',337,'DE',75,459,115,481,399,277,'14:00',NULL,'2:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,425,0.00,0.00,0.00,0.00,0.00),(577,70,0,NULL,NULL,116,'2008-08-02',110,'DE',19,365,522,154,154,440,'10:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Internationaler Reisebüro Waschke Mercure Cup',NULL,'\0',0.00,424,0.00,0.00,0.00,0.00,0.00),(578,40,20,NULL,NULL,116,'2008-07-22',90,'DE',19,23,8,154,188,11,'19:30',NULL,'1:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,422,0.00,0.00,0.00,0.00,0.00),(579,30,0,NULL,NULL,116,'2008-07-20',68,'DE',19,523,524,154,154,438,'10:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,421,0.00,0.00,0.00,0.00,0.00),(580,80,40,'Verspätete Ankunft am Platz nach Rückfahrt aus Zarpen',NULL,294,'2008-07-19',449,'DE',19,208,8,291,188,51,'19:00',NULL,'2:3','2:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Heiner Stacklies-Cup, Finale',NULL,'\0',0.00,420,0.00,0.00,0.00,0.00,0.00),(581,400,100,NULL,NULL,116,'2008-07-19',338,'DE',19,525,46,154,NULL,437,'17:00',NULL,'0:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,419,0.00,0.00,0.00,0.00,0.00),(582,1500,0,NULL,NULL,116,'2008-08-01',385,'NL',19,526,527,154,154,439,'20:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,423,0.00,0.00,0.00,0.00,0.00),(583,29342,1000,NULL,NULL,108,'2016-02-19',449,'DE',2,101,238,106,261,54,'18:30',NULL,'1:3','1:2',NULL,0.00,0.00,0.00,0.00,10.00,0.00,'22. Spieltag',NULL,'\0',0.00,972,0.00,0.00,0.00,0.00,0.00),(584,75000,5000,NULL,'<br>',45,'2016-02-20',220,'DE',1,1,97,1,104,9,'15:30',NULL,'3:1','0:1',NULL,55.89,0.00,0.00,0.00,31.48,0.00,'22. Spieltag',NULL,'',26.40,973,0.00,0.00,33.00,0.00,0.00),(585,50,10,NULL,NULL,116,'2008-07-19',315,'DE',19,129,44,154,76,436,'15:00',NULL,'2:4','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Jürgen-Frahm-Gedächtnisturnier (Vorrunde)',NULL,'\0',0.00,418,0.00,0.00,0.00,0.00,0.00),(586,16816,0,NULL,NULL,116,'2008-07-18',449,'DE',19,101,528,484,483,54,'19:00',NULL,'7:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,417,0.00,0.00,0.00,0.00,0.00),(587,100,30,NULL,NULL,360,'2008-07-15',449,'DE',19,452,8,434,188,51,'19:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Heiner-Stacklies-Pokal (2. Spiel)',NULL,'\0',0.00,416,0.00,0.00,0.00,0.00,0.00),(589,100,30,NULL,NULL,361,'2008-07-12',449,'DE',19,448,8,485,188,51,'15:00',NULL,'2:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Heiner-Stacklies-Pokal (1. Spiel)',NULL,'\0',0.00,415,0.00,0.00,0.00,0.00,0.00),(590,16,3,NULL,NULL,116,'2008-07-10',449,'DE',19,529,16,154,376,369,'18:15',NULL,'3:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'SCALA-Phönikks-Pokal',NULL,'\0',0.00,414,0.00,0.00,0.00,0.00,0.00),(591,300,150,NULL,NULL,116,'2008-06-04',449,'DE',50,530,531,154,154,85,'19:00',NULL,'0:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,413,0.00,0.00,0.00,0.00,0.00),(592,130000,25,NULL,NULL,362,'2008-05-27',353,'IN',19,532,1,486,487,435,'18:15',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Abschiedsspiel Oliver Kahn',NULL,'',0.00,412,0.00,0.00,0.00,0.00,0.00),(593,400,30,NULL,NULL,363,'2008-05-18',77,'DE',134,211,8,221,188,232,'15:00',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,411,0.00,0.00,0.00,0.00,0.00),(594,36,0,NULL,NULL,116,'2008-05-17',449,'DE',58,16,291,376,154,21,'16:00',NULL,'3:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,410,0.00,0.00,0.00,0.00,0.00),(595,1819,0,NULL,NULL,364,'2008-05-13',449,'DE',16,131,497,148,489,4,'19:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,409,0.00,0.00,0.00,0.00,0.00),(596,50,0,NULL,NULL,116,'2008-05-10',1079,'DE',135,533,534,154,154,434,'15:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,408,0.00,0.00,0.00,0.00,0.00),(597,1100,30,NULL,NULL,116,'2008-05-01',202,'DE',136,535,536,154,154,58,'15:00',NULL,'1:1','1:1','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Finale','8:9','\0',0.00,407,0.00,0.00,0.00,0.00,0.00),(598,66000,3300,NULL,NULL,365,'2008-04-24',220,'DE',140,1,537,487,490,9,'20:45',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL,'',0.00,406,0.00,0.00,0.00,0.00,0.00),(599,74244,22000,NULL,NULL,125,'2008-04-19',42,'DE',7,72,1,491,487,37,'20:00',NULL,'1:2','0:1','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,405,0.00,0.00,0.00,0.00,0.00),(600,184,0,NULL,NULL,116,'2008-04-19',42,'DE',137,538,539,154,154,433,'14:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,404,0.00,0.00,0.00,0.00,0.00),(601,2500,0,NULL,NULL,366,'2008-04-18',195,'DE',30,46,540,442,493,79,'19:00',NULL,'0:4','0:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,403,0.00,0.00,0.00,0.00,0.00),(602,170,0,NULL,NULL,368,'2008-04-15',449,'DE',134,8,452,188,434,21,'18:30',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL,'\0',0.00,402,0.00,0.00,0.00,0.00,0.00),(603,100,20,NULL,NULL,48,'2008-04-13',259,'DE',134,273,8,287,188,101,'15:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,401,0.00,0.00,0.00,0.00,0.00),(604,250,0,NULL,NULL,360,'2008-04-06',449,'DE',134,8,7,188,300,21,'15:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,400,0.00,0.00,0.00,0.00,0.00),(605,500,30,NULL,NULL,369,'2008-03-30',449,'DE',96,329,330,333,494,72,'14:00',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,399,0.00,0.00,0.00,0.00,0.00),(606,10856,5000,NULL,NULL,116,'2008-03-22',413,'SK',139,541,542,495,496,431,'17:00',NULL,'2:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,398,0.00,0.00,0.00,0.00,0.00),(607,80,0,NULL,NULL,116,'2008-03-16',449,'DE',108,448,380,154,154,105,'10:45',NULL,'3:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,397,0.00,0.00,0.00,0.00,0.00),(608,22743,3000,NULL,NULL,21,'2008-03-15',86,'DE',1,490,1,457,487,178,'15:30',NULL,'2:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'',0.00,396,0.00,0.00,0.00,0.00,0.00),(609,40,0,NULL,NULL,116,'2008-03-07',31,'DE',108,354,543,NULL,NULL,401,'19:30',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,395,0.00,0.00,0.00,0.00,0.00),(611,21000,1500,NULL,NULL,234,'2008-03-06',6,'BE',140,544,1,497,487,93,'19:00',NULL,'0:5','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,394,0.00,0.00,0.00,0.00,0.00),(612,646,2,NULL,'<br>',22,'2016-02-27',333,'DE',30,545,174,498,499,657,'12:00',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,29.10,0.00,'23. Spieltag',NULL,'\0',8.00,974,0.00,0.00,0.00,0.00,0.00),(613,30000,3500,NULL,'<br>',56,'2016-02-27',333,'DE',1,61,1,57,1,33,'15:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'',40.00,975,0.00,0.00,0.00,0.00,0.00),(614,120,30,NULL,NULL,256,'2008-03-02',449,'DE',134,41,8,456,188,215,'14:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,393,0.00,0.00,0.00,0.00,0.00),(615,69000,6900,NULL,NULL,370,'2008-02-24',220,'DE',1,1,57,487,448,9,'17:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'',0.00,392,0.00,0.00,0.00,0.00,0.00),(616,400,50,NULL,NULL,116,'2008-02-24',220,'DE',141,546,263,154,265,430,'14:00',NULL,'1:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,391,0.00,0.00,0.00,0.00,0.00),(617,20047,1000,NULL,NULL,371,'2008-02-14',410,'SS',140,547,1,500,487,179,'19:00',NULL,'2:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Zwischenrunde, Hinspiel',NULL,'\0',0.00,390,0.00,0.00,0.00,0.00,0.00),(618,21,0,NULL,NULL,116,'2008-02-10',124,'DE',82,548,550,154,154,428,'12:00',NULL,'3:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,388,0.00,0.00,0.00,0.00,0.00),(619,300,0,NULL,NULL,116,'2008-02-10',124,'DE',16,549,71,154,154,429,'14:00',NULL,'0:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale','3:1','\0',0.00,389,0.00,0.00,0.00,0.00,0.00),(620,201,100,NULL,'<br>',116,'2008-02-09',449,'DE',16,551,8,154,188,153,'14:00',NULL,'0:0','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale','3:1','\0',0.00,387,0.00,0.00,0.00,0.00,0.00),(621,29000,2900,NULL,NULL,105,'2008-02-01',280,'DE',1,264,1,501,487,57,'20:30',NULL,'1:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,386,0.00,0.00,0.00,0.00,0.00),(622,25421,15000,NULL,NULL,320,'2008-01-09',29,'DE',19,237,1,502,487,427,'19:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,385,0.00,0.00,0.00,0.00,0.00),(623,50,10,NULL,NULL,48,'2007-12-15',449,'DE',134,359,8,503,188,382,'14:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,384,0.00,0.00,0.00,0.00,0.00),(624,23800,3000,NULL,NULL,45,'2007-12-02',51,'DE',1,433,1,504,487,56,'17:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'',0.00,382,0.00,0.00,0.00,0.00,0.00),(625,200,0,NULL,NULL,116,'2007-12-02',151,'DE',142,552,553,154,154,426,'14:15',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,381,0.00,0.00,0.00,0.00,0.00),(626,10000,800,NULL,NULL,62,'2007-11-29',394,'PT',140,554,1,505,487,425,'21:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Gruppenphase, 3. Spieltag',NULL,'\0',0.00,380,0.00,0.00,0.00,0.00,0.00),(627,150,15,NULL,NULL,372,'2007-11-25',139,'DE',134,153,8,NULL,NULL,133,'14:00',NULL,'3:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,379,0.00,0.00,0.00,0.00,0.00),(628,330,15,NULL,NULL,99,'2007-11-18',449,'DE',134,8,270,188,87,21,'14:00',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,378,0.00,0.00,0.00,0.00,0.00),(629,55600,6000,NULL,NULL,21,'2007-11-10',310,'DE',1,104,1,121,487,315,'15:30',NULL,'3:1','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'',0.00,377,0.00,0.00,0.00,0.00,0.00),(630,600,20,NULL,NULL,373,'2007-11-10',310,'DE',103,257,366,507,508,424,'11:30',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,376,0.00,0.00,0.00,0.00,0.00),(631,15,0,NULL,NULL,116,'2007-12-15',449,'DE',46,555,556,154,154,382,'12:00',NULL,'2:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,383,0.00,0.00,0.00,0.00,0.00),(632,50,0,NULL,NULL,116,'2007-11-01',215,'DE',133,428,133,154,154,423,'19:30',NULL,'2:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,375,0.00,0.00,0.00,0.00,0.00),(634,20374,150,NULL,NULL,374,'2007-10-20',369,'CA',143,557,558,509,510,422,'15:30',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,374,0.00,0.00,0.00,0.00,0.00),(635,80,0,NULL,NULL,116,'2007-10-06',209,'DE',51,559,560,154,154,421,'18:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,373,0.00,0.00,0.00,0.00,0.00),(636,175,30,NULL,NULL,11,'2007-10-06',449,'DE',134,123,8,511,188,240,'15:00',NULL,'3:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,372,0.00,0.00,0.00,0.00,0.00),(637,7000,1000,NULL,NULL,375,'2007-10-04',395,'PT',140,561,1,512,487,420,'20:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde (Rückspiel)',NULL,'\0',0.00,371,0.00,0.00,0.00,0.00,0.00),(638,536,20,NULL,NULL,376,'2016-03-05',178,'DE',26,562,563,513,514,658,'14:00',NULL,'5:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',17.00,976,0.00,0.00,0.00,0.00,0.00),(639,81359,8000,' ',NULL,136,'2016-03-05',92,'DE',1,72,1,202,1,55,'18:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'',39.00,977,0.00,0.00,45.00,0.00,0.00),(640,34647,100,NULL,NULL,377,'2007-10-03',395,'PT',8,564,56,516,54,419,'20:45',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 2. Spieltag',NULL,'\0',0.00,370,0.00,0.00,0.00,0.00,0.00),(641,200,50,NULL,NULL,116,'2007-10-02',449,'DE',16,447,8,154,188,242,'19:15',NULL,'0:6','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,369,0.00,0.00,0.00,0.00,0.00),(642,200,0,NULL,NULL,360,'2007-09-30',449,'DE',134,8,273,188,287,21,'15:00',NULL,'4:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,368,0.00,0.00,0.00,0.00,0.00),(643,350,0,NULL,NULL,378,'2007-09-16',449,'DE',134,8,233,188,20,21,'15:00',NULL,'1:5','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,367,0.00,0.00,0.00,0.00,0.00),(644,31000,2000,NULL,NULL,379,'2007-09-08',434,'WW',132,565,512,517,476,418,'20:30',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag (Gruppe D)',NULL,'\0',0.00,366,0.00,0.00,0.00,0.00,0.00),(645,57000,7000,NULL,NULL,105,'2007-09-02',449,'DE',1,57,1,448,487,45,'17:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'',0.00,365,0.00,0.00,0.00,0.00,0.00),(646,350,0,NULL,NULL,116,'2007-09-02',449,'DE',134,8,121,188,39,21,'14:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,364,0.00,0.00,0.00,0.00,0.00),(647,120,25,NULL,NULL,116,'2007-08-28',449,'DE',16,566,8,154,188,326,'19:00',NULL,'1:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,363,0.00,0.00,0.00,0.00,0.00),(648,800,20,NULL,NULL,380,'2007-08-26',220,'DE',103,115,567,399,518,44,'15:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,362,0.00,0.00,0.00,0.00,0.00),(649,69000,5000,NULL,NULL,21,'2007-08-25',220,'DE',1,1,53,487,57,9,'15:30',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'',0.00,361,0.00,0.00,0.00,0.00,0.00),(650,86100,8000,NULL,NULL,308,'2007-08-22',339,'EN',19,568,512,519,476,417,'21:00',NULL,'1:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,360,0.00,0.00,0.00,0.00,0.00),(651,90,30,NULL,NULL,116,'2007-08-15',449,'DE',16,529,8,154,188,320,'18:00',NULL,'1:8','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,359,0.00,0.00,0.00,0.00,0.00),(652,540,40,NULL,NULL,372,'2007-08-12',449,'DE',134,8,355,188,356,21,'15:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,358,0.00,0.00,0.00,0.00,0.00),(653,22000,150,NULL,NULL,116,'2007-08-07',416,'ES',19,569,1,520,487,416,'22:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,357,0.00,0.00,0.00,0.00,0.00),(654,870,150,NULL,NULL,364,'2007-07-27',235,'DE',134,270,8,87,188,31,'19:30',NULL,'3:3','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,356,0.00,0.00,0.00,0.00,0.00),(655,80,50,'Das Erstrundenspiel des Oddset-Pokals wurde bei Stand von 0:8 in der 70. Spielminute abgebrochen und am 9.8 neu angesetzt.',NULL,116,'2007-07-24',449,'DE',46,467,8,154,188,324,'19:00',NULL,'0:8','0:6',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,355,0.00,0.00,0.00,0.00,0.00),(656,51500,5000,NULL,NULL,21,'2007-07-21',98,'DE',144,52,1,35,487,415,'18:00',NULL,'1:4','1:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde',NULL,'',0.00,354,0.00,0.00,0.00,0.00,0.00),(657,630,0,NULL,NULL,NULL,'2007-07-20',184,'DE',145,492,570,460,55,414,'20:00',NULL,'5:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 2. Spieltag',NULL,'\0',0.00,353,0.00,0.00,0.00,0.00,0.00),(658,7300,1000,'Stadion Breite zum ersten mal ausverkauft (Stadionrekord)',NULL,381,'2007-07-11',409,'CH',19,571,1,521,487,413,'18:45',NULL,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,352,0.00,0.00,0.00,0.00,0.00),(659,2180,800,NULL,NULL,292,'2007-07-10',449,'DE',19,44,264,76,501,35,'19:00',NULL,'2:7','1:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,351,0.00,0.00,0.00,0.00,0.00),(660,1500,12,NULL,NULL,382,'2007-06-13',70,'DE',146,572,1,522,523,146,'18:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale (Hinspiel)',NULL,'\0',0.00,350,0.00,0.00,0.00,0.00,0.00),(661,90,0,NULL,NULL,116,'2007-05-23',262,'DE',147,573,574,154,154,412,'19:00',NULL,'3:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,349,0.00,0.00,0.00,0.00,0.00),(662,330,0,NULL,NULL,140,'2007-05-20',449,'DE',134,8,121,188,87,21,'15:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'\0',0.00,348,0.00,0.00,0.00,0.00,0.00),(663,83,25,NULL,NULL,383,'2007-05-16',449,'DE',134,102,8,40,188,73,'19:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,347,0.00,0.00,0.00,0.00,0.00),(664,140,0,NULL,NULL,116,'2007-05-13',449,'DE',45,575,491,154,154,411,'10:45',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,346,0.00,0.00,0.00,0.00,0.00),(665,22450,2500,NULL,NULL,88,'2007-05-12',86,'DE',1,490,1,395,487,178,'15:30',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,345,0.00,0.00,0.00,0.00,0.00),(666,70,35,'Verspätete Ankunft am Stadion (ca. 15 -20 Min.)',NULL,116,'2007-05-12',86,'DE',148,576,577,154,154,410,'12:30',NULL,'3:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,344,0.00,0.00,0.00,0.00,0.00),(667,310,200,NULL,NULL,372,'2007-05-06',449,'DE',134,84,8,125,188,51,'10:45',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,343,0.00,0.00,0.00,0.00,0.00),(668,50,5,NULL,NULL,116,'2007-04-29',39,'DE',58,578,16,154,376,409,'10:45',NULL,'3:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,342,0.00,0.00,0.00,0.00,0.00),(669,69000,6900,NULL,NULL,21,'2007-04-28',220,'DE',1,1,57,487,448,9,'15:30',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'',0.00,341,0.00,0.00,0.00,0.00,0.00),(670,35,0,NULL,NULL,116,'2007-04-27',325,'DE',108,580,579,154,154,408,'19:00',NULL,'0:13','0:8',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,340,0.00,0.00,0.00,0.00,0.00),(671,133,40,NULL,NULL,384,'2007-04-22',449,'DE',134,168,8,524,188,94,'15:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,339,0.00,0.00,0.00,0.00,0.00),(672,15,0,NULL,NULL,116,'2007-04-22',276,'DE',99,513,581,154,154,407,'13:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,338,0.00,0.00,0.00,0.00,0.00),(673,197,80,NULL,NULL,116,'2007-04-09',323,'DE',134,416,8,464,188,123,'18:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,337,0.00,0.00,0.00,0.00,0.00),(674,434,50,NULL,NULL,385,'2007-04-09',449,'DE',54,131,582,526,525,188,'13:00',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,335,0.00,0.00,0.00,0.00,0.00),(675,220,0,NULL,NULL,116,'2007-04-09',449,'DE',16,60,491,154,154,406,'15:00',NULL,'1:1','0:1','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale','4:5','\0',0.00,336,0.00,0.00,0.00,0.00,0.00),(676,110,60,NULL,NULL,116,'2007-04-09',449,'DE',58,291,16,154,376,659,'10:45',NULL,'2:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,334,0.00,0.00,0.00,0.00,0.00),(677,67500,4000,NULL,NULL,386,'2007-04-03',362,'IT',8,583,1,527,487,99,'20:45',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Hinspiel)',NULL,'',0.00,333,0.00,0.00,0.00,0.00,0.00),(678,326,150,NULL,NULL,82,'2007-03-30',449,'DE',134,7,8,300,188,4,'19:00',NULL,'4:3','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,332,0.00,0.00,0.00,0.00,0.00),(679,250,0,NULL,NULL,360,'2007-03-25',449,'DE',134,8,71,188,71,21,'15:00',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,331,0.00,0.00,0.00,0.00,0.00),(680,70,0,NULL,NULL,116,'2007-03-25',449,'DE',149,584,585,154,154,404,'13:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,330,0.00,0.00,0.00,0.00,0.00),(681,50,0,NULL,NULL,116,'2007-03-23',124,'DE',108,586,314,154,154,403,'19:30',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,329,0.00,0.00,0.00,0.00,0.00),(682,200,0,NULL,NULL,364,'2007-03-11',449,'DE',134,8,63,188,528,21,'15:00',NULL,'2:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,328,0.00,0.00,0.00,0.00,0.00),(683,450,5,NULL,NULL,123,'2007-03-04',449,'DE',96,329,330,333,494,72,'14:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,327,0.00,0.00,0.00,0.00,0.00),(684,74220,8000,NULL,NULL,387,'2007-03-03',42,'DE',1,30,1,529,487,37,'15:30',NULL,'2:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'',0.00,326,0.00,0.00,0.00,0.00,0.00),(685,80000,4000,NULL,NULL,388,'2007-02-20',415,'ES',8,587,1,NULL,NULL,97,'20:45',NULL,'3:2','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,325,0.00,0.00,0.00,0.00,0.00),(686,20832,2000,NULL,NULL,56,'2007-02-17',18,'DE',1,588,1,286,487,402,'15:30',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'',0.00,324,0.00,0.00,0.00,0.00,0.00),(687,18,8,NULL,NULL,116,'2007-02-05',31,'DE',19,233,8,20,188,401,'19:30',NULL,'3:1','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,323,0.00,0.00,0.00,0.00,0.00),(688,60,0,NULL,NULL,116,'2007-02-04',449,'DE',19,355,25,154,154,400,'14:30',NULL,'10:1','5:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,322,0.00,0.00,0.00,0.00,0.00),(689,80708,8000,NULL,NULL,56,'2007-01-26',92,'DE',1,72,1,531,374,55,'20:30',NULL,'3:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'',0.00,321,0.00,0.00,0.00,0.00,0.00),(690,57000,5700,NULL,NULL,389,'2007-01-20',449,'DE',19,57,1,491,374,45,'15:30',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,320,0.00,0.00,0.00,0.00,0.00),(691,35000,15000,NULL,NULL,116,'2007-01-17',286,'DE',19,589,1,532,374,399,'19:00',NULL,'1:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,319,0.00,0.00,0.00,0.00,0.00),(692,800,0,NULL,NULL,116,'2007-01-11',431,'AE',150,590,591,154,533,398,'13:00',NULL,'2:4','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'\0',0.00,318,0.00,0.00,0.00,0.00,0.00),(693,2500,70,NULL,NULL,116,'2007-01-10',431,'AE',19,324,1,534,374,397,'18:00',NULL,'3:4','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Dubai-Cup (Spiel um Platz drei)',NULL,'\0',0.00,317,0.00,0.00,0.00,0.00,0.00),(694,1824,1200,NULL,NULL,NULL,'2007-01-07',263,'DE',19,592,264,535,501,396,'13:30',NULL,'0:15','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,316,0.00,0.00,0.00,0.00,0.00),(695,70,0,'Halbzeistand unbekannt',NULL,116,'2006-12-03',449,'DE',58,593,376,154,154,217,'10:45',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,315,0.00,0.00,0.00,0.00,0.00),(696,57000,6000,NULL,NULL,21,'2006-11-25',449,'DE',1,57,1,491,374,45,'15:30',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'',0.00,314,0.00,0.00,0.00,0.00,0.00),(697,550,100,NULL,NULL,256,'2006-11-24',449,'DE',134,355,8,432,188,95,'19:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,313,0.00,0.00,0.00,0.00,0.00),(698,220,20,NULL,NULL,11,'2006-11-19',449,'DE',134,8,211,188,221,21,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,312,0.00,0.00,0.00,0.00,0.00),(699,70,0,NULL,NULL,116,'2006-11-19',449,'DE',32,594,595,154,154,391,'10:45',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,311,0.00,0.00,0.00,0.00,0.00),(700,61482,6000,NULL,NULL,125,'2006-11-05',128,'DE',1,118,1,163,374,338,'17:00',NULL,'2:2','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'',0.00,310,0.00,0.00,0.00,0.00,0.00),(701,700,0,NULL,NULL,390,'2006-11-05',92,'DE',30,540,46,493,536,390,'14:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,309,0.00,0.00,0.00,0.00,0.00),(702,900,100,NULL,NULL,391,'2006-11-05',95,'DE',96,596,330,537,494,389,'11:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,308,0.00,0.00,0.00,0.00,0.00),(703,310,100,NULL,NULL,392,'2006-11-04',449,'DE',134,121,8,87,188,294,'14:00',NULL,'3:4','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,307,0.00,0.00,0.00,0.00,0.00),(704,650,40,NULL,NULL,393,'2006-11-03',94,'DE',151,597,535,538,539,388,'19:30',NULL,'1:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,306,0.00,0.00,0.00,0.00,0.00),(705,500,0,NULL,NULL,116,'2006-10-31',195,'DE',152,598,46,154,536,387,'19:00',NULL,'0:15','0:6',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,305,0.00,0.00,0.00,0.00,0.00),(706,52,0,'Normannia Harburg zieht seine Mannschaft aus dem laufenden Wettbewerb zurück und meldet komplett ab. Alle Spieler werden aus der Wertung genommen.',NULL,116,'2006-10-21',449,'DE',46,600,599,154,154,386,'15:00',NULL,'3:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,304,0.00,0.00,0.00,0.00,0.00),(707,360,0,NULL,NULL,394,'2006-10-15',449,'DE',134,8,84,188,125,21,'15:00',NULL,'2:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,303,0.00,0.00,0.00,0.00,0.00),(708,11,0,NULL,NULL,116,'2006-10-15',449,'DE',153,601,602,154,154,385,'13:00',NULL,'3:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,302,0.00,0.00,0.00,0.00,0.00),(709,50,0,NULL,NULL,116,'2006-10-15',449,'DE',91,603,23,154,154,384,'10:45',NULL,'0:6','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,301,0.00,0.00,0.00,0.00,0.00),(710,250,0,'Das Spiel endete 3:2 für Osdorf und wurde nachträglich am \"Grünen Tisch\" mit 0:3 gewertet, womit Osdorf aus dem Pokalwettbewerb ausschied.',NULL,116,'2006-10-03',449,'DE',16,604,138,154,154,383,'15:00',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,300,0.00,0.00,0.00,0.00,0.00),(711,260,0,NULL,NULL,372,'2006-10-01',449,'DE',134,8,168,188,540,21,'15:00',NULL,'6:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,299,0.00,0.00,0.00,0.00,0.00),(712,20,0,NULL,NULL,116,'2006-10-01',449,'DE',43,555,25,154,154,382,'12:30',NULL,'8:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,298,0.00,0.00,0.00,0.00,0.00),(713,30000,10000,NULL,NULL,395,'2006-09-30',333,'DE',1,61,1,541,374,33,'15:30',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'',0.00,297,0.00,0.00,0.00,0.00,0.00),(714,90,0,NULL,NULL,116,'2006-09-23',230,'DE',147,605,423,154,154,381,'17:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,296,0.00,0.00,0.00,0.00,0.00),(715,400,0,NULL,NULL,397,'2006-09-15',187,'DE',154,606,607,41,543,380,'17:30',NULL,'5:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,293,0.00,0.00,0.00,0.00,0.00),(716,500,0,NULL,NULL,398,'2006-09-17',449,'DE',134,8,7,188,300,21,'15:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,294,0.00,0.00,0.00,0.00,0.00),(717,200,30,NULL,NULL,116,'2006-09-09',449,'DE',134,71,8,71,188,272,'16:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,291,0.00,0.00,0.00,0.00,0.00),(718,19400,2000,NULL,NULL,370,'2006-09-09',449,'DE',7,101,1,437,374,54,'20:15',NULL,'1:2','1:0','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,292,0.00,0.00,0.00,0.00,0.00),(719,5019,3000,NULL,NULL,399,'2006-09-06',405,'SM',155,608,512,544,476,379,'20:45',NULL,'0:13','0:6',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag (Gruppe D)',NULL,'',0.00,290,0.00,0.00,0.00,0.00,0.00),(720,305,0,NULL,NULL,87,'2006-08-22',449,'DE',134,8,355,188,432,21,'19:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,289,0.00,0.00,0.00,0.00,0.00),(721,2853,50,NULL,NULL,400,'2006-08-13',15,'DK',28,609,40,545,546,378,'15:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,288,0.00,0.00,0.00,0.00,0.00),(722,200,150,NULL,NULL,116,'2006-08-08',449,'DE',16,64,8,154,188,51,'18:45',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,287,0.00,0.00,0.00,0.00,0.00),(723,320,0,NULL,NULL,401,'2006-08-06',449,'DE',134,8,443,188,433,21,'15:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,286,0.00,0.00,0.00,0.00,0.00),(724,41300,20000,NULL,NULL,56,'2006-08-05',11,'DE',144,52,1,35,374,376,'18:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'\0',0.00,285,0.00,0.00,0.00,0.00,0.00),(725,3669,15,NULL,NULL,402,'2006-08-05',204,'DE',138,610,83,548,547,375,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,284,0.00,0.00,0.00,0.00,0.00),(726,600,13,NULL,NULL,116,'2006-07-30',270,'DE',19,611,115,549,399,374,'15:00',NULL,'1:8','0:6',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Jubiläumsspiel \"50 Jahre TuS Lehmden\"',NULL,'\0',0.00,283,0.00,0.00,0.00,0.00,0.00),(727,450,15,NULL,NULL,116,'2006-07-29',299,'DE',19,115,214,399,244,373,'18:30',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Nordwestcup',NULL,'\0',0.00,282,0.00,0.00,0.00,0.00,0.00),(728,450,100,NULL,NULL,116,'2006-07-29',299,'DE',19,492,152,127,438,373,'16:30',NULL,'3:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Nordwestcup',NULL,'\0',0.00,281,0.00,0.00,0.00,0.00,0.00),(729,1000,20,NULL,NULL,116,'2006-07-28',112,'DE',19,115,152,399,438,48,'20:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Nordwestcup',NULL,'\0',0.00,280,0.00,0.00,0.00,0.00,0.00),(730,130,0,NULL,NULL,116,'2006-07-26',449,'DE',16,612,452,154,154,372,'18:45',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,279,0.00,0.00,0.00,0.00,0.00),(731,40,35,NULL,NULL,116,'2006-07-25',449,'DE',16,327,8,154,188,336,'18:45',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,278,0.00,0.00,0.00,0.00,0.00),(732,20,2,NULL,NULL,116,'2006-07-18',301,'DE',19,226,8,154,188,371,'19:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,277,0.00,0.00,0.00,0.00,0.00),(733,50,0,'Ankunft erst zur zweiten Halbzeit',NULL,116,'2006-07-13',449,'DE',19,8,233,188,154,370,'19:30',NULL,'4:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,276,0.00,0.00,0.00,0.00,0.00),(734,35,2,'Nach der ersten Hälfte zur ersten Mannschaft zum Langenfort gefahren. Halbzeithopping....',NULL,116,'2006-07-13',449,'DE',19,16,614,376,154,369,'18:15',NULL,'2:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Willi-Bosse-Pokal (Vorrundenspiel)',NULL,'\0',0.00,275,0.00,0.00,0.00,0.00,0.00),(735,50000,500,NULL,NULL,388,'2006-06-30',449,'DE',156,615,616,192,550,45,'21:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale',NULL,'',0.00,274,0.00,0.00,0.00,0.00,0.00),(736,15206,3000,NULL,NULL,45,'2006-06-03',132,'DE',19,617,618,285,551,368,'19:00',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,272,0.00,0.00,0.00,0.00,0.00),(737,30,0,NULL,NULL,116,'2006-06-03',132,'DE',78,620,619,154,154,367,'16:00',NULL,'2:6','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,271,0.00,0.00,0.00,0.00,0.00),(738,150,0,NULL,NULL,116,'2006-06-30',449,'DE',157,8,102,188,NULL,21,'19:00',NULL,'3:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,273,0.00,0.00,0.00,0.00,0.00),(739,24636,0,NULL,NULL,374,'2006-05-28',428,'US',19,621,622,NULL,NULL,366,'20:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,270,0.00,0.00,0.00,0.00,0.00),(740,900,0,NULL,NULL,116,'2006-05-27',430,'US',158,623,624,154,555,365,'19:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,269,0.00,0.00,0.00,0.00,0.00),(741,5173,26,NULL,NULL,403,'2006-05-27',429,'US',19,625,1,509,374,364,'17:00',NULL,'4:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,268,0.00,0.00,0.00,0.00,0.00),(742,100,40,NULL,NULL,116,'2006-05-23',323,'DE',157,416,8,154,188,123,'19:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,267,0.00,0.00,0.00,0.00,0.00),(743,230,0,NULL,NULL,301,'2006-05-21',449,'DE',157,8,9,188,461,21,'15:00',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'\0',0.00,266,0.00,0.00,0.00,0.00,0.00),(744,6122,19,NULL,NULL,116,'2006-05-16',78,'DE',19,626,1,154,374,160,'18:00',NULL,'0:5','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,265,0.00,0.00,0.00,0.00,0.00),(745,120,0,NULL,NULL,401,'2006-05-14',449,'DE',157,63,8,528,188,36,'10:45',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,264,0.00,0.00,0.00,0.00,0.00),(746,200,0,NULL,NULL,394,'2006-05-09',449,'DE',157,8,355,188,432,21,'18:30',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,263,0.00,0.00,0.00,0.00,0.00),(747,12000,10000,NULL,NULL,25,'2006-05-07',61,'DE',19,627,1,483,374,660,'13:30',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Ablösespiel Christoph Krause',NULL,'',0.00,262,0.00,0.00,0.00,0.00,0.00),(748,50754,5000,NULL,NULL,125,'2006-05-06',166,'DE',1,628,1,557,374,312,'15:30',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,261,0.00,0.00,0.00,0.00,0.00),(749,120,20,NULL,NULL,404,'2006-05-02',449,'DE',157,7,8,300,188,4,'18:30',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,260,0.00,0.00,0.00,0.00,0.00),(750,74349,17500,NULL,NULL,387,'2006-04-29',42,'DE',7,38,1,558,374,37,'20:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,259,0.00,0.00,0.00,0.00,0.00),(751,150,0,NULL,NULL,116,'2006-04-29',42,'DE',137,629,630,154,154,363,'14:00',NULL,'6:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,258,0.00,0.00,0.00,0.00,0.00),(752,50,0,NULL,NULL,116,'2006-04-29',264,'DE',159,631,632,154,154,362,'11:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,257,0.00,0.00,0.00,0.00,0.00),(753,8000,3000,NULL,NULL,116,'2006-04-26',423,'TN',160,633,634,154,559,361,'16:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale',NULL,'',0.00,256,0.00,0.00,0.00,0.00,0.00),(754,16000,0,NULL,NULL,116,'2006-04-22',424,'TN',161,494,636,154,560,360,'18:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale, Hinspiel',NULL,'\0',0.00,255,0.00,0.00,0.00,0.00,0.00),(755,200,100,NULL,NULL,36,'2006-04-17',449,'DE',157,518,8,325,188,359,'15:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,254,0.00,0.00,0.00,0.00,0.00),(756,20,0,NULL,NULL,116,'2006-04-15',60,'DE',29,637,639,154,154,358,'18:00',NULL,'2:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,253,0.00,0.00,0.00,0.00,0.00),(757,50,0,NULL,NULL,116,'2006-04-15',157,'DE',163,640,641,154,561,357,'16:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,252,0.00,0.00,0.00,0.00,0.00),(758,250,0,NULL,NULL,405,'2006-04-14',449,'DE',157,8,63,188,528,21,'15:00',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,251,0.00,0.00,0.00,0.00,0.00),(759,19400,2000,NULL,NULL,125,'2006-04-12',449,'DE',7,101,1,437,374,54,'20:30',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'',0.00,250,0.00,0.00,0.00,0.00,0.00),(760,150,30,NULL,NULL,251,'2006-04-09',139,'DE',157,153,8,506,188,133,'15:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,249,0.00,0.00,0.00,0.00,0.00),(761,42100,5000,NULL,NULL,395,'2006-04-08',70,'DE',1,52,1,35,374,27,'15:30',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'',0.00,248,0.00,0.00,0.00,0.00,0.00),(762,100,15,NULL,NULL,406,'2006-04-04',449,'DE',157,168,8,562,188,94,'18:00',NULL,'2:4','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,247,0.00,0.00,0.00,0.00,0.00),(763,210,0,NULL,NULL,304,'2006-04-02',449,'DE',157,8,41,188,416,21,'15:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,246,0.00,0.00,0.00,0.00,0.00),(764,69000,6900,NULL,NULL,158,'2006-04-01',220,'DE',1,1,315,374,563,9,'15:30',NULL,'2:2','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'',0.00,245,0.00,0.00,0.00,0.00,0.00),(765,31500,3150,NULL,NULL,323,'2006-03-25',95,'DE',1,250,1,564,374,59,'15:30',NULL,'1:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'',0.00,244,0.00,0.00,0.00,0.00,0.00),(766,200,0,NULL,NULL,116,'2006-03-24',306,'DE',47,642,643,154,154,356,'19:30',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,243,0.00,0.00,0.00,0.00,0.00),(767,30000,10000,NULL,NULL,56,'2006-03-11',333,'DE',1,61,1,541,374,33,'15:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'',0.00,242,0.00,0.00,0.00,0.00,0.00),(768,69000,6900,'1. Niederlage in der Allianz-Arena',NULL,105,'2006-03-04',220,'DE',1,1,57,374,491,9,'15:30',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'',0.00,241,0.00,0.00,0.00,0.00,0.00),(769,150,50,NULL,NULL,294,'2006-02-26',449,'DE',157,452,8,536,188,355,'15:00',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,240,0.00,0.00,0.00,0.00,0.00),(770,65000,0,NULL,NULL,407,'2006-01-20',2,'EG',164,648,649,565,566,352,'18:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag (Gruppe A)',NULL,'\0',0.00,237,0.00,0.00,0.00,0.00,0.00),(771,6000,0,NULL,NULL,408,'2006-01-21',2,'EG',164,646,647,567,568,353,'19:00',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag (Gruppe B)',NULL,'\0',0.00,238,0.00,0.00,0.00,0.00,0.00),(772,28000,0,NULL,NULL,409,'2006-01-22',1,'EG',164,644,645,569,570,354,'16:15',NULL,'4:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag (Gruppe C)',NULL,'\0',0.00,239,0.00,0.00,0.00,0.00,0.00),(773,50000,48,NULL,NULL,116,'2006-01-13',354,'IR',19,650,1,571,374,351,'15:00',NULL,'1:2','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Abschiedsspiel Ahman Reza Abedzadeh',NULL,'\0',0.00,236,0.00,0.00,0.00,0.00,0.00),(774,18500,5000,NULL,NULL,410,'2006-01-05',109,'DE',19,651,1,573,374,350,'18:30',NULL,'1:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Benefizspiel für RWE',NULL,'',0.00,235,0.00,0.00,0.00,0.00,0.00),(775,66000,6600,NULL,NULL,21,'2005-12-21',220,'DE',7,1,57,374,491,9,'20:30',NULL,'1:0','0:0','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'',0.00,234,0.00,0.00,0.00,0.00,0.00),(776,135,40,NULL,NULL,116,'2005-12-17',318,'DE',16,443,8,433,188,164,'13:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,233,0.00,0.00,0.00,0.00,0.00),(777,112,0,NULL,NULL,116,'2005-12-11',449,'DE',81,652,190,154,154,348,'14:00',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,232,0.00,0.00,0.00,0.00,0.00),(778,20,0,NULL,NULL,116,'2005-12-11',449,'DE',43,217,578,154,154,347,'12:00',NULL,'1:4','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,231,0.00,0.00,0.00,0.00,0.00),(779,120,40,NULL,NULL,411,'2005-12-10',39,'DE',157,398,8,39,188,346,'14:00',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,230,0.00,0.00,0.00,0.00,0.00),(780,170,80,NULL,NULL,251,'2005-12-04',449,'DE',157,9,8,461,188,22,'10:45',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,228,0.00,0.00,0.00,0.00,0.00),(781,28000,3000,NULL,NULL,412,'2005-12-07',5,'BE',8,653,1,574,374,345,'20:45',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 6. Spieltag',NULL,'\0',0.00,229,0.00,0.00,0.00,0.00,0.00),(782,30,0,NULL,NULL,116,'2005-12-03',279,'DE',147,654,655,154,154,344,'14:00',NULL,'2:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,227,0.00,0.00,0.00,0.00,0.00),(783,150,0,NULL,NULL,116,'2005-11-27',104,'DE',165,226,656,154,154,293,'14:00',NULL,'4:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,226,0.00,0.00,0.00,0.00,0.00),(784,50,0,NULL,NULL,116,'2005-11-20',449,'DE',43,657,555,154,154,343,'14:00',NULL,'5:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,225,0.00,0.00,0.00,0.00,0.00),(785,350,100,NULL,NULL,36,'2005-11-18',449,'DE',157,603,8,236,188,221,'19:30',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,224,0.00,0.00,0.00,0.00,0.00),(786,350,0,NULL,NULL,87,'2005-11-13',449,'DE',157,8,515,188,464,21,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,223,0.00,0.00,0.00,0.00,0.00),(787,120,0,NULL,NULL,116,'2005-11-12',449,'DE',45,658,146,154,154,244,'14:00',NULL,'2:3','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,222,0.00,0.00,0.00,0.00,0.00),(788,250,0,NULL,NULL,116,'2005-11-11',89,'DE',166,659,642,154,154,342,'19:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,221,0.00,0.00,0.00,0.00,0.00),(789,350,0,NULL,NULL,116,'2005-10-30',309,'DE',36,660,661,154,154,341,'14:00',NULL,'5:2','4:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,220,0.00,0.00,0.00,0.00,0.00),(790,80,0,NULL,NULL,116,'2005-10-30',70,'DE',167,662,663,154,154,340,'11:00',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,219,0.00,0.00,0.00,0.00,0.00),(791,50000,5000,NULL,NULL,370,'2005-10-29',178,'DE',1,315,1,575,374,65,'15:30',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'',0.00,218,0.00,0.00,0.00,0.00,0.00),(792,16500,1650,NULL,NULL,88,'2005-10-26',27,'DE',7,664,1,268,374,339,'20:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'',0.00,217,0.00,0.00,0.00,0.00,0.00),(793,150,60,NULL,NULL,413,'2005-10-23',449,'DE',157,41,8,416,188,230,'15:00',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,216,0.00,0.00,0.00,0.00,0.00),(794,26,0,NULL,NULL,116,'2005-10-22',449,'DE',79,665,374,154,154,6,'12:30',NULL,'6:1','3:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,215,0.00,0.00,0.00,0.00,0.00),(795,300,0,NULL,NULL,157,'2005-10-16',449,'DE',157,8,416,188,291,654,'15:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,214,0.00,0.00,0.00,0.00,0.00),(796,61524,6000,NULL,NULL,45,'2005-10-15',128,'DE',1,118,1,357,374,338,'15:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'',0.00,213,0.00,0.00,0.00,0.00,0.00),(797,350,120,NULL,NULL,116,'2005-10-09',449,'DE',16,666,8,154,188,256,'15:00',NULL,'0:7','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,212,0.00,0.00,0.00,0.00,0.00),(798,200,30,NULL,NULL,116,'2005-10-02',449,'DE',157,102,8,40,188,73,'15:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,211,0.00,0.00,0.00,0.00,0.00),(799,20,0,'Spielabbruch in der Halbzeit. vahdet II ist mit weniger als 11 Spielern aufgelaufen und völlig chancenlos.',NULL,116,'2005-10-02',449,'DE',46,668,669,154,154,337,'09:00',NULL,'0:7','0:7',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,209,0.00,0.00,0.00,0.00,0.00),(800,30,0,NULL,NULL,116,'2005-10-02',449,'DE',153,670,671,154,154,336,'10:45',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,210,0.00,0.00,0.00,0.00,0.00),(801,220,0,NULL,NULL,392,'2005-09-25',449,'DE',157,8,168,188,562,21,'15:00',NULL,'4:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,208,0.00,0.00,0.00,0.00,0.00),(802,50,0,NULL,NULL,116,'2005-09-25',449,'DE',153,671,243,154,154,335,'13:00',NULL,'5:1','4:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,207,0.00,0.00,0.00,0.00,0.00),(803,100,2,NULL,NULL,116,'2005-09-25',449,'DE',58,412,16,154,376,180,'10:45',NULL,'6:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,206,0.00,0.00,0.00,0.00,0.00),(804,55800,6000,NULL,NULL,105,'2005-09-24',449,'DE',1,57,1,491,374,45,'15:30',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,205,0.00,0.00,0.00,0.00,0.00),(805,50000,5000,NULL,NULL,125,'2005-09-20',116,'DE',1,38,1,558,374,96,'20:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,204,0.00,0.00,0.00,0.00,0.00),(806,400,200,NULL,NULL,401,'2006-09-18',449,'DE',157,84,8,125,188,51,'10:45',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,295,0.00,0.00,0.00,0.00,0.00),(807,500,0,NULL,NULL,360,'2005-09-11',449,'DE',157,8,452,188,536,21,'15:00',NULL,'3:3','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,203,0.00,0.00,0.00,0.00,0.00),(808,16000,50,NULL,NULL,414,'2005-09-06',404,'SB',132,672,673,576,577,333,'12:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Playoffs (Rückspiel)',NULL,'',0.00,202,0.00,0.00,0.00,0.00,0.00),(809,9827,0,NULL,NULL,415,'2005-09-02',380,'NZ',168,674,675,578,579,332,'19:00',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,201,0.00,0.00,0.00,0.00,0.00),(810,180,3,NULL,NULL,416,'2016-03-26',1200,'DE',110,676,179,580,581,661,'13:30',NULL,'3:1','1:0',NULL,15.74,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',5.00,978,0.00,0.00,0.00,0.00,0.00),(811,25208,400,NULL,NULL,116,'2005-08-28',4,'AU',168,675,677,579,154,331,'18:00',NULL,'1:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,200,0.00,0.00,0.00,0.00,0.00),(812,250,40,NULL,NULL,152,'2005-08-21',259,'DE',157,273,8,287,188,101,'15:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,199,0.00,0.00,0.00,0.00,0.00),(813,80,3,NULL,NULL,116,'2005-08-20',449,'DE',58,3,16,154,376,330,'15:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,198,0.00,0.00,0.00,0.00,0.00),(814,160,40,NULL,NULL,116,'2005-08-16',449,'DE',16,41,8,416,188,230,'19:00',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde',NULL,'\0',0.00,197,0.00,0.00,0.00,0.00,0.00),(815,300,0,NULL,NULL,351,'2005-08-14',449,'DE',157,8,518,188,325,21,'15:00',NULL,'2:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,196,0.00,0.00,0.00,0.00,0.00),(816,800,1,NULL,NULL,116,'2005-08-12',121,'DE',19,679,70,154,154,329,'19:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'LZO-Cup (Vorrunde)',NULL,'\0',0.00,194,0.00,0.00,0.00,0.00,0.00),(817,800,0,NULL,NULL,116,'2005-08-12',121,'DE',19,572,680,154,154,329,'20:00',NULL,'2:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'LZO-Cup (Vorrunde)',NULL,'\0',0.00,195,0.00,0.00,0.00,0.00,0.00),(818,12000,150,NULL,NULL,375,'2005-08-08',393,'PL',19,142,1,150,374,328,'20:30',NULL,'3:1','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,193,0.00,0.00,0.00,0.00,0.00),(819,100,40,NULL,NULL,116,'2005-08-06',449,'DE',16,681,8,154,188,327,'15:00',NULL,'1:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,192,0.00,0.00,0.00,0.00,0.00),(820,110,40,NULL,NULL,116,'2005-07-31',449,'DE',16,682,83,154,148,216,'15:15',NULL,'0:7','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,191,0.00,0.00,0.00,0.00,0.00),(821,70,0,'Abbruch der Begegnung nach starken Regefällen. Wiederholung am 3.8 (3-1 für den SC Sternschanze)',NULL,116,'2005-07-31',449,'DE',46,566,448,154,154,326,'13:00',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,190,0.00,0.00,0.00,0.00,0.00),(822,80,35,NULL,NULL,116,'2005-07-31',449,'DE',16,683,8,154,188,649,'10:45',NULL,'0:4','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,189,0.00,0.00,0.00,0.00,0.00),(823,20,0,NULL,NULL,116,'2005-07-30',449,'DE',16,684,380,154,154,325,'15:00',NULL,'2:5','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,188,0.00,0.00,0.00,0.00,0.00),(824,20,0,NULL,NULL,116,'2005-07-29',449,'DE',16,467,452,154,536,324,'18:15',NULL,'0:16','0:9',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,187,0.00,0.00,0.00,0.00,0.00),(825,120,0,NULL,NULL,116,'2005-07-16',80,'DE',169,685,686,154,154,323,'16:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,186,0.00,0.00,0.00,0.00,0.00),(826,250,0,NULL,NULL,116,'2005-07-12',305,'DE',19,687,46,154,583,322,'19:00',NULL,'0:8','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,185,0.00,0.00,0.00,0.00,0.00),(827,600,100,NULL,NULL,116,'2005-07-10',22,'DE',19,688,115,154,399,321,'11:30',NULL,'0:5','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,184,0.00,0.00,0.00,0.00,0.00),(828,120,40,NULL,NULL,116,'2005-07-09',449,'DE',19,8,84,188,154,51,'16:00',NULL,'2:2','1:0','i. E.',0.00,0.00,0.00,0.00,0.00,0.00,'Heiner-Stacklies-Pokal (Finale)','4:3','\0',0.00,183,0.00,0.00,0.00,0.00,0.00),(829,130,80,NULL,NULL,116,'2005-06-23',449,'DE',170,16,269,154,154,320,'19:00',NULL,'5:2','2:2','n. V.',0.00,0.00,0.00,0.00,0.00,0.00,'Entscheidungsspiel',NULL,'\0',0.00,182,0.00,0.00,0.00,0.00,0.00),(830,70,10,NULL,NULL,116,'2005-06-19',449,'DE',170,160,16,154,154,320,'15:00',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag (Gruppe A)',NULL,'\0',0.00,181,0.00,0.00,0.00,0.00,0.00),(831,120,3,NULL,NULL,116,'2005-06-15',449,'DE',170,16,5,154,154,221,'18:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag (Gruppe A)',NULL,'\0',0.00,180,0.00,0.00,0.00,0.00,0.00),(832,14800,1500,NULL,NULL,417,'2005-06-04',386,'nn',19,689,512,584,459,319,'20:30',NULL,'1:4','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,179,0.00,0.00,0.00,0.00,0.00),(833,250,0,NULL,NULL,116,'2005-06-03',355,'IE',171,690,691,154,154,318,'20:30',NULL,'0:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,178,0.00,0.00,0.00,0.00,0.00),(834,2000,0,'Nach der ersten Halbzeit Weiterfahrt nach Athlone',NULL,53,'2005-06-03',358,'IE',172,692,693,585,586,317,'19:00',NULL,'2:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde (Gruppe 4)',NULL,'\0',0.00,177,0.00,0.00,0.00,0.00,0.00),(835,74359,20000,NULL,NULL,105,'2005-05-28',42,'DE',7,118,1,357,374,37,'20:45',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Finale',NULL,'',0.00,176,0.00,0.00,0.00,0.00,0.00),(836,200,0,NULL,NULL,116,'2005-05-28',295,'DE',159,694,695,154,154,316,'14:00',NULL,'5:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,175,0.00,0.00,0.00,0.00,0.00),(837,48600,5000,NULL,NULL,387,'2005-05-21',310,'DE',1,104,1,587,374,315,'15:30',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'34. Spieltag',NULL,'',0.00,173,0.00,0.00,0.00,0.00,0.00),(838,665,50,NULL,NULL,419,'2005-05-22',449,'DE',36,8,492,188,127,21,'15:00',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'32. Spieltag',NULL,'\0',0.00,174,0.00,0.00,0.00,0.00,0.00),(839,60,0,NULL,NULL,116,'2005-05-18',449,'DE',91,380,447,154,154,314,'19:00',NULL,'3:4','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,172,0.00,0.00,0.00,0.00,0.00),(840,800,30,NULL,NULL,296,'2005-05-15',205,'DE',103,696,115,588,399,313,'15:00',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'\0',0.00,171,0.00,0.00,0.00,0.00,0.00),(841,63000,6300,NULL,NULL,421,'2005-05-14',220,'DE',1,1,239,374,557,66,'15:30',NULL,'6:3','5:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'33. Spieltag',NULL,'',0.00,170,0.00,0.00,0.00,0.00,0.00),(842,150,0,NULL,NULL,116,'2005-05-13',449,'DE',66,16,593,154,154,21,'19:00',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,169,0.00,0.00,0.00,0.00,0.00),(843,40721,4000,NULL,NULL,21,'2005-04-30',166,'DE',1,628,1,589,374,312,'15:30',NULL,'0:4','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'31. Spieltag',NULL,'',0.00,168,0.00,0.00,0.00,0.00,0.00),(844,514,150,NULL,NULL,422,'2005-04-29',449,'DE',36,355,8,590,188,95,'19:30',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,167,0.00,0.00,0.00,0.00,0.00),(845,382,30,NULL,NULL,79,'2005-04-26',230,'DE',36,661,8,446,188,112,'19:00',NULL,'4:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'22. Spieltag',NULL,'\0',0.00,166,0.00,0.00,0.00,0.00,0.00),(846,26601,2500,NULL,NULL,395,'2005-04-20',51,'DE',7,433,1,575,374,56,'20:30',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'',0.00,165,0.00,0.00,0.00,0.00,0.00),(847,400,0,'Nach der ersten Halbzeit Stadion verlassen und nach Bielefeld gefahren (Halbzeitground)',NULL,233,'2005-04-20',321,'DE',173,463,697,30,593,311,'18:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,164,0.00,0.00,0.00,0.00,0.00),(848,420,0,NULL,NULL,424,'2005-04-19',449,'DE',36,8,121,188,477,21,'19:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,163,0.00,0.00,0.00,0.00,0.00),(849,160,0,NULL,NULL,116,'2005-04-17',449,'DE',70,6,698,154,154,310,'15:00',NULL,'6:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,162,0.00,0.00,0.00,0.00,0.00),(850,49845,5000,NULL,NULL,370,'2005-04-16',141,'DE',1,53,1,106,374,63,'15:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,161,0.00,0.00,0.00,0.00,0.00),(851,448,150,NULL,NULL,116,'2005-04-15',449,'DE',36,7,8,300,188,4,'19:00',NULL,'0:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,160,0.00,0.00,0.00,0.00,0.00),(852,9,0,NULL,NULL,116,'2005-04-13',449,'DE',43,699,578,154,154,309,'18:00',NULL,'1:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,159,0.00,0.00,0.00,0.00,0.00),(853,560,300,NULL,NULL,425,'2005-04-10',449,'DE',36,8,44,188,383,21,'15:00',NULL,'1:4','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,158,0.00,0.00,0.00,0.00,0.00),(854,150,0,NULL,NULL,116,'2005-04-06',62,'DE',165,700,701,154,154,308,'18:15',NULL,'1:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,157,0.00,0.00,0.00,0.00,0.00),(855,200,25,NULL,NULL,293,'2005-04-03',449,'DE',96,329,330,594,494,72,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,156,0.00,0.00,0.00,0.00,0.00),(856,30000,5000,NULL,NULL,421,'2005-04-02',333,'DE',1,61,1,595,374,33,'15:30',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'',0.00,155,0.00,0.00,0.00,0.00,0.00),(857,1637,40,NULL,NULL,116,'2005-03-28',264,'DE',174,702,330,596,494,307,'14:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'\0',0.00,154,0.00,0.00,0.00,0.00,0.00),(858,300,0,NULL,NULL,116,'2005-03-28',42,'DE',137,703,704,154,154,306,'11:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,153,0.00,0.00,0.00,0.00,0.00),(859,4000,50,NULL,NULL,427,'2005-03-26',344,'EE',132,705,706,597,598,305,'18:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag (Europa, Gruppe 3)',NULL,'\0',0.00,152,0.00,0.00,0.00,0.00,0.00),(860,55,0,NULL,NULL,116,'2005-03-22',289,'DE',45,595,707,154,154,304,'19:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,151,0.00,0.00,0.00,0.00,0.00),(861,120,40,NULL,NULL,428,'2005-03-13',171,'DE',36,708,8,599,188,303,'15:00',NULL,'4:0','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,150,0.00,0.00,0.00,0.00,0.00),(862,13150,0,NULL,NULL,273,'2005-02-26',382,'NL',175,709,710,600,601,302,'20:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,149,0.00,0.00,0.00,0.00,0.00),(863,40,10,'verspätetes Eintreffen, mitte der ersten Halbzeit.',NULL,116,'2005-02-26',91,'DE',19,711,712,154,154,301,'16:00',NULL,'3:3','3:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,148,0.00,0.00,0.00,0.00,0.00),(864,16780,10000,NULL,NULL,342,'2005-02-26',182,'DE',30,225,235,602,603,300,'14:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,147,0.00,0.00,0.00,0.00,0.00),(865,20,0,NULL,NULL,116,'2005-02-20',449,'DE',19,8,9,188,154,299,'17:30',NULL,'4:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,146,0.00,0.00,0.00,0.00,0.00),(866,800,150,NULL,NULL,116,'2005-02-12',389,'AT',19,713,115,154,399,298,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,145,0.00,0.00,0.00,0.00,0.00),(867,40000,0,NULL,NULL,430,'2005-02-09',379,'MA',132,714,715,604,605,297,'19:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag (Gruppe 5, Afrika)',NULL,'\0',0.00,144,0.00,0.00,0.00,0.00,0.00),(868,350,0,NULL,NULL,431,'2005-02-06',449,'DE',36,8,716,188,606,21,'14:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,143,0.00,0.00,0.00,0.00,0.00),(869,450,25,NULL,NULL,349,'2005-01-30',245,'DE',36,536,8,607,188,296,'17:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,142,0.00,0.00,0.00,0.00,0.00),(870,106,5,NULL,NULL,116,'2005-01-29',37,'DE',19,717,46,154,583,295,'14:00',NULL,'0:7','0:5',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,141,0.00,0.00,0.00,0.00,0.00),(871,22,0,NULL,NULL,116,'2005-01-23',449,'DE',118,718,719,154,154,278,'14:00',NULL,'3:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,140,0.00,0.00,0.00,0.00,0.00),(872,22,0,NULL,NULL,116,'2005-01-22',449,'DE',81,579,720,154,154,25,'14:00',NULL,'2:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,139,0.00,0.00,0.00,0.00,0.00),(873,70,0,NULL,NULL,116,'2005-01-16',449,'DE',19,8,515,188,154,21,'14:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,138,0.00,0.00,0.00,0.00,0.00),(874,321,80,NULL,NULL,79,'2004-12-18',449,'DE',36,121,8,477,188,294,'14:00',NULL,'6:0','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,137,0.00,0.00,0.00,0.00,0.00),(875,250,0,NULL,NULL,349,'2004-12-12',449,'DE',36,8,536,188,608,21,'14:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,136,0.00,0.00,0.00,0.00,0.00),(876,70,0,NULL,NULL,116,'2004-12-11',104,'DE',165,226,721,154,154,293,'14:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,135,0.00,0.00,0.00,0.00,0.00),(877,6,0,NULL,NULL,116,'2004-12-11',449,'DE',176,722,723,154,154,292,'12:00',NULL,'3:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,134,0.00,0.00,0.00,0.00,0.00),(878,160,40,NULL,NULL,432,'2004-12-04',78,'DE',36,716,8,606,188,291,'14:00',NULL,'3:3','2:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'16. Spieltag',NULL,'\0',0.00,133,0.00,0.00,0.00,0.00,0.00),(879,250,10,NULL,NULL,401,'2004-11-28',449,'DE',36,8,497,188,464,21,'14:00',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,132,0.00,0.00,0.00,0.00,0.00),(880,60,0,NULL,NULL,116,'2004-11-21',449,'DE',149,725,724,154,154,190,'14:00',NULL,'4:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,131,0.00,0.00,0.00,0.00,0.00),(881,32645,4000,NULL,NULL,56,'2004-11-14',53,'DE',1,62,1,609,374,34,'17:30',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'',0.00,130,0.00,0.00,0.00,0.00,0.00),(882,12727,400,'Nach der ersten Halbzeit, Stadion verlassen und Weiterfahrt nach Bochum (sinnloses Halbzeithopping)',NULL,45,'2004-11-14',95,'DE',2,250,490,266,610,59,'15:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,129,0.00,0.00,0.00,0.00,0.00),(883,400,8,NULL,NULL,433,'2004-11-07',330,'DE',36,726,8,611,188,83,'18:00',NULL,'6:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,128,0.00,0.00,0.00,0.00,0.00),(884,60,0,NULL,NULL,116,'2004-11-07',449,'DE',66,727,381,154,154,289,'10:45',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,127,0.00,0.00,0.00,0.00,0.00),(885,340,0,NULL,NULL,434,'2004-10-31',449,'DE',36,8,708,188,599,21,'15:00',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,126,0.00,0.00,0.00,0.00,0.00),(886,7204,30,NULL,NULL,435,'2004-10-30',417,'CZ',177,99,728,613,612,288,'14:25',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,125,0.00,0.00,0.00,0.00,0.00),(887,150,30,NULL,NULL,422,'2004-10-24',141,'DE',36,174,8,614,188,287,'15:00',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,124,0.00,0.00,0.00,0.00,0.00),(888,29000,3000,NULL,NULL,370,'2004-10-23',280,'DE',1,264,1,615,374,57,'15:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,123,0.00,0.00,0.00,0.00,0.00),(889,825,500,NULL,NULL,436,'2004-10-17',449,'DE',36,8,131,188,616,21,'15:00',NULL,'2:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,122,0.00,0.00,0.00,0.00,0.00),(890,825,70,NULL,NULL,437,'2004-10-10',449,'DE',36,44,8,383,188,35,'14:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag',NULL,'\0',0.00,121,0.00,0.00,0.00,0.00,0.00),(891,460,0,NULL,NULL,438,'2004-10-03',449,'DE',36,8,7,188,300,21,'15:00',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,120,0.00,0.00,0.00,0.00,0.00),(892,42100,5000,NULL,NULL,387,'2004-10-02',70,'DE',1,52,1,35,374,27,'15:30',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,119,0.00,0.00,0.00,0.00,0.00),(893,7898,4000,NULL,NULL,41,'2004-10-01',19,'DE',2,729,250,617,266,286,'19:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,118,0.00,0.00,0.00,0.00,0.00),(894,120,0,NULL,NULL,116,'2004-09-24',235,'DE',58,111,363,154,154,285,'19:00',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,117,0.00,0.00,0.00,0.00,0.00),(895,680,0,NULL,NULL,439,'2004-09-19',449,'DE',36,8,355,188,618,21,'15:00',NULL,'3:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'5. Spieltag',NULL,'\0',0.00,116,0.00,0.00,0.00,0.00,0.00),(896,20000,90,NULL,NULL,440,'2004-09-15',1078,'IL',8,730,1,619,374,284,'20:45',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Vorrunde, 1. Spieltag',NULL,'\0',0.00,115,0.00,0.00,0.00,0.00,0.00),(897,200,5,NULL,NULL,116,'2004-09-12',449,'DE',16,518,181,154,154,283,'15:00',NULL,'7:4','3:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,114,0.00,0.00,0.00,0.00,0.00),(898,20,0,NULL,NULL,116,'2004-09-09',235,'DE',76,731,732,154,154,282,'20:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,113,0.00,0.00,0.00,0.00,0.00),(899,600,50,NULL,NULL,441,'2004-09-05',85,'DE',36,733,8,620,188,281,'18:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,112,0.00,0.00,0.00,0.00,0.00),(900,160,0,NULL,NULL,116,'2004-09-03',253,'DE',108,220,734,154,154,280,'18:00',NULL,'5:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,111,0.00,0.00,0.00,0.00,0.00),(901,1600,50,NULL,NULL,442,'2004-08-29',108,'DE',36,492,8,127,188,279,'18:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spieltag',NULL,'\0',0.00,110,0.00,0.00,0.00,0.00,0.00),(902,300,0,NULL,NULL,116,'2004-08-25',449,'DE',16,8,497,188,489,21,'17:45',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,109,0.00,0.00,0.00,0.00,0.00),(903,55500,5550,NULL,NULL,443,'2004-08-07',449,'DE',1,57,1,621,374,45,'15:30',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'',0.00,108,0.00,0.00,0.00,0.00,0.00),(904,160,30,NULL,NULL,116,'2004-08-01',449,'DE',16,735,8,154,188,278,'10:45',NULL,'0:6','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,107,0.00,0.00,0.00,0.00,0.00),(905,8000,4000,NULL,NULL,56,'2004-07-31',337,'DE',30,459,101,622,437,277,'14:00',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spieltag',NULL,'\0',0.00,106,0.00,0.00,0.00,0.00,0.00),(906,85,40,'Das Stadion nach der ersten Halbzeit verlassen und Weiterfahrt nach Wuppertal. Übles Halbzeithopping',NULL,116,'2004-07-31',35,'DE',19,736,737,154,154,276,'11:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,105,0.00,0.00,0.00,0.00,0.00),(907,53000,100,'Turnier von drei Teams und Spielen zu jeweils 45 Minuten',NULL,21,'2004-07-30',213,'DE',19,81,1,623,374,275,'20:30',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Stadioneröffnung (1. Spiel)',NULL,'\0',0.00,103,0.00,0.00,0.00,0.00,0.00),(908,53000,100,'Turnier von drei Teams und Spielen zu jeweils 45 Minuten',NULL,21,'2004-07-30',213,'DE',19,1,738,374,331,275,'21:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Stadioneröffnung (2. Spiel)',NULL,'\0',0.00,104,0.00,0.00,0.00,0.00,0.00),(909,80,2,NULL,NULL,116,'2004-07-29',449,'DE',19,452,8,154,188,25,'19:30',NULL,'1:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,102,0.00,0.00,0.00,0.00,0.00),(910,150,50,NULL,NULL,116,'2004-07-27',449,'DE',16,698,8,154,188,274,'18:30',NULL,'0:8','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,101,0.00,0.00,0.00,0.00,0.00),(911,20,0,NULL,NULL,116,'2004-07-24',449,'DE',16,739,205,154,154,272,'13:00',NULL,'1:5','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,98,0.00,0.00,0.00,0.00,0.00),(912,200,30,NULL,NULL,116,'2004-07-24',449,'DE',19,452,8,154,188,51,'15:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Heiner Stacklies-Cup, Vorrundenspiel',NULL,'\0',0.00,99,0.00,0.00,0.00,0.00,0.00),(913,70,0,'Zweite Halbzeit (Halbzeithopping) nach Ende des Spiels auf dem Jonny-Rehbein-Sportplatz',NULL,116,'2004-07-24',449,'DE',16,740,741,154,154,273,'16:30',NULL,'3:1','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,100,0.00,0.00,0.00,0.00,0.00),(914,400,200,NULL,NULL,116,'2004-07-21',62,'DE',169,700,221,154,624,271,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale',NULL,'\0',0.00,97,0.00,0.00,0.00,0.00,0.00),(915,3000,2500,NULL,NULL,116,'2004-07-14',322,'DE',19,643,52,154,35,270,'19:00',NULL,'0:9','0:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,96,0.00,0.00,0.00,0.00,0.00),(916,14914,1000,NULL,NULL,410,'2004-07-11',42,'DE',19,340,1,625,374,269,'15:00',NULL,'1:5','0:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Benefizspiel für Union Berlin',NULL,'\0',0.00,95,0.00,0.00,0.00,0.00,0.00),(917,5000,20,NULL,NULL,21,'2004-06-20',141,'DE',146,742,70,626,523,268,'11:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Halbfinale (Rückspiel)',NULL,'',0.00,94,0.00,0.00,0.00,0.00,0.00),(918,1500,80,NULL,NULL,439,'2004-06-13',449,'DE',179,8,743,188,154,21,'15:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'3. Spiel',NULL,'\0',0.00,93,0.00,0.00,0.00,0.00,0.00),(919,650,16,'250 zu 16',NULL,116,'2004-06-09',70,'DE',179,8,744,188,154,267,'19:00',NULL,'2:0','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spiel',NULL,'\0',0.00,92,0.00,0.00,0.00,0.00,0.00),(920,180,20,NULL,NULL,116,'2004-06-08',259,'DE',170,745,282,154,154,266,'19:00',NULL,'4:7','2:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spiel',NULL,'\0',0.00,91,0.00,0.00,0.00,0.00,0.00),(921,1000,300,NULL,NULL,444,'2004-06-05',150,'DE',179,746,8,627,188,228,'15:00',NULL,'2:4','1:3',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Spiel',NULL,'\0',0.00,90,0.00,0.00,0.00,0.00,0.00),(922,2500,2000,NULL,NULL,116,'2004-05-31',304,'DE',19,747,57,154,628,265,'17:30',NULL,'2:13','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,89,0.00,0.00,0.00,0.00,0.00),(923,5500,500,NULL,NULL,116,'2004-05-28',356,'IE',180,748,749,629,630,264,'20:45',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,88,0.00,0.00,0.00,0.00,0.00),(924,42356,0,NULL,NULL,445,'2004-05-27',356,'IE',19,750,751,631,632,263,'20:30',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,87,0.00,0.00,0.00,0.00,0.00),(925,280,0,NULL,NULL,446,'2004-05-23',449,'DE',157,8,452,188,633,21,'15:00',NULL,'1:1','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'30. Spieltag',NULL,'\0',0.00,86,0.00,0.00,0.00,0.00,0.00),(926,100,0,NULL,NULL,116,'2004-05-16',195,'DE',165,752,753,154,154,262,'15:00',NULL,'4:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,85,0.00,0.00,0.00,0.00,0.00),(927,160,0,NULL,NULL,116,'2004-05-16',195,'DE',165,754,746,154,627,261,'13:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,84,0.00,0.00,0.00,0.00,0.00),(928,70,20,NULL,NULL,116,'2004-05-14',449,'DE',19,603,8,154,188,221,'19:00',NULL,'0:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,83,0.00,0.00,0.00,0.00,0.00),(929,210,50,NULL,NULL,405,'2004-05-09',39,'DE',157,398,8,39,188,260,'15:00',NULL,'0:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,82,0.00,0.00,0.00,0.00,0.00),(930,60,0,NULL,NULL,116,'2004-05-07',124,'DE',108,755,543,154,154,259,'19:30',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,81,0.00,0.00,0.00,0.00,0.00),(931,300,0,NULL,NULL,368,'2004-05-02',449,'DE',157,8,64,188,634,21,'15:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',0.00,80,0.00,0.00,0.00,0.00,0.00),(932,850,0,NULL,NULL,448,'2004-04-30',390,'AT',181,756,757,635,636,258,'19:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,79,0.00,0.00,0.00,0.00,0.00),(933,12000,500,NULL,NULL,449,'2004-04-28',403,'RO',19,751,512,632,637,257,'19:00',NULL,'5:1','4:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,78,0.00,0.00,0.00,0.00,0.00),(934,330,0,NULL,NULL,450,'2004-04-18',449,'DE',157,8,117,188,638,21,'15:00',NULL,'1:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'26. Spieltag',NULL,'\0',0.00,77,0.00,0.00,0.00,0.00,0.00),(935,17880,50,NULL,NULL,342,'2004-04-16',449,'DE',30,101,214,437,639,54,'19:30',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'27. Spieltag',NULL,'\0',0.00,76,0.00,0.00,0.00,0.00,0.00),(936,40,0,NULL,NULL,116,'2004-04-12',449,'DE',70,666,758,154,154,256,'10:45',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,75,0.00,0.00,0.00,0.00,0.00),(937,4000,200,NULL,NULL,451,'2004-04-10',422,'TR',182,759,760,640,641,255,'14:30',NULL,'3:1','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'29. Spieltag',NULL,'\0',0.00,74,0.00,0.00,0.00,0.00,0.00),(938,700,200,NULL,NULL,152,'2004-04-03',81,'DE',157,51,8,642,188,152,'14:00',NULL,'2:5','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',0.00,73,0.00,0.00,0.00,0.00,0.00),(939,200,0,NULL,NULL,394,'2004-03-28',449,'DE',157,8,63,188,528,21,'15:00',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'24. Spieltag',NULL,'\0',0.00,72,0.00,0.00,0.00,0.00,0.00),(940,205,0,NULL,NULL,452,'2004-03-27',376,'LU',183,761,762,643,644,254,'17:00',NULL,'4:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,71,0.00,0.00,0.00,0.00,0.00),(941,180,0,NULL,NULL,36,'2004-03-21',449,'DE',157,8,551,188,645,21,'15:00',NULL,'4:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'23. Spieltag',NULL,'\0',0.00,70,0.00,0.00,0.00,0.00,0.00),(942,80,0,NULL,NULL,116,'2004-03-21',235,'DE',58,277,236,154,154,253,'10:45',NULL,'2:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,69,0.00,0.00,0.00,0.00,0.00),(943,250,0,NULL,NULL,394,'2004-03-14',449,'DE',157,168,51,646,642,94,'15:00',NULL,'2:2','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,68,0.00,0.00,0.00,0.00,0.00),(944,150,0,NULL,NULL,116,'2004-02-29',449,'DE',108,25,763,154,154,13,'15:00',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,67,0.00,0.00,0.00,0.00,0.00),(945,30,0,'nur eine Halbzeit verfolgt',NULL,116,'2004-02-29',449,'DE',82,764,548,154,154,252,'13:00',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,66,0.00,0.00,0.00,0.00,0.00),(946,25,0,'Eine Halbzeit verfolgt',NULL,116,'2004-02-29',449,'DE',82,765,766,154,154,251,'12:00',NULL,'5:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,65,0.00,0.00,0.00,0.00,0.00),(947,100,0,NULL,NULL,116,'2004-02-29',449,'DE',45,441,767,154,154,250,'10:45',NULL,'2:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'21. Spieltag',NULL,'\0',0.00,64,0.00,0.00,0.00,0.00,0.00),(948,100,0,'zweite Halbzeit verfolgt.',NULL,116,'2004-02-23',449,'DE',19,83,768,154,647,72,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,63,0.00,0.00,0.00,0.00,0.00),(949,120,40,NULL,NULL,256,'2004-02-22',90,'DE',157,23,8,648,188,11,'15:00',NULL,'1:3','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'20. Spieltag',NULL,'\0',0.00,62,0.00,0.00,0.00,0.00,0.00),(950,70,0,NULL,NULL,453,'2004-02-14',449,'DE',157,181,84,618,125,249,'15:00',NULL,'2:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'19. Spieltag',NULL,'\0',0.00,61,0.00,0.00,0.00,0.00,0.00),(951,50,0,'nach der ersten Halbzeit weiter nach Lohbrügge gefahren (Halbzeithopping)',NULL,116,'2004-02-14',57,'DE',108,446,755,154,154,248,'12:00',NULL,'5:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,60,0.00,0.00,0.00,0.00,0.00),(952,100,40,NULL,NULL,116,'2004-02-08',267,'DE',157,138,8,154,188,247,'10:45',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'18. Spieltag',NULL,'\0',0.00,59,0.00,0.00,0.00,0.00,0.00),(953,70,0,NULL,NULL,116,'2004-02-07',449,'DE',58,3,277,154,154,246,'14:00',NULL,'0:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,58,0.00,0.00,0.00,0.00,0.00),(954,750,500,NULL,NULL,116,'2004-02-01',167,'DE',19,769,101,154,649,245,'14:00',NULL,'0:7','0:4',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,57,0.00,0.00,0.00,0.00,0.00),(955,500,400,NULL,NULL,116,'2004-01-20',449,'DE',19,658,101,154,649,244,'19:00',NULL,'0:8','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,56,0.00,0.00,0.00,0.00,0.00),(956,1800,43,NULL,NULL,116,'2004-01-16',431,'AE',19,490,1,610,487,243,'18:00',NULL,'2:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,55,0.00,0.00,0.00,0.00,0.00),(957,250,0,NULL,NULL,116,'2003-12-14',449,'DE',16,41,515,154,154,230,'14:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,54,0.00,0.00,0.00,0.00,0.00),(958,823,600,NULL,NULL,116,'2003-12-13',449,'DE',16,447,101,154,649,242,'14:00',NULL,'0:2','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde',NULL,'\0',0.00,53,0.00,0.00,0.00,0.00,0.00),(959,280,0,NULL,NULL,454,'2003-12-07',449,'DE',157,8,168,188,646,21,'14:00',NULL,'2:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'17. Spieltag',NULL,'\0',0.00,52,0.00,0.00,0.00,0.00,0.00),(960,43000,4300,NULL,NULL,125,'2003-12-06',70,'DE',1,52,1,35,487,27,'15:30',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'',0.00,51,0.00,0.00,0.00,0.00,0.00),(961,300,50,NULL,NULL,116,'2003-11-28',377,'MT',184,770,771,154,154,241,'18:00',NULL,'2:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,50,0.00,0.00,0.00,0.00,0.00),(962,200,0,NULL,NULL,116,'2003-11-22',449,'DE',45,123,146,154,154,240,'14:00',NULL,'2:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'15. Spieltag',NULL,'\0',0.00,49,0.00,0.00,0.00,0.00,0.00),(963,150,0,NULL,NULL,116,'2003-11-16',449,'DE',45,318,202,154,154,239,'14:00',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,48,0.00,0.00,0.00,0.00,0.00),(964,120,40,NULL,NULL,116,'2003-11-15',275,'DE',16,233,8,154,188,238,'14:00',NULL,'1:1','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'4. Runde','6:4','\0',0.00,47,0.00,0.00,0.00,0.00,0.00),(965,70,0,NULL,NULL,116,'2003-11-08',75,'DE',167,772,773,154,154,237,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,46,0.00,0.00,0.00,0.00,0.00),(966,100,0,'nach der ersten Halbzeit Sportplatz verlassen (Halbzeithopping)',NULL,116,'2003-11-07',449,'DE',108,543,755,154,154,236,'19:30',NULL,'6:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,45,0.00,0.00,0.00,0.00,0.00),(967,150,0,NULL,NULL,116,'2003-11-02',38,'DE',165,510,100,154,154,235,'14:00',NULL,'5:3','1:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,44,0.00,0.00,0.00,0.00,0.00),(968,130,50,NULL,NULL,364,'2003-10-31',449,'DE',157,64,8,634,188,128,'19:30',NULL,'1:2','1:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'13. Spieltag',NULL,'\0',0.00,43,0.00,0.00,0.00,0.00,0.00),(969,230,0,NULL,NULL,197,'2003-10-26',449,'DE',157,8,181,188,618,21,'14:00',NULL,'2:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'12. Spieltag',NULL,'\0',0.00,42,0.00,0.00,0.00,0.00,0.00),(970,200,50,NULL,NULL,455,'2003-10-19',55,'DE',157,117,8,638,188,154,'15:00',NULL,'1:2','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'11. Spieltag',NULL,'\0',0.00,41,0.00,0.00,0.00,0.00,0.00),(971,35,0,'nur eine Halbzeit verfolgt (Halbzeithopping)',NULL,116,'2003-10-18',312,'DE',99,774,775,154,154,234,'15:00',NULL,'0:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,40,0.00,0.00,0.00,0.00,0.00),(972,25000,400,NULL,NULL,456,'2003-10-15',426,'UA',140,776,57,650,628,233,'18:00',NULL,'3:0','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde (Rückspiel)',NULL,'',0.00,39,0.00,0.00,0.00,0.00,0.00),(973,295,0,NULL,NULL,116,'2003-10-12',77,'DE',45,211,288,221,154,232,'15:00',NULL,'3:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,38,0.00,0.00,0.00,0.00,0.00),(974,20,0,'Nach der ersten Halbzei weiter zum nächsten Spiel (Halbzeithopping)',NULL,116,'2003-10-12',164,'DE',185,777,778,154,154,231,'13:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,37,0.00,0.00,0.00,0.00,0.00),(975,250,0,NULL,NULL,116,'2003-10-12',449,'DE',45,146,202,154,154,200,'11:00',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'10. Spieltag',NULL,'\0',0.00,36,0.00,0.00,0.00,0.00,0.00),(976,320,100,NULL,NULL,256,'2003-10-05',449,'DE',157,63,8,528,188,36,'10:45',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,34,0.00,0.00,0.00,0.00,0.00),(977,29000,3000,NULL,NULL,387,'2003-09-27',280,'DE',1,264,1,121,487,57,'15:30',NULL,'1:2','0:1',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'',0.00,33,0.00,0.00,0.00,0.00,0.00),(978,50,0,NULL,NULL,116,'2003-09-27',280,'DE',74,779,780,154,154,229,'13:00',NULL,'3:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,32,0.00,0.00,0.00,0.00,0.00),(979,80,0,NULL,NULL,116,'2003-10-05',449,'DE',91,41,47,154,154,230,'15:00',NULL,'3:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'9. Spieltag',NULL,'\0',0.00,35,0.00,0.00,0.00,0.00,0.00),(980,150,0,NULL,NULL,116,'2003-09-21',150,'DE',165,746,781,627,154,228,'15:00',NULL,'4:1','3:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,31,0.00,0.00,0.00,0.00,0.00),(981,210,50,NULL,NULL,251,'2003-09-12',449,'DE',157,782,8,651,188,95,'19:30',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'6. Spieltag',NULL,'\0',0.00,29,0.00,0.00,0.00,0.00,0.00),(982,450,0,NULL,NULL,457,'2003-09-07',115,'DE',186,783,784,652,653,227,'15:00',NULL,'5:1','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'7. Spieltag',NULL,'\0',0.00,28,0.00,0.00,0.00,0.00,0.00),(983,3548,2500,NULL,NULL,458,'2003-09-06',373,'LI',187,785,786,654,655,226,'20:00',NULL,'0:3','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'8. Spieltag (Gruppe 7)',NULL,'\0',0.00,27,0.00,0.00,0.00,0.00,0.00),(984,400,0,'Stadion zur zweiten Halbzeit erreicht',NULL,116,'2003-09-06',387,'AT',188,787,788,154,154,225,'17:00',NULL,'4:2','2:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,26,0.00,0.00,0.00,0.00,0.00),(985,1100,0,NULL,NULL,116,'2003-09-06',388,'AT',26,789,790,154,154,224,'15:30',NULL,'0:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'14. Spieltag',NULL,'\0',0.00,25,0.00,0.00,0.00,0.00,0.00),(986,3500,2500,NULL,NULL,459,'2003-08-30',70,'DE',7,267,315,656,558,223,'18:30',NULL,'2:5','1:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,24,0.00,0.00,0.00,0.00,0.00),(987,70,0,NULL,NULL,428,'2003-08-30',147,'DE',151,791,792,154,154,222,'16:00',NULL,'4:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'4. Spieltag',NULL,'\0',0.00,23,0.00,0.00,0.00,0.00,0.00),(988,300,0,'2. Halbzeit verfolgt (Halbzeithopping)',NULL,116,'2003-08-22',449,'DE',91,603,319,154,154,221,'19:30',NULL,'1:3','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,22,0.00,0.00,0.00,0.00,0.00),(989,100,0,'nach der ersten Halbzeit zum Hammer Park (Halbzeithopping)',NULL,116,'2003-08-22',449,'DE',91,47,465,154,154,53,'18:30',NULL,'1:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,21,0.00,0.00,0.00,0.00,0.00),(991,400,200,NULL,NULL,116,'2003-08-18',195,'DE',19,793,46,154,57,219,'19:00',NULL,'0:9','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,20,0.00,0.00,0.00,0.00,0.00),(992,150,0,NULL,NULL,116,'2003-08-17',229,'DE',151,794,795,154,154,218,'15:00',NULL,'2:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Spieltag',NULL,'\0',0.00,19,0.00,0.00,0.00,0.00,0.00),(993,650,600,NULL,NULL,116,'2003-08-13',449,'DE',16,682,101,154,649,216,'19:00',NULL,'1:4','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,18,0.00,0.00,0.00,0.00,0.00),(994,50,0,NULL,NULL,116,'2003-08-12',449,'DE',16,593,419,154,154,217,'10:45',NULL,'0:0','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'3. Runde','5:4','\0',0.00,16,0.00,0.00,0.00,0.00,0.00),(995,80,0,NULL,NULL,116,'2003-08-12',449,'DE',91,41,71,154,154,215,'15:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,NULL,NULL,'\0',0.00,17,0.00,0.00,0.00,0.00,0.00),(996,50,0,NULL,NULL,116,'2003-08-10',449,'DE',58,516,796,154,154,214,'15:00',NULL,'1:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,15,0.00,0.00,0.00,0.00,0.00),(997,5,0,NULL,NULL,116,'2003-08-06',308,'DE',189,797,798,154,154,213,'19:00',NULL,'0:0','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Achtelfinale',NULL,'\0',0.00,14,0.00,0.00,0.00,0.00,0.00),(998,400,150,NULL,NULL,116,'2003-08-05',131,'DE',16,799,83,154,154,212,'19:30',NULL,'0:7','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,13,0.00,0.00,0.00,0.00,0.00),(999,50,0,NULL,NULL,116,'2003-08-03',185,'DE',16,288,513,154,154,211,'17:00',NULL,'0:0','0:0','nvUiE',0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde','7:6','\0',0.00,12,0.00,0.00,0.00,0.00,0.00),(1000,2100,2000,NULL,NULL,116,'2003-08-03',20,'DE',16,800,101,154,649,210,'15:00',NULL,'1:21','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'1. Runde',NULL,'\0',0.00,11,0.00,0.00,0.00,0.00,0.00),(1001,30,0,NULL,NULL,116,'2003-09-21',64,'DE',29,801,802,154,154,209,'13:00',NULL,'2:1','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'n. n.',NULL,'\0',0.00,30,0.00,0.00,0.00,0.00,0.00),(1002,20,0,NULL,NULL,116,'2003-08-03',449,'DE',20,803,376,154,154,208,'10:45',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'2. Runde',NULL,'\0',0.00,10,0.00,0.00,0.00,0.00,0.00),(1003,10,0,NULL,NULL,116,'2003-07-31',102,'DE',19,658,763,154,154,207,'19:00',NULL,'1:6','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,9,0.00,0.00,0.00,0.00,0.00),(1004,13000,10000,'macj der ersten Halnzeit sinnloserweise zum Stadion Hammer Park gefahren (da kein Spiel...)',NULL,459,'2003-07-25',171,'DE',19,221,1,658,487,77,'18:00',NULL,'2:6','0:2',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'',0.00,8,0.00,0.00,0.00,0.00,0.00),(1005,50,0,NULL,NULL,116,'2003-07-24',207,'DE',19,804,805,154,154,205,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,7,0.00,0.00,0.00,0.00,0.00),(1006,20,0,'Zweite Halbzeit verfolgt (Halbzeithopping)',NULL,116,'2003-07-22',449,'DE',19,181,7,154,154,204,'19:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,6,0.00,0.00,0.00,0.00,0.00),(1007,200,0,NULL,NULL,116,'2003-07-20',328,'DE',19,46,609,57,545,203,'17:00',NULL,'4:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,5,0.00,0.00,0.00,0.00,0.00),(1008,40,0,NULL,NULL,116,'2003-07-20',449,'DE',19,465,355,154,154,202,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Testspiel',NULL,'\0',0.00,4,0.00,0.00,0.00,0.00,0.00),(1009,250,0,NULL,NULL,116,'2003-07-17',449,'DE',19,666,658,154,154,200,'14:00',NULL,'0:0','0:0',NULL,0.00,0.00,0.00,0.00,0.00,0.00,'Viertelfinale (Harburg-Pokal)',NULL,'\0',0.00,3,0.00,0.00,0.00,0.00,0.00),(1010,80,6,NULL,'<br>',460,'2016-04-01',24,'DE',66,806,59,659,270,662,'19:30',NULL,'1:0','0:0',NULL,4.22,0.00,0.00,0.00,0.00,0.00,'25. Spieltag',NULL,'\0',2.00,979,0.00,0.00,0.00,0.00,0.00),(1011,75000,4000,NULL,NULL,105,'2016-04-02',220,'DE',1,1,38,1,660,9,'15:30',NULL,'1:0','1:0',NULL,4.46,72.00,0.00,0.00,20.26,0.00,'28. Spieltag',NULL,'',12.00,980,0.00,0.00,0.00,0.00,0.00),(1012,2390,150,NULL,NULL,461,'2016-04-14',1162,'BG',190,808,807,661,662,663,'19:00',NULL,'3:0','2:0',NULL,0.00,0.00,179.96,0.00,0.00,0.00,'28. Spieltag',NULL,'\0',12.00,981,0.00,0.00,0.00,0.00,62.00);
/*!40000 ALTER TABLE `sp_besuche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_spieler_spiel_tabelle`
--

DROP TABLE IF EXISTS `sp_spieler_spiel_tabelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_spieler_spiel_tabelle` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `spiel_id` int(11) NOT NULL,
  `spieler_id` int(11) NOT NULL,
  `status` char(2) NOT NULL,
  `status2` char(1) NOT NULL,
  `aw` char(1) DEFAULT '0',
  `aw_minute` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`lfd_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_spieler_spiel_tabelle`
--

LOCK TABLES `sp_spieler_spiel_tabelle` WRITE;
/*!40000 ALTER TABLE `sp_spieler_spiel_tabelle` DISABLE KEYS */;
INSERT INTO `sp_spieler_spiel_tabelle` VALUES (1,407,25,'sa','h','0',NULL),(2,407,26,'sa','h','0',NULL),(3,407,27,'sa','h','0',NULL),(4,407,28,'sa','h','0',NULL),(5,407,29,'sa','h','1','46'),(6,407,30,'sa','h','0',NULL),(7,407,31,'sa','h','0',NULL),(8,407,32,'sa','h','0',NULL),(9,407,33,'sa','h','0',NULL),(10,407,34,'sa','h','1','46'),(11,407,35,'sa','h','0',NULL),(12,407,36,'ew','h','2','46'),(13,407,37,'ew','h','2','46'),(14,407,43,'sa','a','1','46'),(15,407,44,'sa','a','1','46'),(16,407,45,'sa','a','0',NULL),(17,407,46,'sa','a','0',NULL),(18,407,47,'sa','a','1','75'),(19,407,48,'sa','a','0',NULL),(20,407,38,'sa','a','0',NULL),(21,407,39,'sa','a','0',NULL),(22,407,40,'sa','a','1','46'),(23,407,41,'sa','a','0',NULL),(24,407,42,'sa','a','0',NULL),(25,407,49,'ew','a','2','46'),(26,407,50,'ew','a','2','46'),(27,407,51,'ew','a','2','46'),(28,407,52,'ew','a','2','75'),(29,462,58,'sa','h','0',NULL),(30,462,59,'sa','h','0',NULL),(31,462,60,'sa','h','0',NULL),(32,462,61,'sa','h','0',NULL),(33,462,62,'sa','h','0',NULL),(34,462,63,'sa','h','0',NULL),(35,462,64,'sa','h','0',NULL),(36,462,65,'sa','h','0',NULL),(37,462,66,'sa','h','0',NULL),(38,462,67,'sa','h','0',NULL),(39,462,68,'sa','h','0',NULL),(40,462,69,'sa','a','0',NULL),(41,462,70,'sa','a','0',NULL),(42,462,71,'sa','a','0',NULL),(43,462,72,'sa','a','0',NULL),(44,462,73,'sa','a','0',NULL),(45,462,74,'sa','a','0',NULL),(46,462,89,'sa','a','0',NULL),(47,462,90,'sa','a','0',NULL),(48,462,91,'sa','a','0',NULL),(49,462,92,'sa','a','0',NULL),(50,462,93,'sa','a','0',NULL),(51,468,107,'sa','h','0',NULL),(52,468,108,'sa','h','0',NULL),(53,468,109,'sa','h','0',NULL),(54,468,120,'sa','h','0',NULL),(55,468,110,'sa','h','0',NULL),(56,468,111,'sa','h','1','81'),(57,468,112,'sa','h','0',NULL),(58,468,113,'sa','h','0',NULL),(59,468,114,'sa','h','0',NULL),(60,468,115,'sa','h','1','69'),(61,468,116,'sa','h','1','77'),(62,468,117,'ew','h','2','69'),(63,468,118,'ew','h','2','77'),(64,468,119,'ew','h','2','81'),(65,468,6,'sa','a','0',NULL),(66,468,11,'sa','a','0',NULL),(67,468,21,'sa','a','1','56'),(68,468,97,'sa','a','0',NULL),(69,468,12,'sa','a','0',NULL),(70,468,99,'sa','a','0',NULL),(71,468,121,'sa','a','0',NULL),(72,468,100,'sa','a','1','81'),(73,468,23,'sa','a','1','69'),(74,468,102,'sa','a','0',NULL),(75,468,15,'sa','a','0',NULL),(76,468,104,'ew','a','2','56'),(77,468,105,'ew','a','2','69'),(78,468,16,'ew','a','2','81'),(79,501,6,'sa','h','0',NULL),(80,501,11,'sa','h','0',NULL),(81,501,12,'sa','h','0',NULL),(82,501,97,'sa','h','0',NULL),(83,501,100,'sa','h','1','88'),(84,501,99,'sa','h','0',NULL),(85,501,102,'sa','h','1','62'),(86,501,135,'sa','h','0',NULL),(87,501,15,'sa','h','0',NULL),(88,501,16,'sa','h','0',NULL),(89,501,23,'sa','h','1','67'),(90,501,121,'ew','h','2','62'),(91,501,105,'ew','h','2','67'),(92,501,10,'ew','h','2','88'),(93,501,122,'sa','a','0',NULL),(94,501,123,'sa','a','0',NULL),(95,501,136,'sa','a','0',NULL),(96,501,124,'sa','a','0',NULL),(97,501,125,'sa','a','0',NULL),(98,501,126,'sa','a','0',NULL),(99,501,127,'sa','a','1','62'),(100,501,128,'sa','a','1','77'),(101,501,129,'sa','a','0',NULL),(102,501,130,'sa','a','0',NULL),(103,501,131,'sa','a','1','68'),(105,501,132,'ew','a','2','68'),(106,501,134,'ew','a','2','77'),(107,508,137,'sa','h','0',NULL),(108,508,138,'sa','h','0',NULL),(109,508,139,'sa','h','0',NULL),(110,508,140,'sa','h','0',NULL),(111,508,141,'sa','h','0',NULL),(112,508,142,'sa','h','0',NULL),(113,508,143,'sa','h','1','50'),(114,508,144,'sa','h','0',NULL),(115,508,145,'sa','h','0',NULL),(116,508,146,'sa','h','0',NULL),(117,508,147,'sa','h','0',NULL),(118,508,148,'ew','h','2','50'),(119,508,149,'sa','a','0',NULL),(120,508,150,'sa','a','0',NULL),(121,508,151,'sa','a','0',NULL),(122,508,152,'sa','a','0',NULL),(123,508,153,'sa','a','1','72'),(124,508,154,'sa','a','0',NULL),(125,508,155,'sa','a','1','65'),(126,508,156,'sa','a','1','78'),(127,508,157,'sa','a','1','56'),(128,508,158,'sa','a','0',NULL),(129,508,12,'sa','a','0',NULL),(130,508,160,'ew','a','2','56'),(131,508,161,'ew','a','2','65'),(132,508,159,'ew','a','2','72'),(133,508,162,'ew','a','2','78'),(134,527,6,'sa','a','0',NULL),(135,527,135,'sa','a','0',NULL),(136,527,99,'sa','a','1','64'),(137,527,12,'sa','a','0',NULL),(138,527,97,'sa','a','1','80'),(139,527,121,'sa','a','0',NULL),(140,527,23,'sa','a','0',NULL),(141,527,16,'sa','a','0',NULL),(142,527,100,'sa','a','0',NULL),(143,527,11,'sa','a','1','75'),(144,527,15,'sa','a','0',NULL),(145,527,9,'ew','a','2','64'),(146,527,10,'ew','a','2','75'),(147,527,105,'ew','a','2','80'),(148,527,190,'sa','h','0',NULL),(149,527,191,'sa','h','0',NULL),(150,527,192,'sa','h','0',NULL),(151,527,193,'sa','h','0',NULL),(152,527,194,'sa','h','1','29'),(153,527,195,'sa','h','0',NULL),(154,527,196,'sa','h','0',NULL),(155,527,197,'sa','h','0',NULL),(156,527,198,'sa','h','1','46'),(157,527,199,'sa','h','0',NULL),(158,527,200,'sa','h','1','64'),(159,527,201,'ew','h','2','29'),(160,527,202,'ew','h','2','46'),(161,527,203,'ew','h','2','64'),(162,583,231,'sa','h','0',NULL),(163,583,232,'sa','h','0',NULL),(164,583,204,'sa','h','0',NULL),(165,583,205,'sa','h','0',NULL),(166,583,206,'sa','h','0',NULL),(167,583,207,'sa','h','0',NULL),(168,583,208,'sa','h','1','57'),(169,583,209,'sa','h','1','69'),(170,583,210,'sa','h','0',NULL),(171,583,211,'sa','h','1','57'),(172,583,212,'sa','h','0',NULL),(173,583,213,'ew','h','2','57'),(174,583,214,'ew','h','2','57'),(175,583,215,'ew','h','2','69'),(176,583,216,'sa','a','0',NULL),(177,583,217,'sa','a','0',NULL),(178,583,218,'sa','a','0',NULL),(179,583,219,'sa','a','0',NULL),(180,583,220,'sa','a','0',NULL),(181,583,221,'sa','a','0',NULL),(182,583,222,'sa','a','1','19'),(183,583,223,'sa','a','0',NULL),(184,583,224,'sa','a','0',NULL),(185,583,225,'sa','a','1','89'),(186,583,226,'sa','a','1','80'),(187,583,227,'ew','a','2','19'),(188,583,229,'ew','a','2','80'),(189,583,230,'ew','a','2','89'),(190,584,6,'sa','h','0',NULL),(191,584,9,'sa','h','0',NULL),(192,584,135,'sa','h','0',NULL),(193,584,250,'sa','h','1','53'),(194,584,12,'sa','h','0',NULL),(195,584,105,'sa','h','0',NULL),(196,584,16,'sa','h','1','81'),(197,584,23,'sa','h','0',NULL),(198,584,100,'sa','h','0',NULL),(199,584,102,'sa','h','1','53'),(200,584,15,'sa','h','0',NULL),(201,584,251,'ew','h','2','53'),(202,584,10,'ew','h','2','53'),(203,584,99,'ew','h','2','81'),(204,584,236,'sa','a','0',NULL),(205,584,237,'sa','a','0',NULL),(206,584,238,'sa','a','0',NULL),(207,584,239,'sa','a','0',NULL),(208,584,240,'sa','a','0',NULL),(209,584,241,'sa','a','1','73'),(210,584,242,'sa','a','0',NULL),(211,584,243,'sa','a','0',NULL),(212,584,244,'sa','a','1','87'),(213,584,245,'sa','a','1','61'),(214,584,246,'sa','a','0',NULL),(215,584,247,'ew','a','2','61'),(216,584,248,'ew','a','2','73'),(217,584,249,'ew','a','2','87'),(218,612,252,'sa','h','0',NULL),(219,612,253,'sa','h','0',NULL),(220,612,254,'sa','h','0',NULL),(221,612,255,'sa','h','0',NULL),(222,612,256,'sa','h','0',NULL),(223,612,257,'sa','h','1','89'),(224,612,258,'sa','h','0',NULL),(225,612,259,'sa','h','0',NULL),(226,612,260,'sa','h','1','56'),(227,612,261,'sa','h','0',NULL),(228,612,262,'sa','h','0',NULL),(229,612,274,'ew','h','2','56'),(230,612,275,'ew','h','2','89'),(231,612,263,'sa','a','0',NULL),(232,612,264,'sa','a','0',NULL),(233,612,265,'sa','a','0',NULL),(234,612,266,'sa','a','0',NULL),(235,612,267,'sa','a','0',NULL),(236,612,268,'sa','a','0',NULL),(237,612,269,'sa','a','0',NULL),(238,612,270,'sa','a','1','59'),(239,612,271,'sa','a','1','78'),(240,612,272,'sa','a','1','85'),(241,612,273,'sa','a','0',NULL),(242,612,276,'ew','a','2','59'),(243,612,277,'ew','a','2','78'),(244,612,278,'ew','a','2','85'),(245,613,279,'sa','h','0',NULL),(246,613,284,'sa','h','1','72'),(248,613,7,'sa','h','0',NULL),(250,613,286,'sa','h','0',NULL),(251,613,280,'sa','h','0',NULL),(252,613,285,'sa','h','0',NULL),(253,613,287,'sa','h','1','84'),(254,613,288,'sa','h','0',NULL),(255,613,292,'sa','h','0',NULL),(256,613,289,'ew','h','2','72'),(257,613,142,'ew','h','2','76'),(258,613,291,'ew','h','2','84'),(259,613,6,'sa','a','0',NULL),(260,613,11,'sa','a','0',NULL),(261,613,135,'sa','a','0',NULL),(262,613,12,'sa','a','0',NULL),(263,613,10,'sa','a','0',NULL),(264,613,99,'sa','a','0',NULL),(265,613,16,'sa','a','1','56'),(266,613,23,'sa','a','0',NULL),(267,613,100,'sa','a','1','50'),(268,613,102,'sa','a','1','88'),(269,613,15,'sa','a','0',NULL),(270,613,121,'ew','a','2','50'),(271,613,251,'ew','a','2','56'),(272,613,18,'ew','a','2','88'),(273,638,293,'sa','h','0',NULL),(274,638,320,'sa','h','0',NULL),(275,638,294,'sa','h','0',NULL),(276,638,295,'sa','h','0',NULL),(277,638,296,'sa','h','0',NULL),(278,638,297,'sa','h','1','73'),(279,638,298,'sa','h','0',NULL),(280,638,299,'sa','h','1','66'),(281,638,300,'sa','h','0',NULL),(282,638,301,'sa','h','1','58'),(283,638,302,'sa','h','0',NULL),(284,638,314,'ew','h','2','58'),(285,638,315,'ew','h','2','66'),(286,638,316,'ew','h','2','73'),(287,638,303,'sa','a','0',NULL),(288,638,304,'sa','a','0',NULL),(289,638,305,'sa','a','0',NULL),(290,638,306,'sa','a','0',NULL),(291,638,307,'sa','a','0',NULL),(292,638,308,'sa','a','0',NULL),(293,638,309,'sa','a','1','46'),(294,638,310,'sa','a','0',NULL),(295,638,311,'sa','a','0',NULL),(296,638,312,'sa','a','1','70'),(297,638,313,'sa','a','1','57'),(298,638,317,'ew','a','2','46'),(299,638,318,'ew','a','2','57'),(300,638,319,'ew','a','2','70'),(301,639,321,'sa','h','0',NULL),(302,639,322,'sa','h','0',NULL),(303,639,323,'sa','h','0',NULL),(304,639,324,'sa','h','0',NULL),(305,639,325,'sa','h','0',NULL),(306,639,326,'sa','h','0',NULL),(307,639,327,'sa','h','1','90'),(308,639,328,'sa','h','0',NULL),(309,639,329,'sa','h','0',NULL),(310,639,330,'sa','h','0',NULL),(311,639,331,'sa','h','1','81'),(312,639,332,'ew','h','2','81'),(313,639,333,'ew','h','2','90'),(314,639,6,'sa','a','0',NULL),(315,639,11,'sa','a','0',NULL),(316,639,135,'sa','a','0',NULL),(317,639,12,'sa','a','0',NULL),(318,639,10,'sa','a','0',NULL),(319,639,99,'sa','a','1','90'),(320,639,16,'sa','a','0',NULL),(321,639,23,'sa','a','0',NULL),(322,639,105,'sa','a','0',NULL),(323,639,100,'sa','a','1','75'),(324,639,15,'sa','a','0',NULL),(325,639,251,'ew','a','2','75'),(326,639,8,'ew','a','2','90'),(327,810,334,'sa','h','0',NULL),(328,810,335,'sa','h','0',NULL),(329,810,336,'sa','h','0',NULL),(330,810,337,'sa','h','0',NULL),(331,810,338,'sa','h','0',NULL),(332,810,339,'sa','h','0',NULL),(333,810,357,'sa','h','1','46'),(334,810,340,'sa','h','0',NULL),(335,810,341,'sa','h','0',NULL),(336,810,342,'sa','h','0',NULL),(337,810,343,'sa','h','0',NULL),(338,810,358,'ew','h','2','46'),(339,810,346,'sa','a','0',NULL),(340,810,347,'sa','a','1','78'),(341,810,348,'sa','a','0',NULL),(342,810,349,'sa','a','0',NULL),(343,810,350,'sa','a','0',NULL),(344,810,351,'sa','a','0',NULL),(345,810,352,'sa','a','1','46'),(346,810,353,'sa','a','1','46'),(347,810,354,'sa','a','0',NULL),(348,810,355,'sa','a','0',NULL),(349,810,356,'sa','a','0',NULL),(350,810,361,'ew','a','2','46'),(351,810,359,'ew','a','2','46'),(352,810,360,'ew','a','2','78'),(353,1010,362,'sa','h','0',NULL),(354,1010,363,'sa','h','0',NULL),(355,1010,364,'sa','h','1','68'),(357,1010,366,'sa','h','0',NULL),(358,1010,367,'sa','h','0',NULL),(359,1010,368,'sa','h','1','84'),(360,1010,369,'sa','h','1','68'),(361,1010,370,'sa','h','0',NULL),(362,1010,371,'sa','h','0',NULL),(363,1010,372,'sa','h','0',NULL),(364,1010,381,'sa','a','0',NULL),(365,1010,382,'sa','a','0',NULL),(367,1010,384,'sa','a','0',NULL),(368,1010,385,'sa','a','0',NULL),(369,1010,386,'sa','a','0',NULL),(370,1010,376,'sa','a','0',NULL),(371,1010,377,'sa','a','0',NULL),(372,1010,378,'sa','a','0',NULL),(373,1010,379,'sa','a','0',NULL),(374,1010,380,'sa','a','1','68'),(375,1010,383,'sa','a','0',NULL),(376,1010,365,'sa','h','0',NULL),(377,1010,373,'ew','h','2','68'),(378,1010,374,'ew','h','2','68'),(379,1010,375,'ew','h','2','84'),(380,1010,387,'ew','a','2','68'),(382,1011,6,'sa','h','0',NULL),(383,1011,11,'sa','h','0',NULL),(384,1011,104,'sa','h','0',NULL),(385,1011,12,'sa','h','0',NULL),(386,1011,10,'sa','h','0',NULL),(387,1011,99,'sa','h','0',NULL),(388,1011,23,'sa','h','0',NULL),(389,1011,22,'sa','h','1','85'),(390,1011,121,'sa','h','0',NULL),(391,1011,251,'sa','h','0',NULL),(392,1011,15,'sa','h','1','71'),(393,1011,100,'ew','h','2','71'),(394,1011,105,'ew','h','2','85'),(395,1011,388,'sa','a','0',NULL),(396,1011,389,'sa','a','0',NULL),(397,1011,390,'sa','a','0',NULL),(398,1011,391,'sa','a','0',NULL),(399,1011,392,'sa','a','0',NULL),(400,1011,393,'sa','a','0',NULL),(401,1011,394,'sa','a','0',NULL),(402,1011,395,'sa','a','1','48'),(403,1011,396,'sa','a','0',NULL),(404,1011,397,'sa','a','1','64'),(405,1011,398,'sa','a','1','58'),(406,1011,399,'ew','a','2','48'),(407,1011,400,'ew','a','2','58'),(408,1011,401,'ew','a','2','64');
/*!40000 ALTER TABLE `sp_spieler_spiel_tabelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_tore_spiel_tabelle`
--

DROP TABLE IF EXISTS `sp_tore_spiel_tabelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sp_tore_spiel_tabelle` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `spiel_id` int(11) NOT NULL,
  `spieler_id_a` int(11) DEFAULT NULL,
  `spieler_id_h` int(11) DEFAULT NULL,
  `sp_minute` int(11) DEFAULT NULL,
  `besonderheit` varchar(10) DEFAULT NULL,
  `spielstand` varchar(5) NOT NULL,
  `team` char(1) NOT NULL,
  `elfer` int(11) DEFAULT '0',
  PRIMARY KEY (`lfd_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_tore_spiel_tabelle`
--

LOCK TABLES `sp_tore_spiel_tabelle` WRITE;
/*!40000 ALTER TABLE `sp_tore_spiel_tabelle` DISABLE KEYS */;
INSERT INTO `sp_tore_spiel_tabelle` VALUES (1,407,NULL,31,20,'','1:0','h',0),(2,407,NULL,31,26,'','2:0','h',0),(3,407,NULL,31,26,'FE','3:0','h',0),(4,407,NULL,35,38,'','4:0','h',0),(5,407,NULL,28,47,'','5:0','h',0),(7,407,NULL,33,89,'','7:0','h',0),(8,462,NULL,67,40,'','1:0','h',0),(9,468,15,NULL,38,'FE','0:1','a',0),(10,468,NULL,114,53,'','1:1','h',0),(11,468,15,NULL,61,'','1:2','a',0),(12,407,46,NULL,48,'ET','6:0','a',0),(13,501,NULL,15,32,'','1:0','h',0),(14,501,NULL,15,64,'','2:0','h',0),(15,527,15,NULL,39,'','0:1','a',0),(16,527,121,NULL,61,'','0:2','a',0),(17,527,15,NULL,90,'','0:3','a',0),(18,583,NULL,207,10,'','1:0','h',0),(19,583,221,NULL,11,'','1:1','a',0),(20,583,226,NULL,32,'','1:2','a',0),(21,583,NULL,204,53,'ET','1:3','h',0),(26,584,246,NULL,27,'','0:1','a',0),(27,584,NULL,23,49,'','1:1','h',0),(28,584,NULL,23,71,'','2:1','h',0),(30,612,NULL,262,33,'','1:0','h',0),(31,612,270,NULL,45,'','1:1','a',0),(32,613,102,NULL,66,'','0:1','a',0),(33,613,15,NULL,74,'','0:2','a',0),(34,638,NULL,302,10,'','1:0','h',0),(35,638,NULL,302,19,'','2:0','h',0),(36,638,NULL,296,44,'','3:0','h',0),(37,638,NULL,301,50,'','4:0','h',0),(38,638,NULL,302,63,'','5:0','h',0),(40,810,NULL,343,15,'','1:0','h',0),(41,810,351,NULL,53,'','1:1','a',0),(42,810,NULL,335,78,'','2:1','h',0),(43,810,NULL,337,89,'','3:1','h',0),(46,1010,NULL,368,81,'','1:0','h',0),(47,1011,NULL,251,20,'','1:0','h',0),(49,584,NULL,15,84,'HE','3:1','h',0);
/*!40000 ALTER TABLE `sp_tore_spiel_tabelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spieler`
--

DROP TABLE IF EXISTS `spieler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spieler` (
  `spieler_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(264) NOT NULL,
  `vorname` varchar(264) DEFAULT NULL,
  `land` char(2) DEFAULT NULL,
  `position` char(2) DEFAULT NULL,
  `trikot_nr` int(11) DEFAULT NULL,
  `nati_spieler` bit(1) DEFAULT b'0',
  `geb_datum` date DEFAULT NULL,
  `status` bit(1) DEFAULT b'0',
  PRIMARY KEY (`spieler_id`)
) ENGINE=InnoDB AUTO_INCREMENT=430 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spieler`
--

LOCK TABLES `spieler` WRITE;
/*!40000 ALTER TABLE `spieler` DISABLE KEYS */;
INSERT INTO `spieler` VALUES (6,'Neuer 	','Manuel','DE','tw',NULL,'\0','1986-03-27','\0'),(7,'Dante','Bonfim Costa Santos','BR','aw',NULL,'\0','1983-10-18','\0'),(8,'Benatia 	','Medhi','MA','aw',NULL,'\0','1987-04-17','\0'),(9,'Rafinha','Marcio Rafael Ferreira de Souza','BR','aw',NULL,'\0','1985-09-07','\0'),(10,'Bernat 	','Juan','ES','aw',NULL,'\0','1993-03-01','\0'),(11,'Lahm 	','Philipp','DE','mi',NULL,'\0','1983-11-11','\0'),(12,'Alaba 	','David','AT','aw',NULL,'\0','1992-06-24','\0'),(14,'Shaqiri 	','Xherdan','CH','mi',NULL,'\0','1991-10-10','\0'),(15,'Lewandowski 	','Robert','PL','an',NULL,'\0','1988-08-21','\0'),(16,'Robben 	','Arjen','NL','mi',NULL,'\0','1984-01-23','\0'),(17,'Gaudino 	','Gianluca','DE','mi',NULL,'\0','1996-11-11','\0'),(18,'Rode 	','Sebastian','DE','mi',NULL,'\0','1990-10-11','\0'),(19,'Pizarro 	','Claudio','PE','an',NULL,'\0','1978-10-03','\0'),(20,'Reina 	','Pepe','ES','tw',NULL,'\0','1900-01-01','\0'),(21,'Boateng 	','Jerome','DE','aw',NULL,'\0','1988-09-03','\0'),(22,'Götze 	','Mario','DE','mi',NULL,'\0','1992-06-03','\0'),(23,'Müller','Thomas','DE','an',NULL,'\0','1989-09-13','\0'),(24,'Messi','Lionel','AR','an',NULL,'\0','1987-06-24','\0'),(25,'Kalk','Sebastian','DE','tw',NULL,'\0','1997-04-26','\0'),(26,'Franke','Patrick','DE',NULL,NULL,'\0','1900-01-01','\0'),(27,'Gorkow','Christoph','DE','aw',NULL,'\0','1996-02-22','\0'),(28,'Kunze','Marian','DE','aw',NULL,'\0','1996-04-15','\0'),(29,'Pahl','Tim-Julian','DE',NULL,NULL,'\0','1900-01-01','\0'),(30,'Rogowski','Laurenz','DE',NULL,NULL,'\0','1900-01-01','\0'),(31,'Stegmann','Timo','DE','mi',NULL,'\0','1995-08-19','\0'),(32,'Park','Yiyoung','KR','mi',NULL,'\0','1994-06-29','\0'),(33,'Onwuzo','Francis','DE','mi',NULL,'\0','1996-07-07','\0'),(34,'Pinarlik','Furkan','DE','mi',NULL,'\0','1996-04-29','\0'),(35,'Mickels','Leroy','DE','mi',NULL,'\0','1995-06-25','\0'),(36,'Keßner','Lennart','DE',NULL,NULL,'\0','1900-01-01','\0'),(37,'Kehl','Marvin','DE',NULL,NULL,'\0','1900-01-01','\0'),(38,'Hellmann','Patrick','DE',NULL,NULL,'\0','1900-01-01','\0'),(39,'Stapel','Sebastian','DE',NULL,NULL,'\0','1900-01-01','\0'),(40,'von Appen','Dennis','DE',NULL,NULL,'\0','1900-01-01','\0'),(41,'Schulze','Johannes','DE',NULL,NULL,'\0','1900-01-01','\0'),(42,'Kaland','Björn','DE',NULL,NULL,'\0','1900-01-01','\0'),(43,'Schmidt','Alexej','DE','tw',NULL,'\0','1900-01-01','\0'),(44,'Schiller','Björn','DE',NULL,NULL,'\0','1900-01-01','\0'),(45,'Struck','Benjamin','DE',NULL,NULL,'\0','1900-01-01','\0'),(46,'Koopmann','Dennis','DE',NULL,NULL,'\0','1900-01-01','\0'),(47,'Tiede','Fabian','DE',NULL,NULL,'\0','1900-01-01','\0'),(48,'Wagner','Kai','DE',NULL,NULL,'\0','1900-01-01','\0'),(49,'Poerschke','David','DE','tw',NULL,'\0','1900-01-01','\0'),(50,'Blank','Timo','DE',NULL,NULL,'\0','1900-01-01','\0'),(51,'Fröhlich','Sebastian','DE',NULL,NULL,'\0','1900-01-01','\0'),(52,'Voigt','Clemens','DE',NULL,NULL,'\0','1900-01-01','\0'),(58,'Plendiskis','Kaspars','LV','tw',NULL,'\0','1993-07-25','\0'),(59,'Merkle','Christian','DE',NULL,NULL,'\0','1900-01-01','\0'),(60,'Ouro-Gnaou','Achraf','TG','an',NULL,'\0','1900-01-01','\0'),(61,'Dammann','Fabio','DE','aw',NULL,'\0','1900-01-01','\0'),(62,'Jannsen','Lasse','DE',NULL,NULL,'\0','1900-01-01','\0'),(63,'Odabas','Adil Tolga','TR',NULL,NULL,'\0','1900-01-01','\0'),(64,'Ahmed','Amin','DE',NULL,NULL,'\0','1900-01-01','\0'),(65,'Lux','Yannik','DE',NULL,NULL,'\0','1900-01-01','\0'),(66,'Carlson','Gene','DE',NULL,NULL,'\0','1900-01-01','\0'),(67,'Sa Borges Dju','Ivan','PT','an',NULL,'\0','1900-01-01','\0'),(68,'Labiadh','Mohamed','TN','an',NULL,'\0','1989-08-07','\0'),(69,'Möring','Axel','DE',NULL,NULL,'\0','1900-01-01','\0'),(70,'Marten','Jeremy','DE',NULL,NULL,'\0','1900-01-01','\0'),(71,'Dietrich','Torben','DE',NULL,NULL,'\0','1900-01-01','\0'),(72,'Melerski','Maciej','DE',NULL,NULL,'\0','1900-01-01','\0'),(73,'Bokalarsky','Andre','DE',NULL,NULL,'\0','1900-01-01','\0'),(74,'Kohpmann','Michael','DE',NULL,NULL,'\0','1900-01-01','\0'),(75,'Kmoch','Sascha','DE',NULL,NULL,'\0','1900-01-01','\0'),(76,'Klitzke','Sebastian','DE','aw',NULL,'\0','1900-01-01','\0'),(77,'Hüttner','Prince','DE',NULL,NULL,'\0','1900-01-01','\0'),(78,'Polzin','Robin','DE',NULL,NULL,'\0','1900-01-01','\0'),(79,'Bastian','Hagen','DE',NULL,NULL,'\0','1900-01-01','\0'),(80,'Keunemann','Lasse','DE','an',NULL,'\0','1900-01-01','\0'),(81,'Clausen','Sebastian','DE','aw',NULL,'\0','1900-01-01','\0'),(82,'Honig','Luis','DE',NULL,NULL,'\0','1900-01-01','\0'),(83,'Wigger','Ole','DE',NULL,NULL,'\0','1900-01-01','\0'),(84,'Wedemeyer','Sven','DE',NULL,NULL,'\0','1900-01-01','\0'),(85,'Reichel','Stefan','DE',NULL,NULL,'\0','1900-01-01','\0'),(86,'Lorenz','Andreas','DE',NULL,NULL,'\0','1900-01-01','\0'),(87,'Wegner','Dennis','DE','an',NULL,'\0','1991-01-10','\0'),(88,'Kostka','Florian','DE',NULL,NULL,'\0','1900-01-01','\0'),(89,'Böge','Timo','DE',NULL,NULL,'\0','1900-01-01','\0'),(90,'Knopp','Tobias','DE',NULL,NULL,'\0','1900-01-01','\0'),(91,'Dickmann','Marius','DE',NULL,NULL,'\0','1900-01-01','\0'),(92,'Masurek','Finn','DE',NULL,NULL,'\0','1900-01-01','\0'),(93,'Samek','Florian','DE',NULL,NULL,'\0','1900-01-01','\0'),(97,'Badstuber','Holger','DE','aw',NULL,'\0','1989-03-13','\0'),(99,'Alonso','Xabi','ES','mi',NULL,'\0','1981-11-25','\0'),(100,'Costa','Douglas','BR','mi',NULL,'\0','1990-09-14','\0'),(102,'Coman','Kingsley','FR','mi',NULL,'\0','1996-06-13','\0'),(104,'Martinez','Javi','ES','mi',NULL,'\0','1900-01-01','\0'),(105,'Vidal','Arturo','CL','mi',NULL,'\0','1987-05-22','\0'),(107,'Adler','René','DE','tw',NULL,'\0','1985-01-15','\0'),(108,'Diekmeier','Dennis','DE','aw',NULL,'\0','1989-10-20','\0'),(109,'Djourou','Johan','CH','aw',NULL,'\0','1987-01-18','\0'),(110,'Ostrzolek','Matthias','DE','aw',NULL,'\0','1990-06-05','\0'),(111,'Kacar','Gojko','CS','mi',NULL,'\0','1987-01-26','\0'),(112,'Holtby','Lewis','DE','mi',NULL,'\0','1990-09-18','\0'),(113,'Müller','Nicolai','DE','mi',NULL,'\0','1987-09-25','\0'),(114,'Hunt','Aaron','DE','mi',NULL,'\0','1986-09-04','\0'),(115,'Ilicevic','Ivo','HR','mi',NULL,'\0','1986-11-14','\0'),(116,'Lasogga','Pierre-Michel','DE','an',NULL,'\0','1991-12-15','\0'),(117,'Gregoritsch','Michael','AT','an',NULL,'\0','1994-04-18','\0'),(118,'Rudnevs','Artjoms','LV','an',NULL,'\0','1988-01-13','\0'),(119,'Jung','Gideon','DE','mi',NULL,'\0','1994-09-12','\0'),(120,'Cleber','Janderson Pereira Reis','BR','aw',NULL,'\0','1990-12-05','\0'),(121,'Alcántara do Nascimento','Thiago','ES','mi',NULL,'\0','1991-04-11','\0'),(122,'Baumann 	','Oliver','DE','mi',NULL,'\0','1990-06-02','\0'),(123,'Kaderabek 	','Pavel','CZ','aw',NULL,'\0','1992-04-25','\0'),(124,'Kim 	','Jin-su','KR','mi',NULL,'\0','1992-06-13','\0'),(125,'Süle 	','Niklas','DE','mi',NULL,'\0','1995-09-03','\0'),(126,'Rudy 	','Sebastian','DE','mi',NULL,'\0','1990-02-28','\0'),(127,'Schmid 	','Jonathan','FR','mi',NULL,'\0','1990-06-26','\0'),(128,'Hamad 	','Jiloan','SE','mi',NULL,'\0','1990-11-06','\0'),(129,'Strobl	','Tobias','DE','mi',NULL,'\0','1987-10-12','\0'),(130,'Vargas 	','Eduardo','CL','mi',NULL,'\0','1989-11-20','\0'),(131,'Kramaric','Andrej','HR','mi',NULL,'\0','1991-06-19','\0'),(132,'Zuber 	','Steven','CH','mi',NULL,'\0','1990-07-26','\0'),(133,'Amiri 	','Nadiem','DE','mi',NULL,'\0','1996-10-27','\0'),(134,'Volland','Kevin','DE','mi',NULL,'\0','1992-07-30','\0'),(135,'Kimmich','Joshua','DE','mi',NULL,'\0','1995-02-08','\0'),(136,'Bicakcic','Ermin','DE','aw',NULL,'\0','1990-01-24','\0'),(137,'Sauss 	','Marius','DE','tw',NULL,'\0','1992-08-05','\0'),(138,'Thoelke 	','Bjarne','DE','aw',NULL,'\0','1992-04-11','\0'),(139,'Schulze 	','Kevin','DE','an',NULL,'\0','1992-01-25','\0'),(140,'Ozdoev 	','Timur','RU','aw',NULL,'\0','1992-07-26','\0'),(141,'Mustafa 	','Arben','AL','aw',NULL,'\0','1992-04-15','\0'),(142,'Knoche 	','Robin','DE','aw',NULL,'\0','1992-05-22','\0'),(143,'Uzun 	','Enes','TR','mi',NULL,'\0','1992-01-25','\0'),(144,'Henze 	','Leon','DE','mi',NULL,'\0','1992-03-09','\0'),(145,'Gogia 	','Akaki','DE','mi',NULL,'\0','1992-01-18','\0'),(146,'Cigerci 	','Tolga','TR','mi',NULL,'\0','1992-03-22','\0'),(147,'Scheidhauer	','Kevin','DE','an',NULL,'\0','1992-03-13','\0'),(148,'Millemaci','Giovanni','DE','mi',NULL,'\0','1993-03-05','\0'),(149,'Bortel 	','Henning','DE','tw',NULL,'\0','1992-04-16','\0'),(150,'Vitzthum 	','Michael','DE','aw',NULL,'\0','1992-06-20','\0'),(151,'Lewicki 	','Oscar','SE','aw',NULL,'\0','1992-07-14','\0'),(152,'Köz 	','Cüneyt','TR','mi',NULL,'\0','1992-10-12','\0'),(153,'Strieder 	','Rico','DE','mi',NULL,'\0','1992-07-06','\0'),(154,'Steimel 	','Daniel','DE','mi',NULL,'\0','1992-04-10','\0'),(155,'Lehn 	','Sebastian','DE','mi',NULL,'\0','1992-01-16','\0'),(156,'Knasmüllner 	','Christoph','AT','mi',NULL,'\0','1992-04-30','\0'),(157,'Janjatovic 	','Dejan','DE','mi',NULL,'\0','1992-02-25','\0'),(158,'Dreier 	','Sebastian','DE','mi',NULL,'\0','1992-02-22','\0'),(159,'Pflügler 	','Florian','DE','aw',NULL,'\0','1992-03-10','\0'),(160,'Chessa 	','Dennis','DE','aw',NULL,'\0','1992-10-19','\0'),(161,'Hauswirth 	','Valentin','DE','aw',NULL,'\0','1992-08-28','\0'),(162,'Feiersinger','Kevin','DE','an',NULL,'\0','1992-02-02','\0'),(163,'Kaller','Kim','DE','tw',NULL,'\0','1987-06-06','\0'),(164,'Schott','Kessy','DE','aw',NULL,'\0','1980-12-01','\0'),(165,'Held','Daniela','DE','aw',NULL,'\0','1978-01-16','\0'),(166,'Gaspar','Cecilia','HU','aw',NULL,'\0','1984-09-11','\0'),(167,'Dyer','Jeanette','US','aw',NULL,'\0','1986-07-24','\0'),(168,'Gaugler','Heike','DE','aw',NULL,'\0','1992-05-15','\0'),(169,'Hörber','Carolin','DE','mi',NULL,'\0','1992-04-23','\0'),(170,'Treyer','Ramona','DE','mi',NULL,'\0','1979-08-28','\0'),(171,'Höß','Anika','DE','mi',NULL,'\0','1990-12-11','\0'),(172,'Breunig','Carina','DE','mi',NULL,'\0','1984-08-11','\0'),(173,'Eberhardt','Annika','DE','an',NULL,'\0','1992-04-23','\0'),(174,'Nason','Carolyn','US','aw',NULL,'\0','1985-03-19','\0'),(175,'Wich','Lisa','DE','an',NULL,'\0','1990-10-30','\0'),(176,'Kirsamer','Annika','DE','tw',NULL,'\0','1987-04-10','\0'),(177,'Schmetz','Ulrike','DE','tw',NULL,'\0','1979-10-30','\0'),(178,'Baunach','Katharina','DE','aw',NULL,'\0','1989-01-18','\0'),(179,'Paukner','Corinna','DE','aw',NULL,'\0','1986-02-19','\0'),(180,'de Pol','Sandra','DE','aw',NULL,'\0','1975-05-07','\0'),(181,'Rech','Bianca','DE','aw',NULL,'\0','1985-01-25','\0'),(182,'Wörle','Tanja','DE','mi',NULL,'\0','1980-07-06','\0'),(183,'Simic','Julia','DE','mi',NULL,'\0','1985-05-14','\0'),(184,'Behringer','Melanie','DE','mi',NULL,'\0','1985-11-18','\0'),(185,'Aigner','Nina','DE','mi',NULL,'\0','1980-06-20','\0'),(186,'Bürki','Vanessa','CH','an',NULL,'\0','1986-04-01','\0'),(187,'Islacker','Mandy','DE','an',NULL,'\0','1988-08-08','\0'),(188,'Banecki','Sylvie','DE','an',NULL,'\0','1988-09-03','\0'),(189,'Banecki','Nicole','DE','an',NULL,'\0','1988-09-03','\0'),(190,'Riemann','Manuel','DE','tw',NULL,'\0','1988-09-09','\0'),(191,'Celozzi','Stefano','DE','aw',NULL,'\0','1988-11-02','\0'),(192,'Fabian','Patrick','DE','aw',NULL,'\0','1987-10-11','\0'),(193,'Bastians','Felix','DE','aw',NULL,'\0','1988-05-09','\0'),(194,'Perthel','Timo','DE','aw',NULL,'\0','1989-02-11','\0'),(195,'Losilla','Anthony','FR','mi',NULL,'\0','1986-03-10','\0'),(196,'Hoogland','Tim','DE','aw',NULL,'\0','1985-06-11','\0'),(197,'Bulut','Onur','DE','mi',NULL,'\0','1994-04-16','\0'),(198,'Eisfeld','Thomas','DE','mi',NULL,'\0','1993-01-18','\0'),(199,'Haberer','Janik','DE','an',NULL,'\0','1994-04-02','\0'),(200,'Terodde','Simon','DE','an',NULL,'\0','1988-03-02','\0'),(201,'Simunek','Jan','CZ','aw',NULL,'\0','1987-02-20','\0'),(202,'Cacutalua','Malcolm','DE','aw',NULL,'\0','1994-11-15','\0'),(203,'Mlapa','Peniel','DE','an',NULL,'\0','1991-02-20','\0'),(204,'Sobiech','Lasse','DE','aw',NULL,'\0','1991-01-18','\0'),(205,'Ziereis','Philipp','DE','aw',NULL,'\0','1993-03-14','\0'),(206,'Buballa','Daniel','DE','aw',NULL,'\0','1991-05-11','\0'),(207,'Rzatkowski','Marc','DE','mi',NULL,'\0','1990-03-02','\0'),(208,'Nehrig','Bernd','DE','mi',NULL,'\0','1986-09-28','\0'),(209,'Sobota','Waldemar','PL','mi',NULL,'\0','1987-05-19','\0'),(210,'Alushi','Enis','DE','mi',NULL,'\0','1985-12-22','\0'),(211,'Buchtmann','Christopher','DE','mi',NULL,'\0','1992-04-25','\0'),(212,'Thy','Lennart','DE','an',NULL,'\0','1992-02-25','\0'),(213,'Verhoek','John','NL','an',NULL,'\0','1989-03-25','\0'),(214,'Dudziak','Jeremy','DE','aw',NULL,'\0','1995-08-28','\0'),(215,'Choi','Kyoung-Rok','KR','mi',NULL,'\0','1995-03-15','\0'),(216,'Weis','André','DE','tw',NULL,'\0','1989-09-30','\0'),(217,'Huber','Alexander','DE','aw',NULL,'\0','1985-02-25','\0'),(218,'Barry','Shawn Maurice','US','aw',NULL,'\0','1990-04-23','\0'),(219,'Ballas','Florian','DE','aw',NULL,'\0','1993-01-08','\0'),(220,'Safi','Haji','IR','aw',NULL,'\0','1990-02-15','\0'),(221,'Rolim','Yann','BR','mi',NULL,'\0','1995-03-15','\0'),(222,'Zimling','Niki','DK','mi',NULL,'\0','1985-04-19','\0'),(223,'Perdedaj','Fanol','AL','mi',NULL,'\0','1991-07-16','\0'),(224,'Kalmar','Zsolt','HU','mi',NULL,'\0','1995-06-09','\0'),(225,'Awoniyi','Taiwo','NG','an',NULL,'\0','1997-08-12','\0'),(226,'Schahin','Dani','DE','an',NULL,'\0','1989-07-09','\0'),(227,'Kruska','Marc-Andre','DE','mi',NULL,'\0','1987-06-29','\0'),(229,'Dedic','Zlatko','SI','an',NULL,'\0','1984-10-05','\0'),(230,'Gerezgiher','Joel','DE','mi',NULL,'\0','1995-10-09','\0'),(231,'Himmelmann','Robin','DE','tw',NULL,'\0','1989-02-05','\0'),(232,'Hornschuh','Marc','DE','aw',NULL,'\0','1991-03-02','\0'),(236,'Mathenia','Christian','DE','tw',NULL,'\0','1992-03-31','\0'),(237,'Garics','György','AT','aw',NULL,'\0','1984-03-08','\0'),(238,'Rajkovic','Slobodan','CS','aw',NULL,'\0','1989-02-03','\0'),(239,'Caldirola','Luca','IT','aw',NULL,'\0','1991-02-01','\0'),(240,'Diaz','Junior','CR','aw',NULL,'\0','1978-10-09','\0'),(241,'Sirigu','Sandro','IT','aw',NULL,'\0','1988-10-07','\0'),(242,'Jungwirth','Florian','DE','mi',NULL,'\0','1989-01-27','\0'),(243,'Kempe','Tobias','DE','mi',NULL,'\0','1989-06-27','\0'),(244,'Holland','Fabian','DE','aw',NULL,'\0','1990-07-11','\0'),(245,'Vrancic','Mario','BA','mi',NULL,'\0','1989-05-23','\0'),(246,'Wagner','Sandro','DE','an',NULL,'\0','1987-11-29','\0'),(247,'Rosenthal','Jan','DE','mi',NULL,'\0','1986-04-07','\0'),(248,'Sailer','Marco','DE','an',NULL,'\0','1985-11-16','\0'),(249,'Gorka','Benjamin','DE','aw',NULL,'\0','1984-04-15','\0'),(250,'Tasci','Serdar','DE','aw',NULL,'\0','1987-04-24','\0'),(251,'Ribery','Franck','FR','mi',NULL,'\0','1983-04-07','\0'),(252,'Brunst','Alexander','DE','tw',NULL,'\0','1995-07-07','\0'),(253,'Hansen','Hendrik','DE','aw',NULL,'\0','1994-11-04','\0'),(254,'Klamt','Julian','DE','aw',NULL,'\0','1989-08-22','\0'),(255,'Korczowski','Noah','DE','aw',NULL,'\0','1994-01-08','\0'),(256,'Kleihs','Marvin','DE','aw',NULL,'\0','1994-03-19','\0'),(257,'Schulz','Bastian','DE','mi',NULL,'\0','1985-07-10','\0'),(258,'Herrmann','Robert','DE','mi',NULL,'\0','1993-08-10','\0'),(259,'Wimmer','Sebastian','AT','aw',NULL,'\0','1994-01-15','\0'),(260,'Ebot-Etchi','Junior','DE','mi',NULL,'\0','1996-04-02','\0'),(261,'El-Helwe','Hilal','LB','mi',NULL,'\0','1994-11-24','\0'),(262,'Medjedovic','Dino','BA','mi',NULL,'\0','1989-06-13','\0'),(263,'Radlinger','Samuel','AT','tw',NULL,'\0','1992-11-07','\0'),(264,'Rankovic','Vladimir','DE','aw',NULL,'\0','1993-06-27','\0'),(265,'Arkenberg','Fynn','DE','aw',NULL,'\0','1996-03-04','\0'),(266,'Bachmann','Janik','DE','aw',NULL,'\0','1996-05-06','\0'),(267,'Wilton','Lukas','DE','aw',NULL,'\0','1995-05-13','\0'),(268,'Pietler','Fabian','DE','mi',NULL,'\0','1994-01-07','\0'),(269,'Tuna','Can','DE','mi',NULL,'\0','1995-06-12','\0'),(270,'Sarenren-Bazee','Noah-Joel','DE','an',NULL,'\0','1996-08-21','\0'),(271,'Ballmert','Markus','DE','aw',NULL,'\0','1993-11-27','\0'),(272,'Dierßen','Tim','DE','mi',NULL,'\0','1996-01-15','\0'),(273,'Prokoph','Roman','DE','an',NULL,'\0','1985-08-06','\0'),(274,'Bobal','Gergely','HU','an',NULL,'\0','1995-08-31','\0'),(275,'Pläschke','Jannis','DE','aw',NULL,'\0','1993-02-06','\0'),(276,'Sulejmani','Valmir','DE','an',NULL,'\0','1996-02-01','\0'),(277,'Marotzke','Darius','DE','mi',NULL,'\0','1996-07-13','\0'),(278,'Hortum','Melih','DE','mi',NULL,'\0','1994-07-29','\0'),(279,'Casteels','Koen','BE','tw',NULL,'\0','1992-06-25','\0'),(280,'(Adelino Andre Vieira de Freitas)','Vieirinha','PT','aw',NULL,'\0','1986-01-24','\0'),(284,'Träsch','Christian','DE','aw',NULL,'\0','1987-09-01','\0'),(285,'Draxler','Julian','DE','mi',NULL,'\0','1993-09-20','\0'),(286,'Arnold','Maximilian','DE','mi',NULL,'\0','1994-05-27','\0'),(287,'Schäfer','Marcel','DE','aw',NULL,'\0','1984-06-07','\0'),(288,'Kruse','Max','DE','an',NULL,'\0','1988-03-19','\0'),(289,'Schürrle','Andre','DE','an',NULL,'\0','1990-11-06','\0'),(291,'Azzaoui','Ismail','BE','mi',NULL,'\0','1998-01-06','\0'),(292,'Dias','Luiz Gustavo','BR','mi',NULL,'\0','1987-07-23','\0'),(293,'Pellatz','Nico-Stephano','DE','tw',NULL,'\0','1986-07-08','\0'),(294,'Lejan','Michael','BE','aw',NULL,'\0','1983-05-02','\0'),(295,'Malura','Dennis','DE','an',NULL,'\0','1984-06-20','\0'),(296,'Krempicki','Connor','DE','mi',NULL,'\0','1994-09-14','\0'),(297,'Nottbeck','Lukas','DE','mi',NULL,'\0','1988-10-22','\0'),(298,'Reimerink','Jules','NL','an',NULL,'\0','1989-09-30','\0'),(299,'Schwarz','Edwin','DE','aw',NULL,'\0','1994-09-13','\0'),(300,'Reiche','Daniel','DE','aw',NULL,'\0','1988-03-14','\0'),(301,'Heister','Florian','DE','mi',NULL,'\0','1997-03-02','\0'),(302,'Jansen','David','DE','an',NULL,'\0','1987-12-04','\0'),(303,'Bäcker','Timo','DE','tw',NULL,'\0','1983-05-18','\0'),(304,'Below','Noel','DE','aw',NULL,'\0','1993-11-26','\0'),(305,'Saglam','Ahmet','TR','aw',NULL,'\0','1987-05-09','\0'),(306,'Treude','Tim','DE','mi',NULL,'\0','1990-01-28','\0'),(307,'Jorge','Paulo','PT','mi',NULL,'\0','1981-05-05','\0'),(308,'Balci','Ridvan','DE','an',NULL,'\0','1993-09-29','\0'),(309,'Hammel','Leon','DE','mi',NULL,'\0','1996-04-24','\0'),(310,'Campagna','Luigi','IT','mi',NULL,'\0','1989-12-11','\0'),(311,'Schaal','Daniel','DE','mi',NULL,'\0','1994-06-14','\0'),(312,'Schmidt','Robin','DE','an',NULL,'\0','1993-04-22','\0'),(313,'Junior','Edinho','PT','an',NULL,'\0','1994-03-07','\0'),(314,'Klingenburg','Rene','DE','mi',NULL,'\0','1993-12-29','\0'),(315,'Haitz','Tobias','DE','aw',NULL,'\0','1992-02-12','\0'),(316,'Bors','David','DE','an',NULL,'\0','1995-04-13','\0'),(317,'Miyazawa','Yuki','JP','aw',NULL,'\0','1991-03-13','\0'),(318,'Böhmer','Philipp','DE','an',NULL,'\0','1987-07-26','\0'),(319,'Andrijanic','Marcel','BA','mi',NULL,'\0','1992-10-21','\0'),(320,'Brzenska','Markus','DE','aw',NULL,'\0','1985-05-25','\0'),(321,'Bürki','Roman','CH','tw',NULL,'\0','1990-11-14','\0'),(322,'Piszczek','Lukasz','PL','aw',NULL,'\0','1985-06-03','\0'),(323,'Bender','Sven','DE','mi',NULL,'\0','1989-04-27','\0'),(324,'Hummels','Mats','DE','aw',NULL,'\0','1988-12-16','\0'),(325,'Durm','Erik','DE','aw',NULL,'\0','1992-05-12','\0'),(326,'Weigl','Julian','DE','mi',NULL,'\0','1995-09-08','\0'),(327,'Gündogan','Ilkay','DE','mi',NULL,'\0','1990-10-24','\0'),(328,'Schmelzer','Marcel','DE','aw',NULL,'\0','1988-01-22','\0'),(329,'Mkhitaryan','Henrikh','AM','mi',NULL,'\0','1989-01-21','\0'),(330,'Aubameyang','Pierre-Emerick','GA','an',NULL,'\0','1989-06-18','\0'),(331,'Reus','Marco','DE','mi',NULL,'\0','1989-05-31','\0'),(332,'Ramos','Adrian','CO','an',NULL,'\0','1986-01-22','\0'),(333,'Sahin','Nuri','TR','mi',NULL,'\0','1988-09-05','\0'),(334,'Rohweder','Christoph','DE',NULL,NULL,'\0','1900-01-01','\0'),(335,'Tank','Andreas','DE',NULL,NULL,'\0','1900-01-01','\0'),(336,'Albers','Andre','DE',NULL,NULL,'\0','1900-01-01','\0'),(337,'Ehlert','Marvin','DE',NULL,NULL,'\0','1900-01-01','\0'),(338,'Offt','Steffen','DE',NULL,NULL,'\0','1900-01-01','\0'),(339,'Maas','Steffen','DE',NULL,NULL,'\0','1900-01-01','\0'),(340,'Albers','Timo','DE',NULL,NULL,'\0','1900-01-01','\0'),(341,'Büch','Julian','DE',NULL,NULL,'\0','1900-01-01','\0'),(342,'Göttsche','Thies ','DE',NULL,NULL,'\0','1900-01-01','\0'),(343,'Alter','Torsten','DE',NULL,NULL,'\0','1900-01-01','\0'),(344,'Niebuhr','Timm','DE',NULL,NULL,'\0','1900-01-01','\0'),(345,'Fuhrmann','Simon','DE',NULL,NULL,'\0','1900-01-01','\0'),(346,'Ewers','Bernd','DE',NULL,NULL,'\0','1900-01-01','\0'),(347,'Ruhberg','Marian','DE',NULL,NULL,'\0','1900-01-01','\0'),(348,'Pauls','Fabian ','DE',NULL,NULL,'\0','1900-01-01','\0'),(349,'Lott','Niklas','DE',NULL,NULL,'\0','1900-01-01','\0'),(350,'Wrzesinski','Mathias','DE',NULL,NULL,'\0','1900-01-01','\0'),(351,'Milbradt','Franko','DE',NULL,NULL,'\0','1900-01-01','\0'),(352,'Coskun','Baris','DE',NULL,NULL,'\0','1900-01-01','\0'),(353,'Bork','Lasse','DE',NULL,NULL,'\0','1900-01-01','\0'),(354,'Gutzeit','Fynn','DE',NULL,NULL,'\0','1900-01-01','\0'),(355,'Jakubowski','Yannik','DE',NULL,NULL,'\0','1900-01-01','\0'),(356,'Ollenschläger','Tim','DE',NULL,NULL,'\0','1900-01-01','\0'),(357,'Heuer','Nils','DE',NULL,NULL,'\0','1900-01-01','\0'),(358,'Hansen','Bjarne','DE',NULL,NULL,'\0','1900-01-01','\0'),(359,'Schultz','Christoph','DE',NULL,NULL,'\0','1900-01-01','\0'),(360,'Meyerfeldt','Aaron','DE',NULL,NULL,'\0','1900-01-01','\0'),(361,'Meyerfeldt','Alexander','DE',NULL,NULL,'\0','1900-01-01','\0'),(362,'Lucas','Tobias','DE',NULL,NULL,'\0','1900-01-01','\0'),(363,'Mehlhorn','Fabian','DE',NULL,NULL,'\0','1900-01-01','\0'),(364,'Graunke','Franz','DE',NULL,NULL,'\0','1900-01-01','\0'),(365,'Schmoock','Dominik','DE',NULL,NULL,'\0','1900-01-01','\0'),(366,'Bahde','Gerrit','DE',NULL,NULL,'\0','1900-01-01','\0'),(367,'Vogler','Jonas','DE',NULL,NULL,'\0','1900-01-01','\0'),(368,'Vogler','Marco Phillipp','DE',NULL,NULL,'\0','1900-01-01','\0'),(369,'Hetenyi','Justus','DE',NULL,NULL,'\0','1900-01-01','\0'),(370,'Vogt','Heiko Michael','DE',NULL,NULL,'\0','1900-01-01','\0'),(371,'Zerrath','Nico','DE',NULL,NULL,'\0','1900-01-01','\0'),(372,'Knoth','Christopher Philip','DE',NULL,NULL,'\0','1900-01-01','\0'),(373,'Richter','Leon ','DE',NULL,NULL,'\0','1900-01-01','\0'),(374,'Lindemann','Jonas','DE',NULL,NULL,'\0','1900-01-01','\0'),(375,'Schmahl','Alexander','DE',NULL,NULL,'\0','1900-01-01','\0'),(376,'Arndt','Torben','DE',NULL,NULL,'\0','1900-01-01','\0'),(377,'Damerau','Alexander','DE',NULL,NULL,'\0','1900-01-01','\0'),(378,'Bokalarsky','Stefan','DE',NULL,NULL,'\0','1900-01-01','\0'),(379,'Wohlers','Jan','DE',NULL,NULL,'\0','1900-01-01','\0'),(380,'Konradi','Sergej','DE',NULL,NULL,'\0','1900-01-01','\0'),(381,'Schulz','Ricardo','DE',NULL,NULL,'\0','1900-01-01','\0'),(382,'Remus','Matthias','DE',NULL,NULL,'\0','1900-01-01','\0'),(383,'Sedegi','Ahmad','DE',NULL,NULL,'\0','1900-01-01','\0'),(384,'Wegener','Steven','DE',NULL,NULL,'\0','1900-01-01','\0'),(385,'Mohamed','Hassan Fallah Hassan','DE',NULL,NULL,'\0','1900-01-01','\0'),(386,'Telke','Steffen','DE',NULL,NULL,'\0','1900-01-01','\0'),(387,'Bussink-Becking','Piet-Luis','DE',NULL,NULL,'\0','1900-01-01','\0'),(388,'Hradecky','Lucas','FI','tw',NULL,'\0','1989-11-24','\0'),(389,'Chandler','Timothy','DE','aw',NULL,'\0','1990-03-29','\0'),(390,'Zambrano','Carlos','PE','aw',NULL,'\0','1989-07-10','\0'),(391,'Abraham','David','AR','aw',NULL,'\0','1986-07-16','\0'),(392,'Djakpa','Constant','CI','aw',NULL,'\0','1986-10-17','\0'),(393,'Aigner','Stefan','DE','aw',NULL,'\0','1987-08-20','\0'),(394,'Hasebe','Makoto','JP','aw',NULL,'\0','1984-01-18','\0'),(395,'Huszti','Szabolcs','HU','mi',NULL,'\0','1983-04-17','\0'),(396,'Oczipka','Bastian','DE','aw',NULL,'\0','1989-01-12','\0'),(397,'Ben-Hatira','Änis','DE','aw',NULL,'\0','1988-07-18','\0'),(398,'Seferovic','Haris','CH','aw',NULL,'\0','1992-02-22','\0'),(399,'Stendera','Marc','DE','aw',NULL,'\0','1995-12-10','\0'),(400,'Castaignos','Luc','NL','an',NULL,'\0','1992-09-27','\0'),(401,'Kittel','Sonny','DE','aw',NULL,'\0','1993-01-06','\0'),(402,'Jorgacevic 	','Bojan','CS','tw',NULL,'\0','1982-02-12','\0'),(403,'Luchin 	','Srdjan','RO','aw',NULL,'\0','1986-03-04','\0'),(404,'Aleksandrov 	','Aleksander','BG','aw',NULL,'\0','1996-04-13','\0'),(405,'Minev 	','Veselin','BG','aw',NULL,'\0','1980-10-14','\0'),(406,'Aleksandrov 	','Sasho','BG','aw',NULL,'\0','1986-07-30','\0'),(407,'Kraev 	','Bozhidar','BG',NULL,NULL,'\0','1997-06-23','\0'),(408,'Prochazka 	','Roman','SK','mi',NULL,'\0','1989-03-14','\0'),(409,'Tsonev	','Radoslav','BG',NULL,NULL,'\0','1995-04-29','\0'),(410,'Kostadinov 	','Georgi','BG','mi',NULL,'\0','1990-09-07','\0'),(411,'Narh 	','Francis','GH','an',NULL,'\0','1994-04-18','\0'),(412,'Hristov 	','Ventsislav','BG','an',NULL,'\0','1988-11-09','\0'),(413,'Orachev 	','Miki','BG',NULL,NULL,'\0','1996-03-19','\0'),(414,'de Nooijer 	','Jeremy','NL',NULL,NULL,'\0','1992-03-15','\0'),(415,'Adeniji 	','Babatunde','NG',NULL,NULL,'\0','1995-09-17','\0'),(416,'Golas 	','Vítor','BR','tw',NULL,'\0','1990-12-27','\0'),(417,'Terziev 	','Radoslav','BG',NULL,NULL,'\0','1984-08-06','\0'),(418,'Filipov 	','Filip','BG','aw',NULL,'\0','1988-08-02','\0'),(419,'Starokin	','Orlin','BG','aw',NULL,'\0','1987-01-08','\0'),(420,'Nedelev 	','Todor','BG','mi',NULL,'\0','1993-02-07','\0'),(421,'Yusein 	','Serkan','BG',NULL,NULL,'\0','1996-03-31','\0'),(422,'Hristov 	','Yordan','BG',NULL,NULL,'\0','1984-02-12','\0'),(423,'Baltanov 	','Lachezar','BG','mi',NULL,'\0','1988-07-11','\0'),(424,'Nelson 	','Gregory','NL','an',NULL,'\0','1988-01-31','\0'),(425,'Milev 	','Nasko','BG',NULL,NULL,'\0','1996-07-18','\0'),(426,'Kifoueti 	','Rahavi','FR',NULL,NULL,'\0','1989-03-12','\0'),(427,'Zlatkov 	','Daniel','BG','aw',NULL,'\0','1989-03-06','\0'),(428,'Marin 	','Lazar','BG','aw',NULL,'\0','1994-02-09','\0'),(429,'Gamakov','Milen','BG',NULL,NULL,'\0','1994-04-12','\0');
/*!40000 ALTER TABLE `spieler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stad_verein_tabelle`
--

DROP TABLE IF EXISTS `stad_verein_tabelle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stad_verein_tabelle` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `stadion_id` int(11) NOT NULL,
  `verein_id` int(11) NOT NULL,
  PRIMARY KEY (`lfd_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stad_verein_tabelle`
--

LOCK TABLES `stad_verein_tabelle` WRITE;
/*!40000 ALTER TABLE `stad_verein_tabelle` DISABLE KEYS */;
INSERT INTO `stad_verein_tabelle` VALUES (1,4,7),(2,63,53),(3,652,252),(4,651,251),(5,9,1),(6,44,115),(7,479,413),(8,654,8),(9,657,545),(10,422,557),(11,658,562),(12,662,806);
/*!40000 ALTER TABLE `stad_verein_tabelle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadionliste`
--

DROP TABLE IF EXISTS `stadionliste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadionliste` (
  `stadion_id` int(11) NOT NULL AUTO_INCREMENT,
  `stadionname` varchar(200) NOT NULL,
  `ort` int(11) NOT NULL,
  `stadtteil` int(11) DEFAULT NULL,
  `land` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `kapazitaet` int(11) DEFAULT NULL,
  `zusch_rek` int(11) DEFAULT NULL,
  `anschrift` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `historie` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `er_jahr` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `abriss` bit(1) DEFAULT b'0',
  `gr_nr` int(11) DEFAULT NULL,
  `bundesland_id` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`stadion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=665 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadionliste`
--

LOCK TABLES `stadionliste` WRITE;
/*!40000 ALTER TABLE `stadionliste` DISABLE KEYS */;
INSERT INTO `stadionliste` VALUES (1,'Beijing National Stadium',8,NULL,'CN',91000,0,NULL,NULL,'2008','\0',620,NULL),(2,'Sportplatz Tegelsbarg',449,58,'DE',3000,0,'Tegelsbaeg 2\n22399 Hamburg','<font size=\"7\"><font face=\"arial,helvetica,sans-serif\">Kein Spielbetrieb (nonleague)<br></font></font>',NULL,'\0',621,'HH'),(3,'Sportanlage Dratelnstraße (Kunstrasenplatz)',449,75,'DE',500,0,'Dratelnstraße 21\n21109 Hamburg',NULL,NULL,'\0',619,'HH'),(4,'Stadion Hoheluft',449,84,'DE',5004,0,'Lokstedter Steindamm 87\n22529 Hamburg',NULL,'1907','\0',8,'HH'),(5,'HFV-Sportschule (Rasenplatz)',449,39,'DE',2000,0,'Jenfelder Allee 70 A-C\n22043 Hamburg',NULL,NULL,'\0',591,'HH'),(6,'Kampfbahn Stellingen',449,69,'DE',4000,0,'Sportplatzring 36\n22527 Hamburg','Das Stadion soll im Jahr 2017 abgerissen werden und 600 Wohnungen geopfert werden.<br>',NULL,'\0',145,'HH'),(7,'Edmund-Plambeck-Stadion (Kunstrasenplatz 1)',235,NULL,'DE',2000,0,'Ochsenzoller Straße 58\n22848 Norderstedt',NULL,NULL,'\0',622,'SH'),(8,'Kurparkstadion',37,NULL,'DE',0,0,NULL,NULL,NULL,'\0',618,'SH'),(9,'Allianz Arena',220,NULL,'DE',75000,75000,'Werner-Heisenberg-Allee 25\n80939 München',NULL,'2005','\0',302,'BY'),(10,'Sportplatz Spatzenloh',1038,NULL,'DE',0,0,NULL,NULL,NULL,'\0',617,'BY'),(11,'Stadion am Wendelweg',90,NULL,'DE',2500,0,NULL,NULL,NULL,'\0',78,'SH'),(12,'Camp Nou',414,NULL,'ES',99354,0,NULL,NULL,'1957','\0',26,NULL),(13,'Hein-Klink-Stadion (Rasenplatz)',449,13,'DE',3000,0,'Möllner Landstr. 197\n22117 Hamburg',NULL,NULL,'\0',203,'HH'),(14,'Sportzentrum Oetjendorfer Landstraße (Nebenplatz)',154,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',395,'SH'),(15,'Sportplatz Holstentor Süd',195,NULL,'DE',1000,0,'Märkische Straße 22\n23558 Lübeck',NULL,NULL,'\0',616,'SH'),(16,'Stadion am See',1044,NULL,'DE',4000,0,'Am See\n85748 Garching bei München',NULL,NULL,'\0',615,'BY'),(17,'Häcker-Wiehenstadion',1046,NULL,'DE',3140,2200,NULL,NULL,'2011','\0',614,'NW'),(18,'Estadio do Dragao',1047,NULL,'PT',52000,52000,NULL,NULL,'2003','\0',613,NULL),(19,'Sportplatz Jahnweg',1048,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',612,'SH'),(20,'DS Arena',1050,NULL,'DK',7500,0,NULL,NULL,NULL,'\0',611,NULL),(21,'Wilhelm-Rupprecht-Sportplatz',449,83,'DE',7000,7000,'Steilshooper Str. 210a\n22307 Hamburg',NULL,'1925','',37,'HH'),(22,'Sportzentrum Oldenfelde',449,85,'DE',2500,0,NULL,NULL,NULL,'\0',68,'HH'),(23,'Sportzentrum Hörnerkirchen',1052,NULL,'DE',1000,0,'Schulweg 3\n25364 Brande-Hörnerkirchen',NULL,NULL,'\0',623,'SH'),(24,'Wilhelm-Langrehr-Stadion',1053,NULL,'DE',3500,0,'Hannoversche Straße\nGarbsen-Havelse',NULL,'1933','\0',624,'NI'),(25,'Borgweg-Stadion',449,77,'DE',3500,0,NULL,NULL,'1930','\0',40,'HH'),(26,'Städtisches Stadion an der Düsternortstraße',1054,NULL,'DE',12000,0,NULL,NULL,NULL,'\0',610,'NI'),(27,'Weserstadion',70,NULL,'DE',42500,0,NULL,NULL,'1947','\0',10,'HB'),(29,'Atatürk Olimpiyat Stadyumu',422,NULL,'TR',76092,0,NULL,NULL,'2002','\0',609,NULL),(30,'Arena Lwiw',1056,NULL,'UA',34915,0,NULL,NULL,'2011','\0',608,NULL),(31,'Edmund-Plambeck-Stadion',235,NULL,'DE',5068,0,NULL,NULL,'1975','\0',28,'SH'),(32,'Paul-Hauenschild-Sportplätze (Kunstrasenplatz 2)',235,NULL,'DE',1000,0,'Ulzburger Straße 94\n22850 Norderstedt',NULL,NULL,'\0',528,'SH'),(33,'Volkswagen Arena',333,NULL,'DE',30000,0,NULL,NULL,'2002','\0',135,'NI'),(34,'Rewirpowerstadion',53,NULL,'DE',29299,0,'Castroper Straße 145\n44791 Bochum',NULL,'1911','\0',241,'NW'),(35,'Adolf-Jäger-Kampfbahn',449,56,'DE',8000,27000,NULL,NULL,'1908','\0',46,'HH'),(36,'Professor-Reinmüller-Platz',449,23,'DE',2500,0,NULL,NULL,NULL,'\0',125,'HH'),(37,'Olympiastadion Berlin',42,NULL,'DE',76197,0,NULL,NULL,'1936','\0',27,'BE'),(38,'Sportplatz Monumentenstraße',42,NULL,'DE',2000,0,'Monumentenstraße 13c\n10829 Berlin-Tempelhof',NULL,NULL,'\0',607,'BE'),(39,'Sydbank Park',1058,NULL,'DK',10000,0,NULL,NULL,'2001','\0',606,NULL),(41,'Etihad Stadium',342,NULL,'EN',55097,0,NULL,NULL,'2002','\0',561,NULL),(42,'Ewen Fields',1059,NULL,'EN',4250,0,'Grange Road\nHyde, Cheshire, SK14 2SB ',NULL,'1885','\0',605,NULL),(43,'Stadion Dresden',71,NULL,'DE',32066,0,NULL,NULL,'2009','\0',625,'SN'),(44,'Städtisches Stadion an der Grünwalder Straße',220,NULL,'DE',21272,58200,NULL,NULL,'1911','\0',116,'BY'),(45,'Volksparkstadion (neu)',449,8,'DE',57000,57000,NULL,NULL,'2000','\0',63,'HH'),(46,'Seacon Stadion de Koel',1061,NULL,'NL',7500,0,NULL,NULL,'1972','\0',604,NULL),(47,'Stadio Olimpico di Roma',364,NULL,'IT',72698,0,NULL,NULL,'1932','\0',458,NULL),(48,'Stadion an der Peldemühle',112,NULL,'DE',6000,6500,'Walpurgisstraße\n26427 Esens','<br>','1948','\0',2,'NI'),(49,'Volksparkstadion (alt)',449,8,'DE',61000,77000,NULL,'<b>Namensrechte</b><br>1925 bis 1938 Altonaer Stadion<br>1938 bis 1953 Bahrenfelder Stadion<br>1953 bis 30. Juni 2001 Volksparkstadion<br>1. Juli 2001 bis 03. Juli 2007 AOL Arena<br>4. Juli 2007 bis 30. Juni 2010 HSH Nordbank Arena<br>1. Juli 2010 bis 30. Juni 2015: Imtech Arena<br>Seit dem 1. Juli 2015: Volksparkstadion','1953','',1,'HH'),(50,'Sportplatz am Rothenbaum',449,64,'DE',27000,0,NULL,NULL,'1911','',3,'HH'),(51,'Jonny-Rehbein-Sportplatz',449,9,'DE',1500,0,'Brucknerstraße 24\n22083 Hamburg',NULL,NULL,'\0',100,'HH'),(52,'Sportplatz Rönnbaum',1063,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',603,'SH'),(53,'Sportzentrum Fünfhausen',449,40,'DE',1000,0,NULL,NULL,NULL,'\0',170,'HH'),(54,'Millerntorstadion',449,68,'DE',29546,0,NULL,NULL,'1963','\0',4,'HH'),(55,'Signal Iduna Park',92,NULL,'DE',81359,0,NULL,NULL,'1971','\0',5,'NW'),(56,'SchücoArena',51,NULL,'DE',26137,0,NULL,NULL,'1926','\0',6,'NW'),(57,'Ostseestadion',280,NULL,'DE',29000,0,NULL,NULL,'1954','\0',7,'MV'),(58,'Stadion am Wilschenbruch',202,NULL,'DE',6000,0,NULL,NULL,'1905','',9,'NI'),(59,'Wedaustadion',95,NULL,'DE',40000,0,NULL,NULL,'1921','\0',11,'NW'),(60,'Rheinstadion',98,NULL,'DE',55850,0,NULL,NULL,'1925','',12,'NW'),(61,'VfL-Stadion am Elsterweg',333,NULL,'DE',17600,0,NULL,NULL,'1947','\0',13,'NI'),(62,'Parkstadion',128,NULL,'DE',70600,0,NULL,NULL,'1973','',14,'NW'),(63,'HDI-Arena',141,NULL,'DE',56000,0,NULL,NULL,'1954','\0',15,'NI'),(64,'Bökelbergstadion',213,NULL,'DE',34500,0,NULL,NULL,'1919','',16,'NW'),(65,'RheinEnergie Stadion',178,NULL,'DE',50000,0,NULL,NULL,'1975','\0',17,'NW'),(66,'Olympiastadion München',220,NULL,'DE',69250,0,NULL,NULL,'1972','\0',18,'BY'),(67,'BayArena',192,NULL,'DE',30210,0,NULL,NULL,'1958','\0',19,'NW'),(68,'Frankenstadion',246,NULL,'DE',50000,0,NULL,NULL,'1928','\0',20,'BY'),(69,'Dreisamstadion',120,NULL,'DE',24000,0,NULL,NULL,'1954','\0',21,'BW'),(70,'Stadion Niederrhein',247,NULL,'DE',21318,0,NULL,NULL,'1926','\0',22,'NW'),(71,'Hänsch-Arena',210,NULL,'DE',16500,0,NULL,NULL,'1924','\0',23,'NI'),(72,'Wolfgang-Meyer-Sportanlage',449,69,'DE',1318,0,NULL,NULL,NULL,'\0',24,'HH'),(73,'Stadion an der Flurstraße (Jonny-Arfert-Sportplatz)',449,45,'DE',6000,0,NULL,NULL,NULL,'\0',25,'HH'),(74,'Stadion im Sportforum Hohenschönhausen',42,NULL,'DE',12400,0,NULL,NULL,'1970','\0',29,'BE'),(75,'Stadion am Bieberer Berg',248,NULL,'DE',25000,0,NULL,NULL,'1921','\0',30,'HE'),(76,'Amsterdam ArenA',381,NULL,'NL',53346,0,NULL,NULL,'1996','\0',31,NULL),(77,'Holstein-Stadion',171,NULL,'DE',10200,0,NULL,NULL,'1911','\0',32,'SH'),(78,'Feijenoord-Stadion (\"de Kuip\")',383,NULL,'NL',51177,0,NULL,NULL,'1937','\0',33,NULL),(79,'Stadion an der Lohmühle',195,NULL,'DE',17849,0,NULL,NULL,'1924','\0',34,'SH'),(80,'Jahnstadion',294,NULL,'DE',6000,0,NULL,NULL,NULL,'\0',35,'MV'),(81,'Wembley Stadium',339,NULL,'EN',82000,0,NULL,NULL,'1923','',36,NULL),(82,'Stadio delle Alpi',365,NULL,'IT',69041,0,NULL,NULL,'1990','\0',38,NULL),(83,'Jadestadion',330,NULL,'DE',7500,0,NULL,NULL,'1999','\0',39,'NI'),(84,'Stadion Wilhelmstraße',105,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',41,'SH'),(85,'Polizeisportplatz im Sternschanzenpark',449,64,'DE',2000,0,NULL,NULL,NULL,'\0',42,'HH'),(86,'Sportzentrum Redingskamp',449,21,'DE',2500,0,NULL,NULL,NULL,'\0',43,'HH'),(87,'Olimpijski kompleks Luschniki (Bolschaja Sportiwnaja Arena)',399,NULL,'RU',84864,0,NULL,NULL,'1955','\0',44,NULL),(88,'Stade de Frace',350,NULL,'FR',81338,0,NULL,NULL,'1998','\0',45,NULL),(89,'Køge Stadion',16,NULL,'DK',10000,0,NULL,NULL,'1932','\0',47,NULL),(90,'Hvidovre Stadion',1065,NULL,'DK',12000,0,NULL,NULL,'1955','\0',48,NULL),(91,'Brøndby Stadion',14,NULL,'DK',29000,0,NULL,NULL,'1965','\0',49,NULL),(92,'Old Trafford',342,NULL,'EN',75653,0,NULL,NULL,'1910','\0',50,NULL),(93,'Stade Constant Vanden Stock',6,NULL,'BE',21500,0,NULL,NULL,'1917','\0',52,NULL),(94,'Bezirkssportanlage Königskinderweg',449,66,'DE',3500,0,NULL,NULL,NULL,'\0',51,'HH'),(95,'Stadion Marienthal',449,86,'DE',6500,0,NULL,NULL,'1924','',53,'HH'),(96,'Waldstadion',116,NULL,'DE',57000,0,NULL,NULL,'1925','\0',54,'HE'),(97,'Estadio Santiago Bernabéu',415,NULL,'ES',81044,0,NULL,NULL,'1947','\0',55,NULL),(98,'Stadion Viktoria',417,NULL,'CZ',5037,0,NULL,NULL,'1952','\0',56,NULL),(99,'Stadio Giuseppe Meazza',362,NULL,'IT',80018,0,NULL,NULL,'1926','\0',57,NULL),(100,'Århus Idrætspark',13,NULL,'DK',19433,0,NULL,NULL,'1920','\0',58,NULL),(101,'Stadion 1',259,NULL,'DE',6000,0,NULL,NULL,NULL,'\0',59,'SH'),(102,'Stadion an der Nienburger Straße',83,NULL,'DE',8000,0,NULL,NULL,NULL,'\0',60,'NI'),(103,'Stadion am Ellernfeld',32,NULL,'DE',8000,0,NULL,NULL,NULL,'\0',61,'NI'),(104,'Marschwegstadion',250,NULL,'DE',15200,0,NULL,NULL,NULL,'\0',62,'NI'),(105,'Sportplatz Beethovenstraße',449,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',64,'HH'),(106,'Stadion Paulshöhe',297,NULL,'DE',10000,0,NULL,NULL,NULL,'\0',65,'MV'),(107,'Stadion Mürwiker Straße',114,NULL,'DE',12000,0,NULL,NULL,NULL,'\0',66,'SH'),(108,'Sportplatz Ellernreihe',449,17,'DE',3500,0,NULL,NULL,NULL,'\0',67,'HH'),(109,'Stadion Rahlstedter Höhe',449,59,'DE',1700,0,NULL,NULL,NULL,'\0',79,'HH'),(111,'Sportplatz Waldesruh',449,15,'DE',2000,0,NULL,NULL,NULL,'\0',69,'HH'),(112,'VfR-Stadion an der Geerdtsstraße',230,NULL,'DE',4999,0,NULL,NULL,'1927','\0',70,'SH'),(113,'Stade Louis II',349,NULL,'FR',18523,0,NULL,NULL,'1985','\0',71,NULL),(114,'Waldstadion',156,NULL,'DE',21813,0,NULL,NULL,'1937','\0',72,'SL'),(115,'Sportanlage In der Ahe',284,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',73,'NI'),(116,'Sportanlage am Freibad',186,NULL,'DE',1500,0,NULL,NULL,NULL,'\0',74,'SH'),(117,'Rudolf-Kalweit-Stadion',141,NULL,'DE',18000,0,NULL,NULL,'1918','\0',75,'NI'),(118,'Piepenbrockstadion an der Bremer Brücke',251,NULL,'DE',16667,0,NULL,NULL,'1931','\0',76,'NI'),(119,'Stadion Sander Tannen',449,43,'DE',12000,0,NULL,NULL,NULL,'\0',77,'HH'),(120,'Sportplatz Guerickestraße',195,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',80,'SH'),(121,'Stadion Glashütte',235,NULL,'DE',2500,0,NULL,NULL,NULL,'\0',81,'SH'),(122,'Sportzentrum Klausdorf',23,NULL,'DE',2500,0,NULL,NULL,NULL,'\0',82,'SH'),(123,'Elbe-Stadion',323,NULL,'DE',5000,0,NULL,NULL,NULL,'\0',83,'SH'),(124,'Sportplatz Jahnhöhe',449,36,'DE',7500,0,NULL,NULL,NULL,'\0',85,'HH'),(125,'Stadion Slaski',392,NULL,'PL',47246,120000,NULL,NULL,'1956','\0',84,NULL),(126,'Preußenstadion',227,NULL,'DE',15000,0,NULL,NULL,'1926','\0',86,'NW'),(127,'Friesenstadion',158,NULL,'DE',4000,0,NULL,NULL,NULL,'\0',87,'SH'),(128,'ETV-Sportzentrum Hoheluft',449,84,'DE',1100,0,NULL,NULL,'1912','\0',88,'HH'),(129,'Städtisches Stadion an der Hamburger Straße',66,NULL,'DE',23325,0,NULL,NULL,'1923','\0',89,'NI'),(130,'Sportplatz Saseler Parkweg',449,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',90,'HH'),(131,'Holsten-Stadion',267,NULL,'DE',5000,0,NULL,NULL,NULL,'\0',91,'SH'),(132,'Kilia-Platz',171,NULL,'DE',5500,0,NULL,NULL,'1913','\0',92,'SH'),(133,'Jakob-Thode-Platz',139,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',93,'SH'),(134,'Olympiastadion Tokio',368,NULL,'JP',57363,0,NULL,NULL,'1958','\0',94,NULL),(135,'Sportanlage Öjendorfer Weg',449,13,'DE',3000,0,NULL,NULL,NULL,'\0',95,'HH'),(136,'Hermann-Löns-Stadion',255,NULL,'DE',12000,0,NULL,NULL,NULL,'\0',96,'NW'),(137,'Kurt-Bürger-Stadion',332,NULL,'DE',5000,0,NULL,NULL,NULL,'\0',97,'MV'),(138,'HSV-Stadion an der Meldorfer Straße',148,NULL,'DE',11000,0,NULL,NULL,NULL,'\0',98,'SH'),(139,'Petrowski-Stadion',401,NULL,'RU',21570,0,NULL,NULL,'1925','\0',99,NULL),(140,'Osterwald-Stadion',293,NULL,'DE',4000,0,NULL,NULL,NULL,'\0',101,'NI'),(141,'Sportplatz Rotenhäuser Straße',449,75,'DE',0,0,NULL,NULL,NULL,'\0',102,'HH'),(142,'Jahnplatz, Nebenplatz (Grandplatz)',449,6,'DE',500,0,NULL,NULL,NULL,'\0',103,'HH'),(143,'Sportplatz Grauener Straße',313,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',104,'NI'),(144,'Heidewaldstadion',137,NULL,'DE',12500,0,NULL,NULL,'1933','\0',105,'NW'),(145,'Sportplatz Kroonhorst (Nebenplatz, Grand)',449,45,'DE',1000,0,NULL,NULL,NULL,'\0',106,'HH'),(146,'Weserstadion Platz 11',70,NULL,'DE',5500,0,NULL,NULL,NULL,'\0',107,'HB'),(147,'Wilhelm-Lindemann-Sportanlage (Grandplatz)',449,43,'DE',500,0,NULL,NULL,NULL,'\0',108,'HH'),(148,'Sportzentrum Almtweg',25,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',109,'SH'),(149,'Sportzentrum Holm',155,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',110,'SH'),(150,'Sportplatz Goethestraße',76,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',111,'SH'),(151,'Lehmwohldstadion',161,NULL,'DE',8000,0,NULL,NULL,NULL,'\0',112,'SH'),(152,'Jahnstadion',81,NULL,'DE',4000,0,'An der Rennbahn 1\n21614 Buxtehude',NULL,NULL,'\0',113,'NI'),(153,'Sperber-Platz',449,4,'DE',3000,0,NULL,NULL,NULL,'\0',114,'HH'),(154,'Sportzentrum Bönningstedt',55,NULL,'DE',2500,0,NULL,NULL,NULL,'\0',115,'SH'),(155,'Jahnstadion (an der Prüfeninger Straße)',272,NULL,'DE',12500,0,NULL,NULL,'1926','\0',117,'BY'),(156,'Stadion an der Schillerwiese',272,NULL,'DE',1500,0,NULL,NULL,NULL,'\0',118,'BY'),(157,'Dr.-Curt-Wassmund-Stadion',258,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',119,'SH'),(158,'Sportpark Hinschenfelde',449,73,'DE',4500,0,NULL,NULL,NULL,'\0',120,'HH'),(159,'Jahnplatz',449,6,'DE',3000,0,NULL,NULL,NULL,'\0',121,'HH'),(160,'Eiderstadion',78,NULL,'DE',8000,0,NULL,NULL,NULL,'\0',122,'SH'),(161,'Stadion an der Landesgrenze',449,75,'DE',2500,0,NULL,NULL,NULL,'\0',123,'HH'),(162,'Sportanlage Vogelhüttendeich',449,75,'DE',3000,0,NULL,NULL,NULL,'\0',124,'HH'),(164,'Rosenstadion',318,NULL,'DE',5000,0,NULL,NULL,NULL,'\0',126,'SH'),(165,'Olimpiskij Stadion Kosevo',7,NULL,'BA',35630,0,NULL,NULL,NULL,'\0',127,NULL),(166,'Friedrich-Peters-Platz',171,NULL,'DE',2500,0,'Friedrich-Peters-Platz\nAlter Steenbeker Weg 24\n24107 Kiel',NULL,NULL,'\0',626,'SH'),(167,'Jokri Park',1067,NULL,'DK',10418,0,NULL,NULL,'2008','\0',627,NULL),(168,'Continental Arena',272,NULL,'DE',15224,15224,'Franz-Josef-Strauß-Allee 22\nRegensburg',NULL,'2015','\0',628,'BY'),(169,'PGE Arena',1068,NULL,'PL',43615,0,'ul. Uczniowska 28\n80-530 Gda?sk',NULL,'2011','\0',629,NULL),(170,'Rentis Training Centre',1070,NULL,'GR',3000,0,NULL,NULL,'2004','\0',630,NULL),(171,'Stadio Peristeriou',1071,NULL,'GR',8939,0,'121 31, Kresnas 82, Peristeri 121 31, Griechenland',NULL,'1947','\0',631,NULL),(172,'Stadio Georgios Karaiskaki',1073,NULL,'GR',33300,0,NULL,NULL,'2004','\0',632,NULL),(173,'Stadio Theodoros Kolokotronis',1072,NULL,'GR',7616,0,NULL,NULL,'1979','\0',633,NULL),(174,'Merck-Stadion am Böllenfalltor ',1074,NULL,'DE',16150,0,'Nieder-Ramstädter Straße 170\n64285 Darmstadt',NULL,'1921','\0',634,'HE'),(175,'Strand-Arena',314,NULL,'DE',4500,0,'Höppnerweg 9\n23669 Timmendorfer Strand',NULL,NULL,'\0',471,'SH'),(177,'Stadion Crvena Zvezda',411,NULL,'CS',60000,0,NULL,NULL,'1963','\0',128,NULL),(178,'Stadion der Freundschaft',86,NULL,'DE',22528,0,NULL,NULL,'1930','\0',129,'BB'),(179,'Pittodrie Stadium',410,NULL,'SS',22199,0,NULL,NULL,'1899','\0',130,NULL),(180,'Sportplatz Scharbeutzer Straße (Nebenplatz 2, Rasen)',449,59,'DE',1000,0,NULL,NULL,NULL,'\0',131,'HH'),(181,'Sportzentrum Bültenbarg',24,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',132,'SH'),(182,'Sportplatz im Allhorn',449,72,'DE',3000,0,NULL,NULL,NULL,'\0',133,'HH'),(183,'Billtal-Stadion',449,10,'DE',30000,0,NULL,NULL,'1950','\0',134,'HH'),(185,'Sportplatz Alsterredder',449,65,'DE',1000,0,NULL,NULL,NULL,'\0',136,'HH'),(186,'Sportplatz Teekoppel',449,11,'DE',1000,0,NULL,NULL,NULL,'\0',137,'HH'),(187,'Sportzentrum Puckafferweg',449,20,'DE',2000,0,NULL,NULL,NULL,'\0',138,'HH'),(188,'Rudi-Barth-Sportanlage',449,6,'DE',6500,0,NULL,NULL,NULL,'\0',139,'HH'),(189,'Sportplatz Struckholt',449,55,'DE',1000,0,NULL,NULL,NULL,'\0',140,'HH'),(190,'Sportanlage Tiefenstaaken',449,44,'DE',3000,0,NULL,NULL,NULL,'\0',141,'HH'),(191,'Bromstens Idrottsplats ',407,NULL,'SE',1000,0,NULL,NULL,NULL,'\0',142,NULL),(192,'Mommsenstadion',42,NULL,'DE',15005,0,NULL,NULL,'1930','\0',143,'BE'),(193,'Sportplatz Gorch-Fock-Straße',289,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',144,'SH'),(195,'Sportplatz Weg-Beim-Jäger',449,29,'DE',1000,0,NULL,NULL,NULL,'\0',146,'HH'),(196,'Neo GSP',436,NULL,'CY',22859,0,NULL,NULL,'1999','\0',147,NULL),(197,'Stadion an der Norderstraße',183,NULL,'DE',6000,0,NULL,NULL,NULL,'\0',148,'SH'),(198,'Stadion im Schulsportzentrum',288,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',149,'SH'),(199,'Olympia-Sportplatz',230,NULL,'DE',0,0,NULL,NULL,NULL,'\0',150,'SH'),(200,'Sportplatz Alter Postweg',449,36,'DE',1500,0,NULL,NULL,NULL,'\0',151,'HH'),(201,'Sportplatz Heidenau, Nebenplatz (Rasen)',1076,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',152,'NI'),(202,'Karl-Hülbert-Sportzentrum',449,85,'DE',1000,0,NULL,NULL,NULL,'\0',153,'HH'),(203,'Sportplatz Bahnhofstraße',328,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',154,'SH'),(204,'Carl-Ohl-Kampfbahn',449,52,'DE',1000,0,NULL,NULL,NULL,'\0',155,'HH'),(205,'Rudolf Sievers Arena',207,NULL,'DE',1500,0,NULL,NULL,NULL,'\0',156,'NI'),(206,'Emirates Stadium',339,NULL,'EN',60260,0,'slington, Greater London N7 7\nLondon, ',NULL,'2006','\0',537,NULL),(207,'Sportplatz Eckel',102,NULL,'DE',1000,0,'Buchholzer Str. 2, 21224 Rosengarten\nTelefon:04181 99813335',NULL,NULL,'\0',157,'NI'),(208,'Sportplatz Am Berner Heerweg 187 B (Nebenplatz, Grand)',449,85,'DE',1000,0,'Berner Heerweg 187B, 22159 Hamburg\nTelefon:040 64551114',NULL,NULL,'\0',158,'HH'),(209,'Gemeindesportplatz',64,NULL,'DE',1000,0,'Quickborner Str. 99\n25494 Borstel-Hohenraden',NULL,NULL,'\0',159,'SH'),(210,'Stormarnplatz',20,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',160,'SH'),(211,'Gemeindesportplatz',185,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',161,'SH'),(212,'Am Sportplatz',131,NULL,'DE',3000,0,'Am Sportplatz 98, 21509 Glinde',NULL,NULL,'\0',162,'SH'),(213,'Sportzentrum \"Kurze Heide\" (Nebenplatz, Rasen)',308,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',163,'NI'),(214,'Sportplatz Brödermannsweg',449,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',164,'HH'),(215,'Wolfgang Krohn Arena',449,52,'DE',1000,0,NULL,NULL,NULL,'\0',165,'HH'),(216,'Gustav-Falke-Platz',449,23,'DE',1000,0,'Gustav-Falke-Straße 19, 20144 Hamburg',NULL,NULL,'\0',167,'HH'),(217,'Sportplatz Schützenhof',449,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',166,'HH'),(218,'Stichter Sportpark',229,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',168,'NI'),(219,'Stadion an der Travemünder Allee',195,NULL,'DE',5000,0,'Mecklenburger Str. 30a\n23568 Lübeck',NULL,NULL,'\0',169,'SH'),(221,'Stadion Hammer Park',449,32,'DE',7000,0,'Hammer Steindamm 131\n20535 Hamburg-Hamm',NULL,NULL,'\0',171,'HH'),(222,'Waldsportplatz',147,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',172,'NI'),(223,'Stadion am Vinnenweg',70,NULL,'DE',5050,0,'Vinnenweg 100\n28355 Bremen',NULL,NULL,'\0',173,'HB'),(224,'Waldstadion',388,NULL,'AT',2550,0,'Unterer Achdamm 4\n6971 Hard am Bodensee',NULL,NULL,'\0',174,NULL),(225,'Waldstadion',387,NULL,'AT',3500,0,'Stadionstr.\n6800 Feldkirch',NULL,NULL,'\0',175,NULL),(226,'Rheinpark Stadion',373,NULL,'LI',7838,0,'Rheindamm\n9490 Vaduz',NULL,NULL,'\0',176,NULL),(227,'Stadion am Weiher',115,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',177,'HE'),(228,'Sportanlage Alsterquelle',150,NULL,'DE',2000,0,'Schäferkampsweg 32\n24558 Henstedt-Ulzburg-Rhen',NULL,NULL,'\0',178,'SH'),(229,'Hafen-Platz Damerower Weg',280,NULL,'DE',3500,0,'Damerower Weg 25\n18059 Rostock',NULL,NULL,'\0',179,'MV'),(230,'Sportcentrum Sachsenweg',449,52,'DE',3500,0,'Sachsenweg 91\n22455 Hamburg-Niendorf',NULL,NULL,'\0',180,'HH'),(231,'Moorstadion',164,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',181,'NI'),(232,'Otto-Koch-Kampfbahn',77,NULL,'DE',1500,0,'Seppenser Mühlenweg 44\n21244 Buchholz in der Nordheide',NULL,NULL,'\0',182,'NI'),(233,'Stadion Meteor',426,NULL,'UA',24401,0,'vul. Bil\'shovyts\'ka 27-A\n49000 Dnipropetrovs\'k',NULL,NULL,'\0',183,NULL),(234,'Sportplatz Hasloer Weg',312,NULL,'DE',1000,0,'Geschäftsstelle\nHasloher Weg 5\n25499 Tangstedt',NULL,NULL,'\0',184,'SH'),(235,'Sportzentrum Bargteheide',38,NULL,'DE',5000,0,'Alte Landstr. 81\nBargteheide',NULL,NULL,'\0',185,'SH'),(236,'Sportanlage Kandinskyallee',449,47,'DE',5000,0,'Kandinskyallee 29\n22115 Hamburg-Mümmelmannsberg',NULL,NULL,'\0',186,'HH'),(237,'Nordseestadion',75,NULL,'DE',10000,0,'Am Stadion 10\n27580 Bremerhaven',NULL,NULL,'\0',187,'HB'),(238,'Hans-Heinrich-Hackmack-Stadion',275,NULL,'DE',1000,0,'Amselstieg 26\n21465 Reinbek',NULL,NULL,'\0',188,'SH'),(239,'Städtische Sportanlage Jägerhof (Nebenplatz, Grand)',449,35,'DE',500,0,'Talweg 1\n21149 Hamburg',NULL,NULL,'\0',189,'HH'),(240,'Sportplatz Scharfsche Schlucht',449,67,'DE',2000,0,'Scharfsche Schlucht\n21077 Hamburg',NULL,NULL,'\0',190,'HH'),(241,'Ta Qali-Stadion',377,NULL,'MT',17797,0,NULL,NULL,'1980','\0',191,NULL),(242,'Albert-Kaehlert Platz am Gesundbrunnen',449,16,'DE',1500,0,'Beim Gesundbrunnen 15\n20537 Hamburg-Borgfelde',NULL,'1982','\0',192,'HH'),(243,'Dubai Police Club Stadium',431,NULL,'AE',7500,0,NULL,NULL,NULL,'\0',193,NULL),(244,'Sportplatz Rabenstein',449,76,'DE',5000,0,'Hölscherweg 11\n21077 Hamburg',NULL,NULL,'\0',194,'HH'),(245,'Stadion am Marschweg',167,NULL,'DE',3500,0,'Stadion am Marschweg\nAm Marschweg 18\n24568 Kaltenkirchen',NULL,NULL,'\0',195,'SH'),(246,'Sportanlage Bültenkoppel (Nebenplatz, Grand)',449,58,'DE',1000,0,'Sportanlage Bültenkoppel\nBültenkoppel 1\n22399 Hamburg-Poppenbüttel',NULL,NULL,'\0',196,'HH'),(247,'Holsten-Stadion (Nebenplatz, Grand)',267,NULL,'DE',2000,0,'Am Stadion\n25451 Quickborn',NULL,NULL,'\0',197,'SH'),(248,'Sportplatz Hamfelderedder',57,NULL,'DE',1500,0,'Hamfelderedder 17\n21039 Börnsen',NULL,NULL,'\0',198,'SH'),(249,'Wilhelm-Lindemann-Sportanlage',449,43,'DE',5000,0,'Binnenfeldredder 9\n21031 Hamburg-Lohbrügge',NULL,NULL,'\0',199,'HH'),(250,'Hermann-Seiffart-Sportanlage',449,8,'DE',2000,0,'Baurstraße 20\n22605 Hamburg',NULL,NULL,'\0',200,'HH'),(251,'Sportplatz Bekkamp ',449,39,'DE',1000,0,NULL,NULL,NULL,'\0',201,'HH'),(252,'Sportplatz Mittlerer Landweg',449,14,'DE',1000,0,'Mittlerer Landweg 40\n21033 Hamburg',NULL,NULL,'\0',202,'HH'),(253,'Paul-Hauenschild-Sportplätze (Kunstrasenplatz 1)',235,NULL,'DE',1000,0,'Ulzburger Straße 94\n22850 Norderstedt',NULL,NULL,'\0',204,'SH'),(254,'Stade op Flohr',376,NULL,'LU',4062,0,'Rue du Stade\nGréiwemaacher (Grevenmacher)',NULL,NULL,'\0',205,NULL),(255,'Mimar Yahya Bas Stadi',422,NULL,'TR',15242,0,NULL,NULL,NULL,'\0',206,NULL),(256,'Sportplatz Außenmühle',449,76,'DE',5000,0,'Vinzenzweg 20\n21077 Hamburg-Wilstorf',NULL,NULL,'\0',207,'HH'),(257,'Stadionul Valentin Stanescu - Guilesti',403,NULL,'RO',19100,0,NULL,NULL,'1939','\0',208,NULL),(258,'Stadion Hohe Warte',390,NULL,'AT',5500,0,NULL,NULL,'1921','\0',209,NULL),(259,'Sportplatz Silberberg',124,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',210,'SH'),(260,'Sportanlage Soltausredder \"Helmut-John-Stadion\"',39,NULL,'DE',3500,0,'Hinterm Garten 2\n22885 Barsbüttel',NULL,NULL,'\0',211,'SH'),(261,'Sportplatz Koggestraße',195,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',212,'SH'),(262,'Bezirkssportanlage Gebrüder-Grimm-Ring',195,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',213,'SH'),(263,'Lansdowne Road',356,NULL,'IE',50000,0,NULL,NULL,'1872','',214,NULL),(264,'Tolka Park',356,NULL,'IE',9681,0,NULL,NULL,'1953','\0',215,NULL),(265,'Sportplatz am VfL-Heim',304,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',216,'NI'),(266,'Sportanlage Müßentwiete',259,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',217,'SH'),(267,'Bezirkssportanlage Schevenmoor',70,NULL,'DE',1500,0,'Walliser Straße 119\n28325 Bremen',NULL,NULL,'\0',218,'HB'),(268,'Beekestadion',141,NULL,'DE',6000,0,'Mühlenholzweg 4b\n30459 Hannover-Ricklingen',NULL,NULL,'\0',219,'NI'),(269,'Stadion An der Alten Försterei',42,NULL,'DE',21717,0,NULL,NULL,'1920','\0',220,'BE'),(270,'Platz bei Postels',322,NULL,'DE',2500,0,'Schuldamm 1\n27729 Vollersode',NULL,NULL,'\0',221,'NI'),(271,'Sportpark am Möhlenkamp (Nebenplatz, Rasen)',62,NULL,'DE',1000,0,'Möhlenkamp 26\n24582 Bordesholm',NULL,NULL,'\0',222,'SH'),(272,'Sportplatz Grankowweg',449,18,'DE',2000,0,'Gramkowweg\n21039 Hamburg-Neuengamme',NULL,NULL,'\0',223,'HH'),(273,'Sportplatz Vogesenstraße',449,19,'DE',500,0,NULL,NULL,NULL,'\0',224,'HH'),(274,'Sportplatz Winsener Straße',449,76,'DE',8000,0,'Kapellenweg 111\n21077 Hamburg-Harburg',NULL,NULL,'\0',225,'HH'),(275,'Stadion im Borussia-Park',213,NULL,'DE',54000,54000,'Hennes-Weisweiler-Allee 1',NULL,'2004','\0',226,'NW'),(276,'Friedrich-Moebus-Stadion',35,NULL,'DE',10000,0,'Pfingstwiese 911\n55545 Bad Kreuznach',NULL,NULL,'\0',227,'RP'),(277,'Stadion am Zoo',337,NULL,'DE',23067,0,NULL,NULL,'1924','\0',228,'NW'),(278,'Ernst-Fischer-Spielplatz (rechts)',449,33,'DE',1000,0,NULL,NULL,NULL,'\0',229,'HH'),(279,'Dr. Helmut Riedl-Stadion',108,NULL,'DE',7200,12000,NULL,NULL,'1950','\0',230,'NI'),(280,'Sportzentrum Oststeinbek (Rasenplatz)',253,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',231,'SH'),(281,'Stadion an der Friesoyther Straße',85,NULL,'DE',5001,0,NULL,NULL,NULL,'\0',232,'NI'),(282,'Moorbekstadion',235,NULL,'DE',5000,0,NULL,NULL,NULL,'\0',233,'SH'),(283,'Stadion Opferberg',449,49,'DE',4000,0,'Cuxhavener Straße 271a\n21149 Hamburg-Hausbruch',NULL,NULL,'\0',234,'HH'),(284,'Ramat-Gan-Stadion',1078,NULL,'IL',41583,0,NULL,NULL,'1951','\0',235,NULL),(285,'Exerzierplatz',235,NULL,'DE',4000,0,'Am Exerzierplatz 14 - 16\n22844 Norderstedt',NULL,NULL,'\0',236,'SH'),(286,'Wersestadion',19,NULL,'DE',12500,0,'August-Kirchner-Straße 14\n59229 Ahlen/Westfalen',NULL,NULL,'\0',237,'NW'),(287,'Eilenriedestadion ',141,NULL,'DE',18000,0,'Clausewitzstraße 4\n30175 Hannover',NULL,'1922','\0',238,'NI'),(288,'Toyota Arena',417,NULL,'CZ',20854,0,'Milady Horákové 1066/98, Letná\n170 82 Praha',NULL,'1917','\0',239,NULL),(289,'Sportplatz Deepenhorn',449,59,'DE',1000,0,NULL,NULL,NULL,'\0',240,'HH'),(291,'Stadion Am Heisterort',78,NULL,'DE',2500,0,'Heisterort 15\n24782 Büdelsdorf',NULL,NULL,'\0',242,'SH'),(292,'Heinrich-Kruse-Stadion',449,87,'DE',2500,0,'Sthamer Straße 30\n22397 Hamburg-Ohlstedt',NULL,NULL,'\0',243,'HH'),(293,'Ernst-Wagener-Stadion',104,NULL,'DE',2000,0,'Matthias-Claudius-Straße\n22964 Steinburg-Eichede',NULL,NULL,'\0',244,'SH'),(294,'Stadion Meiendorf',449,59,'DE',3000,0,'Meiendorfer Straße 196\n22145 Hamburg-Meiendorf',NULL,NULL,'\0',245,'HH'),(295,'Travestadion',37,NULL,'DE',4000,0,'Am Stadion\n23843 Bad Oldesloe',NULL,NULL,'\0',246,'SH'),(296,'Eintracht-Stadion',245,NULL,'DE',7500,0,'Heideweg 18\n48512 Nordhorn',NULL,NULL,'\0',247,'NI'),(297,'Stade Prince Moulay Abdallah',379,NULL,'MA',52000,0,'Avenue Hassan II\nRabat',NULL,'1983','\0',248,NULL),(298,'Stadion Wals-Siezenheim',389,NULL,'AT',31895,0,'Stadionstrasse 2/3\n5071 Wals-Siezenheim',NULL,'2003','\0',249,NULL),(299,'HFV-Sportschule (Kunstrasenplatz)',449,39,'DE',500,0,NULL,NULL,NULL,'\0',250,'HH'),(300,'Grotenburg-Stadion',182,NULL,'DE',34500,0,'Tiergartenstr., Bockum\n47800 Krefeld',NULL,'1927','\0',251,'NW'),(301,'Stadion im Bayer-Sportcentrum',91,NULL,'DE',5000,0,'Höhenberg 40\n41539 Dormagen',NULL,NULL,'\0',252,'NW'),(302,'Arke-Stadion',382,NULL,'NL',13250,0,NULL,NULL,'1998','\0',253,NULL),(303,'Bezirkssportanlage Projensdorf (Kunstrasen)',171,NULL,'DE',1000,0,'Steenbeker Weg 150-152\n24106 Kiel',NULL,NULL,'\0',254,'SH'),(304,'Stadion Achter de Weiden',289,NULL,'DE',8000,0,'Achter de Weiden 34\n22869 Schenefeld',NULL,NULL,'\0',255,'SH'),(305,'A. Le Coq Arena',344,NULL,'EE',9692,0,NULL,NULL,'2001','\0',256,NULL),(306,'Preußenstadion Malteserstraße',42,NULL,'DE',7000,0,NULL,NULL,'1938','\0',257,'BE'),(307,'Karl-Liebknecht-Stadion',264,NULL,'DE',11925,0,NULL,NULL,'1976','\0',258,'BB'),(308,'Sportpark am Möhlenkamp',62,NULL,'DE',3500,0,'Möhlenkamp 26\n24582 Bordesholm',NULL,NULL,'\0',259,'SH'),(309,'Sportanlage Karl-Arnold-Ring',449,75,'DE',2000,0,NULL,NULL,NULL,'\0',260,'HH'),(310,'Uhlenhoff-Stadion',449,27,'DE',3500,0,'Norderschulweg\n21129 Hamburg',NULL,NULL,'\0',261,'HH'),(311,'Stadion an der Poststraße',321,NULL,'DE',5001,0,'Poststraße\n33415 Verl',NULL,'1994','\0',262,'NW'),(312,'Fritz-Walter-Stadion',166,NULL,'DE',49780,0,'Fritz-Walter-Straße 1\n67663 Kaiserslautern',NULL,'1920','\0',263,'RP'),(313,'Stadion am Bruchweg',205,NULL,'DE',18000,0,NULL,NULL,'1929','\0',264,'RP'),(314,'Linne-Kampfbahn ',449,19,'DE',3000,0,NULL,NULL,NULL,'\0',265,'HH'),(315,'Gottlieb-Daimler-Stadion',310,NULL,'DE',60449,0,NULL,NULL,'1933','\0',266,'BW'),(316,'Friedrich-Ludwig-Jahn-Sportplatz',295,NULL,'DE',2000,0,'Babickstraße 9\n15566 Schöneiche',NULL,NULL,'\0',267,'BB'),(317,'Flancare Park',358,NULL,'IE',6850,0,'Strokestown Road (N5)\nLongford ',NULL,NULL,'\0',269,NULL),(318,'St. Mels Park',355,NULL,'IE',8200,0,NULL,NULL,NULL,'\0',270,NULL),(319,'Windsor Park',386,NULL,'nn',20332,0,NULL,NULL,'1905','\0',271,NULL),(320,'Sportanlage Siemershöh',449,41,'DE',4000,0,'Langenhorner Chaussee 118a\n22415 Hamburg-Fuhlsbüttel',NULL,NULL,'\0',272,'HH'),(321,'Hindenburg-Stadion',22,NULL,'DE',3000,0,'Im Hindenburg-Stadion\n31061 Alfeld/Leine',NULL,NULL,'\0',274,'NI'),(322,'Hindenburgstadion',305,NULL,'DE',2500,0,'Stubbendorffweg 8\n29614 Soltau',NULL,NULL,'\0',273,'NI'),(323,'Stadion am Rosengrund',80,NULL,'DE',3000,0,'Rosengrund\n25761 Büsum',NULL,NULL,'\0',275,'SH'),(324,'Sportplatz Birkenau',449,71,'DE',500,0,NULL,NULL,NULL,'\0',276,'HH'),(325,'Jahnplatz (Nebenplatz, Grandplatz 2)',449,6,'DE',500,0,NULL,NULL,NULL,'\0',278,'HH'),(326,'Sportplatz Sternschanze',449,64,'DE',500,0,NULL,NULL,NULL,'\0',279,'HH'),(327,'Heinsich-Kruse-Stadion (Nebenplatz, Grand)',449,87,'DE',1000,0,NULL,NULL,NULL,'\0',280,'HH'),(328,'Wojska Polskiego im. Marszalka Jozefa Pilsudskiego',393,NULL,'PL',15000,0,NULL,NULL,'1927','\0',281,NULL),(329,'Hansa Stadion',121,NULL,'DE',2500,0,'Thüler Straße 25c\n26169 Friesoythe',NULL,NULL,'\0',282,'NI'),(330,'Sportanlage Bültenkoppel',449,58,'DE',2000,0,'Bültenkoppel 1\n22399 Hamburg-Poppenbüttel',NULL,NULL,'\0',283,'HH'),(331,'Aussie Stadium',4,NULL,'AU',45500,0,NULL,NULL,'1988','\0',284,NULL),(332,'North Harbour Stadium ',380,NULL,'NZ',25000,0,'Oteha Valley Road, Albany\n752 North Shore',NULL,'1997','\0',285,NULL),(333,'Lawson Tama Stadium',404,NULL,'SB',25000,21000,NULL,NULL,NULL,'\0',286,NULL),(334,'Sportplatz Scharbeutzer Straße (Nebenplatz 1, Rasen)',449,59,'DE',1000,0,NULL,NULL,NULL,'\0',287,'HH'),(335,'Sportplatz Berner Allee',449,85,'DE',1000,0,NULL,NULL,NULL,'\0',288,'HH'),(336,'Julius-Sparbier-Sportplatz',449,23,'DE',500,0,NULL,NULL,NULL,'\0',289,'HH'),(337,'Sportplatz Luisenweg',449,31,'DE',500,0,NULL,NULL,NULL,'\0',290,'HH'),(338,'Veltins-Arena',128,NULL,'DE',61673,0,NULL,NULL,'2001','\0',291,'NW'),(339,'Erzgebirgsstadion ',27,NULL,'DE',15690,0,NULL,NULL,'1950','\0',292,'SN'),(340,'Sportanlage Erlenstraße',70,NULL,'DE',2500,0,NULL,NULL,NULL,'\0',293,'HB'),(341,'BSV-Arena',309,NULL,'DE',2200,0,'BSV-Arena\nBrunnenweg\n28816 Stuhr',NULL,NULL,'\0',294,'NI'),(342,'Sportplatz Kampfbahn',89,NULL,'DE',6000,0,NULL,NULL,NULL,'\0',295,'NI'),(343,'Sportplatz Marckmannstraße',449,63,'DE',1000,0,NULL,NULL,NULL,'\0',296,'HH'),(344,'Städtisches Stadion Nobiskrug',279,NULL,'DE',5000,0,'Städtisches Stadion Nobiskrug\nNobiskrüger Allee 42a\n24768 Rendsburg ',NULL,NULL,'\0',297,'SH'),(345,'Jan Breydelstadion',5,NULL,'BE',29042,0,'Jan Breydelstadion\nOlympialaan 74\n8200 Brugge',NULL,'1975','\0',298,NULL),(346,'Sportanlage Soltausredder \"Helmut-John-Stadion\" (Kunstrasen)',39,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',299,'SH'),(347,'Sportpark Altengamme (Kunstrasen)',449,5,'DE',1000,0,'Altengammer Hauptdeich 44\n21039 Hamburg',NULL,NULL,'\0',300,'HH'),(348,'Sportpark Altengamme',449,5,'DE',1000,0,'Altengammer Hauptdeich 44\n21039 Hamburg',NULL,NULL,'\0',301,'HH'),(350,'Steigerwaldstadion',109,NULL,'DE',19439,0,'Arnstädter Straße 55\n99096 Erfurt',NULL,'1927','\0',303,'TH'),(351,'Azadi-Stadion',354,NULL,'IR',95225,0,NULL,NULL,'1973','\0',304,NULL),(352,'Cairo International Stadium',2,NULL,'EG',74100,0,'l-Istad Al-Bahary Street, Nasr City\nal-Quhirah (Cairo)',NULL,'1960','\0',305,NULL),(353,'Cairo Military Academy Stadium',2,NULL,'EG',28500,0,NULL,NULL,'1989','\0',306,NULL),(354,'Border Guard Stadium (Haras El-Hodod Stadium)',1,NULL,'EG',22500,0,NULL,NULL,NULL,'\0',307,NULL),(355,'Sportplatz Meerweinstraße',449,77,'DE',1000,0,NULL,NULL,NULL,'\0',308,'HH'),(356,'Stadion Camper Höhe',306,NULL,'DE',6000,0,'Am Exerzierplatz 17\n21680 Stade',NULL,NULL,'\0',309,'NI'),(357,'Sportplatz Jahnstraße',157,NULL,'DE',1200,0,'Heisterender Weg 10\n25358 Horst',NULL,NULL,'\0',310,'SH'),(358,'Sportplatz Schulweg',60,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',311,'SH'),(359,'Sportplatz Kiesbarg',449,49,'DE',2500,0,'Kiesbarg\n21149 Hamburg-Fischbek',NULL,NULL,'\0',312,'HH'),(360,'Stade Taieb Mhiri',424,NULL,'TN',22000,0,NULL,NULL,'1938','\0',313,NULL),(361,'Stade du 15-Octobre',423,NULL,'TN',20000,0,NULL,NULL,'1985','\0',314,NULL),(362,'Sportplatz Sandscholle',264,NULL,'DE',2500,0,'Franz-Mehring-Str. 54\n14482 Potsdam',NULL,NULL,'\0',315,'BB'),(363,'Hans-Zoschke-Stadion',42,NULL,'DE',10000,0,NULL,NULL,'1952','\0',316,'BE'),(364,'Giants Stadium',429,NULL,'US',80242,0,'Stadium Road\n7073 East Rutherford, New Jersey',NULL,'1976','',317,NULL),(365,'Mitchel Athletic Complex',430,NULL,'US',8000,0,'Charles Lindbergh Blvd\nNY 11553 Uniondale',NULL,NULL,'\0',318,NULL),(366,'Rentschler Field',428,NULL,'US',40000,0,NULL,NULL,'2003','\0',319,NULL),(367,'Maschparkstadion',132,NULL,'DE',8000,0,NULL,NULL,NULL,'\0',320,'NI'),(368,'Jahnstadion',132,NULL,'DE',17000,0,'Sandweg 5\n37083 Göttingen',NULL,'1913','\0',321,'NI'),(369,'Hermsn-Löns-Sportplatz',449,28,'DE',3000,0,NULL,NULL,NULL,'\0',322,'HH'),(370,'Sportplatz Langenfort (2)',449,83,'DE',1000,0,NULL,NULL,NULL,'\0',323,'HH'),(371,'Sportplatz Kirchstraße (Nebenplatz Rasen 1)',301,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',324,'SH'),(372,'Sportplatz Meister-Francke-Straße',449,83,'DE',1000,0,NULL,NULL,NULL,'\0',325,'HH'),(373,'Stadion an der Neuscharreler Straße 4 (Nebenplatz Rasen)',299,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',326,'NI'),(374,'Sportplatz Minchenkoog',270,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',327,'NI'),(375,'Heinrich-Germer-Stadion',204,NULL,'DE',8000,0,'Salzmannstraße 34\n39112 Magdeburg',NULL,'1920','\0',328,'ST'),(376,'Zentralstadion',11,NULL,'DE',44345,0,NULL,NULL,'2004','\0',329,'SN'),(378,'Forum Horsens Stadion',15,NULL,'DK',10400,0,'Langmarksvej 65\n8700 Horsens',NULL,'1929','\0',330,NULL),(379,'Stadio Olimpico di Serravalle',405,NULL,'SM',5115,0,'Via Rancaglia\nSerravalle',NULL,'1969','\0',331,NULL),(380,'Walter-Bettges-Stadion',187,NULL,'DE',4500,0,'Leibnizstraße 56\n30853 Langenhagen',NULL,NULL,'\0',332,'NI'),(381,'Sportanlage Stettiner Straße',230,NULL,'DE',2000,0,'Stettiner Straße 29\n24537 Neumünster',NULL,NULL,'\0',333,'SH'),(382,'Sportplatz Ladenbeker Weg',449,43,'DE',1000,0,NULL,NULL,NULL,'\0',334,'HH'),(383,'Sportplatz Blomkamp',449,55,'DE',2000,0,'Blomkamp 32\n22549 Hamburg-Osdorf',NULL,NULL,'\0',335,'HH'),(384,'Sportplatz Von-Elm-Weg',449,37,'DE',1000,0,NULL,NULL,NULL,'\0',336,'HH'),(385,'Sportplatz Neue Welt (oben)',449,77,'DE',500,0,NULL,NULL,NULL,'\0',337,'HH'),(386,'Sportplatz Marienkäferweg',449,67,'DE',1000,0,NULL,NULL,NULL,'\0',338,'HH'),(387,'Sportzentrum Schlutup',195,NULL,'DE',2500,0,'Palinger Weg 56a\n23568 Lübeck-Schlutup',NULL,NULL,'\0',339,'SH'),(388,'Kehdinger Stadion',94,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',340,'NI'),(389,'PCC-Stadion',95,NULL,'DE',5000,0,'Rheindeichstraße 50\n47198 Duisburg-Homberg',NULL,'2003','\0',341,'NW'),(390,'Stadion Rote Erde',92,NULL,'DE',25000,0,'Strobelallee 46\n44139 Dortmund',NULL,'1924','\0',342,'NW'),(391,'Karl-Möller-Sportplatz',449,6,'DE',1500,0,'Max-Brauer-Allee 121\n22765 Hamburg-Altona',NULL,NULL,'\0',343,'HH'),(392,'Sportanlage Moorweg',276,NULL,'DE',1500,0,'Moorweg 68a\n25462 Rellingen-Pütjen',NULL,NULL,'\0',344,'SH'),(394,'Stadion am Fliesenwerk',58,NULL,'DE',5000,0,'Weg der Jugend\n19258 Boizenburg/Elbe',NULL,NULL,'\0',345,'MV'),(395,'Sportplatz Am Torfmoor',136,NULL,'DE',1500,0,'Am Torfmoor 8\n23627 Groß Grönau ',NULL,NULL,'\0',346,'SH'),(396,'Waldstadion',263,NULL,'DE',2500,2300,'Am Waldstadion\n19303 Polz',NULL,NULL,'\0',347,'MV'),(397,'Al-Rashid Stadium',431,NULL,'AE',12000,0,NULL,NULL,'1948','\0',348,NULL),(398,'Rashid Al-Maktoum Stadium',431,NULL,'AE',12000,0,'10th Street / Oud Metha Road\nDubayy (Dubai)',NULL,NULL,'\0',349,NULL),(399,'Ludwigsparkstadion ',286,NULL,'DE',35286,53000,'Stadionweg\n66113 Saarbrücken',NULL,'1953','\0',350,'SL'),(400,'Sportplatz Am Neumarkt',449,73,'DE',1000,0,NULL,NULL,NULL,'\0',351,'HH'),(401,'Fritz-Bortz-Sportplatz',31,NULL,'DE',3000,0,'Sachsenwaldstraße 18\n21521 Aumühle',NULL,NULL,'\0',352,'SH'),(402,'Tivoli',18,NULL,'DE',21300,0,'Krefelder Straße 187\n52070 Aachen',NULL,'1928','',353,'NW'),(403,'Sportplatz Neuer Krug',124,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',354,'SH'),(404,'Sportplatz Grandweg',449,44,'DE',1000,0,NULL,NULL,NULL,'\0',355,'HH'),(406,'Sportplatz Dockenhuden',449,88,'DE',1200,0,'Simrockstr. 62 A\n22589 Hamburg',NULL,NULL,'\0',356,'HH'),(407,'Schulsportplatz Egenbüttel',276,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',357,'SH'),(408,'Sportplatz Marienburg',325,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',358,'SH'),(409,'Am Sportplatz',39,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',359,'SH'),(410,'Stadion an der Lipezker Straße',86,NULL,'DE',5000,0,'Stadion an der Lipezker Straße\nCottbus',NULL,NULL,'\0',360,'BB'),(411,'Sportanlage Dratelnstraße',449,75,'DE',2500,0,'Dratelnstraße 21\n21109 Hamburg-Wilhelmsburg',NULL,NULL,'\0',361,'HH'),(412,'Schiffsthal-Stadion',262,NULL,'DE',4500,0,'Am Schiffsthal 13\n24306 Plön',NULL,NULL,'\0',362,'SH'),(413,'Stadion Breite',409,NULL,'CH',4200,7300,'Breitenaustrasse\n8200 Schaffhausen',NULL,'1950','\0',363,NULL),(414,'Sportanlage Bunter Weg',184,NULL,'DE',2000,0,'Bunter Weg 9\n26736 Pewsum',NULL,NULL,'\0',364,'NI'),(415,'LTU arena',98,NULL,'DE',54600,54600,'Arena Straße 1\n40479 Düsseldorf-Stockum',NULL,'2005','\0',365,'NW'),(416,'ONO Estadi ',416,NULL,'ES',23142,0,'Camí dels Reis\nPalma de Mallorca',NULL,'1999','\0',366,NULL),(417,'Wembley Stadium (new)',339,NULL,'EN',90000,0,NULL,NULL,'2007','\0',367,NULL),(418,'Millennium Stadium',434,NULL,'WW',74500,0,NULL,NULL,'1999','\0',368,NULL),(419,'Estádio do Sport Lisboa e Benfica (da Luz)',395,NULL,'PT',65647,0,NULL,NULL,'2003','\0',369,NULL),(420,'Estádio do Restelo',395,NULL,'PT',32500,0,NULL,NULL,'1956','\0',370,NULL),(421,'Hermann-Hahn-Platz',209,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',371,'NI'),(422,'BMO Field',369,NULL,'CA',22453,0,'170 Princes Boulevard\nMBK 3C3 Toronto, Ontario',NULL,'2007','\0',372,NULL),(423,'Sportzentrum Ann Himmelsbarg (Nebenplatz, Rasen)',215,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',373,'SH'),(424,'GAZI-Stadion auf der Waldau',310,NULL,'DE',11408,0,NULL,NULL,'1905','\0',374,'BW'),(425,'Estádio AXA',394,NULL,'PT',30286,0,NULL,NULL,NULL,'\0',375,NULL),(426,'Ludwig-Jahn-Stadion (Nebenplatz, Kunstrasen)',151,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',376,'NW'),(427,'Rosenaustadion',29,NULL,'DE',28000,64856,NULL,NULL,'1951','\0',377,'BY'),(428,'Sportanlage Berliner Straße (Nebenplatz, Grand)',124,NULL,'DE',2000,0,'Berliner Straße\n21502 Geesthacht',NULL,NULL,'\0',378,'SH'),(429,'Sportanlage Berliner Straße',124,NULL,'DE',3500,0,'Berliner Straße\n21502 Geesthacht',NULL,NULL,'\0',379,'SH'),(430,'Sportanlage Heiglhofstraße',220,NULL,'DE',1000,0,'Heiglhofstraße 25, 81375 München ',NULL,NULL,'\0',380,'BY'),(431,'Stadion Tehelne pole',413,NULL,'SK',30087,0,NULL,NULL,'1940','',381,NULL),(433,'Sportplatz Freiheitsweg',42,NULL,'DE',3000,0,'Freiheitsweg 20-26\n13407 Berlin-Reinickendorf',NULL,NULL,'\0',382,'BE'),(434,'Sportplatz Breloh',1079,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',383,'NI'),(435,'Yuba Bharati Krirangan',353,NULL,'IN',125000,131000,'Eastern Metropolitan Bypass\n700091 Kalkata (Kolkata), West Bengal',NULL,'1984','\0',384,NULL),(436,'Sportplatz Dorfstraße',315,NULL,'DE',1500,0,'Am Sportplatz\n23826 Todesfelde',NULL,NULL,'\0',385,'SH'),(437,'Sportplatz Pöhlsener Weg',338,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',386,'SH'),(438,'Schulsportplatz',68,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',387,'SH'),(439,'FC Zwolle Stadion',385,NULL,'NL',10500,0,'Stadionplein 1\nZwolle',NULL,'2007','\0',388,NULL),(440,'Heinrich-Graf-Sportanlage',110,NULL,'DE',2800,0,'Am Sportfeld 16\n65760 Eschborn/Taunus',NULL,NULL,'\0',389,'HE'),(441,'Glück-Auf-Stadion Am Holzplatz',152,NULL,'DE',8000,0,'Am Holzplatz\n44627 Herne-Sodingen',NULL,NULL,'\0',390,'NW'),(442,'Sportplatz Wendenstraße',449,33,'DE',1000,0,NULL,NULL,NULL,'\0',391,'HH'),(443,'Sportplatz Glüsinger Weg',189,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',392,'SH'),(444,'Gerhardt-Buhr-Platz',146,NULL,'DE',2000,0,'Am Sportplatz 2\n25474 Hasloh',NULL,NULL,'\0',393,'SH'),(445,'Helsingin Olympiastadion',345,NULL,'FI',40682,0,'Paavo Nurmen tie 1\n00250 Helsinki (Helsingfors)',NULL,'1938','\0',394,NULL),(446,'Wildparkstadion',168,NULL,'DE',29699,0,'Adenauerring 17\n76131 Karlsruhe',NULL,'1955','\0',396,'BW'),(447,'Sportplatz Am Ecksoll',307,NULL,'DE',1000,0,NULL,NULL,NULL,'',397,'SH'),(448,'Stadio Artemio Franchi',361,NULL,'IT',46389,58271,'Viale Manfredo Fanti 14\nFirenze',NULL,'1931','\0',398,NULL),(449,'Sportplatz Furtweg',449,21,'DE',2000,0,NULL,NULL,NULL,'\0',399,'HH'),(450,'Friedrich-Ludwig-Jahn-Sportpark',42,NULL,'DE',19708,30000,'Cantianstraße 24\n10437 Berlin-Prenzlauer Berg',NULL,'1952','\0',400,'BE'),(451,'Stade de Gerland',347,NULL,'FR',41842,48552,'353, avenue Jean-Jaurès\n69007 VIIè Arrondissement, Lyon',NULL,'1926','\0',401,NULL),(452,'Sultan Qaboos Sports Complex',391,NULL,'OM',39000,0,'Al-Ghubbrah Street, Boshar\nMasqa? (Muscat)',NULL,'1985','\0',402,NULL),(453,'Prince Abdullah Al Faisal Stadium',406,NULL,'SA',27000,0,NULL,NULL,'1970','\0',403,NULL),(454,'Trittau-Arena',317,NULL,'DE',2500,0,'Im Raum 25a\n22946 Trittau',NULL,NULL,'\0',404,'SH'),(455,'Sportplatz Zollenspieker',449,40,'DE',2000,0,NULL,NULL,NULL,'\0',405,'HH'),(456,'Estádio José de Alvalade XXI',395,NULL,'PT',50466,49076,'Rua Professor Fernando da Fonseca\n1500-801 Lisboa',NULL,'2003','\0',406,NULL),(457,'Stade Olympique d\'El Menzah',425,NULL,'TN',45000,0,'Place Bab Souika, El Menzah\n1006 Tunis',NULL,'1967','\0',407,NULL),(458,'Rhein-Neckar-Arena',303,NULL,'DE',30150,0,'Dietmar-Hopp-Straße 1\n74889 Sinsheim',NULL,'2009','\0',408,'BW'),(459,'Waldsportpark',212,NULL,'DE',4000,0,'Andreas-Paul-Weber-Straße\n23879 Mölln',NULL,NULL,'\0',409,'SH'),(460,'Wagner & Partners Stadion',384,NULL,'NL',12500,0,'Milaanstraat\n6135 LH Sittard',NULL,'2008','\0',410,NULL),(461,'Schönebürgstadion',88,NULL,'DE',5000,0,'Schönebürgstr.\n74564 Crailsheim',NULL,'1976','\0',411,'BW'),(462,'Porschestadion ',333,NULL,'DE',6000,0,NULL,NULL,NULL,'\0',412,'NI'),(463,'Sportplatz Niendorfer Weg',324,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',413,'NI'),(464,'bluechip-Arena Glaserkuppe',211,NULL,'DE',5260,0,'Ernst-Grube-Straße\n04610 Meuselwitz',NULL,'1952','\0',415,'TH'),(465,'Stadion FK Baník Sokolov',421,NULL,'CZ',5000,0,'Stadion FK Baník Sokolov',NULL,NULL,'\0',416,NULL),(466,'VfB-Stadion',28,NULL,'DE',4100,0,'Ziegeleiweg 20\n08209 Auerbach/Vogtland',NULL,NULL,'\0',417,'SN'),(467,'DETAG-Stadion',327,NULL,'DE',2500,0,'Bahnhofstraße 70\nD-92533 Wernberg-Köblitz',NULL,'1963','\0',418,'BY'),(468,'Stadion an der Ketscher Landstraße',298,NULL,'DE',10000,0,'Ketscher Landstraße\n68723 Schwetzingen',NULL,NULL,'\0',419,'BW'),(469,'Frankfurter Volksbank Stadion (Nebenplatz, Rasen)',116,NULL,'DE',1500,0,'Am Erlenbruch 1\n60386 Frankfurt/Main-Bornheim',NULL,NULL,'\0',420,'HE'),(470,'Sportplatz Eichelhäherkamp',449,42,'DE',1000,0,NULL,NULL,NULL,'\0',421,'HH'),(471,'Wormatia-Stadion',336,NULL,'DE',7203,0,'Alzeyer Straße 131\n67549 Worms',NULL,'1928','\0',422,'RP'),(472,'Sportplatz Barmwisch',449,17,'DE',1000,0,'Barmwisch 22\n22179 Hamburg',NULL,NULL,'\0',423,'HH'),(473,'Sportanlage Katendeich',449,10,'DE',1000,0,NULL,NULL,NULL,'\0',424,'HH'),(474,'Sportplatz Quellental',449,53,'DE',4000,0,'Quellental 27\n22609 Hamburg',NULL,NULL,'\0',425,'HH'),(475,'Stade Jacques Chaban-Delmas',346,NULL,'FR',34263,0,'Place Johnston\nBordeaux',NULL,'1924','\0',426,NULL),(476,'Sportplatz Lichtenauer Weg',449,24,'DE',3500,0,'Ehestorfer Weg 79\n21075 Hamburg-Eißendorf',NULL,NULL,'\0',427,'HH'),(477,'Sportpark Britz-Süd',42,NULL,'DE',12000,0,'Buckower Damm 13\n12359 Berlin-Neukölln',NULL,NULL,'\0',428,'BE'),(478,'Stadio Olimpico di Torino',365,NULL,'IT',27994,0,'Corso Sebastopoli 123, Santa Rita\n10137 Torino',NULL,'1933','\0',429,NULL),(479,'St. Jakob-Park',408,NULL,'CH',38512,0,'Birsstrasse 320a\n40562 Basel',NULL,'2001','\0',430,NULL),(480,'Sportanlage Öjendorfer Weg (Kunstrasen)',449,13,'DE',1000,0,'Öjendorfer Weg 78\n22119 Hamburg-Billstedt',NULL,NULL,'\0',431,'HH'),(481,'Sportplatz Snitgerreihe',449,37,'DE',1000,0,NULL,NULL,NULL,'\0',432,'HH'),(482,'Sportanlage Gropiusring (Kunstrasen)',449,60,'DE',1000,0,'Gropiusring 43\n22309 Hamburg-Bramfeld',NULL,NULL,'\0',433,'HH'),(483,'Paul-Luckow-Stadion (Grandplatz)',274,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',434,'SH'),(484,'Rosenstadion (Grandplatz)',318,NULL,'DE',1000,0,'Alsenstraße\n25436 Uetersen',NULL,NULL,'\0',435,'SH'),(485,'Trainingsgelände Säbener Straße (Rasenplatz 6)',220,NULL,'DE',2000,0,'Säbener Straße 51\n81547 München-Giesing',NULL,NULL,'\0',436,'BY'),(486,'Gottfried-Tönsfeldt-Sportplatz',449,56,'DE',1000,6000,'Tönsfeldtstraße\n22763 Hamburg ',NULL,NULL,'\0',437,'HH'),(487,'Stadion Vogelgesang',271,NULL,'DE',5000,0,'Birkenweg 45\n14712 Rathenow',NULL,NULL,'\0',438,'BB'),(488,'Fichtestadion',266,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',439,'SH'),(489,'Sportanlage Müden',217,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',440,'NI'),(490,'Stadion Hasenburg',202,NULL,'DE',3000,0,'Häcklinger Weg 49\n21335 Lüneburg',NULL,NULL,'\0',441,'NI'),(491,'Sportplatz Dorfstraße',300,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',442,'SH'),(492,'Kurwaldstadion',36,NULL,'DE',3000,0,'Schwimmbadstraße\n33175 Bad Lippspringe',NULL,NULL,'\0',443,'NW'),(493,'Marienstadion',140,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',444,'NW'),(494,'Sportzentrum Bönningstedt (Nebenplatz, Rasen)',55,NULL,'DE',2000,0,'Ellerbeker Straße 25\n25474 Bönningstedt',NULL,NULL,'\0',445,'SH'),(495,'Sportzentrum Ann Himmelsbarg',215,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',446,'SH'),(496,'Stadio Comunale di Arco di via Pomerio',360,NULL,'IT',5000,0,NULL,NULL,NULL,'\0',447,NULL),(497,'Sportzentrum Oldenfelde (Grandplatz)',449,85,'DE',1000,0,NULL,NULL,NULL,'\0',448,'HH'),(498,'stadtwerke arena',103,NULL,'DE',2500,0,'Bystedtredder 65\n23340 Eckernförde',NULL,NULL,'\0',449,'SH'),(499,'Stadion am Wiesenhang',52,NULL,'DE',3000,0,'Am Wiesenhang 15\n86399 Bobingen ',NULL,NULL,'\0',450,'BY'),(500,'impuls arena',29,NULL,'DE',30660,0,'Bürgermeister-Ulrich-Straße\n86199 Augsburg',NULL,'2009','\0',451,'BY'),(501,'Sportplatz Legienstraße (Grandplatz)',449,37,'DE',1000,0,'Legienstraße 233\n22119 Hamburg',NULL,NULL,'\0',452,'HH'),(502,'Steponas Dariaus ir Stasys Gireno stadionas',375,NULL,'LT',9180,0,NULL,NULL,'1925','\0',453,NULL),(503,'Sportplatz Scharbeutzer Straße',449,59,'DE',2000,0,NULL,NULL,NULL,'\0',454,'HH'),(504,'Stadionul Dr. Constantin Radulescu',402,NULL,'RO',23200,0,'Strada Romulus Vuia, nr. 23\nCluj-Napoca',NULL,'1973','\0',455,NULL),(505,'Tin Shui Wai Sports Ground',1080,NULL,'HK',2500,0,NULL,NULL,NULL,'\0',456,NULL),(506,'Tianhe Stadium',12,NULL,'CN',60151,0,NULL,NULL,'1987','\0',457,NULL),(507,'Khalifa International Stadium',371,NULL,'QA',50000,0,'Sports City Street, Ar-Rayyan\nDoha',NULL,'1976','\0',459,NULL),(508,'Al-Khor Stadium',370,NULL,'QA',16000,0,NULL,NULL,'1986','\0',460,NULL),(509,'Sportplatz Langenfort (1)',449,83,'DE',1000,0,NULL,NULL,NULL,'\0',461,'HH'),(510,'Sportplatz am Tannenberg',135,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',462,'MV'),(511,'Sportplatz Rahewinkel',449,13,'DE',1000,0,NULL,NULL,NULL,'\0',463,'HH'),(512,'Volksparkstadion',233,NULL,'DE',5000,0,'Alt Ruppiner Allee 56\n16816 Neuruppin',NULL,NULL,'\0',464,'BB'),(514,'SolarTechnics-Arena',194,NULL,'DE',7474,0,NULL,NULL,NULL,'\0',465,'NW'),(515,'BRITA-Arena',329,NULL,'DE',13144,0,'Berliner Straße 9\n65189 Wiesbaden',NULL,NULL,'\0',466,'HE'),(516,'Schul- und Sportzentrum (Kunstrasen)',218,NULL,'DE',2000,0,'Judengäßchen\n56218 Mülheim-Kärlich',NULL,NULL,'\0',467,'RP'),(517,'Stadion Oberwerth',177,NULL,'DE',9500,40000,'Jupp-Gauchel-Straße 10\n56075 Koblenz',NULL,'1935','\0',468,'RP'),(518,'Schul- und Sportzentrum ',218,NULL,'DE',5000,0,'Judengäßchen\n56218 Mülheim-Kärlich',NULL,NULL,'\0',469,'RP'),(519,'Hasetal-Stadion',153,NULL,'DE',7000,0,'m Mersch\n49770 Herzlake',NULL,NULL,'\0',470,'NI'),(520,'Bezirkssportanlage Riekbornweg ',449,66,'DE',2000,0,'Riekbornweg 5\n22457 Hamburg-Schnelsen',NULL,NULL,'\0',472,'HH'),(521,'Heidmark-Stadion',34,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',473,'NI'),(522,'Sportplatz Beckermannweg (Kunstrasen)',449,41,'DE',1000,0,NULL,NULL,NULL,'\0',474,'HH'),(523,'Ernst-Abbe-Sportfeld',162,NULL,'DE',12990,27500,'Oberaue 3\n07745 Jena',NULL,'1924','\0',475,'TH'),(524,'Sportplatz Küperkoppel',449,70,'DE',1000,0,NULL,NULL,NULL,'\0',476,'HH'),(525,'Sportplatz Othmarscher Kirchenweg',449,57,'DE',1000,0,NULL,NULL,NULL,'\0',477,'HH'),(526,'Otto-Kesslau-Sportplatz',449,33,'DE',2000,0,NULL,NULL,NULL,'\0',478,'HH'),(527,'Sportplatz Grützmühlenweg',449,38,'DE',2000,0,NULL,NULL,NULL,'\0',479,'HH'),(528,'Willy-Widhopf-Stadion',101,NULL,'DE',7000,0,'Dietersheimer Straße 8\n85386 Eching',NULL,NULL,'\0',480,'BY'),(529,'Ljudski vrt',412,NULL,'SI',12881,0,'Mladinska ul. 29\nMaribor',NULL,'1962','\0',481,NULL),(530,'Am Sportplatz',165,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',482,'SH'),(531,'Stadio Pierluigi Penzo',367,NULL,'IT',7450,26000,'Isola di Sant\'Elena\n30132 Venezia',NULL,'1913','\0',483,NULL),(532,'Paul-Janes-Stadion',98,NULL,'DE',7150,0,'Flinger Broich 87\n40235 Düsseldorf-Flingern',NULL,'1930','\0',484,'NW'),(533,'Nordfrieslandstadion ',190,NULL,'DE',10000,0,'Jacob-Johannsen-Weg\n25917 Leck',NULL,NULL,'\0',485,'SH'),(534,'Sportplatz Fährstraße',449,75,'DE',1000,0,NULL,NULL,NULL,'\0',486,'HH'),(535,'Stadio San Paolo',363,NULL,'IT',60240,0,'Pizzale Vincenzo Tecchio\nNapoli',NULL,'1948','\0',487,NULL),(536,'Auestadion',169,NULL,'DE',17993,0,'Damaschkestraße\nDamaschkestraße Kassel',NULL,'1953','\0',488,'HE'),(537,'Riemer-Volkswagen-Arena',68,NULL,'DE',1500,0,'Am Uhlenbusch\n23881 Breitenfelde',NULL,NULL,'\0',489,'SH'),(538,'Sportanlage Schützenallee',296,NULL,'DE',3000,0,'Schützenallee\n21493 Schwarzenbek',NULL,NULL,'\0',490,'SH'),(539,'Sportplatz in der Ortsmitte',130,NULL,'DE',1500,0,'Rheinstraße 66\n65462 Ginsheim',NULL,NULL,'\0',491,'HE'),(540,'Coface Arena',205,NULL,'DE',34034,0,'Eugen-Salomon-Straße 1\n55128 Mainz',NULL,'2011','\0',492,'RP'),(541,'Sport- & Gemeindezentrum Tremsbüttel',316,NULL,'DE',1000,0,'Hauptstraße 66\n22967 Tremsbüttel',NULL,NULL,'\0',493,'SH'),(542,'Jawaharlal Nehru Stadium',352,NULL,'IN',60000,0,'Jawaharlal Nehru Stadium Marg, Lodi Estate\nDelhi',NULL,'1983','\0',494,NULL),(543,'Energieteam Arena',255,NULL,'DE',15306,0,'Paderborner Straße 89\n33104 Paderborn',NULL,'2008','\0',495,'NW'),(544,'Sportplatz Bekkamp (Kunstrasen)',449,39,'DE',1000,0,NULL,NULL,NULL,'\0',496,'HH'),(545,'Sportplatz Wilhelmshöh',449,8,'DE',1500,0,'Notkestraße 89\n21073 Hambur',NULL,NULL,'\0',497,'HH'),(546,'Jugendfußballzentrum Kurtekotten (Kunstrasen)',178,NULL,'DE',1000,0,'Otto-Bayer-Straße 2\n51061 Köln-Kurtekotten',NULL,NULL,'\0',498,'NW'),(547,'Sportplatz Tannenbergstraße',192,NULL,'DE',3500,0,'Tannenbergstraße 54\n51374 Leverkusen',NULL,NULL,'\0',499,'NW'),(548,'Sportplatz Am Pfeilshof',449,74,'DE',1000,0,NULL,NULL,NULL,'\0',500,'HH'),(549,'Wolfgang-Meyer-Sportanlage (Grandplatz)',449,69,'DE',1000,0,NULL,NULL,NULL,'\0',501,'HH'),(550,'Stade Velodrome',348,NULL,'FR',67394,60031,'3, boulevard Michelet\nMarseille',NULL,'1937','\0',502,NULL),(551,'Sportplatz Schulstraße',234,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',503,'HE'),(552,'Sportplatz Burenweg',32,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',504,'NI'),(553,'Stadion an der Landesgrenze (Grandplatz)',449,75,'DE',1000,0,'Georg-Wilhelm-Straße 6\n21107 Hamburg-Wilhelmsburg',NULL,NULL,'\0',505,'HH'),(554,'Sportplatz Schulzentrum Neumoorstück',449,49,'DE',2500,0,'Quellmoor\n21147 Hamburg-Neugraben',NULL,NULL,'\0',506,'HH'),(555,'Blohm-Bau Arena',249,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',507,'SH'),(556,'Sportplatz Leistikowstraße',113,NULL,'DE',1500,0,'Leistikowstraße 74\n14612 Falkensee',NULL,NULL,'\0',508,'BB'),(557,'Stadion an der Lindenstraße',160,NULL,'DE',5000,0,'Leuchtenbergstraße 25\n85737 Ismaning',NULL,NULL,'\0',509,'BY'),(558,'Sportpark Aschheim',26,NULL,'DE',3000,0,'Am Sportpark 4\n85609 Aschheim',NULL,NULL,'\0',510,'BY'),(559,'Hein-Klink-Stadion',449,13,'DE',6000,0,'Möllner Landstraße 197\n22117 Hamburg-Öjendorf',NULL,NULL,'\0',511,'HH'),(560,'Waldstadion Bokel',59,NULL,'DE',1500,0,NULL,NULL,NULL,'\0',512,'SH'),(561,'Sportanlage Steinwiesenweg (Grandplatz)',449,21,'DE',1500,0,NULL,NULL,NULL,'\0',513,'HH'),(562,'Workers Stadium',8,NULL,'CN',64000,0,'Gongti Beilu, Chaoyang District\nBeijing',NULL,NULL,'\0',514,NULL),(563,'Beijing Fengtai Stadium',8,NULL,'CN',31043,0,NULL,NULL,NULL,'\0',515,NULL),(564,'26 Degree Sports Centre (Platz 4)',8,NULL,'CN',500,0,NULL,NULL,NULL,'\0',516,NULL),(565,'26 Degree Sports Centre (Platz 1)',8,NULL,'CN',1500,0,NULL,NULL,NULL,'\0',517,NULL),(566,'Sportplatz Rahmwerder Straße',449,75,'DE',1500,0,NULL,NULL,NULL,'\0',518,'HH'),(567,'Sportplatz Grunewaldstraße 61',449,59,'DE',1000,0,NULL,NULL,NULL,'\0',519,'HH'),(568,'Sportplatz Iserbarg',449,62,'DE',2000,0,NULL,NULL,NULL,'\0',520,'HH'),(569,'Sportzentrum Kleeblatt',122,NULL,'DE',1000,0,'Kronacher Straße 154\n90765 Fürth/Mittelfranken',NULL,NULL,'\0',521,'BY'),(570,'Trolli Arena',122,NULL,'DE',18000,30000,'Laubenweg 60\n90765 Fürth/Mittelfranken',NULL,'1910','\0',522,'BY'),(571,'Gemeindesportplatz Rellingen',276,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',523,'SH'),(572,'Am Sportplatz',325,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',524,'SH'),(573,'Waldstadion an der Schule',176,NULL,'DE',2000,0,'Schulstraße\n25336 Klein Nordende',NULL,NULL,'\0',525,'SH'),(574,'Alleestadion',163,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',526,'SH'),(575,'Stadyjon Dynama',435,NULL,'BY',41024,0,NULL,NULL,'1934','',527,NULL),(576,'Sportplatz Kroonhorst',449,45,'DE',1500,0,NULL,NULL,NULL,'\0',529,'HH'),(577,'Sportanlage Eichenallee',170,NULL,'DE',2200,0,'Quarnstedter Str. 13\n25548 Kellinghusen',NULL,NULL,'\0',530,'SH'),(578,'Sportplatz An der Bahn',252,NULL,'DE',4000,0,'An der Bahn 25\n37520 Osterode am Harz',NULL,NULL,'\0',531,'NI'),(579,'Oskar-Masler-Platz',149,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',532,'SH'),(580,'Stadion im Sportpark',319,NULL,'DE',15053,0,'Am Sportpark 1\n82008 Unterhaching',NULL,'1922','\0',533,'BY'),(581,'Sportplatz Langenharmer Weg',235,NULL,'DE',1500,0,NULL,NULL,NULL,'\0',534,'SH'),(582,'Volksstadion',280,NULL,'DE',5000,0,'Kopernikusstraße\n18057 Rostock',NULL,'1928','\0',535,'MV'),(583,'Trainingsgelände Säbener Straße (Kunstrasenplatz 6)',220,NULL,'DE',1000,0,'Säbener Straße 51\n81547 München-Giesing',NULL,NULL,'\0',536,'BY'),(584,'Sportplatz Schule Neuland',449,50,'DE',1000,0,NULL,NULL,NULL,'\0',538,'HH'),(585,'Edmund-Plambeck-Stadion (Kunstrasenplatz 2)',235,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',539,'SH'),(586,'Stadion an der Gellertstraße',56,NULL,'DE',18712,0,'Gellertstraße\n09130 Chemnitz',NULL,NULL,'\0',540,'SN'),(587,'Sportplatz Gartenweg',257,NULL,'DE',1300,0,'Gartenweg 28a\n19075 Pampow',NULL,NULL,'\0',541,'MV'),(588,'Hans-Bayer-Stadion (Kunstrasen)',320,NULL,'DE',1500,0,'Stadionstr. 1\n85716 Unterschleißheim',NULL,NULL,'\0',542,'BY'),(589,'AUDI Sportpark',159,NULL,'DE',15729,0,'Am Sportpark 1\n85053 Ingolstadt',NULL,'2010','\0',543,'BY'),(590,'Stadion im Vorwerk',208,NULL,'DE',4000,0,'Vorwerkstraße 20\n85077 Manching',NULL,NULL,'\0',544,'BY'),(591,'Sportplatz Koppeldamm',105,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',545,'SH'),(592,'Sportplatz Moorburger Elbdeich',449,46,'DE',1000,0,NULL,NULL,NULL,'\0',546,'HH'),(593,'Frankfurter Volksbank Stadion',116,NULL,'DE',12542,0,'Am Erlenbruch 1\n60386 Frankfurt/Main-Bornheim',NULL,NULL,'\0',547,'HE'),(594,'Sportplatz am Hagen',20,NULL,'DE',1500,0,'Hagener Allee 121\n22926 Ahrensburg',NULL,NULL,'\0',548,'SH'),(595,'Sportplatz Hermann-Schulz-Straße',287,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',549,'NI'),(596,'Sportanlage Rüstersiel',330,NULL,'DE',2000,0,'Rüstersieler Straße 39\n26386 Wilhelmshaven',NULL,NULL,'\0',550,'NI'),(597,'ESV-Sportplatz',138,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',551,'MV'),(598,'Waldstadion',134,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',552,'SH'),(599,'Lohrheidestadion',53,NULL,'DE',16233,0,'Lohrheidestraße 82\n44866 Bochum-Wattenscheid',NULL,NULL,'\0',553,'NW'),(600,'Sportplatz Brunebecker Straße',1081,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',554,'NW'),(601,'Sportplatz Hedendorf',81,NULL,'DE',1500,0,'Feldstr. 50\n21614 Buxtehude',NULL,NULL,'\0',555,'NI'),(602,'ETO Park',427,NULL,'HU',16000,0,'Nagysándor József utca 31.\n9027 Gy?r',NULL,'2008','\0',557,NULL),(603,'Eden Arena',417,NULL,'CZ',21000,0,'Vladivostocká 1460/10\n100 05 Praha',NULL,'2008','\0',558,NULL),(604,'Sportplatz am Stubbenberg',111,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',559,'SH'),(605,'Jahnstadion',65,NULL,'DE',5000,0,'Scheveweg\n46236 Bottrop',NULL,NULL,'\0',560,'NW'),(606,'Sportplatz Bokhorst',291,NULL,'DE',1000,0,'Am Sportplatz 7\n24637 Schillsdorf-Bokhorst',NULL,NULL,'\0',562,'SH'),(607,'Stipper-Barthel-Platz',259,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',563,'SH'),(608,'Sportanlage Allermöhe (Kunstrasen)',449,10,'DE',1500,0,NULL,NULL,NULL,'\0',564,'HH'),(609,'Südstadion im Jean-Löring-Sportpark',178,NULL,'DE',14944,0,'Vorgebirgsglacisweg 2\n50969 Köln-Zollstock',NULL,'1979','\0',565,'NW'),(610,'Waldstadion',235,NULL,'DE',3000,0,NULL,NULL,NULL,'\0',566,'SH'),(611,'Emil-Nüssler-Stadion',220,NULL,'DE',5000,0,'Tübinger Str. 10\n80686 München,',NULL,'1957','\0',567,'BY'),(612,'Futbalovy Areal Bedrichowska',417,NULL,'CZ',3000,0,NULL,NULL,NULL,'\0',568,NULL),(613,'Stadion Oktyabr',399,NULL,'RU',3060,0,'ul. Zhvopisnaya 21, Shchukino\nMoskva',NULL,NULL,'\0',569,NULL),(614,'Arena Chimki',398,NULL,'RU',18636,0,'ul. Kirova, dom 24\n141400 Chimki',NULL,'2008','\0',570,NULL),(615,'Sportplatz Ladenbeker Furtweg',449,10,'DE',1000,0,NULL,NULL,NULL,'\0',571,'HH'),(616,'Grand Stade de Marrakech',378,NULL,'MA',41356,0,'Km 11, Route Nationale 9\nMarrakech',NULL,'2011','\0',572,NULL),(617,'Al Kuwait Sports Club Stadium',372,NULL,'KW',18500,0,'Alexandria Street\nMad?nat al-Kuwayt (Kuwait City)',NULL,NULL,'\0',573,NULL),(618,'Schulsportgelände am Ziegenweg',267,NULL,'DE',1200,0,'Ziegenweg\nQuickborn',NULL,NULL,'\0',574,'SH'),(619,'Kilia-Platz (Nebenplatz Rasen)',171,NULL,'DE',1000,0,'Hasseldieksdammer Weg 166\n24114 Kiel',NULL,NULL,'\0',575,'SH'),(620,'Eintracht-Stadion B-Platz (Rheingoldarena)',66,NULL,'DE',2000,0,'Hamburger Straße 210\n38112 Braunschweig',NULL,NULL,'\0',577,'NI'),(621,'Sportplatz Kasernenbrink',195,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',576,'SH'),(622,'Sportplatz Schulstraße',292,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',578,'SH'),(623,'Sportplatz Kirchstraße (Nebenplatz Rasen 2)',301,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',579,'SH'),(624,'Sportgelände Strietkamp',175,NULL,'DE',1000,0,'Strietkamp 15\n24629 Kisdorf',NULL,NULL,'\0',580,'SH'),(625,'Sportanlage Langenau',1082,NULL,'DE',2500,0,'Langenaustraße 17\n91058 Erlangen-Eltersdorf',NULL,NULL,'\0',581,'BY'),(626,'Jugendsportanlage Gröbenrieder Straße',1083,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',582,'BY'),(627,'Stadio Marc Antonio Bentegodi',1084,NULL,'IT',44799,0,'Piazzale Olimpia\n37138 Verona',NULL,'1963','\0',583,NULL),(628,'S-Arena',1085,NULL,'DE',5001,0,'Osterfeld 10\n38640 Goslar',NULL,NULL,'\0',585,'NI'),(629,'Stadion auf dem Wurfplatz',42,NULL,'DE',5400,0,NULL,NULL,'2004','\0',586,'BE'),(630,'Sportplatz Poppenbüttler Straße (Grandplatz)',235,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',584,'SH'),(631,'Poststadion',42,NULL,'DE',10000,55000,'Lehrter Straße 59\n10557 Berlin',NULL,'1929','\0',587,'BE'),(632,'Sportplatz Rüschpark',449,27,'DE',1000,0,NULL,NULL,NULL,'\0',588,'HH'),(633,'Heinrich-Langeloh-Platz (Bardowick Stadion)',1086,NULL,'DE',3000,0,'Brietlinger Weg 1\n21357 Bardowick',NULL,NULL,'\0',589,'NI'),(634,'Stadion Miejski imienia Floriana Krygiera',1087,NULL,'PL',17783,0,'ul. Kar?owicza 28\n71-102 Szczecin',NULL,'1925','\0',590,NULL),(635,'Sportplatz Schackendorfer Weg',1088,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',592,'SH'),(636,'Arena Bodenseestraße',1089,NULL,'DE',11150,0,'Bodenseestraße 44\n87700 Memmingen/Allgäu',NULL,NULL,'\0',593,'BY'),(637,'Blue Water Arena',1051,NULL,'DK',15790,0,'Gl. Vardevej 88\n6700 Esbjerg',NULL,'1955','\0',594,NULL),(638,'Schloßparkstadion',1090,NULL,'DE',0,0,NULL,NULL,NULL,'\0',595,'SH'),(639,'Manfred-Werner-Stadion',114,NULL,'DE',4000,0,'Bredstedter Straße 2\n24941 Flensburg',NULL,NULL,'\0',596,'SH'),(640,'Sportplatz Schulstraße',1091,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',597,'SH'),(641,'Sportplatz Westerheese',124,NULL,'DE',2000,0,NULL,NULL,NULL,'\0',598,'SH'),(642,'Stadion Essen',1093,NULL,'DE',20650,0,'Hafenstraße 97a\n45356 Essen/Ruhr-Bergeborbeck',NULL,'2012','\0',599,'NW'),(643,'Stadion am Auetal',1094,NULL,'DE',1500,0,'Büntweg 5\n21702 Ahlerstedt',NULL,NULL,'\0',600,'NI'),(644,'Stadion im Sportpark Heimstetten',1095,NULL,'DE',2800,0,'Am Sportpark 2\n85551 Heimstetten',NULL,NULL,'\0',601,'BY'),(645,'Sportplatz Am Ohlendiek',253,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',602,'SH'),(646,'Daugavas stadions',374,NULL,'LV',5083,0,NULL,NULL,'1958','\0',268,NULL),(647,'Trainingsplatz am Volkspakstadion (links)',449,8,'DE',500,0,'Sylvesterallee 7',NULL,NULL,'\0',635,'HH'),(648,'Sportzentrum Oststeinbek (Kunstrasen)',253,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',556,'SH'),(649,'Sportanlage Heiligengeistfeld (Kunstrasenplatz links)',449,68,'DE',500,0,'Der folgende Platz STERNSCHANZE ist Nr. 278',NULL,NULL,'\0',277,'HH'),(650,'Jahnstadion (Nebenplatz, Kunstrasen)',81,NULL,'DE',1000,0,'An der Rennbahn 1\n21614 Buxtehude',NULL,NULL,'\0',636,'NI'),(651,'Stadion Hitrec Kacian',1119,NULL,'HR',5000,0,'Maksimirska cesta\n10000 Zagreb',NULL,NULL,'\0',637,NULL),(652,'Stadion Maksimir',1119,NULL,'HR',37168,0,'Maksimirska cesta 128\n10 000 Zagreb',NULL,'1912','\0',638,NULL),(653,'Trainingszentrum FC St. Pauli (Kunstrasen)',449,52,'DE',500,0,'Langenhorst 6\n22453 Hamburg',NULL,NULL,'\0',639,'HH'),(654,'Stadion an der Dieselstraße',449,83,'DE',2000,147,'Dieselstraße 6\n22307 Hamburg','Kosten: Knapp 4 Millionen €<br>','2016','\0',640,'HH'),(655,'Waldstadion (Grandplatz)',235,NULL,'DE',1000,0,NULL,NULL,NULL,'\0',414,'SH'),(656,'Bezirkssportanlage Agnes-Bernauer-Straße (Kunstrasen)',220,NULL,'DE',1000,0,'Agnes-Bernauer-Str. 239\n81241 München',NULL,NULL,'\0',641,'BY'),(657,'AOK Stadion',333,NULL,'DE',5200,0,'In den Allerwiesen 1\n38446 Wolfsburg ',NULL,'2015','\0',642,'NI'),(658,'Stadion im Sportpark Höhenberg',178,NULL,'DE',6271,0,'Merheimer Heide\n51103 Köln-Höhenberg',NULL,'1931','\0',643,'NW'),(659,'Sportplatz Am Berner Heerweg 187 B',449,85,'DE',2000,0,NULL,NULL,NULL,'\0',0,'HH'),(660,'Sportpark Nord',61,NULL,'DE',0,0,NULL,NULL,NULL,'\0',0,'NW'),(661,'Sportplatz Reher',1200,NULL,'DE',500,0,'Am Sportplatz\n25593 Reher',NULL,NULL,'\0',644,'SH'),(662,'Kay Weber Platz am Bullenredder',24,NULL,'DE',1500,0,'Bullenredder 9\n22949 Ammersbek-Hoisbüttel',NULL,NULL,'\0',645,'SH'),(663,'Georgi-Asparuchow-Stadion',1162,NULL,'BG',29200,0,NULL,NULL,NULL,'\0',648,NULL),(664,'Test',1146,NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0',NULL,'NI');
/*!40000 ALTER TABLE `stadionliste` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadionliste_bk`
--

DROP TABLE IF EXISTS `stadionliste_bk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadionliste_bk` (
  `stadion_id` int(11) NOT NULL AUTO_INCREMENT,
  `nr` int(11) NOT NULL,
  `stadionname` varchar(200) NOT NULL,
  `ort` varchar(64) NOT NULL,
  `stadtteil` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `land` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `kapazitaet` int(11) DEFAULT NULL,
  `zusch_rek` int(11) DEFAULT NULL,
  `anschrift` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `historie` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `er_jahr` char(4) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `abriss` bit(1) DEFAULT b'0',
  PRIMARY KEY (`stadion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=795 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadionliste_bk`
--

LOCK TABLES `stadionliste_bk` WRITE;
/*!40000 ALTER TABLE `stadionliste_bk` DISABLE KEYS */;
INSERT INTO `stadionliste_bk` VALUES (1,1,'Haras-El-Hedood Stadium','1',NULL,'EG',NULL,NULL,NULL,NULL,NULL,'\0'),(2,2,'Kairo International Stadium','2',NULL,'EG',NULL,NULL,NULL,NULL,NULL,'\0'),(3,3,'Cairo Military Academy Stadium','2',NULL,'EG',28500,0,NULL,'Das Cairo Military Academy Stadium (arabisch:     Istd al-Kullyah al-arbyah bil-Qhira) ist ein Multifunktions-Stadion in Kairo. Es wurde für die Sportmannschaften und Sportler der Militärakademie gebaut und 1989 eröffnet. Es hat eine Kapazität von 28.500 Zuschauerplätzen und Plänen zufolge soll es auf 65.000 Plätze erweitert werden. Außer einem kleinen Dach auf der Haupttribüne ist das Stadion unüberdacht. Die Arena besitzt auch eine Leichtathletikanlage.\n\nNeben dem Cairo International Stadium tragen hier die zwei Fußballvereine Al-Ahly Kairo und Az-Zamalik ihre Heimspiele aus. Das Stadion war einer von sechs Spielorten der Fußball-Afrikameisterschaft 2006.','1989','\0'),(4,1,'Allianz Stadium','4',NULL,'AU',45500,43967,NULL,'Das Allianz Stadium ist ein Rugby- und Fußballstadion in Sydney, Australien. Das damalige Sydney Football Stadium wurde im Jahr 1988 an der Stelle des früheren Sydney Sports Ground als erstes rechteckiges Stadion? in Sydney errichtet. Anfangs wurde es hauptsächlich als Austragungsort für Rugby League-Spiele genutzt, heute wird dort aber auch Rugby Union und Fußball gespielt.\n\nEs wurde als Ergänzung zu dem in unmittelbarer Nähe befindlichen Sydney Cricket Ground errichtet, da sich das dortige ovale Spielfeld weniger gut für Sportarten wie Fußball oder Rugby eignet.\n\nDas Sydney Football Stadium ist Heimstadion folgender Mannschaften:\n\n    Sydney Roosters (National Rugby League, Rugby League)\n    New South Wales Waratahs (Super 14, Rugby Union)\n    Sydney FC (A-League, Fußball)\n    Wests Tigers (National Rugby League, Rugby League)\n\nBei seiner Eröffnung hatte das Stadion 41.159 Sitzplätze, heute liegt die Kapazität bei 45.500 Plätzen. Der Zuschauerrekord liegt bei 43.967, erzielt 1993 beim Qualifikationsspiel für die Fußball-Weltmeisterschaft 1994 zwischen Australien und Argentinien.\n\n2002 wurde ein Sponsoringvertrag mit Aussie Home Loans abgeschlossen und das Stadion von Sydney Football Stadium in Aussie Stadium umbenannt. Nach dem Auslaufen des Vertrages im Jahr 2007 hieß das Stadion wieder Sydney Football Stadium. Ende Februar 2012 erhielt das Stadion durch die Allianz Group einen neuen Namen und trägt seitdem die Bezeichnung Allianz Stadium.','1988','\0'),(5,2,'Jan-Breydel-Stadion','5',NULL,'BE',0,0,NULL,NULL,NULL,'\0'),(6,1,'Stade Constant Vanden Stock Anderlecht','6',NULL,'BE',NULL,NULL,NULL,NULL,NULL,'\0'),(7,1,'Olimpijski-Stadion Kosevo','7',NULL,'BA',0,0,NULL,NULL,NULL,'\0'),(8,3,'Arbeiterstadion Gong Ti','8',NULL,'CN',0,0,NULL,NULL,NULL,'\0'),(9,2,'26 Dregree Sport Centre - Platz 1','8',NULL,'CN',NULL,NULL,NULL,NULL,NULL,'\0'),(10,1,'26 Dregree Sport Centre - Platz 4','8',NULL,'CN',1,0,NULL,NULL,NULL,'\0'),(11,4,'Fengtai-Stadion','8',NULL,'CN',0,0,NULL,NULL,NULL,'\0'),(12,5,'Tianhe Stadium','12',NULL,'CN',NULL,NULL,NULL,NULL,NULL,'\0'),(13,1,'Aarhus Idraetspark','13',NULL,'DK',NULL,NULL,NULL,NULL,NULL,'\0'),(14,2,'Böndby-Stadion','14',NULL,'DK',NULL,NULL,NULL,NULL,NULL,'\0'),(15,3,'Forum Horsens Stadion','15',NULL,'DK',0,0,NULL,NULL,NULL,'\0'),(16,5,'Köge Stadion','16',NULL,'DK',NULL,NULL,NULL,NULL,NULL,'\0'),(17,4,'Hvidovre Stadion','17',NULL,'DK',1,0,NULL,NULL,NULL,'\0'),(18,1,'Tivoli','18',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(19,2,'Wersestadion','19',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(20,3,'Sportanlage am Hagen (Kunstrasen)','20',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(21,4,'Stormarnplatz','20',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(22,5,'Hindenburgstadion','22',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(23,6,'Stadion am Gemeindezentrum','23',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(24,7,'Sportzentrum Bültenbarg (Hoisbütteler Sportverein v. 1955 e. V.)','24',NULL,'DE',1000,1,NULL,NULL,NULL,'\0'),(25,8,'Sportzentrum Almtweg','25',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(26,9,'Sportpark Aschheim','26',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(27,10,'Erzgebirgsstadion','27',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(28,11,'VfB-Stadion','28',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(29,13,'Impuls-Arena','29',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(30,12,'Rosenaustadion','29',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(31,14,'Fritz-Bortz-Sportplatz','31',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(32,16,'Sportplatz Burenweg','32',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(33,15,'Stadion am Ellernfeld','32',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(34,17,'Heidmark-Stadion','34',NULL,'DE',0,0,'Idinger Heide 26\n29683 Bad Fallingbostel - Fallingbostel',NULL,NULL,'\0'),(35,18,'Friedrich-Möbus-Stadion','35',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(36,19,'Kurwaldstadion','36',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(37,20,'Travestadion','37',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(38,21,'Sportzentrum am Volkspark','38',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(39,22,'Sportplatz Soltausredder','39',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(40,23,'Sportplatz Soltausredder (Kunstrasen)','39',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(41,24,'Am Sportplatz (Willinghusener SC)','41',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(42,30,'Friedrich-Ludwig-Jahn-Sportpark (Türkiyemspor Berlin)','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(43,26,'Hans-Zoschke-Stadion','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(44,31,'Mommsenstadion','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(45,27,'Olympiastadion Berlinn','42',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(46,32,'Preußenstadion Malteserstraße','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(47,28,'Sportforum Hohenschönhausen','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(48,33,'Sportplatz Freiheitsweg','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(49,29,'Stadion an der Alten Försterei','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(50,25,'Stadion Britz-Süd','42',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(51,34,'Stadion Alm / Schüco-Arena','51',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(52,35,'Stadion am Wiesenhang','52',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(53,37,'Lohrheidestadion','53',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(54,36,'Ruhrstadion','53',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(55,43,'Sportzentrum Bönningstedt','55',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(56,42,'Sportzentrum Bönningstedt (Nebenplatz Rasen)','55',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(57,46,'Sportplatz Hamfeldredder','57',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(58,38,'Stadion der Fliesenwerker','58',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(59,39,'Waldstadion','59',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(60,40,'Sportplatz Schulweg (Vosslocher SV)','60',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(61,41,'Sportpark Nord','61',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(62,44,'Sportpark am Möhlenkamp','62',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(63,45,'Sportpark am Möhlenkamp (Nebenplatz Rasen)','62',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(64,47,'Gemeindesportplatz (TuS Borstel-Hohenraden)','64',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(65,48,'Jahnstadion','65',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(66,50,'Eintracht-Stadion an der Hamburger Straße (Erster Besuch: Stadion Hamburger Straße)','66',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(67,49,'Eintracht-Stadion an der Hamburger Straße - Nebenplatz 1','66',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(68,52,'Riemer-Volkswagen-Arena','68',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(69,51,'Schulsportplatz Im Grünen Weg (Nebenplatz Grand)','68',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(70,55,'Bezirkssportanlage Schevenmoor','70',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(71,53,'Sportplatz am Vinnenweg','70',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(72,56,'Sportplatz Erlenstraße','70',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(73,54,'Weserstadion','70',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(74,57,'Weserstadion - Platz 11','70',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(75,58,'Nordseestadion','75',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(76,59,'Städtisches Stadion Goethestraße','76',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(77,60,'Otto-Koch-Kampfbahn','77',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(78,62,'Eiderstadion','78',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(79,61,'Stadion im Heisterort','78',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(80,63,'Stadion Rosengrund','80',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(81,65,'Jahnstadion','81',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(82,64,'Sportplatz Feldstraße','81',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(83,66,'Städtisches Stadion','83',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(84,67,'Stadion an der Gellerstraße','84',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(85,68,'Stadion an der Friesoyther Straße','85',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(86,69,'Stadion an der Lipezker Straße','86',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(87,70,'Stadion der Freundschaft','86',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(88,71,'Schönebürgstadion','88',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(89,72,'CSV-Kampfbahn Herrmann-Allmers-Straße','89',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(90,73,'Sportplatz Bornweg','90',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(91,74,'Bayerstadion','91',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(92,75,'Stadion Rote Erde','92',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(93,76,'Westfalenstadion','92',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(94,77,'Kehdinger Stadion','94',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(95,80,'MSV-Arena','95',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(96,79,'PCC-Stadion','95',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(97,78,'Wedaustadion','95',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(98,82,'LTU-Arena','98',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(99,81,'Paul-Janes-Stadion','98',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(100,83,'Rheinstadion','98',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(101,84,'Willi-Wildhopf-Stadion','101',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(102,85,'Sportplatz Eckel','102',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(103,86,'Stadtwerke Arena','103',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(104,87,'Ernst-Wagener-Stadion','104',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(105,88,'Krückauparkstadion','105',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(106,90,'Sportplatz Koppeldamm','105',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(107,89,'Sportplatz Wilhelmstraße','105',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(108,91,'Dr. Helmut-Riedl-Stadion','108',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(109,92,'Steigerwaldstadion','109',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(110,93,'Heinrich-Graf-Sportanlage','110',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(111,94,'Sportplatz am Stubbenberg','111',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(112,95,'Stadion an der Peldemühle','112',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(113,96,'Sportplatz Leistikowstraße','113',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(114,97,'Stadion Mürwiker Straße','114',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(115,98,'Sportplatz am Weiher','115',NULL,'DE',0,1,NULL,NULL,NULL,'\0'),(116,99,'Commerzbank-Arena','116',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(117,101,'Waldstadion','116',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(118,100,'Frankfurter Volksbank Stadion','116',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(119,102,'Frankfurter Volksbank Stadion - Nebenplatz Rasen (FSV Frankfurt II)','116',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(120,103,'badenova-Stadion (erster Besuch: Dreisamstadion)','120',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(121,104,'Stadion Thülauer Straße','121',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(122,105,'Sportzentrum Kleeblatt','122',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(123,106,'Trolli Arena','122',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(124,107,'Sportplatz Neuer Krug (FC Geesthacht / Ausweich)','124',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(125,109,'Sportplatz Silberberg','124',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(126,108,'Stadion Berliner Straße (FSV Geesthacht 07)','124',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(127,110,'Stadion Berliner Straße Nebenplatz (Grand) (FSV Geesthacht 07 II)','124',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(128,112,'Parkstadion','128',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(129,111,'Veltins-Arena','128',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(130,113,'Sportplatz in der Ortsmitte','130',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(131,114,'Sportanlage Möllner Landstraße','131',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(132,116,'Jahnstadion','132',NULL,'DE',0,1,NULL,NULL,NULL,'\0'),(133,115,'Maschparkstadion','132',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(134,117,'Waldstadion','134',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(135,118,'Sportplatz am Tannenberg','135',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(136,119,'Sportplatz Am Torfmoor','136',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(137,120,'Heidewaldstadion','137',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(138,121,'ESV-Sportplatz','138',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(139,122,'Jakob-Thode-Platz','139',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(140,268,'Marienstadion','140',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(141,269,'AWD-Arena','141',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(142,272,'Beekestadion (SF Ricklingen)','141',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(143,270,'Eilenriedestadion','141',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(144,273,'Niedersachsenstadion','141',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(145,271,'Rudolf-Kalweit-Stadion','141',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(146,274,'Gerhardt-Buhr-Platz','146',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(147,275,'Waldstadion','147',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(148,276,'Stadion Meldorfer Straße','148',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(149,277,'Oskar-Masler-Platz (TuS Hemdingen-Bilsen)','149',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(150,278,'Sportplatz Alsterquelle (Schäferkampsweg)','150',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(151,279,'Friedrich-Jahn-Stadion - Kunstrasen','151',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(152,280,'Glückaufstadion Am Holzplatz','152',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(153,281,'Hasetalstadion','153',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(154,282,'Sportzentrum Waldstraße (Nebenplatz Grand)','154',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(155,283,'Sportzentrum Holm','155',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(156,284,'Waldstadion','156',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(157,285,'Stadion an der Jakob-Struve-Schule','157',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(158,286,'Friesenstadion','158',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(159,287,'Audi Sportpark','159',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(160,288,'Stadion an der Lindenstraße','160',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(161,289,'Lehmwohldstadion','161',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(162,290,'Ernst-Abbe-Sportfeld','162',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(163,291,'Alleestadion','163',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(164,292,'Moorstadion','164',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(165,293,'Am Sportplatz','165',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(166,294,'Fritz-Walter-Stadion','166',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(167,295,'Marschwegstadion','167',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(168,296,'Wildparkstadion','168',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(169,297,'Auestadion','169',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(170,298,'Sportplatz Quarnstedter Straße','170',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(171,299,'Bezirkssportanlage Projensdorf - Kunstrasen','171',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(172,301,'Holsteinstadion','171',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(173,300,'Kilia-Platz am Hasseldieksdammer Weg','171',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(174,302,'Kilia-Platz am Hasseldieksdammer Weg Nebenplatz (Grand)','171',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(175,303,'Sportanlage Strietkamp','175',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(176,304,'Waldstadion (SV Lieth)','176',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(177,305,'Stadion Oberwerth','177',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(178,306,'Jugendfußballzentrum Kurtekotten (Nebenplatz Kunstrasen)','178',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(179,308,'Müngersdorfer Stadion','178',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(180,307,'RheinEnergieStadion','178',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(181,309,'Südstadion','178',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(182,310,'Grotenburgstadion','182',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(183,311,'Stadion Kropp','183',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(184,312,'Sportplatz Bunter Weg','184',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(185,313,'Sportzentrum am Ossenpad','185',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(186,314,'Sportanlage am Freibad','186',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(187,315,'Walter-Bettges-Stadion','187',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(188,316,'Sportplatz Am Stadtweg','188',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(189,317,'Sportplatz Glüsinger Weg (FC Lauenburg e. V.)','189',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(190,318,'Nordfrieslandstadion','190',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(191,319,'Zentralstadion','191',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(192,321,'BayArena','192',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(193,320,'Sportplatz Tannenbergstraße','192',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(194,322,'Solartechnics-Arena','194',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(195,323,'Lohmühle','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(196,327,'Sportplatz Gebrüder-Grimm-Ring','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(197,324,'Sportplatz Guerickestraße','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(198,328,'Sportplatz Kasernenbrink (SC Rapid)','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(199,325,'Sportplatz Koggestraße (SC Bunte Kuh)','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(200,329,'Sportzentrum (TSV Schlutup) Palinger Weg','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(201,326,'Stadion Travenmünder Allee (1. FC Phönix)','195',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(202,331,'Eintracht-Stadion Hasenburg','202',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(203,330,'LSK-Stadion Wilschenbruch','202',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(204,332,'Heinrich-Germer-Stadion','204',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(205,333,'coface Arena','205',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(206,334,'Stadion am Bruchweg','205',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(207,336,'Rudolf Sievers Arena (gekreuzt als August-Erdmann-Platz)','207',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(208,335,'Stadion im Sportpark Manching','208',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(209,337,'Hermann-Hahn-Platz (SV Ilmenau)','209',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(210,338,'Emslandstadion','210',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(211,339,'bluechip-Arena','211',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(212,340,'Waldsportplatz','212',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(213,342,'Bökelbergstadion','213',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(214,341,'Stadion im Borussia-Park','213',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(215,344,'Sportzentrum An´n Himmelsbarg','215',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(216,343,'Sportzentrum An´n Himmelsbarg (Nebenplatz Rasen)','215',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(217,345,'Sportanlage Müden','217',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(218,346,'Sportplatz Am Schulzentrum im Judengäßchen','218',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(219,347,'Sportplatz Am Schulzentrum im Judengäßchen (Nebenplatz Kunstrasen)','218',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(220,349,'Städtisches Stadion an der Grünwalderstraße','220',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(221,354,'Allianz Arena','220','Fröttmaning','DE',71137,71137,'Werner-Heisenberg-Allee 25\n80939 München','9. Juni 2006, WM-Eröffnungsspiel\nDeutschland Deutschland 	– 	Costa Rica Costa Rica 	4:2\n24. Juni 2006, WM-Achtelfinale\nDeutschland Deutschland 	– 	Schweden Schweden 	2:0\n17. Oktober 2007, EM-Qualifikation\nDeutschland Deutschland 	– 	Tschechien Tschechien 	0:3\n3. März 2010, Freundschaftsspiel\nDeutschland Deutschland 	– 	Argentinien Argentinien 	0:1\n6. September 2013, WM-Qualifikation\nDeutschland Deutschland 	– 	Österreich Österreich 	3:0','2005','\0'),(222,350,'Emil-Nüssler-Stadion (Sv 1880 München)','220',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(223,353,'Olympiastadion','220',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(224,351,'Sportplatz Heiglhofstraße (TSV München-Großhadern)','220',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(225,348,'Trainingsgelände Säbener Straße - Platz 3 (Kunstrasen)','220',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(226,352,'Trainingsgelände Säbener Straße - Platz 6','220',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(227,355,'Preußenstadion','227',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(228,356,'Sportplatz Hermann-Löns-Straße','227',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(229,357,'Stichter Sportpark','229',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(230,359,'Olympia-Sportplatz','230',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(231,358,'PSV-Platz Stettiner Straße','230',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(232,360,'VfR-Stadion Geerdtstraße','230',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(233,361,'Volksparkstadion','233',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(234,362,'Sportplatz Schulstraße','234',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(235,365,'Edmund-Plambeck-Stadion','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(236,370,'Edmund-Plambeck-Stadion - Platz 3 (Kunstrasen)','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(237,366,'Exerzierplatz bzw. Collatz & Schwarz Sportpark','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(238,371,'Moorbekstadion','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(239,367,'Paul-Hauenschild-Sportanlage - Kunstrasen 1','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(240,372,'Paul-Hauenschild-Sportanlage - Kunstrasen 2','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(241,368,'Sportplatz Lawaetzstraße (Nebenplatz Grand)','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(242,363,'Sportplatz Langenharmer Weg (FFC Nordlichter Norderstedt)','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(243,369,'Sportplatz Poppenbüttler Straße','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(244,364,'Waldstadion (SV Friedrichsgabe)','235',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(245,373,'Stadion am Heideweg','245',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(246,374,'Frankenstadion','246',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(247,375,'Niederrheinstadion','247',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(248,376,'Bieberer Berg','248',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(249,377,'Blohm Bau Arena','249',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(250,378,'Marschwegstadion','250',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(251,379,'Piepenbrookstadion','251',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(252,380,'Sportplatz an der Bahn','252',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(253,382,'Sportplatz Meessen','253',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(254,381,'Sportplatz Meessen (Kunstrasen)','253',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(255,384,'Energieteam-Arena','255',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(256,383,'Herman-Löns-Stadion','255',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(257,385,'Sportplatz Gartenweg','257',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(258,386,'Dr.-Curt-Wassmund-Stadion','258',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(259,387,'Sportplatz Müßentwiete','259',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(260,389,'Stadion 1/ Fahltsweide','259',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(261,388,'Stipper-Barthel-Platz (SUS Waldenau)','259',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(262,390,'Schiffsthal-Stadion','262',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(263,391,'Waldstadion','263',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(264,393,'Karl-Liebknecht-Stadion','264',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(265,392,'Sportplatz Sandscholle','264',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(266,394,'Fichtestadion (FT Preetz)','266',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(267,395,'Holstenstadion Harksheiderweg','267',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(268,397,'Holstenstadion Harksheiderweg (Nebenplatz Grand)','267',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(269,396,'Sportplatz im Schulzentrum Ziegenweg','267',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(270,398,'Sportplatz Hahn','270',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(271,399,'Stadion Vogelsang','271',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(272,401,'Städtisches Stadion an der Prüfeninger Straße (Jahnstadion)','272',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(273,400,'Sportplatz an der Schillerwiese','272',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(274,402,'Paul-Luckow-Stadion (Nebenplatz Grand)','274',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(275,403,'Hans-Heinrich-Hackmack-Stadion (FC Voran Ohe)','275',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(276,404,'Gemeindesportplatz (Rellinger FC 2010)','276',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(277,406,'Sportanlage Moorweg (SC Egenbüttel)','276',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(278,405,'Sportplatz Hempbergstraße / Schule Egenbüttel (FC Eintracht Rellingen)','276',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(279,407,'Städtischer Sportplatz Nobiskrug','279',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(280,408,'Ostseestadion','280',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(281,410,'Ostseestadion (alt)','280',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(282,409,'Sportplatz Damerower Weg (SV Hafen Rostock)','280',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(283,411,'Volksstadion','280',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(284,412,'Sportzentrum in der Ahe','284',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(285,413,'Sportplatz Brunebecker Straße','285',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(286,414,'Ludwigsparkstadion','286',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(287,415,'Sportplatz Hermann-Schulz-Straße','287',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(288,416,'Stadion im Schulzentrum','288',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(289,417,'Sportplatz Gorch-Fock-Straße','289',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(290,418,'Stadion Achter de Weiden','289',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(291,419,'Am Sportplatz','291',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(292,420,'Sportplatz Schulstraße','292',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(293,421,'Sportzentrum Osterwald','293',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(294,422,'Jahnstadion','294',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(295,423,'Jahn-Sportplatz Babickstraße','295',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(296,424,'Sportplatz Schützenallee','296',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(297,425,'Stadion Paulshöhe','297',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(298,426,'Stadion an der Kettscher Landstraße','298',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(299,427,'Sportanlage Sedelsberg','299',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(300,428,'Sportplatz Dorfstraße','300',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(301,429,'Sportplatz Kirchstraße (Nebenplatz 1 Rasen)','301',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(302,430,'Sportplatz Kirchstraße (Nebenplatz 2 Rasen)','301',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(303,431,'Rhein-Neckar-Arena','303','Hoffenheim','DE',30150,0,'Dietmar-Hopp-Str. 1\n74889 Sinsheim','Die Wirsol Rhein-Neckar-Arena ist ein Fußballstadion in Sinsheim, Baden-Württemberg. Seit der Fertigstellung Anfang 2009 ist das Stadion die Heimstätte des Bundesligavereins TSG 1899 Hoffenheim. Das Stadion bietet 30.150 Plätze (davon sind 21.000 Sitzplätze und 9.150 Stehplätze). Heimtribüne ist die Südtribüne. Am 24. Januar 2009 wurde die Rhein-Neckar-Arena mit einer großen Eröffnungsfeier und einem Spiel der TSG 1899 Hoffenheim gegen eine Auswahl der Metropolregion Rhein-Neckar eröffnet. Am 31. Januar 2009 bestritt die TSG Hoffenheim gegen Energie Cottbus ihre erste Bundesliga-Partie im neuen Stadion und gewann zum Auftakt mit 2:0.\n\nIm Juli 2011 wurden die Namensrechte an der Arena an ein am Rande der Region Rhein-Neckar ansässiges Unternehmen veräußert, die Wirsol Solar AG in Waghäusel. Seitdem heißt das Stadion Wirsol Rhein-Neckar-Arena.\n\nBau\n\nDas Stadion wurde gegenüber dem Auto- und Technikmuseum Sinsheim neben der neuen Autobahnausfahrt Sinsheim-Süd der Autobahn 6 binnen 22 Monaten erbaut. Geplant und begleitet haben es die Generalplaner agn Niederberghaus & Partner aus Ibbenbüren. Der erste Spatenstich erfolgte am 25. Mai 2007, nachdem der Bau am ursprünglich geplanten Standort in Heidelberg bzw. Eppelheim im Sommer 2006 an einem Streit mit der Stadt Heidelberg über die Umweltbelastungen des Stadions und an den Erweiterungsplänen der Wild-Werke gescheitert war. Deren Pläne sind inzwischen wieder verworfen.\nVerkehrsanschluss\n\nDer S-Bahn-Haltepunkt Sinsheim-Museum/Arena ist rund eineinhalb Kilometer Fußweg entfernt.[2] Mit dem Auto ist das Stadion über die neu gebaute Anschlussstelle Sinsheim-Süd der Bundesautobahn 6 erreichbar.\nKapazität\n\nDas reine Fußballstadion besitzt 30.150 überdachte Plätze, davon 9.150 Stehplätze. Für internationale Spiele können die Stehplätze zu Sitzplätzen umgebaut werden, wodurch sich die Kapazität um rund 4.500 Plätze verringert. Außerdem gibt es noch 1.364 Business-Sitze und 40 Business-Logen ab zehn Personen, die sich allesamt auf der Westtribüne befinden. Des Weiteren befinden sich direkt am Stadion 2.500 Parkplätze für Fans und nochmals 2.500 Parkplätze für Fernsehteams, Businesskunden, Reisebusse usw.\nFinanzierung\n\nDas Stadion finanzierten der Sportmäzen Dietmar Hopp, der auch das 1999 erbaute Dietmar-Hopp-Stadion in Hoffenheim finanziert hatte, sowie verschiedene Unternehmen aus der Region.\nNutzung\nFußball\n\nDie Wirsol Rhein-Neckar-Arena wird für die Heimspiele der ersten Mannschaft der TSG 1899 Hoffenheim genutzt. Des Weiteren war das Stadion einer der neun Spielorte der Fußball-Weltmeisterschaft der Frauen 2011 in Deutschland. In Sinsheim wurden drei Vorrundenspiele sowie das Spiel um Platz drei ausgetragen.[4]\n\nDas erste Länderspiel in der Arena fand am 25. Juli 2009 statt, als die deutsche Nationalmannschaft der Frauen in einem Vorbereitungsspiel auf die Europameisterschaft 2009 gegen die Niederlande antrat. Die deutsche Mannschaft gewann das Spiel mit 6:0.[5][6] Das erste Herren-Länderspiel in der Rhein-Neckar-Arena fand am 29. Mai 2011 gegen Uruguay statt. Vor ausverkauften Rängen endete es mit einem 2:1-Sieg der deutschen \nNationalmannschaft.\n\nAm 2. August 2009 spielte die SpVgg Neckarelz in der ersten Runde des DFB-Pokals gegen den FC Bayern München (1:3) vor ausverkauftem Haus in der Rhein-Neckar-Arena.\n\nFußball-Weltmeisterschaft der Frauen 2011\n\nSinsheim war mit rund 35.000 Einwohnern kleinster Austragungsort des Turniers. Spielstätte des Ortes war die Rhein-Neckar-Arena, die 24.475 Zuschauern Platz bot.\n\nWährend der Fußball-Weltmeisterschaft der Frauen 2011 fanden im Stadion folgende Spiele statt:\n\nSo, 26. Juni 2011, 15 Uhr Gruppe A\nNigeria Nigeria 	– 	Frankreich Frankreich 	0:1 (Eröffnungsspiel)\nDi. 5. Juli 2011, 18.15 Uhr Gruppe B\nNeuseeland Neuseeland 	– 	Mexiko Mexiko 	2:2\nSa, 2. Juli 2011, 18 Uhr Gruppe C\nVereinigte Staaten USA 	– 	Kolumbien Kolumbien 	3:0\nSa, 16. Juli 2011, 17.30 Uhr Spiel um Platz 3\nSchweden Schweden 	– 	Frankreich Frankreich 	2:1','2009','\0'),(304,432,'Sportplatz am VfL-Heim','304',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(305,433,'Sportplatz an der Winsener Straße','305',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(306,434,'Sportplatz Camper Höhe','306',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(307,435,'Sportplatz Am Ecksoll','307',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(308,436,'Sportanlage Kurze Heide (Nebenplatz Rasen)','308',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(309,437,'Jahnsportzentrum Brunnenweg','309',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(310,438,'GAZI-Stadion auf der Waldau','310',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(311,439,'Gottlieb-Daimler-Stadion','310',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(312,440,'Sportplatz Hasloher Weg (Tangstedter SV)','312',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(313,441,'Sportplatz Tewel','313',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(314,442,'Strand-Arena','314',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(315,443,'Sportplatz Dorfstraße','315',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(316,444,'Sportplatz Am Gemeindezentrum','316',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(317,445,'Sportzentrum Großenseer Straße Trittau-Arena','317',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(318,446,'Rosenstadion (TSV Uetersen)','318',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(319,447,'Sportparkt Unterhaching','319',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(320,448,'Hans-Bayer-Stadion - Nebenplatz Kunstrasen)','320',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(321,449,'Stadion an der Poststraße','321',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(322,450,'Sportplatz am Gasthaus Postels','322',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(323,451,'Elbestadion','323',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(324,452,'Sportplatz Niendorfer Weg','324',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(325,453,'Am Sportplatz (SC Wentorf)','325',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(326,454,'Sportplatz Marienburg (TSG Bergedorf)','325',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(327,455,'DETAG-Stadion','327',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(328,456,'Sportplatz Bahnhofstraße','328',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(329,457,'Brita-Arena','329',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(330,459,'Jadestadion','330',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(331,458,'Sportanlage Rüstersiel','330',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(332,460,'Kurt-Bürger-Stadion','332',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(333,461,'VfL-Stadion am Elsterweg','333',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(334,463,'Volkswagen-Arena','333',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(335,462,'Porschestadion','333',NULL,'DE',1,0,NULL,NULL,NULL,'\0'),(336,464,'Wormatia-Stadion','336',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(337,465,'Stadion am Zoo','337',NULL,'DE',0,0,NULL,NULL,NULL,'\0'),(338,466,'Sportplatz Pöhlsener Weg','338',NULL,'DE',NULL,NULL,NULL,NULL,NULL,'\0'),(339,3,'Emirates Stadium','339',NULL,'EN',NULL,NULL,NULL,NULL,NULL,'\0'),(340,2,'Wembley Stadium (neu)','339',NULL,'EN',NULL,NULL,NULL,NULL,NULL,'\0'),(341,1,'Wembley Stadium (abgerissen)','339',NULL,'EN',0,0,NULL,NULL,NULL,''),(342,5,'Etihad Stadium','342','Eastlands','EN',47726,47304,NULL,'Im Jahr 1993 bewarb sich die Stadt Manchester um die Olympischen Spiele 2000 und erstellte Pläne für ein neues Stadion im Osten (Stadtteil Eastlands) der Stadt mit einer Kapazität von 80.000 Zuschauern. Nachdem der Zuschlag an das australische Sydney ging, bewarb man sich erfolgreich um die Durchführung der Commonwealth Games 2002. An den Bauplänen wurde in der ersten Zeit weiter festgehalten, aber nachdem der englische Fußballverband FA sich für einen Neubau des Wembley-Stadions in London als Nationalstadion Englands festgelegt hatte, wurden die Pläne überarbeitet und die Kapazität auf 38.000 Zuschauer festgelegt. Gleichzeitig wurde mit dem Verein Manchester City eine Vereinbarung geschlossen, in der der Umbau des Stadions nach den Spielen in eine reine Fußballarena mit 48.000 Zuschauern und die Nutzung des Stadions durch den Verein für die nächsten 250 Jahre festgeschrieben wurden.\n\nAm 17. Dezember 1999 legte Premierminister Tony Blair den Grundstein für das Stadion; einen Monat später begannen die Arbeiten. Konstruiert wurde das Stadion durch das Londoner Architekturbüro Arup mit durchgehenden und leicht geschwungenen Tribünen. Am 25. Juli 2002 erfolgte die feierliche Eröffnung des Stadions unter dem Namen City of Manchester Stadium sowie der Commonwealth Games durch Königin Elisabeth II.. Während der Spiele wurden hier alle Leichtathletikveranstaltungen und die Rugby-Spiele ausgetragen.\n\nNach Abschluss der Commonwealth Games begann der Umbau in ein reines Fußballstadion. Die Laufbahn und alle anderen Stätten der Leichtathletik wurden entfernt. Der erste Rang wurde gesenkt und eine temporäre Tribüne durch eine neue permanente Tribüne ersetzt. Insgesamt konnten so 10.000 neue Plätze gewonnen werden. Die gesamten Umbaukosten trug der Verein Manchester City, der nach der Saison 2002/03 sein altes Heimstadion Maine Road verließ und das neue Stadion bezog. Am 1. Juni 2004 wurde das Stadion das 50. Stadion, in dem die englische Fußballnationalmannschaft ein Heimspiel austrug.\n\nDas Etihad Stadium ist Teil des Sportkomplexes Sportcity. Neben dem Fußballstadion steht noch ein Leichtathletikstadion (Regional Athletics Arena), das 6.000 Zuschauern Platz bietet und in dem Ausscheidungswettkämpfe der Leichtathletik stattfinden bzw. die zweite Mannschaft von Manchester City seine Heimspiele austrägt. Daneben stehen die Radsporthalle (Manchester Velodrome) und das National Squash Centre.\n\nVon der UEFA ist das Stadion als Vier-Sterne Stadion ausgewiesen. Es wurde als Austragungsort für das Finale des UEFA-Pokal 2007/08 ausgewählt.\n\nNeben seiner heutigen Hauptfunktion als Fußballstadion dient es als Veranstaltungsort von weiteren sportlichen Großveranstaltungen, wie z. B. Spielen der Rugby Football League[2] und Konzerten.[3]','2002','\0'),(343,4,'Old Trafford','342',NULL,'EN',30000,0,NULL,NULL,NULL,'\0'),(344,1,'A. Le Coq Arena','344',NULL,'EE',NULL,NULL,NULL,NULL,NULL,'\0'),(345,1,'Olympiastadion','345',NULL,'FI',NULL,NULL,NULL,NULL,NULL,'\0'),(346,1,'Stade Jacques Chaban-Delmas (Parc Lescure)','346',NULL,'FR',NULL,NULL,NULL,NULL,NULL,'\0'),(347,2,'Stade Municipal de Gerland','347',NULL,'FR',NULL,NULL,NULL,NULL,NULL,'\0'),(348,3,'Stade Vélodrome','348',NULL,'FR',NULL,NULL,NULL,NULL,NULL,'\0'),(349,4,'Stade Luis II.','349',NULL,'FR',NULL,NULL,NULL,NULL,NULL,'\0'),(350,5,'Stade de France','350',NULL,'FR',NULL,NULL,NULL,NULL,NULL,'\0'),(351,1,'Hong Kong','351',NULL,'HK',0,0,NULL,NULL,NULL,'\0'),(352,2,'Jawaharlal Nehru Stadion','352',NULL,'IN',NULL,NULL,NULL,NULL,NULL,'\0'),(353,1,'Yuba Bharati Krirangan (Salt Lake Stadium)','353',NULL,'IN',NULL,NULL,NULL,NULL,NULL,'\0'),(354,1,'Azadi-Stadion','354',NULL,'IR',NULL,NULL,NULL,NULL,NULL,'\0'),(355,1,'St. Mels Park','355',NULL,'IE',NULL,NULL,NULL,NULL,NULL,'\0'),(356,2,'Landsdowne Raod','356',NULL,'IE',NULL,NULL,NULL,NULL,NULL,'\0'),(357,3,'Tolka Park','356',NULL,'IE',NULL,NULL,NULL,NULL,NULL,'\0'),(358,4,'Flancare Park','358',NULL,'IE',NULL,NULL,NULL,NULL,NULL,'\0'),(359,1,'Stadion Ramat Gan','359',NULL,'IL',NULL,NULL,NULL,NULL,NULL,'\0'),(360,1,'Stadio Cumunale di Arco di via Pomerio','360',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(361,2,'Stadio Artemio Franchi','361',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(362,3,'Stadio Guiseppe Meazza','362',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(363,4,'Stadio San Paolo','363',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(364,5,'Stadio di Olimpico','364',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(365,7,'Stadio Delle Alpi','365',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(366,6,'Stadio Olimpico','365',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(367,8,'Stadio Pierluigi Penzo','367',NULL,'IT',NULL,NULL,NULL,NULL,NULL,'\0'),(368,1,'Olympiastadion Tokio','368',NULL,'JP',NULL,NULL,NULL,NULL,NULL,'\0'),(369,1,'BMO (Bank of Montreal) Field','369',NULL,'CA',NULL,NULL,NULL,NULL,NULL,'\0'),(370,1,'Al-Khawr Stadium','370',NULL,'QA',NULL,NULL,NULL,NULL,NULL,'\0'),(371,2,'Kalifa International Stadium','371',NULL,'QA',NULL,NULL,NULL,NULL,NULL,'\0'),(372,1,'al Kuwait Sports Club Stadium','372',NULL,'KW',NULL,NULL,NULL,NULL,NULL,'\0'),(373,1,'Rheinparkstadion','373',NULL,'LI',NULL,NULL,NULL,NULL,NULL,'\0'),(374,1,'Daugava Stadion','374',NULL,'LV',NULL,NULL,NULL,NULL,NULL,'\0'),(375,1,'S. Dariaus ir Gireno stadionas','375',NULL,'LT',NULL,NULL,NULL,NULL,NULL,'\0'),(376,1,'Stade Op Flohr','376',NULL,'LU',NULL,NULL,NULL,NULL,NULL,'\0'),(377,1,'Ta ´Qali National Stadion','377',NULL,'MT',NULL,NULL,NULL,NULL,NULL,'\0'),(378,1,'Stade de Marrakech','378',NULL,'MA',NULL,NULL,NULL,NULL,NULL,'\0'),(379,2,'Stade Moulay Abdellah','379',NULL,'MA',NULL,NULL,NULL,NULL,NULL,'\0'),(380,1,'North Harbour Stadium','380',NULL,'NZ',NULL,NULL,NULL,NULL,NULL,'\0'),(381,1,'Amsterdam ArenA','381',NULL,'NL',NULL,NULL,NULL,NULL,NULL,'\0'),(382,2,'Arke Stadion','382',NULL,'NL',NULL,NULL,NULL,NULL,NULL,'\0'),(383,3,'Stadion „De Kuip“ Feijenoord','383',NULL,'NL',NULL,NULL,NULL,NULL,NULL,'\0'),(384,4,'Wagner & Partners Stadion','384',NULL,'NL',NULL,NULL,NULL,NULL,NULL,'\0'),(385,5,'Oosterenkstadion','385',NULL,'NL',NULL,NULL,NULL,NULL,NULL,'\0'),(386,1,'Windsor Park','386',NULL,'nn',NULL,NULL,NULL,NULL,NULL,'\0'),(387,1,'Waldstadion Gisingen','387',NULL,'AT',NULL,NULL,NULL,NULL,NULL,'\0'),(388,2,'Waldstadion','388',NULL,'AT',NULL,NULL,NULL,NULL,NULL,'\0'),(389,3,'Stadion Wals/Siezenheim','389',NULL,'AT',NULL,NULL,NULL,NULL,NULL,'\0'),(390,4,'Stadion Hohe Warte','390',NULL,'AT',NULL,NULL,NULL,NULL,NULL,'\0'),(391,1,'Sultan Qaboos Sports Complex','391',NULL,'OM',NULL,NULL,NULL,NULL,NULL,'\0'),(392,1,'Stadion Slaski','392',NULL,'PL',NULL,NULL,NULL,NULL,NULL,'\0'),(393,2,'Stadion Wojska Polskiego','393',NULL,'PL',NULL,NULL,NULL,NULL,NULL,'\0'),(394,1,'Estadio AXA (Munipal de Braga)','394',NULL,'PT',NULL,NULL,NULL,NULL,NULL,'\0'),(395,3,'Estadio da Luz','395',NULL,'PT',NULL,NULL,NULL,NULL,NULL,'\0'),(396,2,'Estadio do Restelo','395',NULL,'PT',NULL,NULL,NULL,NULL,NULL,'\0'),(397,4,'Estadio Jose Alvalade','395',NULL,'PT',NULL,NULL,NULL,NULL,NULL,'\0'),(398,1,'Arena Chimki','398',NULL,'RU',NULL,NULL,NULL,NULL,NULL,'\0'),(399,3,'Olimpiyskiy Kompleks Luzhniki (Bolschaja Sportiwna Arena)','399',NULL,'RU',NULL,NULL,NULL,NULL,NULL,'\0'),(400,2,'Stadion Oktyabr','399',NULL,'RU',NULL,NULL,NULL,NULL,NULL,'\0'),(401,4,'Petrovskij Stadion','401',NULL,'RU',NULL,NULL,NULL,NULL,NULL,'\0'),(402,2,'Stadionul Dr. Constantin Radulescu','402',NULL,'RO',NULL,NULL,NULL,NULL,NULL,'\0'),(403,1,'Stadionul Valentin Stanescu (Giulesti)','403',NULL,'RO',NULL,NULL,NULL,NULL,NULL,'\0'),(404,1,'Lawson-Tama-Stadium','404',NULL,'SB',NULL,NULL,NULL,NULL,NULL,'\0'),(405,1,'Stadio Olimpico di Serravalle','405',NULL,'SM',NULL,NULL,NULL,NULL,NULL,'\0'),(406,1,'Prince Abdullah Alfaisal Bin Abdulaziz Stadium','406',NULL,'SA',NULL,NULL,NULL,NULL,NULL,'\0'),(407,1,'Bromstens Idrottsparken','407',NULL,'SE',NULL,NULL,NULL,NULL,NULL,'\0'),(408,1,'St. Jakob-Park','408',NULL,'CH',NULL,NULL,NULL,NULL,NULL,'\0'),(409,2,'Stadion Breite','409',NULL,'CH',NULL,NULL,NULL,NULL,NULL,'\0'),(410,1,'Pittodrie Stadium','410',NULL,'SS',NULL,NULL,NULL,NULL,NULL,'\0'),(411,1,'Stadion Crvena Zvezda','411',NULL,'CS',1,0,NULL,NULL,NULL,'\0'),(412,1,'Ljudski vrt','412',NULL,'SI',NULL,NULL,NULL,NULL,NULL,'\0'),(413,1,'Tehelne Pole Stadion','413',NULL,'SK',NULL,NULL,NULL,NULL,NULL,'\0'),(414,1,'Estadi Nou Camp del FC Barcelona','414',NULL,'ES',NULL,NULL,NULL,NULL,NULL,'\0'),(415,2,'Estadio Santiago Bernabeu','415',NULL,'ES',NULL,NULL,NULL,NULL,NULL,'\0'),(416,3,'Ono-Estadi','416',NULL,'ES',NULL,NULL,NULL,NULL,NULL,'\0'),(417,4,'Eden Arena','417',NULL,'CZ',NULL,NULL,NULL,NULL,NULL,'\0'),(418,3,'Fotbalovy areal Bedrichovska','417',NULL,'CZ',NULL,NULL,NULL,NULL,NULL,'\0'),(419,2,'Toyota Arena (Letna)','417',NULL,'CZ',NULL,NULL,NULL,NULL,NULL,'\0'),(420,1,'Stadion Viktoria','417',NULL,'CZ',1,0,NULL,NULL,NULL,'\0'),(421,5,'FK Banik Sokolov Stadion','421',NULL,'CZ',NULL,NULL,NULL,NULL,NULL,'\0'),(422,1,'Güngören Belediye','422',NULL,'TR',NULL,NULL,NULL,NULL,NULL,'\0'),(423,1,'Stade 15. Octobre','423',NULL,'TN',NULL,NULL,NULL,NULL,NULL,'\0'),(424,2,'Stade Taieb-Mhiri','424',NULL,'TN',NULL,NULL,NULL,NULL,NULL,'\0'),(425,3,'Stade El Menzah','425',NULL,'TN',NULL,NULL,NULL,NULL,NULL,'\0'),(426,1,'Stadion Meteor','426',NULL,'UA',NULL,NULL,NULL,NULL,NULL,'\0'),(427,1,'ETO Park','427',NULL,'HU',NULL,NULL,NULL,NULL,NULL,'\0'),(428,1,'Rentschler Field','428',NULL,'US',1,0,NULL,NULL,NULL,'\0'),(429,2,'Giants-Stadium','429',NULL,'US',0,0,NULL,NULL,NULL,''),(430,3,'Mitchel Athletic Complex','430',NULL,'US',NULL,NULL,NULL,NULL,NULL,'\0'),(431,3,'Police Stadium','431',NULL,'AE',NULL,NULL,NULL,NULL,NULL,'\0'),(432,2,'Al-Rashid Stadium','431',NULL,'AE',NULL,NULL,NULL,NULL,NULL,'\0'),(433,1,'Al-Maktoum Stadium','431',NULL,'AE',NULL,NULL,NULL,NULL,NULL,'\0'),(434,1,'Millennium Stadium','434',NULL,'WW',NULL,NULL,NULL,NULL,NULL,'\0'),(435,1,'Dinamo-Stadion','435',NULL,'BY',NULL,NULL,NULL,NULL,NULL,'\0'),(436,1,'Neo G. S. P.','436',NULL,'CY',NULL,NULL,NULL,NULL,NULL,'\0'),(437,3,'Sportzentrum Bönningstedt B-Platz','55',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(438,1,'Nebenplatz Sportpark am Möhlenkamp','62',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(439,2,'Schulsportplatz - Nebenplatz / Grand (Breitenfelder SV)','68',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(440,4,'Sportplatz Waldstraße / B-Platz (grand)','154',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(441,5,'An´n Himmelsbarg - Nebenplatz / Rasen (Flutlicht!) (Morreger SV)','215',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(442,6,'Sportplatz am Sportzentrum im Judengäßchen - Nebenplatz / Kunstrasen','218',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(443,8,'Paul-Hauenschild-Sportplätze - Kunstrasen','235',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(444,7,'Sportplatz Lawaetzstraße (SV Friedrichsgabe)','235',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(445,9,'Holstenstadion - Nebenplatz (Holstein Quickborn)','267',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(446,10,'Paul-Luckow-Stadion - Nebenplatz / Grand (TSV Reinbek)','274',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(447,11,'Sportzentrum Seth - Nebenplatz / Rasen (SG Seth)','301',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(448,12,'Sportanlage Kurze Heide - Nebenplatz (TSV Stelle)','308',NULL,'nb',NULL,NULL,NULL,NULL,NULL,'\0'),(449,123,'Sportplatz Heubergredder (SC Sperber)','449','Alsterdorf','DE',0,1,NULL,NULL,NULL,'\0'),(450,124,'Sportpark Altengamme im Gammer Weg (SV Altengamme)','449','Altengamme','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(451,125,'Sportpark Altengamme im Gammer Weg (Kunstrasen)','449','Altengamme','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(452,127,'Jahnplatz (SV Örnek-Türkspor e. V.)','449','Altona (Nord)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(453,129,'Jahnplatz Memellandallee (Grand)','449','Altona (Nord)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(454,128,'Jahnplatz Memellandallee (Nebenplatz Grand rechts)','449','Altona (Nord)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(455,130,'Rudi-Barth-Sportplatz (SC Union v. 1903)','449','Altona (Nord)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(456,126,'Karl-Möller-Sportplatz (Sport-Club Teutonia v. 1910)','449','Altona','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(457,132,'Hermann-Seiffart-Sportanlage / Baurstraße (Bahrenfelder Sport-Verein v. 1919)','449','Bahrenfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(458,131,'Sportplatz Wilhelmshöh (Groß-Flottbeker SpVgg)','449','Bahrenfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(459,138,'Jonny-Rehbein-Sportplatz an der Brucknerstraße (USC Paloma)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(460,135,'Sportplatz Beethovenstraße (SV UH/Adler)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(461,139,'Sportplatz Langenfort 2 (links BU-Jugend / nonleague)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(462,136,'Sportplatz Langenfort 1 (rechts  BU II. Herren und Jugendmannschaften)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(463,133,'Sportplatz Meister-Francke-Straße (SV Barmbek)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(464,137,'Sportplatz Schützenhof (SC Urania)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(465,134,'Wilhelm-Rupprecht-Sportplatz (BU)','449','Barmbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(466,141,'Billtalstadion (BFSV Atlantik 97)','449','Bergedorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(467,140,'Sportplatz Henriette-Herz-Ring (SVNA)','449','Bergedorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(468,142,'Sportplatz Ladenbeker Furtweg (SV Bergedorf-West)','449','Bergedorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(469,143,'Sportplatz Teekoppel (SV Bergstedt)','449','Bergstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(470,144,'Sportplatz Berner Allee (TuS Berne)','449','Berne','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(471,145,'Hein-Klink-Stadion (S. V. Billstedt-Horn)','449','Billstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(472,148,'Hein-Klink-Stadion  Rasenplatz (S. V. Billstedt-Horn)','449','Billstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(473,146,'Sportplatz Kandinskyallee (Mümmelmannsberger SV Hamburg v. 1974 e. V.)','449','Billstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(474,149,'Sportplatz Öjendorfer Weg (SC Vorwärts-Wacker v. 1904)','449','Billstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(475,147,'Sportplatz Öjendorfer Weg (Nebenplatz Kunstrasen)','449','Billstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(476,150,'Sportplatz Mittlerer Landweg (ETSV Hamburg v. 1924 e. V.)','449','Billwerder','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(477,151,'Sportplatz Dockenhuden (FTSV Komet Blankenese)','449','Blankenese','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(478,152,'Sportplatz Waldesruh (Spielvereinigung Blankenese v. 1903)','449','Blankenese','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(479,153,'Albert-Kaehlert Platz am Gesundbrunnen (Turn- und Sportverein Hamburg v. 1880 r. V.)','449','Borgfelde','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(480,154,'Sportplatz Barmwisch (SC Osterbek)','449','Bramfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(481,155,'Sportplatz Ellernreihe (Bramfelder SV)','449','Bramfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(482,156,'Sportplatz Gramkowweg (SV Curslack-Neuengamme)','449','Curslack','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(483,158,'Linne-Kampfbahn Dulsberg (Kroatische Kulturgemeinschaft Croatia Hamburg)','449','Dulsberg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(484,157,'Sportplatz Vogesenstraße (Dulsberger Sport-Club Hanseat v. 1899)','449','Dulsberg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(485,159,'Sportzentrum Puckafferweg (Duvenstedter SV v. 1969 e. V.)','449','Duvenstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(486,160,'Sportplatz Furtweg (SV Krupunder / Lohkamp)','449','Eidelstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(487,162,'Sportplatz Steinwiesenweg (Nebenplatz Grand)','449','Eidelstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(488,161,'Sportzentrum Redingskamp (Eidelstedter SV)','449','Eidelstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(489,163,'Sportplatz Fichtestraße (SC Eilbek)','449','Eilbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(490,164,'Gustav-Falke-Platz (Sportverein 72 Fortuna)','449','Eimsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(491,166,'Julius-Sparbier-Sportplätze (u. a. Eimsbütteler TV SSC Italia Amburgo  AC Italia)','449','Eimsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(492,165,'Polizeisportplatz im Sternschanzenpark (FC St. Pauli II)','449','Eimsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(493,167,'Professor-Reinmüller-Platz Tornquisstraße (HEBC Hamburg)','449','Eimsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(494,168,'Sportplatz Lichtenauer Weg (SV Rot-Gelb Harburg)','449','Eißendorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(495,169,'Sportplatz Berner Heerweg 187 (Farmsener TV)','449','Farmsen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(496,171,'Sportplatz Berner Heerweg 187 (Nebenplatz Grand)','449','Farmsen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(497,170,'Sportzentrum Oldenfelde (SC Condor)','449','Farmsen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(498,172,'Sportzentrum Oldenfelde (Nebenplatz Grand)','449','Farmsen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(499,173,'Karl-Hülbert-Sportzentrum (Post SV Hamburg e. V.)','449','Farmsen-Berne','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(500,174,'Uhlenhoffstadion (TuS Finkenwerder)','449','Finkenwerder','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(501,175,'Hermann-Löns-Sportplatz / Schlehdornweg (ex - TuS Alstertal)','449','Fuhlsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(502,176,'Sportplatz Struckholt (VfV Oberalster)','449','Fuhlsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(503,177,'Sportplatz Brödermannsweg (TSV Eppendorf-Groß Borstel)','449','Groß Borstel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(504,178,'Sportplatz Weg beim Jäger (SV Weiß-Blau 63)','449','Groß Borstel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(505,181,'Ernst-Fischer-Spielplatz (Sport-Club Hamm v. 1902 e. V.)','449','Hamm (Süd)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(506,179,'Sportplatz Luisenweg (Befinca Hamburg)','449','Hamm (Mitte)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(507,180,'Stadion Hammer Park (Hamm United)','449','Hamm (Nord)','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(508,182,'Sportplatz Wendenstraße (SV Muslime Hamburg e. V.)','449','Hammerbrook','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(509,183,'Sportplatz Außenmühle (Freie Sportvereinigung Harburg v. 1893 e. V.))','449','Harburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(510,184,'Sportplatz Jägerhof oben (FTSV Altenwerder)','449','Hausbruch','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(511,185,'Sportplatz Alter Postweg (Bostelbeker SV)','449','Heimfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(512,186,'Sportplatz Legienstraße (Nebenplatz Grand)','449','Horn','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(513,188,'Sportplatz Snitgerreihe (TuS Hamburg)','449','Horn','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(514,187,'Sportplatz Von-Elm-Weg (FC St. Georg-Horn im Horner TV)','449','Horn','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(515,189,'Sportplatz Grützmühlenweg (Hummelsbütteler SV)','449','Hummelsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(516,190,'HFV-Sportzentrum (Kunstrasen)','449','Jenfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(517,192,'Sportplatz Bekkamp (TSV Wandsbek-Jenfeld)','449','Jenfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(518,191,'Sportplatz Bekkamp Kunstrasen (SC Concordia II)','449','Jenfeld','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(519,194,'Sportplatz Zollenspieker (SC Vier- und Marschlande)','449','Kirchwerder','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(520,193,'Rasenplatz Fünfhausen (SC Vier- und Marschlande)','449','Kirchwerder','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(521,196,'Sportplatz Siemershöh (SC Alstertal/Langenhorn)','449','Langenhorn','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(522,195,'Sportplatz Beckermannweg (Kunstrasen)','449','Langenhorn','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(523,197,'Sportanlage Eichelhäherkamp (Lemsahler SV)','449','Lemsahl','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(524,198,'Sportplatz Ladenbeker Weg (Inter GSK Bergedorf)','449','Lohbrügge','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(525,200,'Stadion Sander Tannen (FC Bergedorf 85 ehem. ASV Bergedorf -Lohbrügge v. 1885)','449','Lohbrügge','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(526,199,'Wilhelm-Lindemann-Sportplatz (VfL Lohbrügge v. 1892 e. V.)','449','Lohbrügge','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(527,201,'Sportplatz Grandweg (SC Bosna 1992)','449','Lokstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(528,204,'Sportplatz Tiefenstaaken (ESV Grün-Weiß Eimsbüttel)','449','Lokstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(529,202,'Sportzentrum Hoheluft (Eimsbütteler TV)','449','Lokstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(530,205,'Stadion Hohe Luft (SC Victoria)','449','Lokstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(531,203,'Wolfgang-Meyer-Sportanlage','449','Lokstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(532,206,'Wolfgang-Meyer-Sportanlage (Nebenplatz Grand  rechts)','449','Lokstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(533,207,'Jonny-Afert-Anlage im Uwe-Einsath-Stadion (SV Lurup Hamburg v. 1923 e. V.)','449','Lurup','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(534,208,'Sportplatz Moorburger Elbdeich Schule Moorburg','449','Moorburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(535,209,'Sportplatz Rahewinkel (SC Europa v. 1992)','449','Mümmelmannsberg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(536,210,'Sportanlage Katendeich (SV Nettelnburg-Allermöhe)','449','Nettelnburg','DE',1,0,NULL,NULL,NULL,'\0'),(537,211,'Sportplatz Kiesbarg (FC Süderelbe)','449','Neugraben-Fischbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(538,212,'Sportplatz Opferberg (FC Süderelbe)','449','Neugraben-Fischbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(539,213,'Sportplatz Schule Neuland (TSV Neuland v. 1924 e. V.)','449','Neuland','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(540,214,'Schulzentrum Neumoorstück (FTSV Altenwerder)','449','Neuwiedenthal','DE',1,0,NULL,NULL,NULL,'\0'),(541,215,'Carl-Ohl-Kampfbahn (Niendorfer TSV II)','449','Niendorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(542,217,'Sportzentrum Sachsenweg (Niendorfer SV)','449','Niendorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(543,216,'Wolfgang-Krohn-Arena','449','Niendorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(544,218,'Sportplatz Quellental (SC Nienstedten)','449','Nienstedten','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(545,220,'Heinrich-Kruse-Stadion (TSV DuWo 08)','449','Ohlstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(546,219,'Sportplatz Sthamerstraße (Nebenplatz Rasen)','449','Ohlstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(547,222,'Sportplatz Blomkamp (TuS Osdorf)','449','Osdorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(548,221,'Sportplatz Kroonhorst (SV Osdorfer Born)','449','Osdorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(549,223,'Sportplatz Kroonhorst (SV Osdorfer Born / Nebenplatz Grand)','449','Osdorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(550,225,'Adolf-Jäger-Kampfbahn (Altonaer Fußballclub v. 1893 Altona 93)','449','Ottensen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(551,226,'Gottfried-Tönsfeldt-Stadion (FC Teutonia v. 1905)','449','Ottensen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(552,224,'Sportplatz Othmarscher Kirchenweg (Altona 93 II)','449','Othmarschen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(553,228,'Sportplatz Bültenkoppel (SC Poppenbüttel)','449','Poppenbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(554,227,'Sportplatz Bültenkoppel (Nebenplatz Grand)','449','Poppenbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(555,233,'Sportplatz Deepenhorn (Meiendorfer SV II)','449','Rahlstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(556,230,'Sportplatz Grunewaldstraße 61 (FC Maihan)','449','Rahlstedt','DE',1,0,NULL,NULL,NULL,'\0'),(557,234,'Sportplatz Scharbeutzer Straße (Rahlstedter SC)','449','Rahlstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(558,231,'Sportplatz Scharbeutzer Straße (Nebenplatz Rasen)','449','Rahlstedt','DE',1,0,NULL,NULL,NULL,'\0'),(760,229,'Stadion Meiendorfer Straße (Meiendorfer SV)','449','Rahlstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(761,232,'Stadion Rahlstedter Höhe/Ahrenshooper Straße (Meiendorfer SV)','449','Rahlstedt','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(762,235,'Sportplatz Iserbarg (Rissener SV)','449','Rissen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(763,236,'Sportplatz Marckmannstraße (FTSV Lorbeer)','449','Rothenburgsort','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(764,237,'Sportplatz Sternschanze / Dänenweg (SC Sternschanze)','449','Rotherbaum','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(765,238,'Stadion Rotherbaum (ehemals Hamburger SV )','449','Rotherbaum','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(766,239,'Sportplatz Parkweg (TSV Sasel)','449','Sasel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(767,241,'Bezirkssportanlage Riekbornweg (TuS Germania Schnelsen)','449','Schnelsen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(768,240,'Sportplatz Königskinderweg (TuS Germania Schnelsen)','449','Schnelsen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(769,242,'Sportplatz Marienkäferweg (Panteras Negras)','449','Sinstorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(770,243,'Millerntor-Stadion','449','St.Pauli','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(771,244,'Sportplatz Feldstraße (SC Hansa 10/11)','449','St.Pauli','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(772,245,'Sportplatz Gropiusring (Kunstrasen)','449','Steilshoop','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(773,247,'AOL-Arena','449','Stellingen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(774,246,'Stellinger Stadion am Sportplatzring (TSV Stellingen)','449','Stellingen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(775,248,'Volksparkstadion (Hamburger SV)','449','Stellingen','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(776,249,'Sportplatz Küperkoppel (SV Tonndorf-Lohe)','449','Tonndorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(777,250,'Sportplatz Birkenau (Sportverein K. S. Polonia v. 1988)','449','Uhlenhorst','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(778,251,'Stadion Allhorn (Walddörfer SV)','449','Volksdorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(779,252,'Sportplatz Am Neumarkt (Non-league Concordia Jugend)','449','Wandsbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(780,254,'Sportzentrum Hinschenfelde (TSV Wandsetal v. 1881 e. V.)','449','Wandsbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(781,253,'Stadion Marienthal (SC Concordia)','449','Wandsbek','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(782,255,'Sportplatz Am Pfeilshof (TSC Wellingsbüttel)','449','Wellingsbüttel','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(783,256,'Joh.-Martens-Sportplatz Vogelhüttendeich (SV Wilhelmsburg)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(784,260,'Sportplatz Dratelnstraße (ESV Einigkeit Wilhelmsburg)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(785,257,'Sportplatz Fährstraße (FC Dynamo Hamburg)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(786,261,'Sportplatz Karl-Arnold-Ring (Inter Wilhelmsburg)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(787,258,'Sportplatz Landesgrenze / Georg-Wilhelm-Straße (TSC Victoria Wilhelmsburg-Veddel)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(788,262,'Sportplatz Landesgrenze / Nebenplatz (Grand) (FC Türkiye)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(789,259,'Sportplatz Rahmwerder Straße (Vorwärts 93 - Ost)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(790,263,'Sportplatz Rotenhäuser Straße (Rot-Weiß Wilhelmsburg)','449','Wilhelmsburg','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(791,265,'Sportgelände Rabenstein (Harburger SC)','449','Wilstorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(792,264,'Sportplatz Winsener Straße (FC Viktoria Harburg)','449','Wilstorf','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(793,267,'Sportplatz Meerweinstraße (VfL 93 Hamburg II)','449','Winterhude','DE',NULL,NULL,NULL,NULL,NULL,'\0'),(794,266,'Sportplatz Neue Welt (oben) (FC Winterhude)','449','Winterhude','DE',NULL,NULL,NULL,NULL,NULL,'\0');
/*!40000 ALTER TABLE `stadionliste_bk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadionnamen`
--

DROP TABLE IF EXISTS `stadionnamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadionnamen` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `stadion_id` int(11) NOT NULL,
  `name_vor_ae` varchar(200) NOT NULL,
  `von_jahr` char(4) DEFAULT NULL,
  `bis_jahr` char(4) DEFAULT NULL,
  PRIMARY KEY (`lfd_nr`,`stadion_id`,`name_vor_ae`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadionnamen`
--

LOCK TABLES `stadionnamen` WRITE;
/*!40000 ALTER TABLE `stadionnamen` DISABLE KEYS */;
INSERT INTO `stadionnamen` VALUES (3,54,'Millerntorstadion','1963','1970'),(4,54,'Wilhelm-Koch-Stadion','1970','2015'),(5,55,'Westfalenstadion','1971','2005'),(6,56,'Stadion Alm','1926','2004'),(8,57,'Ostseestadion','1954','2007'),(9,57,'DKB-Arena','2015','2020'),(12,59,'Wedaustradion','1921','2004'),(13,59,'MSV-Arena','2004','2099'),(17,63,'Niedersachsenstadion','1954','2002'),(18,63,'AWD-Arena','2002','2013'),(20,64,'Westdeutsches Stadion','1962','2005'),(23,65,'Müngersdorfer Stadion','1975','2004'),(25,68,'Städtisches Stadion','1945','1961'),(26,68,'Victory-Stadium','1961','1991'),(27,68,'Städtisches Stadion','1991','2006'),(28,68,'Frankenstadion','2006','2012'),(29,68,'easyCredit-Stadion','2012','2013'),(30,68,'Stadion Nürnberg','2013','2099'),(31,69,'Dreisamstadion','1954','2004'),(32,69,'Badenova-Stadion','2004','2011'),(33,69,'Mage Solar Stadion','2012','2014'),(35,71,'Meppener Sportplatz','1924','1927'),(36,71,'Hindenburgstadion','1927','1992'),(37,71,'Emslandstadion','1992','2005'),(38,71,'Vivaris Arena Emsland','2005','2013'),(39,71,'MEP-Arena','2011','2013'),(40,96,'Waldstadion','1925','2005'),(41,34,'Ruhrstadion ','1979','2006');
/*!40000 ALTER TABLE `stadionnamen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadtteile`
--

DROP TABLE IF EXISTS `stadtteile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadtteile` (
  `stadtteil_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `ort_id` int(11) NOT NULL,
  PRIMARY KEY (`stadtteil_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadtteile`
--

LOCK TABLES `stadtteile` WRITE;
/*!40000 ALTER TABLE `stadtteile` DISABLE KEYS */;
INSERT INTO `stadtteile` VALUES (1,'Fröttmaning',220),(2,'Hoffenheim',303),(3,'Eastlands',342),(4,'Alsterdorf',449),(5,'Altengamme',449),(6,'Altona-Nord',449),(7,'Altona',449),(8,'Bahrenfeld',449),(9,'Barmbek-Süd',449),(10,'Bergedorf',449),(11,'Bergstedt',449),(12,'Berne',449),(13,'Billstedt',449),(14,'Billwerder',449),(15,'Blankenese',449),(16,'Borgfelde',449),(17,'Bramfeld',449),(18,'Curslack',449),(19,'Dulsberg',449),(20,'Duvenstedt',449),(21,'Eidelstedt',449),(22,'Eilbek',449),(23,'Eimsbüttel',449),(24,'Eißendorf',449),(25,'Farmsen',449),(26,'Farmsen-Berne',449),(27,'Finkenwerder',449),(28,'Fuhlsbüttel',449),(29,'Groß Borstel',449),(30,'Hamm (Süd)',449),(31,'Hamm (Mitte)',449),(32,'Hamm (Nord)',449),(33,'Hammerbrook',449),(34,'Harburg',449),(35,'Hausbruch',449),(36,'Heimfeld',449),(37,'Horn',449),(38,'Hummelsbüttel',449),(39,'Jenfeld',449),(40,'Kirchwerder',449),(41,'Langenhorn',449),(42,'Lemsahl',449),(43,'Lohbrügge',449),(44,'Lokstedt',449),(45,'Lurup',449),(46,'Moorburg',449),(47,'Mümmelmannsberg',449),(48,'Nettelnburg',449),(49,'Neugraben-Fischbek',449),(50,'Neuland',449),(51,'Neuwiedenthal',449),(52,'Niendorf',449),(53,'Nienstedten',449),(54,'Ohlstedt',449),(55,'Osdorf',449),(56,'Ottensen',449),(57,'Othmarschen',449),(58,'Poppenbüttel',449),(59,'Rahlstedt',449),(60,'Steilshoop',449),(61,'Hamm',449),(62,'Rissen',449),(63,'Rothenburgsort',449),(64,'Rotherbaum',449),(65,'Sasel',449),(66,'Schnelsen',449),(67,'Sinstorf',449),(68,'St.Pauli',449),(69,'Stellingen',449),(70,'Tonndorf',449),(71,'Uhlenhorst',449),(72,'Volksdorf',449),(73,'Wandsbek',449),(74,'Wellingsbüttel',449),(75,'Wilhelmsburg',449),(76,'Wilstorf',449),(77,'Winterhude',449),(81,'Giesing',220),(82,'Florya',422),(83,'Barmbek-Nord',449),(84,'Eppendorf',449),(85,'Farmsen-Berne',449),(86,'Marienthal',449),(87,'Wohldorf-Ohlstedt',449),(88,'Iserbrook',449),(89,'Sülldorf',449);
/*!40000 ALTER TABLE `stadtteile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_bild_upload`
--

DROP TABLE IF EXISTS `test_bild_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_bild_upload` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `bild` varchar(264) NOT NULL,
  PRIMARY KEY (`lfd_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_bild_upload`
--

LOCK TABLES `test_bild_upload` WRITE;
/*!40000 ALTER TABLE `test_bild_upload` DISABLE KEYS */;
INSERT INTO `test_bild_upload` VALUES (1,'DSC_0001.JPG'),(2,'DSC_0002.JPG'),(3,'DSC_0003.JPG'),(4,'Abla und ich b.JPG'),(5,'adnan ve ben3.jpg'),(6,'Alte Freunde.jpg'),(7,'Image1.jpg'),(8,'Memo ile Hatca.jpg'),(9,'MumAndDad.png');
/*!40000 ALTER TABLE `test_bild_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(264) NOT NULL,
  `land` char(2) NOT NULL,
  `geb_datum` date DEFAULT NULL,
  PRIMARY KEY (`trainer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=663 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (1,'Josep Guardiola','ES','1900-01-01'),(2,'Nuno Espírito Santo','ES','1900-01-01'),(3,'Diamantis Cholevas','DE','1900-01-01'),(4,'Olaf Ohrt','DE','1900-01-01'),(5,'Thorsten Beyer','DE','1900-01-01'),(6,'Denis Zepcan','DE','1900-01-01'),(7,'Christian Woike','DE','1900-01-01'),(8,'Frank Pieper-von Valtier','DE','1900-01-01'),(9,'Reinhardt Friedrichsen','DE','1900-01-01'),(10,'Randolf Lengler','DE','1900-01-01'),(11,'Markus Dolle','DE','1900-01-01'),(12,'Dirk Hellmann','DE','1900-01-01'),(13,'Wolfgang Geelhaar','DE','1900-01-01'),(14,'Andreas Höhn','DE','1973-10-24'),(15,'Karsten Drube','DE','1900-01-01'),(16,'Bernd Reinke','DE','1900-01-01'),(17,'Martin Schmidt','CH','1900-01-01'),(18,'Markus Remler','DE','1900-01-01'),(19,'Khatib Zakaria','DE','1900-01-01'),(20,'Jan Schönteich','DE','1900-01-01'),(21,'Luis Enrique Martínez García','ES','1900-01-01'),(22,'Patric Hoffmann','DE','1900-01-01'),(23,'Andreas Seega','DE','1900-01-01'),(24,'Hans-Jürgen Peinelt','DE','1900-01-01'),(25,'Andreas Schwilski','DE','1900-01-01'),(26,'Patrick Kawohl','DE','1900-01-01'),(27,'Pal Dardai','HU','1900-01-01'),(28,'Daniel Weber','DE','1900-01-01'),(29,'Mario Tanzer','DE','1900-01-01'),(30,'Mario Ermisch','DE','1900-01-01'),(31,'Ismail Atalan','DE','1900-01-01'),(32,'Julen Lopetegui','ES','1900-01-01'),(33,'Carlos Carstensen','DE','1900-01-01'),(34,'Besin Babic','DE','1900-01-01'),(35,'Thomas Schaaf','DE','1900-01-01'),(36,'Jonas Dal Andersen','DK','1900-01-01'),(37,'Niels Frederiksen','DK','1900-01-01'),(38,'Ali Farhadi','DE','1900-01-01'),(39,'Lutz Göttling','DE','1900-01-01'),(40,'Oliver Dittberner','DE','1900-01-01'),(41,'Stefan Gehrke','DE','1900-01-01'),(42,'Denny Skwierczynski','DE','1900-01-01'),(43,'Frank Hänel','DE','1900-01-01'),(44,'Jörn Jacobsen','DE','1900-01-01'),(45,'Olaf Poschmann','DE','1900-01-01'),(46,'Jürgen Hahn','DE','1900-01-01'),(47,'Normen Günther','DE','1900-01-01'),(49,'Rene Klawon','DE','1900-01-01'),(50,'Viktor Skripnik','UA','1969-11-19'),(51,'Tayfun Korkut','TR','1974-04-02'),(52,'Slaven Bilic','HR','1900-01-01'),(53,'Brendan Rodgers','EN','1900-01-01'),(54,'Mircea Lucescu','RO','1945-07-29'),(55,'Josef Zinnbauer','DE','1900-01-01'),(56,'Christian Streich','DE','1965-06-11'),(57,'Dieter Hecking','DE','1964-09-12'),(58,'Gertjan Verbeek','NL','1900-01-01'),(60,'Marco Fagin','DE','1900-01-01'),(61,'Uli Brüning','DE','1900-01-01'),(63,'Jos Luhukay','NL','1900-01-01'),(64,'Andreas Fricke','DE','1900-01-01'),(65,'Rudy Raab','DE','1900-01-01'),(67,'Lars Søndergaard','DK','1900-01-01'),(68,'Manuel Luis Pellegrini','CL','1900-01-01'),(69,'Patrick Vieira','FR','1976-06-23'),(70,'Heiko Vogel','DE','1975-11-21'),(71,'Torsten Henke','DE','1900-01-01'),(72,'Peter Paczkowski-Gutzeit','DE','1900-01-01'),(73,'Jürgen Klopp','DE','1967-06-16'),(74,'Bruno Labbadia','DE','1966-02-08'),(75,'Uwe Neuhaus','DE','1959-11-26'),(76,'Torsten Fröhling','DE','1966-08-24'),(77,'Florian Schlicker','DE','1981-01-02'),(78,'Maurice Steijn','NL','1973-11-20'),(79,'Martin Koopman','NL','1966-06-05'),(80,'Rudi Garcia','FR','1900-01-01'),(81,'Wolf Werner','DE','1942-04-08'),(82,'Rolf Schmitz','DE','1900-01-01'),(83,'Josip Skoblar','HR','1900-01-01'),(84,'Ottavio Bianchi','IT','1943-10-06'),(85,'Gerd-Volker Schock','DE','1950-04-08'),(86,'Jakob Schulze','DE','1900-01-01'),(87,'Marco Krausz','DE','1900-01-01'),(88,'Oliver Strey','DE','1900-01-01'),(89,'Frank Tuchlinski','DE','1900-01-01'),(90,'Hakan Aykurt','TR','1900-01-01'),(91,'Daniel Lechte','DE','1900-01-01'),(92,'John Klebér Saarenpää','SE','1900-01-01'),(94,'Christian Brand','DE','1972-05-23'),(95,'Thomas von Heesen','DE','1961-10-01'),(96,'Marcin Brosz','PL','1973-04-11'),(97,'Vasilis Vouzas','GR','1900-01-01'),(98,'Holger Seitz','DE','1900-01-01'),(99,'Marco Silva','PT','1900-01-01'),(100,'Nikos Pantelis','GR','1900-01-01'),(101,'Panagiotis Dilberis','GR','1900-01-01'),(102,'Zdenek Scasny','CZ','1900-01-01'),(103,'Staikos Vergetis','GR','1900-01-01'),(104,'Dirk Schuster','DE','1900-01-01'),(105,'Frank Salomon','DE','1964-06-18'),(106,'Ewald Lienen','DE','1900-01-01'),(107,'Norman Köhlitz','DE','1900-01-01'),(108,'Arsene Wenger','FR','1949-10-22'),(109,'Alexander Zorniger','DE','1957-10-08'),(110,'John Stegeman ','NL','1976-08-27'),(112,'Bülent Solak','TR','1900-01-01'),(113,'Kay Papenfuß','DE','1900-01-01'),(114,'Ilija Aracic','HR','1970-11-15'),(115,'Heiko Klemme','DE','1900-01-01'),(116,'Marcus Fürstenberg','DE','1900-01-01'),(117,'Bernd Ruhser','DE','1956-08-03'),(118,'Hartmut Mattfeldt','DE','1900-01-01'),(119,'Mentor Grapci','DE','1900-01-01'),(120,'Ruben Cousillas Fuse','AR','1957-05-19'),(121,'Armin Veh','DE','1961-02-01'),(122,'Erik ten Hag','NL','1970-02-02'),(123,'Roberto Pätzold','DE','1980-07-17'),(124,'Ralf Palapies','DE','1900-01-01'),(125,'Frank Hüllmann','DE','1900-01-01'),(126,'Jens Keller','DE','1970-11-24'),(127,'Marc Fascher','DE','1968-08-04'),(128,'Andreas Zimmermann','DE','1969-12-28'),(129,'Matthias Stuhlmacher','DE','1900-01-01'),(130,'Bülent Tinas','TR','1900-01-01'),(131,'Sven Siebert','DE','1900-01-01'),(132,'Carsten Schruhl','DE','1900-01-01'),(133,'Mirko Petersen','DE','1900-01-01'),(134,'Maxwell Phelps','DE','1964-12-21'),(135,'Domnik Fey','DE','1900-01-01'),(136,'Lucien Favre','CH','1957-11-02'),(137,'Jan Werth','DE','1900-01-01'),(138,'Sascha Sievers','DE','1900-01-01'),(139,'Daniel Jurgeleit','DE','1963-12-15'),(140,'Thomas Meggle','DE','1975-02-22'),(141,'Thomas Janiczek','DE','1900-01-01'),(142,'Ove Hinrichsen','DE','1900-01-01'),(143,'Vladimir Weiss','SK','1964-09-22'),(144,'Thomas Reinhardt','DE','1969-04-14'),(145,'Jan Jakobsen','DK','1973-10-02'),(146,'Lars landschof','DE','1900-01-01'),(147,'Roland Vrabec','DE','1974-03-06'),(148,'Joachim Philipkowski','DE','1961-02-26'),(149,'Ekkehard Bushe','nb','1900-01-01'),(150,'Dariusz Wdowczyk','PL','1962-09-25'),(151,'Henning Stille Berg','NO','1969-09-01'),(152,'Gerd Bruns','DE','1954-01-07'),(153,'Thorben Hoffmann','DE','1900-01-01'),(154,'n. n.','nb','1900-01-01'),(155,'Dietmar Demuth','DE','1955-01-14'),(156,'Michael Hiemisch','DE','1970-05-10'),(157,'Sebastian Gunkel','DE','1975-06-24'),(158,'Norbert Elgert','DE','1957-01-13'),(159,'Mario Block','DE','1972-01-07'),(160,'Helge Melzer','DE','1900-01-01'),(161,'Rodolfo Esteban Cardoso','AR','1968-10-17'),(162,'Thomas Bliemeister','DE','1956-04-10'),(163,'Mirko Slomka','DE','1967-09-12'),(164,'Andrea Mandorlini','IT','1960-07-17'),(165,'Mauricio Andres Pellegrino','AR','1971-10-05'),(166,'Torsten Lieberknecht','DE','1973-08-01'),(167,'Stephan Basmer','DE','1900-01-01'),(168,'Gerd Klaus','DE','1970-09-02'),(169,'Hendrik Baumgart','DE','1977-05-28'),(170,'Christian Stadler','DE','1973-06-02'),(171,'David Moyes','SS','1963-04-25'),(173,'Florian Gossow','DE','1900-01-01'),(174,'Boris Völker','DE','1900-01-01'),(175,'Rüdiger Brüggen','DE','1900-01-01'),(176,'Gody Hoedoafia','GH','1981-05-18'),(177,'Ole Timm','DE','1900-01-01'),(178,'Philipp Volkmer','DE','1900-01-01'),(179,'Sören Osterland','DE','1985-12-06'),(181,'Christoph Urbat','DE','1900-01-01'),(182,'Sebastian Wenchel','DE','1900-01-01'),(183,'Timo Klöfkorn','DE','1900-01-01'),(184,'Henning Bürger','DE','1969-12-16'),(185,'Stefan Köpke','DE','1900-01-01'),(186,'Thomas Schwantes','DE','1900-01-01'),(187,'Bert van Marwijk','NL','1952-05-19'),(188,'Peter Martens','DE','1900-01-01'),(190,'Marin Ion','RO','1955-03-25'),(191,'Faouzi Benzarti','TN','1950-01-03'),(192,'Marcello Lippi','IT','1900-01-01'),(193,'Alexi Stival','BR','1963-06-07'),(194,'Robin Dutt','DE','1965-01-24'),(196,'Oliver Stender','DE','1900-01-01'),(197,'Waldemar Meya','nb','1900-01-01'),(198,'Leonid Slutskiy','RU','1971-05-04'),(200,'Aleksandr Grishin','RU','1971-11-18'),(201,'Josef Pleticha','CZ','1900-01-01'),(202,'Thomas Tuchel','DE','1973-08-29'),(203,'Neziri Alexander','nb','1900-01-01'),(204,'Jose Molina','ES','1900-01-01'),(206,'Torsten Hoffmann','DE','1900-01-01'),(207,'Bernd Rode','DE','1900-01-01'),(208,'Holger Bichel','DE','1900-01-01'),(209,'Ingo Desombre','DE','1900-01-01'),(210,'Dennis Mitteregger','DE','1982-07-09'),(211,'Sami Hyypiä','FI','1973-10-07'),(212,'Sven Timmermann','DE','1971-07-02'),(213,'Uwe Koschinat','DE','1971-09-01'),(214,'Ramazan Yildirim','DE','1975-09-07'),(215,'Klaus Behla','DE','1953-12-21'),(216,'Tüncer Taner','TR','1900-01-01'),(217,'Michael Mathey','DE','1900-01-01'),(218,'Hardy Brüning','DE','1978-05-31'),(219,'Martin Heilck','DE','1900-01-01'),(220,'Torsten Sötje','DE','1900-01-01'),(221,'Thomas Titze','DE','1900-01-01'),(223,'Bernhard Trares','DE','1965-08-18'),(224,'Daniel Farke','DE','1976-10-30'),(225,'Carsten Puttfarken','DE','1900-01-01'),(226,'Nils Witte','DE','1900-01-01'),(227,'Vahid Haschemian','IR','1976-07-21'),(228,'Jose Mourinho','PT','1963-01-26'),(230,'Attila Pinter','HU','1966-05-07'),(231,'Stefan Kohfahl','DE','1968-06-26'),(232,'Karsten Neitzel','DE','1967-12-17'),(233,'Matthias Dischert','DE','1900-01-01'),(234,'Andre Pawlak','DE','1971-02-12'),(235,'Eric van der Luer','NL','1965-08-16'),(236,'Oliver Zapel','DE','1968-01-15'),(237,'Frank Schomann','DE','1968-11-02'),(238,'Mario Kuska','DE','1900-01-01'),(239,'Dierk Nattke','DE','1900-01-01'),(241,'Bruno Mönck','DE','1900-01-01'),(242,'Lars Poedtke','nb','1900-01-01'),(243,'Sven Schneppel','DE','1972-12-29'),(244,'Mike Büskens','DE','1968-03-19'),(245,'Ernst-Peter Schorn','DE','1900-01-01'),(246,'Jupp Heynckes','DE','1945-05-09'),(247,'Markus Weinzierl','DE','1974-12-28'),(248,'Juri Nikolajewitsch Sawitschew','RU','1965-02-13'),(249,'Benno Möhlmann','DE','1954-08-01'),(250,'Peter Pacult','AT','1959-10-28'),(251,'Francesc \"Tito\" Vilanova','ES','1968-09-17'),(252,'Benjamin Scherner','DE','1986-04-17'),(253,'Michael Wiesinger','DE','1972-12-27'),(254,'Muhamet Aslani','nb','1900-01-01'),(255,'Tiago Dos Santos Teixeira De Sousa','PT','1982-02-15'),(256,'Andreas Meyer','DE','1900-01-01'),(257,'Antonio Conte','IT','1969-07-31'),(258,'Thorsten Fink','DE','1967-10-29'),(259,'Uwe Neunsinger','DE','1971-02-26'),(260,'Dragan Lazic','DE','1969-11-12'),(261,'Tomas Oral','DE','1973-04-24'),(262,'Kosta Runjaic','DE','1971-06-04'),(263,'Zoran Mamic','HR','1971-09-30'),(264,'Mario Cvitanovic','HR','1975-05-06'),(265,'Ralph Hasenhüttl','AT','1967-08-09'),(266,'Norbert Meier','DE','1958-09-20'),(267,'Axel Giere','DE','1967-11-04'),(268,'Gerd Schädlich','DE','1952-12-30'),(269,'Jürgen Kramny','DE','1971-10-18'),(270,'Jörn Schwinkendorf','DE','1971-01-27'),(271,'Stefan Bergmann','DE','1962-05-12'),(272,'Thomas Rabe','DE','1958-07-16'),(273,'Uli Schulz','DE','1946-11-11'),(274,'Naderi Najib','AF','1984-02-22'),(275,'Claus Schromm','DE','1969-04-21'),(276,'Mehmet Scholl','DE','1970-10-16'),(277,'Jörn Geffert','DE','1967-12-10'),(278,'Hendrik Lampen','DE','1900-01-01'),(279,'Marco Erhardt','DE','1900-01-01'),(280,'Peter Moussalli','DE','1972-08-14'),(281,'Maik Poll','DE','1900-01-01'),(282,'Eugen Helmel','DE','1985-07-31'),(283,'Thomas Seeliger','DE','1966-09-20'),(284,'Michael Graf','DE','1900-01-01'),(285,'Knut Nolte','DE','1900-01-01'),(286,'Michael Frontzeck','DE','1964-03-26'),(287,'Michael Fischer','DE','1967-10-25'),(288,'Bernd Rasmus','DE','1900-01-01'),(289,'Markus Babbel','DE','1972-09-08'),(291,'Michael Noffz','DE','1964-12-02'),(292,'Poen Alcaron','AR','1971-09-06'),(293,'Viktor Goncharenko','BY','1977-06-10'),(295,'Matthias Räck','DE','1972-02-17'),(296,'Berkan Algan','DE','1977-03-29'),(297,'Frank Pagenkopf','DE','1961-08-29'),(299,'Karsten Weiß','DE','1900-01-01'),(300,'Bert Ehm','DE','1946-10-24'),(301,'Matthias Lust','DE','1970-04-27'),(302,'Achim Beierlorzer','DE','1967-11-20'),(303,'Ingo Jopp','DE','1900-01-01'),(304,'Andreas Dämmich','DE','1958-05-29'),(305,'Achtar Loudin','AF','1900-01-01'),(306,'Ulf Pfützenreuter','DE','1900-01-01'),(308,'Mario Weiß','DE','1900-01-01'),(309,'Denis Wucherpfennig','DE','1900-01-01'),(310,'Jaime Pacheco','PT','1958-07-22'),(311,'Takeshi Okada','JP','1956-08-25'),(312,'Friedhelm Mienert','DE','1965-08-19'),(313,'Henrik Voigt','DE','1971-04-18'),(314,'Nathalie Bischof','DE','1979-05-03'),(315,'Jürgen Ehrmann','DE','1961-02-23'),(316,'Roberto di Matteo','IT','1970-05-29'),(317,'Frank Schmöller','DE','1966-08-21'),(318,'Michael Hochrein','DE','1964-02-04'),(319,'Frank Rohde','DE','1960-03-02'),(320,'Harry Rath ','DE','1956-02-01'),(321,'Kim Koitka','DE','1979-08-30'),(322,'Frank Schäfer','DE','1963-10-26'),(323,'Holger Dobelstein','DE','1965-12-24'),(324,'Michael Dürr','DE','1900-01-01'),(325,'Thorsten Bettin','DE','1965-10-09'),(326,'Dogan Inam','TR','1967-11-07'),(327,'Mike Breitmeier','DE','1970-11-03'),(329,'Jerzy Klukowski','PL','1900-01-01'),(330,'Jörg Schwanke','DE','1969-01-12'),(331,'Didier Deschamps','FR','1968-09-15'),(332,'Rossen Atanassov','BG','1969-06-05'),(333,'Achim Feifel','DE','1964-08-03'),(334,'Thomas Wörle','DE','1982-02-11'),(335,'Thorsten Dick','DE','1900-01-01'),(336,'Frank Schirrmacher','DE','1900-01-01'),(337,'Christian Bröhl','DE','1900-01-01'),(338,'Jörg Bittner','DE','1900-01-01'),(339,'Sebastian Scherer','DE','1976-07-01'),(340,'Jan Feldmeier','DE','1965-01-15'),(341,'Christian Pletz','DE','1900-01-01'),(342,'Volker Koppelt','DE','1947-03-22'),(343,'Harald Wenzing','DE','1966-01-09'),(344,'Patrikk Ernst','DE','1972-09-16'),(345,'Roger Schmidt','DE','1967-03-13'),(346,'Savio Medeira','IN','1965-03-20'),(347,'Holger Kurth','DE','1900-01-01'),(348,'Michael Deuerling','DE','1900-01-01'),(349,'Bernd-Uwe Lange','DE','1900-01-01'),(350,'Heiko Rohweder','DE','1900-01-01'),(351,'Holger Brück','DE','1900-01-01'),(352,'Andries Jonker','NL','1962-09-22'),(353,'Walter Mazzarri','IT','1961-10-01'),(354,'Dennis Peper','DE','1900-01-01'),(355,'Frank Papenberg','DE','1900-01-01'),(356,'Andreas Führer','DE','1974-07-17'),(357,'Ralf Rangnick','DE','1958-06-29'),(358,'Goran Vucic','CS','1969-11-05'),(359,'David Sassarini','IT','1900-01-01'),(360,'Gianni Tortolo','IT','1900-01-01'),(361,'Burhan Öztürk','TR','1975-12-16'),(362,'Cevdet Atik','nb','1900-01-01'),(363,'Gerhard Najjar','DE','1900-01-01'),(364,'Michael Oenning','DE','1965-09-27'),(365,'Stephan Beckenbauer','DE','1968-12-01'),(366,'Roman Tyce','CZ','1977-05-07'),(367,'Markus Kauczinski','DE','1970-08-07'),(368,'Darko Milanic','SI','1967-12-18'),(369,'Alistair Murdoch McCoist','SS','1962-09-24'),(370,'Urs Fischer','CH','1966-06-20'),(371,'Ivo Bacic','HR','1973-10-16'),(372,'Mario Demmelbauer','DE','1975-01-23'),(373,'Oliver Schweißing','DE','1971-03-03'),(374,'Felix Magath','DE','1953-07-26'),(375,'Marcel Greve','DE','1900-01-01'),(376,'Thomas Giza','DE','1963-03-08'),(377,'Frank Gläser','DE','1900-01-01'),(378,'Arne Baumann','DE','1900-01-01'),(379,'Heiko Weber','DE','1965-06-26'),(380,'Jogi Meyer','DE','1968-08-13'),(381,'Jens Paeslack','DE','1974-02-25'),(382,'Thomas Hoffmann','DE','1969-02-12'),(383,'Andreas Prohn','DE','1900-01-01'),(385,'Joachim Press','DE','1900-01-01'),(386,'Friedhelm Lübken','DE','1900-01-01'),(387,'Wolfgang Schmidt','DE','1900-01-01'),(388,'Holger Stanislawski','DE','1969-09-26'),(390,'Eurico Peireira de Barros','PT','1900-01-01'),(391,'Matthias Missullis','DE','1964-08-02'),(392,'Marco Wagner','DE','1900-01-01'),(393,'Robert Jung','DE','1944-12-19'),(394,'Rainer Ulrich','DE','1949-06-04'),(395,'Petrik Sander','DE','1960-11-17'),(396,'Manfred Nitschke','DE','1948-04-18'),(397,'Jörg Stölben','DE','1900-01-01'),(398,'Gino Lettieri','IT','1966-12-23'),(399,'Hermann Gerland','DE','1954-06-04'),(400,'Maik Walpurgis','DE','1973-10-09'),(401,'Armin Perrey','DE','1965-08-19'),(402,'Ronald Lotz','DE','1966-09-21'),(403,'Louis van Gaal','NL','1950-08-08'),(404,'Jens Reckmann','DE','1900-01-01'),(406,'Klaus Meixner','DE','1971-08-14'),(407,'Leonardo Nascimento de Araujo','BR','1969-09-05'),(408,'Marco Pezzaiuoli','DE','1968-11-16'),(409,'Thomas Möller','DE','1900-01-01'),(410,'Adnan Dirjal Mutar','IQ','1959-01-26'),(411,'Bruno Metsu','FR','1954-01-28'),(412,'Vadim Abramov','AZ','1962-08-05'),(413,'Claudio Ranieri','IT','1951-10-20'),(414,'Shang Ruihua','CN','1944-11-18'),(415,'Sorin Cartu','RO','1955-11-12'),(416,'Jörn Großkopf','DE','1966-08-29'),(417,'Matthias Nagel','DE','1900-01-01'),(418,'Stephan Roesler','DE','1970-02-02'),(419,'Remigius Elert','DE','1977-01-21'),(420,'Henning Seemann','DE','1900-01-01'),(421,'Arne Witt','DE','1900-01-01'),(422,'Meik Ehlert','DE','1971-06-29'),(423,'Arie van Lent','NL','1970-08-31'),(424,'Ioan Andone','RO','1960-03-15'),(425,'Christian Ziege','DE','1972-02-01'),(426,'Christian Hock','DE','1970-04-11'),(427,'Ingo Kahlisch','DE','1956-08-05'),(428,'Volker Löbenberg','DE','1956-12-16'),(429,'Günther Wörle','DE','1949-10-01'),(430,'Dariusz Wosz','DE','1969-06-08'),(431,'Christian Wück','DE','1973-06-09'),(432,'Andreas Klobedanz','DE','1963-06-28'),(433,'Peter Ehlers','DE','1966-09-04'),(434,'Daniel Sager','DE','1979-06-10'),(435,'Heiko Herrlich','DE','1971-12-03'),(436,'Ciro Ferrara','IT','1967-02-11'),(437,'Andreas Bergmann','DE','1959-06-18'),(438,'Thomas Wolter','DE','1963-10-04'),(439,'Thomas Grunenberg','DE','1955-11-02'),(440,'Said Farhadi','nb','1900-01-01'),(441,'Laurent Blanc','FR','1965-11-19'),(442,'Uwe Fuchs','DE','1966-07-23'),(443,'Sascha Koch','DE','1978-03-15'),(444,'Raimund Bertels','DE','1967-07-16'),(445,'Peter Hogen','DE','1961-07-13'),(446,'Ramon Berndroth','DE','1900-01-01'),(447,'Marco Roth','DE','1973-04-17'),(448,'Huub Stevens','NL','1953-11-29'),(449,'Stefan Tutschka','DE','1966-03-06'),(451,'Christian Sedlmeier','DE','1900-01-01'),(453,'Manfred Mattes','DE','1952-05-01'),(454,'Hubert Müller','DE','1952-08-22'),(455,'Roger Reijners','NL','1964-02-10'),(456,'Carrel Segner','DE','1966-08-29'),(457,'Bojan Prasnikar','SI','1953-02-03'),(458,'Alexander Schäfke','DE','1900-01-01'),(459,'Jürgen Klinsmann','DE','1964-07-30'),(460,'Stefan Emmerling','DE','1966-02-10'),(461,'Matthias Bub','DE','1900-01-01'),(462,'Mohamed Amiq','MA','1949-07-07'),(463,'Uwe Erkenbrecher','DE','1954-11-14'),(464,'Andreas Reinke','DE','1900-01-01'),(465,'Jan Rohde','DE','1900-01-01'),(466,'Paulo Bento','PT','1969-06-20'),(467,'Dominique Bathenay','FR','1954-02-13'),(468,'Claude Puel','FR','1961-09-02'),(469,'Nasser Al Johar','SA','1900-01-01'),(470,'Detlef Ullrich','DE','1955-11-28'),(471,'Hans Meyer','DE','1942-11-03'),(472,'Cesare Prandelli','IT','1957-08-19'),(473,'Edmund Becker','DE','1956-07-18'),(474,'Selcuk Turan','TR','1971-07-12'),(475,'Stuart Baxter','EN','1953-08-16'),(476,'Joachim Löw','DE','1960-02-03'),(477,'Frank Stolina','DE','1900-01-01'),(478,'Martin Jol','NL','1956-01-16'),(479,'Dirk Helmig','DE','1965-05-03'),(480,'Karl-Heinz Pflipsen','DE','1970-10-31'),(481,'Christoph John','DE','1958-12-24'),(482,'Hans-Peter Schubert','DE','1966-06-14'),(483,'Reinhold Fanz','DE','1954-01-16'),(484,'Andre Trulsen','DE','1965-05-28'),(485,'Peter Vernickel','DE','1900-01-01'),(486,'Carlos Roberto Pereira','BR','1900-01-01'),(487,'Ottmar Hitzfeld','DE','1949-01-12'),(489,'Rüdiger Schwarz','DE','1900-01-01'),(490,'Dick Advocaat','NL','1947-09-27'),(491,'Thomas Doll','DE','1966-04-09'),(493,'Theo Schneider','DE','1960-08-23'),(494,'Sissy Raith','DE','1960-06-11'),(495,'Ladislav Pecko','SK','1900-01-01'),(496,'Josef Mazura','SK','1900-01-01'),(497,'Ariel Jacobs','BE','1953-07-25'),(498,'Valerien Ismael','FR','1975-09-28'),(499,'Michael Krüger','DE','1954-05-28'),(500,'Jimmy Calderwood','SS','1955-02-28'),(501,'Frank Pagelsdorf','DE','1958-02-05'),(502,'Ralf Loose','DE','1963-01-05'),(503,'Seweryn Malyk ','nb','1900-01-01'),(504,'Ernst Middendorp','DE','1958-10-28'),(505,'Manuel Machado','PT','1955-12-04'),(506,'Oliver Berndt','DE','1900-01-01'),(507,'Rainer Adrion','DE','1953-12-10'),(508,'Rainer Krieg','DE','1968-02-02'),(509,'Mo Johnston','SS','1963-04-30'),(510,'Stephen Nicol','SS','1961-12-11'),(511,'Rai­ner Beth','DE','1900-01-01'),(512,'Jorge Fernando Pinheiro de Jesus','PT','1954-07-24'),(513,'Tomasz Kaczmarek','PL','1984-09-20'),(514,'Florian Schnorrenberg','DE','1977-04-16'),(516,'José Antonio Camacho','ES','1955-06-08'),(517,'John Toshack','WW','1949-03-22'),(518,'Peter Zeidler','DE','1962-08-08'),(519,'Steve McClaren','EN','1900-01-01'),(520,'Gregorio Manzano','ES','1956-08-05'),(521,'Marco Schällibaum','CH','1962-04-06'),(522,'Mirko Votava','DE','1956-04-25'),(523,'Kurt Niedermayer','DE','1955-11-25'),(524,'Heino Stemmann','DE','1900-01-01'),(525,'Alfons Weusthof ','DE','1958-05-24'),(526,'Klaus-Peter Nemet','DE','1953-12-09'),(527,'Carlo Ancelotti','IT','1959-06-10'),(528,'Stylianos Vamvakidis','GR','1972-09-11'),(529,'Falko Götz','DE','1962-03-26'),(530,'Fabio Capello','IT','1946-06-18'),(531,'Jürgen Röber','DE','1953-12-25'),(532,'Didier Philippe','FR','1961-09-28'),(533,'Winfried Schäfer','DE','1950-01-10'),(534,'Albert Emon','FR','1953-06-24'),(535,'Rene Weidmann','DE','1900-01-01'),(536,'Bernd Hollerbach','DE','1969-12-08'),(537,'Dietmar Herhaus','DE','1900-01-01'),(538,'Lars Jagemann','DE','1900-01-01'),(539,'Elard Ostermann','DE','1968-10-15'),(540,'Ingo Kock','DE','1900-01-01'),(541,'Klaus Augenthaler','DE','1957-09-26'),(543,'Patrick Werner','DE','1975-08-21'),(544,'Giampaolo Mazza','IT','1956-02-26'),(545,'Kent Nielsen','DK','1961-12-28'),(546,'Troels Bech Hansen','DK','1966-07-29'),(547,'Karsten Bäron','DE','1973-04-24'),(548,'Dirk Heyne','DE','1957-10-10'),(549,'Timo Kauer','DE','1900-01-01'),(550,'Oleg Blochin','RU','1952-11-05'),(551,'Ricardo Antonio La Volpe Quarchione','AR','1952-02-06'),(553,'Jurijs Andrejevs','LV','1957-01-16'),(554,'Bruce Arena','US','1951-09-21'),(555,'Leigh Cowlishaw','EN','1970-12-16'),(556,'Frank Behrmann','DE','1900-01-01'),(557,'Wolfgang Wolf','DE','1957-09-24'),(558,'Friedhelm Funkel','DE','1953-12-10'),(559,'Khaled Ben Yahia','TN','1959-11-12'),(560,'Henri Stambouli','FR','1961-08-05'),(561,'Bernd Rehder','DE','1900-01-01'),(562,'Patrick Heßmann','DE','1900-01-01'),(563,'Hanspeter Latour','CH','1947-06-04'),(564,'Jürgen Kohler','DE','1965-10-06'),(565,'Hassan Shehata','EG','1949-06-19'),(566,'Ilija Loncarevic','HR','1944-10-08'),(567,'Stephen Keshi','NG','1962-01-23'),(568,'Claude Le Roy','FR','1948-02-06'),(569,'Roger Lemerre','FR','1941-06-18'),(570,'Kalusha Bwalya','ZM','1963-08-16'),(571,'Ali Parvin','IR','1946-10-12'),(573,'Pavel Dotchev','BG','1965-09-28'),(574,'Jan Ceulemans','BE','1957-02-28'),(575,'Uwe Rapolder','DE','1958-05-29'),(576,'Ayrton Andrioli','BR','1900-01-01'),(577,'Guus Hiddink','NL','1946-11-08'),(578,'John Adshead','NZ','1942-03-27'),(579,'Pierre Littbarski','DE','1960-04-16'),(580,'Carsten Hinrichsen','DE','1900-01-01'),(581,'Dubau Lars','DE','1900-01-01'),(583,'Stefan Böger','DE','1966-06-01'),(584,'Lawrie Sanchez','nn','1959-10-22'),(585,'Donald Joseph Givens','IE','1949-08-09'),(586,'Guy Levy','IL','1966-09-08'),(587,'Matthias Sammer','DE','1967-09-05'),(588,'Peter Neustädter','DE','1966-02-16'),(589,'Hans-Werner Moser','DE','1965-09-24'),(590,'Ralf Schehr','DE','1953-10-28'),(593,'Martin Strötzel','DE','1963-10-09'),(594,'Andrew Pfennig','DE','1962-01-01'),(595,'Eric Gerets','BE','1954-05-18'),(596,'Bernd Schröder','DE','1942-07-22'),(597,'Jelle Goes','NL','1960-03-26'),(598,'Dusan Galis','SK','1949-11-24'),(599,'Mecki Brunner','DE','1960-07-11'),(600,'Rini Coolen','NL','1967-02-10'),(601,'Gert Kruys','NL','1961-05-08'),(602,'Wolfgang Maes','DE','1951-12-20'),(603,'Uwe Weidemann','DE','1963-06-14'),(604,'Zaki Badou','MA','1959-04-02'),(605,'Twahir Muhiddin','KE','1900-01-01'),(606,'Olaf Lehmann','DE','1900-01-01'),(607,'Gerd Heuermann','DE','1967-12-26'),(608,'Theo Vonk','NL','1947-12-16'),(609,'Peter Neururer','DE','1955-04-26'),(610,'Eduard Geyer','DE','1944-10-07'),(611,'Wolfgang Steinbach','DE','1954-09-21'),(612,'Petr Ulicny','CZ','1950-02-11'),(613,'Frantisek Straka','CZ','1958-05-21'),(614,'Jörg Goslar','DE','1963-12-29'),(615,'Juri Schlünz','DE','1961-07-27'),(616,'Frank Bernhardt','DE','1969-08-26'),(617,'Ingo Peter','DE','1951-10-23'),(618,'Manfred Lorenz','DE','1948-08-26'),(619,'Nir Klinger','IL','1966-05-25'),(620,'Hubert Hüring','DE','1950-05-27'),(621,'Klaus Toppmöller','DE','1951-08-12'),(622,'Werner Kasper','DE','1951-10-06'),(623,'Holger Fach','DE','1962-09-06'),(624,'Frank Neubarth','DE','1962-07-29'),(625,'Frank Wormuth','DE','1960-09-13'),(626,'Jürgen Stoffregen','DE','1957-03-10'),(627,'Jens Martens','DE','1900-01-01'),(628,'Kurt Jara','AT','1950-10-14'),(629,'Pat Fenlon','IE','1959-03-15'),(630,'Stephen Kenny','IE','1971-10-30'),(631,'Brian Kerr','IE','1953-03-03'),(632,'Anghel Iordanescu','RO','1950-05-04'),(633,'Jürgen Domzalski','DE','1900-01-01'),(634,'Michael Richter','DE','1963-12-02'),(635,'Kurt Garger','AT','1960-09-15'),(636,'Peter Flicker','AT','1964-08-14'),(637,'Rudi Völler','DE','1960-04-13'),(638,'Thomas Buchauer','DE','1900-01-01'),(639,'Gerhard Kleppinger','DE','1958-03-01'),(640,'Aykut Kocaman','TR','1965-04-05'),(641,'Yunus Altun','TR','1977-07-25'),(642,'Wolfgang Nitschke','nb','1900-01-01'),(643,'Christof Kempny','DE','1959-11-26'),(644,'Benny Reiter','LU','1958-10-14'),(645,'Bernd Dietze','DE','1900-01-01'),(646,'Holger Menzel','DE','1900-01-01'),(647,'Jaroslav Hrebik','CZ','1948-12-14'),(648,'Marcus Marin','DE','1966-12-13'),(649,'Franz Gerber','DE','1953-11-27'),(650,'Evgeni Kucherevski','UA','1941-08-06'),(651,'Victor da Silva','nb','1900-01-01'),(652,'Jörg Meinhardt','DE','1964-10-09'),(653,'Peter Cestonaro','DE','1954-05-14'),(654,'Walter Hörmann','AT','1961-09-13'),(655,'Senol Günes','TR','1952-06-01'),(656,'Torsten Gütschow','DE','1962-07-28'),(657,'Sven Wilke','DE','1900-01-01'),(658,'Hans-Werner Moors','DE','1950-07-24'),(659,'Rainer Pomerenke','DE','1900-01-01'),(660,'Niko Kovac','HR','1971-10-15'),(661,'Stoicho Stoev','BG','1962-08-15'),(662,'Nikolay Kostov','BG','1963-07-02');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `benutzer` varchar(15) COLLATE utf8_bin NOT NULL,
  `passwort` varchar(40) COLLATE utf8_bin DEFAULT NULL,
  `admin` char(1) COLLATE utf8_bin DEFAULT NULL,
  `status` char(1) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `loginCount` smallint(6) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `timeOut` datetime DEFAULT NULL,
  `logoutTime` datetime DEFAULT NULL,
  `onlineTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`,`benutzer`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (19,'kai','5328bef60ee5ad9876f50bd0d358b4c59187a63a','J','B','',0,NULL,NULL,'2018-07-23 03:17:27',NULL),(20,'test','29188fc37b7c70d80184f94aa891679edda7f7fe','N','O','',0,NULL,NULL,NULL,NULL),(21,'sek','88ed0f8c77939191699c58aa023e1262a9c4d531','J','B','',0,NULL,NULL,NULL,'2018-10-14 18:07:43'),(22,'test2','51e31108b4b7debc379feb5ceddbc7f9fa65e63b','N','O','',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verbaende`
--

DROP TABLE IF EXISTS `verbaende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verbaende` (
  `verband_id` int(11) NOT NULL AUTO_INCREMENT,
  `verbandname` varchar(64) NOT NULL,
  `land` char(2) NOT NULL,
  `abk` varchar(10) DEFAULT NULL,
  `wappen` varchar(264) DEFAULT NULL,
  PRIMARY KEY (`verband_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verbaende`
--

LOCK TABLES `verbaende` WRITE;
/*!40000 ALTER TABLE `verbaende` DISABLE KEYS */;
INSERT INTO `verbaende` VALUES (1,'Die Liga – Fußballverband e. V.','DE','DFL',NULL),(2,'Deutscher Fußball-Bund','DE','DFB',NULL),(3,'Union of European Football Associations','WD','UEFA',NULL),(4,'Fédération Internationale de Football Association','WD','FIFA',NULL),(5,'Confederación Sudamericana de Fútbol','WD','CONMEBOL',NULL),(6,'Confederation of North, Central America and Caribbean Associatio','WD','CONCACAF',NULL),(7,'Oceania Football Confederation','WD','OFC',NULL),(8,'Confederation of African Football','WD','CAF',NULL),(9,'Asian Football Confederation','WD','AFC',NULL),(10,'Türkiye Futbol Federasyonu ','TR','TFF',NULL),(11,'Real Federación Española de Fútbol','ES','RFEF',NULL),(12,'The Football Association ','EN','FA',NULL),(13,'Fédération Française de Football','FR','FFF',NULL);
/*!40000 ALTER TABLE `verbaende` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vereine`
--

DROP TABLE IF EXISTS `vereine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vereine` (
  `verein_id` int(11) NOT NULL AUTO_INCREMENT,
  `vereinsname` varchar(264) CHARACTER SET latin1 NOT NULL,
  `gaengiger_name` varchar(264) DEFAULT NULL,
  `gr_datum` datetime DEFAULT NULL,
  `land` char(2) CHARACTER SET latin1 NOT NULL,
  `ort` int(11) NOT NULL,
  `historie` longtext CHARACTER SET latin1,
  `liga_id` int(11) DEFAULT NULL,
  `spitzname` varchar(264) CHARACTER SET latin1 DEFAULT NULL,
  `stadtteil` int(11) DEFAULT NULL,
  PRIMARY KEY (`verein_id`)
) ENGINE=InnoDB AUTO_INCREMENT=809 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vereine`
--

LOCK TABLES `vereine` WRITE;
/*!40000 ALTER TABLE `vereine` DISABLE KEYS */;
INSERT INTO `vereine` VALUES (1,'Fußball Club Bayern München','FC Bayern München','1900-02-27 00:00:00','DE',220,NULL,NULL,'Die Roten',NULL),(2,'','Valencia Club de Futbol','1900-01-01 00:00:00','ES',1040,NULL,NULL,NULL,NULL),(3,'','SC Poppenbüttel v. 1930','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(4,'','Wandsbeker TSV Concordia v. 1881','2013-03-27 00:00:00','DE',449,NULL,NULL,'\"Cordi\"',39),(5,'','Klub Kosova von 1977','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(6,'','TuS Finkenwerder v, 1893','1893-03-11 00:00:00','DE',449,'<font class=\"titelBlau\">TuS Finkenwerder<br>\n                                        Postfach 95 01 32<br>\n                                        21129&nbsp;Hamburg<br>\n<br>Tel.: 040-742 58 11<br>Fax: 040-742 58 11</font>',NULL,NULL,27),(7,'Sport Club Victoria Hamburg','SC Victoria Hamburg','1895-05-05 00:00:00','DE',449,'<br>',NULL,'\"Vicky\"',84),(8,'Hamburger Sportverein Barmbek-Uhlenhorst v. 1923','HSV Barmbek-Uhlenhorst v. 1923','1923-10-15 00:00:00','DE',449,'<br>',NULL,'BU',83),(9,'Sport Cöub Condor von 1956','SC Condor v. 1956','1956-07-13 00:00:00','DE',449,NULL,NULL,'Die Raubvögel',26),(11,'VfL Lohbrügge v. 1892 1. Alte Herren','VfL Lohbrügge v. 1892 1. Alte Herren','1892-01-01 00:00:00','DE',449,NULL,NULL,NULL,43),(12,'Hamburger Sportverein Barmbek-Uhlenhorst v. 1923 1. Alte Herren','HSV Barmbek-Uhlenhorst v. 1923 1. Alte Herren','1923-10-23 00:00:00','DE',449,'<br>',NULL,'BU',83),(13,'Hamburger Fußball-Club Falke e. V.','HFC Falke e. V.','2014-07-14 00:00:00','DE',449,NULL,NULL,'die Falken',23),(14,'SV West-Eimsbüttel v. 1923','SV West-Eimsbüttel v. 1923','1923-04-05 00:00:00','DE',449,NULL,NULL,'Wespe',69),(16,'HSV Barmbek-Uhlenhorst v. 1923 II','HSV Barmbek-Uhlenhorst v. 1923 II','1923-10-15 00:00:00','DE',449,NULL,NULL,'BU',83),(17,'FC Eintracht Norderstedt v. 2003 II','FC Eintracht Norderstedt v. 2003 II','2003-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(18,'SG Union/Grabau','SG Union/Grabau','1900-01-01 00:00:00','DE',37,NULL,NULL,NULL,NULL),(19,'Sport Interessen Gemeinschaft Elmenhorst','S. I. G. Elmenhorst','1976-01-01 00:00:00','DE',1041,NULL,NULL,NULL,NULL),(20,'1. Fußball- und Sportverein Mainz 05 e. V.','1. FSV Mainz 05','1905-03-16 00:00:00','DE',205,NULL,NULL,NULL,NULL),(21,'','Wintersportverein Isartal / Icking e. V.','1900-01-01 00:00:00','DE',1038,NULL,NULL,NULL,NULL),(22,'','1. FC Weidach e. V. II','1900-01-01 00:00:00','DE',1042,NULL,NULL,NULL,NULL),(23,'TuS Dassendorf e. V. v. 1948','TuS Dassendorf e. V. v. 1948','1948-01-01 00:00:00','DE',90,NULL,NULL,NULL,NULL),(24,'Futbol Club Barcelona','FC Barcelona','1899-11-29 00:00:00','ES',414,NULL,NULL,'Barca',NULL),(25,'Sportvereinigung Billstedt-Horn v. 1891 e. V.','S. V. Billstedt-Horn v 1891','1891-01-01 00:00:00','DE',449,NULL,NULL,'Bille-Horn',13),(26,'','TuS Hoisdorf v. 1958 II','1958-01-01 00:00:00','DE',154,NULL,NULL,NULL,NULL),(27,'','Rümpeler SV','1900-01-01 00:00:00','DE',1043,NULL,NULL,NULL,NULL),(28,'Deutsche Jugendkraft Lübeck e. V.','DJK Lübeck e. V.','1954-12-06 00:00:00','DE',195,NULL,NULL,NULL,NULL),(29,'','Lübecker SV Gut Heil v. 1876 e. V. II','1900-01-01 00:00:00','DE',195,NULL,NULL,NULL,NULL),(30,'Hertha Berliner Sport Club e. V.','Hertha BSC','1892-06-25 00:00:00','DE',42,NULL,NULL,NULL,NULL),(31,'','VfR Garching v. 1921 e. V.','1900-01-01 00:00:00','DE',1044,NULL,NULL,NULL,NULL),(32,'','SV Schalding-Heining e. V.','1956-05-22 00:00:00','DE',1045,NULL,NULL,NULL,NULL),(33,'','SV Rödinghausen','1900-01-01 00:00:00','DE',1046,NULL,NULL,NULL,NULL),(34,'','VfL Sportfreunde Lotte e. V. v. 1929','1900-01-01 00:00:00','DE',194,NULL,NULL,NULL,NULL),(35,'Futebol Clube do Porto','FC Porto','1893-09-28 00:00:00','PT',1047,NULL,NULL,'Super Dragoes',NULL),(36,'','TSV St. Peter-Ording','1900-01-01 00:00:00','DE',1048,NULL,NULL,NULL,NULL),(37,'','TSV Hattstedt e. V. v. 1935 II','1900-01-01 00:00:00','DE',1049,NULL,NULL,NULL,NULL),(38,'','Eintracht Frankfurt','1900-01-01 00:00:00','DE',116,NULL,NULL,NULL,NULL),(39,'','Hobro Idraets Klub','1900-01-01 00:00:00','DK',1050,NULL,NULL,NULL,NULL),(40,'','Esbjerg fB','1900-01-01 00:00:00','DK',1051,NULL,NULL,NULL,NULL),(41,'','Niendorfer TSV v. 1919','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(43,'Verein für Leibesübungen Pinneberg e. V. III','VfL Pinneberg e. V. III','1945-12-01 00:00:00','DE',259,NULL,NULL,NULL,NULL),(44,'','Altonaer FC v. 1893','1893-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(45,'Turn- und Sportverein Havelse 1912 e. V.','TSV Havelse 1912 e. V.','1912-08-05 00:00:00','DE',1053,NULL,NULL,NULL,NULL),(46,'Verein für Bewegungsspiele Lübeck von 1919 e. ','VfB Lübeck v. 1919','1919-06-01 00:00:00','DE',195,NULL,NULL,NULL,NULL),(47,'Sport-Club Vier- und Marschlande von 1899 e. V.','SC Vier- und Marschlande von 1899 e. V','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,40),(48,'','SV Hörnerkirchen e. V. II','1900-01-01 00:00:00','DE',1052,NULL,NULL,NULL,NULL),(49,'','SV Atlas Delmenhorst','2012-04-04 00:00:00','DE',1054,NULL,NULL,NULL,NULL),(50,'','Spiel- und Turnverein Voslapp v. 1949','1900-01-01 00:00:00','DE',330,NULL,NULL,NULL,NULL),(51,'Buxtehuder Sportverein v. 1862 e. v.','Buxtehuder SV v. 1862 e. v.','1862-08-05 00:00:00','DE',81,NULL,NULL,'BSV',NULL),(52,'Sport-Verein „Werder“ v. 1899 e. V.','SV Werder Bremen','1899-02-04 00:00:00','DE',70,NULL,NULL,'Fischköppe',NULL),(53,'Hannoversche Sportverein von 1896 e.V.','Hannover 96','1896-04-12 00:00:00','DE',141,NULL,NULL,'HSV',NULL),(54,'Beikta Jimnastik Kulübü','Besiktas','1903-03-19 00:00:00','TR',422,NULL,NULL,NULL,NULL),(55,'Liverpool Football Club','Liverpool FC','1892-06-03 00:00:00','EN',1055,NULL,NULL,'the Reds',NULL),(56,'','FK Schachtar Donezk','1900-01-01 00:00:00','UA',1057,NULL,NULL,NULL,NULL),(57,'Hamburger Sportverein','HSV','1887-09-29 00:00:00','DE',449,NULL,NULL,'HSV',69),(58,'Sport-Club Freiburg e. V.','Sport-Club Freiburg','1904-05-30 00:00:00','DE',120,NULL,NULL,'\"Breisgau-Brasilianer\"',NULL),(59,'Hamburger Sportverein IV','Hamburger SV IV','1887-09-29 00:00:00','DE',449,NULL,NULL,'HSV',NULL),(60,'Freie Turn- und Sportvereinigung Komet Blankenese von 1907 e. V.','FTSV Komet Blankenese von 1907 e. V.','1907-05-07 00:00:00','DE',449,NULL,NULL,NULL,15),(61,'VfL Wolfsburg-Fußball GmbH','VfL Wolfsburg','1945-09-12 00:00:00','DE',333,NULL,NULL,'Wölfe',NULL),(62,'Verein für Leibesübungen Bochum 1848 Fußballgemeinschaft e.V.','VfL Bochum','1938-04-14 00:00:00','DE',53,NULL,NULL,NULL,NULL),(63,'Hamburg-Eimsbütteler Ballspiel-Club von 1911 e.V.','Hamburg-Eimsbütteler Ballspiel-Club e.V.','1911-08-13 00:00:00','DE',449,NULL,NULL,'HEBC',23),(64,'Eimsbütteler Turnverband e. V.','Eimsbütteler Turnverband e. V.','1889-06-12 00:00:00','DE',449,NULL,NULL,'ETV',23),(65,'','FC Internationale Berlin 1980 e. V.','1900-01-01 00:00:00','DE',42,NULL,NULL,NULL,NULL),(66,'','SV Empor Berlin','1900-01-01 00:00:00','DE',42,NULL,NULL,NULL,NULL),(67,'Sønderjysk Elitesport','Sonderjysk Elitesport','2004-01-01 00:00:00','DK',1058,NULL,NULL,'SønderjyskE',NULL),(68,'Manchester City Football Club','Manchester City FC','1900-01-01 00:00:00','EN',342,NULL,NULL,'The Citizens',NULL),(69,'','Manchester City FC U 19','1900-01-01 00:00:00','EN',1059,NULL,NULL,NULL,NULL),(70,'FC Bayern München U 19','FC Bayern München U 19','1900-02-27 00:00:00','DE',220,NULL,NULL,'Die Roten',NULL),(71,'SV Curslack-Neuengamme v. 1919 e. V','SV Curslack-Neuengamme v. 1919 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,18),(72,'Ballspielverein Borussia 09 e.V. Do','Borussia Dortmund','1909-12-19 00:00:00','DE',92,NULL,NULL,NULL,NULL),(73,'Sportgemeinschaft Dynamo Dresden e. V.','SG Dynamo Dresden','1953-04-12 00:00:00','DE',71,NULL,NULL,NULL,NULL),(74,'','TSV 1860 München II','1900-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(76,'SVS - Spielverein Seligenporten e.V.','SV Seligenporten','1949-07-23 00:00:00','DE',1060,NULL,NULL,'Die Klosterer',NULL),(77,'Venlose Voetbal Vereniging Venlo','VVV-Venlo','1903-02-07 00:00:00','NL',1061,NULL,NULL,NULL,NULL),(78,'Rooms Katholieke Combinatie Waalwijk','RKC Waalwijk','1940-08-26 00:00:00','NL',1062,NULL,NULL,NULL,NULL),(79,'Associazione Sportiva Roma S.p.A.','AS Roma','1927-06-07 00:00:00','IT',364,NULL,NULL,NULL,NULL),(80,'Turn- und Sportverein Esens e.V. von 1861/1926','TuS Esens','1934-01-13 00:00:00','DE',112,NULL,NULL,'Die Bärenstädter',NULL),(81,'Borussia Verein für Leibesübungen 1900 e. V','Borussia Mönchengladbach','1900-08-01 00:00:00','DE',213,NULL,NULL,'\"Die Fohlen\"',NULL),(82,'Società Sportiva Calcio Napoli S.p.A.','S.S.C. Napoli','1926-08-01 00:00:00','IT',363,NULL,NULL,NULL,NULL),(83,'Hamburger Sportverein II','Hamburger SV II','1887-09-29 00:00:00','DE',449,NULL,NULL,'HSV',NULL),(84,'Uhlenhorster Sport-Club \"Paloma\" von 1909 e. V.','USC Paloma Hamburg','1909-08-01 00:00:00','DE',449,NULL,NULL,'Die Tauben',9),(85,'','VfR Todendorf v. 1931 e. V.','1900-01-01 00:00:00','DE',1063,NULL,NULL,NULL,NULL),(86,'','Tralauer SV v. 1965 e. V.','1900-01-01 00:00:00','DE',1064,NULL,NULL,NULL,NULL),(87,'','Suchsdorfer Sportverein von 1921 e.V.','1900-01-01 00:00:00','DE',171,NULL,NULL,NULL,NULL),(88,'','Verein für Rasensport Laboe von 1926 e. V.','1900-01-01 00:00:00','DE',1066,NULL,NULL,NULL,NULL),(89,'','Vejle Boldklub Kolding','1900-01-01 00:00:00','DK',1067,NULL,NULL,NULL,NULL),(90,'Sport- und Schwimmverein Jahn 2000 Regensburg e.V.','SSV Jahn 2000 Regensburg e.V.','1907-10-04 00:00:00','DE',272,NULL,NULL,NULL,NULL),(91,'Klub Sportowy Lechia Gdask Spóka Akcyjna','OSP Lechia Gdask','1900-01-01 00:00:00','PL',1068,NULL,NULL,NULL,NULL),(92,'','Korona Kielce','1900-01-01 00:00:00','PL',1069,NULL,NULL,NULL,NULL),(93,'','Olympiakos C. F. P. U 19','1900-01-01 00:00:00','GR',1073,NULL,NULL,NULL,NULL),(94,'','Kallithea FC','1900-01-01 00:00:00','GR',1071,NULL,NULL,NULL,NULL),(95,'','Agrotikos Asteras','1900-01-01 00:00:00','GR',1075,NULL,NULL,NULL,NULL),(96,'','PAE Asteras Tripolis','1900-01-01 00:00:00','GR',1072,NULL,NULL,NULL,NULL),(97,'','SV Darmstadt 1898 e. V.','1900-01-01 00:00:00','DE',1074,NULL,NULL,NULL,NULL),(98,'','Olympiakos C. F. P.','1900-01-01 00:00:00','GR',1073,NULL,NULL,NULL,NULL),(99,'','AC Sparta Praha','1900-01-01 00:00:00','CZ',417,NULL,NULL,NULL,NULL),(100,'Niendorfer-Timmendorfer Sportverein Strand 08','NTSV Strand 08','1908-09-07 00:00:00','DE',314,NULL,NULL,'\"Die Strandpiraten\"',NULL),(101,'','St. Pauli','1910-05-15 00:00:00','DE',449,NULL,NULL,'\"Kiezkicker\"',NULL),(102,'SV Lurup Hamburg v. 1923','SV Lurup Hamburg v. 1923','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,45),(103,'','Arsenal FC','1900-01-01 00:00:00','EN',339,NULL,NULL,NULL,NULL),(104,'Verein für Bewegungsspiele Stuttgart 1893 e. V.','VfB Stuttgart','1893-09-09 00:00:00','DE',310,NULL,NULL,NULL,NULL),(105,'','Heracles Almelo','1900-01-01 00:00:00','NL',1096,NULL,NULL,NULL,NULL),(106,'','FC Haak Bir','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(107,'Wandsbeker Turn- und Sportverein Concordia von 1881 e.V.','Wandsbeker TSV Concordia v. 1881 II','2013-03-27 00:00:00','DE',449,NULL,NULL,'\"Cordi\"',39),(108,'','S. C. Egenbüttel e. V. von 1953','1900-01-01 00:00:00','DE',276,NULL,NULL,NULL,NULL),(109,'','VfB Stuttgart U19','1900-01-01 00:00:00','DE',310,NULL,NULL,NULL,NULL),(110,'Verein für Leibesübungen Pinneberg e. V. II','VfL Pinneberg e. V. II','1900-01-01 00:00:00','DE',259,NULL,NULL,NULL,NULL),(111,'Turn- und Rasensportverein Harksheide e. V.','TuRa Harksheide','1945-06-16 00:00:00','DE',235,NULL,NULL,NULL,NULL),(112,'FC Elmshorn v. 1920 e. V.','FC Elmshorn v. 1920','2004-07-01 00:00:00','DE',105,NULL,NULL,NULL,NULL),(113,'','SV Ahlerstedt/Ottendorf 1970 ','1900-01-01 00:00:00','DE',1094,NULL,NULL,NULL,NULL),(114,'','FC Eintracht Cuxhaven 01','1900-01-01 00:00:00','DE',89,NULL,NULL,NULL,NULL),(115,'FC Bayern München (A)','FC Bayern München (A)','1900-02-27 00:00:00','DE',220,NULL,NULL,'Die Roten',NULL),(116,'','FC Eintracht Bamberg 2010','1900-01-01 00:00:00','DE',1097,NULL,NULL,NULL,NULL),(117,'Sportverein Rugenbergen v. 1925 e.V.','S. V. Rugenbergen v. 1925','1925-01-01 00:00:00','DE',55,NULL,NULL,NULL,NULL),(118,'Fußballclub GelsenkirchenSchalke 04 e.V.','FC Schalke 04','1904-05-04 00:00:00','DE',128,NULL,NULL,'Die Knappen',NULL),(119,'','Rot-Weiß Essen','1900-01-01 00:00:00','DE',1093,NULL,NULL,NULL,NULL),(120,'SC Rot-Weiß Oberhausen- Rheinland e. V.','SC Rot-Weiß Oberhausen','1904-12-18 00:00:00','DE',247,NULL,NULL,NULL,NULL),(121,'','Meiendorfer SV v. 1949','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(122,'','Fatihspor Hamburg v. 1982','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(123,'','SV Grün-Weiß Harburg v. 1920','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(124,'','VfL Grünhof-Tesperhude v. 1909','1909-01-01 00:00:00','DE',124,NULL,NULL,NULL,NULL),(125,'','SV Börnsen v. 1948','1900-01-01 00:00:00','DE',57,NULL,NULL,NULL,NULL),(126,'Sportvereinigung Deutsche Jugendkraft Hamburg e. V.','SV DJK Hamburg e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(127,'','SC Wentorf v. 1906','1900-01-01 00:00:00','DE',325,NULL,NULL,NULL,NULL),(128,'','TSV Nützen von 1951','1900-01-01 00:00:00','DE',1091,NULL,NULL,NULL,NULL),(129,'','SV Todesfelde v. 1928','1900-01-01 00:00:00','DE',315,NULL,NULL,NULL,NULL),(130,'Eisenbahner Turn- & Sportverein Weiche von 1930 e.V.','ETSV Weiche v. 1930','1900-01-01 00:00:00','DE',114,NULL,NULL,'Weiche',NULL),(131,'','FC St. Pauli v. 1910 II','1910-05-15 00:00:00','DE',449,NULL,NULL,'\"Kiezkicker\"',NULL),(132,'','TV Haseldorf v. 1909','1900-01-01 00:00:00','DE',1090,NULL,NULL,NULL,NULL),(133,'','Heidgrabener SV v. 1949','1900-01-01 00:00:00','DE',1098,NULL,NULL,NULL,NULL),(135,'','FK Qairat Almaty','1900-01-01 00:00:00','KZ',1099,NULL,NULL,NULL,NULL),(136,'FC Bayern Fanclub Red Baroons Dietmannsried e. V.','BFC Baroons Dietmannsried e. V.','1900-01-01 00:00:00','DE',1100,NULL,NULL,NULL,NULL),(137,'','SV Todesfelde v. 1928 II','1900-01-01 00:00:00','DE',315,NULL,NULL,NULL,NULL),(138,'TuS Holstein Quickborn v. 1914 e. V','TuS Holstein Quickborn v. 1914','1900-01-01 00:00:00','DE',267,NULL,NULL,NULL,NULL),(139,'','FC Eintracht Norderstedt v. 2003 U 19','2003-03-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(140,'','FC St. Pauli v. 1910 U 19','1910-05-15 00:00:00','DE',449,NULL,NULL,'\"Kiezkicker\"',NULL),(141,'Morski Klub Sportowy Pogo Szczecin S.S.A','MKS Pogon Szczecin','1948-04-21 00:00:00','PL',1087,NULL,NULL,NULL,NULL),(142,'Legia Warszawa Spóka Akcyjna','KP Legia Warszawa','1916-01-01 00:00:00','PL',393,NULL,NULL,NULL,NULL),(143,'TSV Deutsche Eiche Bardowick v. 1899','TSV Deutsche Eiche Bardowick v. 1899','1900-01-01 00:00:00','DE',1086,NULL,NULL,NULL,NULL),(144,'','FC Oldenstadt v. 1975','1900-01-01 00:00:00','DE',1101,NULL,NULL,NULL,NULL),(145,'','FFC 08 Osmanbey','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(146,'','Bostelbeker SV v. 1922','1922-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(147,'Berliner Athletik-Klub 07 e. V.','Berliner Athletik-Klub 07 e. V.','1907-12-15 00:00:00','DE',42,NULL,NULL,NULL,NULL),(148,'Vogtländischer Fußballclub Plauen e. V.','VFC Plauen','1903-05-27 00:00:00','DE',1102,NULL,NULL,NULL,NULL),(149,'Sport-Club Freiburg e. V. U 19','Sport-Club Freiburg U 19','1904-05-30 00:00:00','DE',120,NULL,NULL,'\"Breisgau-Brasilianer\"',NULL),(150,'Fußballclub GelsenkirchenSchalke 04 e.V.','FC Schalke 04 U 19','1904-05-04 00:00:00','DE',128,NULL,NULL,'Die Knappen',NULL),(151,'Goslarer Sportclub von 1908 e.V.','Goslarer SC v. 1908','1900-01-01 00:00:00','DE',1085,NULL,NULL,NULL,NULL),(152,'Sport-Verein „Werder“ v. 1899 e. V.','SV Werder Bremen II','1899-02-04 00:00:00','DE',70,NULL,NULL,'Fischköppe',NULL),(153,'Spielvereinigung Halstenbek-Rellingen e.V.','S. V. Halstenbek-Rellingen','1910-01-01 00:00:00','DE',139,NULL,NULL,'HR',NULL),(154,'','Ilinden 1903 Makedonija e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(156,'','SV Bergstedt v. 1948 II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(157,'Hellas Verona Football Club S.p.A.','Hellas Verona Football Club','1900-01-01 00:00:00','IT',1084,NULL,NULL,'\"i gialloblu\"',NULL),(158,'Calcio Catania 1946 S.p.A.','Catania Calcio','1900-01-01 00:00:00','IT',1103,NULL,NULL,NULL,NULL),(159,'Braunschweiger Turn- und Sportverein Eintracht von 1895 e.V.','Eintracht Braunschweig','1895-12-15 00:00:00','DE',66,NULL,NULL,'\"Die Löwen\"',NULL),(160,'SC Alstertal-Langenhorn e. V. II','SC Alstertal-Langenhorn e. V. II','1900-01-01 00:00:00','DE',449,NULL,NULL,'SCALA',NULL),(161,'','1. FC Schweinfurt 05','1900-01-01 00:00:00','DE',1104,NULL,NULL,NULL,NULL),(162,'','ASV Dachau e. V. U 19','1900-01-01 00:00:00','DE',1083,NULL,NULL,NULL,NULL),(163,'','JfG TaF Glonntal','1900-01-01 00:00:00','DE',1105,NULL,NULL,NULL,NULL),(164,'','SC 1926 e. V. Eltersdorf','1900-01-01 00:00:00','DE',1082,NULL,NULL,NULL,NULL),(165,'Spielvereinigung SV Weiden e. V.','SpVgg SV Weiden','2010-12-21 00:00:00','DE',1106,NULL,NULL,NULL,NULL),(167,'','Manchester United FC','1900-01-01 00:00:00','EN',342,NULL,NULL,'ManU',NULL),(168,'Turn- und Sportverein Germania Schnelsen von 1921 e.V.','TuS Germania Schnelsen von 1921 e.V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(169,'','Strietkamp SC Phönix Kisdorf','1900-01-01 00:00:00','DE',175,NULL,NULL,NULL,NULL),(170,'','TuS Hartenholm v. 1913 II','1900-01-01 00:00:00','DE',1107,NULL,NULL,NULL,NULL),(171,'Sport Club Victoria Hamburg','SC Victoria Hamburg II','1895-05-05 00:00:00','DE',449,NULL,NULL,'\"Vicky\"',84),(172,'','SG Seth v. 1910','1900-01-01 00:00:00','DE',301,NULL,NULL,NULL,NULL),(173,'SV Preußen  e,. V. 1909Reinfeld II','SV Preußen Reinfeld II','1900-01-01 00:00:00','DE',1108,NULL,NULL,NULL,NULL),(174,'Hannoversche Sportverein von 1896 e.V. II','Hannover 96 II','1895-04-12 00:00:00','DE',141,NULL,NULL,'HSV',NULL),(175,'','Schmalfelder SV v. 1927','1900-01-01 00:00:00','DE',292,NULL,NULL,NULL,NULL),(176,'','SC Rapid Lübeck e. V.','1900-01-01 00:00:00','DE',195,NULL,NULL,NULL,NULL),(177,'','TSV Pansdorf v. 1920 e. V.','1900-01-01 00:00:00','DE',258,NULL,NULL,NULL,NULL),(178,'Braunschweiger Turn- und Sportverein Eintracht von 1895 e.V. II','Eintracht Braunschweig II','1895-12-15 00:00:00','DE',66,NULL,NULL,'\"Die Löwen\"',NULL),(179,'Fußball-Club Kilia Kiel von 1902 e.V.','FC Kilia Kiel v. 1902','1902-07-23 00:00:00','DE',171,NULL,NULL,NULL,NULL),(180,'Verein für Bewegungsspiele Kiel von 1910 e.V.','VfB Kiel v. 1910','1900-01-01 00:00:00','DE',171,NULL,NULL,NULL,NULL),(181,'','VfL Lohbrügge v. 1892','1892-02-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(182,'Sportverein Rugenbergen v. 1925 e.V. III','S. V. Rugenbergen v. 1925 e.V. III','1900-01-01 00:00:00','DE',55,NULL,NULL,NULL,NULL),(183,'','1. FC Quickborn v. 1999','1900-01-01 00:00:00','DE',267,NULL,NULL,NULL,NULL),(184,'','1. Norderstedter FC','1900-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(185,'','SV Osdorfer Born v. 1969 e. V. II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(186,'al Kuwait Sports Club','al Kuwait SC','1960-10-20 00:00:00','KW',372,NULL,NULL,NULL,NULL),(187,'Raja Club Athletic de Casablanca','Raja Casablanca','1949-03-20 00:00:00','MA',1109,NULL,NULL,NULL,NULL),(188,'Guangzhou Evergrande Football Club','Guangzhou Evergrande FC','1900-01-01 00:00:00','CN',12,NULL,NULL,NULL,NULL),(189,'Clube Atlético Mineiro','Atletico Mineiro','1908-03-25 00:00:00','BR',1111,NULL,NULL,NULL,NULL),(190,'','SV Bergedorf-West v. 1971','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,10),(191,'','TSV Gülzow v. 1920 e. V.','1900-01-01 00:00:00','DE',1112,NULL,NULL,NULL,NULL),(192,'Profesionalni futbolny klub ZSKA Moskwa','PFK ZSKA Moskwa','1911-08-27 00:00:00','RU',399,NULL,NULL,NULL,NULL),(193,'Profesionalni futbolny klub ZSKA Moskwa U 19','PFK ZSKA Moskwa U 19','1911-08-27 00:00:00','RU',399,NULL,NULL,NULL,NULL),(194,'','FK Meteor Praha VIII','1900-01-01 00:00:00','CZ',417,NULL,NULL,NULL,NULL),(195,'','SK Strakonice 1908','1900-01-01 00:00:00','CZ',1113,NULL,NULL,NULL,NULL),(196,'','SV München von 1880 e. V. II','1900-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(197,'','FC Espanol München II','1900-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(198,'','SV Friedrichsgabe e. V. v. 1955','1900-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(199,'Turn- und Rasensportverein Harksheide e. V. II','TuRa Harksheide II','1945-06-16 00:00:00','DE',235,NULL,NULL,NULL,NULL),(200,'','SC Hansa von 1911','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(201,'','Rissener SV von 1949','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(202,'Spielvereinigung Blankenese von 1903 e.V.','SV Blankenese v. 1903 e. V.','1903-10-01 00:00:00','DE',449,NULL,NULL,NULL,89),(203,'','TSV Bayer 04 Leverkusen','1904-07-01 00:00:00','DE',192,NULL,NULL,NULL,NULL),(204,'Sportclub Fortuna Köln e. V. ','SC Fortuna Köln','1948-02-21 00:00:00','DE',178,NULL,NULL,NULL,NULL),(205,'','SV Nettelnburg-Allermöhe v. 1930','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(206,'','FC Elazig Spor','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(207,'Spiel und Sport Waldenau von 1947 e.V.','SUS Waldenau v. 1947 e. V.','1900-01-01 00:00:00','DE',259,NULL,NULL,NULL,NULL),(208,'Bramfelder Sportverein von 1945 e.V.','Bramfelder SV v. 1945 e. V.','1945-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(209,'','S. V. Bokhorst 1959','1900-01-01 00:00:00','DE',291,NULL,NULL,NULL,NULL),(210,'','SV Tungendorf Neumünster','1900-01-01 00:00:00','DE',230,NULL,NULL,NULL,NULL),(211,'Turn- und Sportverein Buchholz von 1908 e. V.','TSV Buchholz 08 e. V.','1938-08-05 00:00:00','DE',77,NULL,NULL,NULL,NULL),(214,'Fußballclub GelsenkirchenSchalke 04 e.V. II','FC Schalke 04 II','1904-05-04 00:00:00','DE',128,NULL,NULL,'Die Knappen',NULL),(215,'','SV Lippstadt 08','1900-01-01 00:00:00','DE',1115,NULL,NULL,NULL,NULL),(216,'Escheburger Sportvereins e. V.','Escheburger SV e. V.','1900-01-01 00:00:00','DE',111,NULL,NULL,NULL,NULL),(217,'','SV Altengamme v. 1928 e. V. II','1928-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(218,'','Chelsea FC','1900-01-01 00:00:00','EN',339,NULL,NULL,NULL,NULL),(219,'Györi Egyetertes Torna Osztaly Football Club','Györi ETO FC','1900-01-01 00:00:00','HU',427,NULL,NULL,NULL,NULL),(220,'','Oststeinbeker SV v. 1948','1900-01-01 00:00:00','DE',253,NULL,NULL,NULL,NULL),(221,'Kieler Sportvereinigung Holstein von 1900 e.V.','Holstein Kiel','1900-10-07 00:00:00','DE',171,NULL,NULL,'\"Die Störche\"',NULL),(222,'','TuRa Rüdinghausen II','1900-01-01 00:00:00','DE',285,NULL,NULL,NULL,NULL),(223,'','TuS Blankenstein 1970 e. V . II','1900-01-01 00:00:00','DE',1116,NULL,NULL,NULL,NULL),(224,'Sportgemeinschaft 09 Wattenscheid e. V.','SG Wattenscheid 09','1909-08-09 00:00:00','DE',53,NULL,NULL,NULL,NULL),(225,'','KFC Uerdingen 05','1905-11-17 00:00:00','DE',182,NULL,NULL,NULL,NULL),(226,'Sportverein Eichede von 1947 e.V.','SV Eichede v. 1947','1947-05-15 00:00:00','DE',104,NULL,NULL,NULL,NULL),(227,'','Hagenower SV e. V.','1900-01-01 00:00:00','DE',138,NULL,NULL,NULL,NULL),(228,'Mecklenburgischer Sportverein Pampow e. V.','MSV Pampow e. V.','1990-06-22 00:00:00','DE',257,NULL,NULL,NULL,NULL),(229,'SV Wilhelmshaven Germania 05 e.V. II','SV Wilhelmshaven II','1900-01-01 00:00:00','DE',330,NULL,NULL,NULL,NULL),(230,'','TuS Obenstrohe v. 1906 e. V. II','1900-01-01 00:00:00','DE',1117,NULL,NULL,NULL,NULL),(232,'','FC Rot-Weiß Sande-Cäiliengroden','1900-01-01 00:00:00','DE',287,NULL,NULL,NULL,NULL),(233,'','FC Voran Ohe v. 1949','1900-01-01 00:00:00','DE',275,NULL,NULL,NULL,NULL),(234,'Spiel Sport Club Hagen Ahrensburg von 1947 e. V.','SSC Hagen Ahrensburg v. 1947','1900-01-01 00:00:00','DE',20,NULL,NULL,NULL,NULL),(235,'Düsseldorfer Turn- und Sportverein Fortuna 1895 e. V.','Fortuna Düsseldorf','1895-05-05 00:00:00','DE',98,NULL,NULL,NULL,NULL),(236,'','Duvenstedter SV v. 1969','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(237,'Fußball-Club Augsburg 1907','FC Augsburg','1907-08-08 00:00:00','DE',29,NULL,NULL,NULL,NULL),(238,'Fußballsportverein Frankfurt 1899 e. V.','FSV Frankfurt','1899-08-20 00:00:00','DE',116,NULL,NULL,NULL,NULL),(239,'1. Fußball-Club Nürnberg, Verein für Leibesübungen e. V.','1. FC Nürnberg','1900-05-04 00:00:00','DE',246,NULL,NULL,'\"Der Club\"',NULL),(240,'','Moorburger TSV v. 1897 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(241,'','SV Este 06/70 II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(242,'','Hamburger FC von 2009 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(243,'','SV Barmbek von 1939 e. V. II','1939-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(244,'','Holsatia Elmshorn im EMTV von 1960 e. V.','1960-01-01 00:00:00','DE',105,NULL,NULL,NULL,NULL),(245,'','Juventude do Minho 1987 e. V. II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(246,'Juventus Football Club S.p.A.','Juventus F.C.','1897-11-01 00:00:00','IT',365,NULL,NULL,'Juve',NULL),(247,'','SV Manching e. V.','1900-01-01 00:00:00','DE',208,NULL,NULL,NULL,NULL),(248,'','SpVgg Kaufbeuren e.V. ','1900-01-01 00:00:00','DE',1118,NULL,NULL,NULL,NULL),(249,'Fußballclub Ingolstadt 04 e.V.','FC Ingolstadt 04 e. V.','2004-02-05 00:00:00','DE',159,NULL,NULL,'\"Schanzer\"',NULL),(250,'Meidericher Spielverein 02 e. V. Duisburg','MSV Duisburg','1902-06-02 00:00:00','DE',95,NULL,NULL,'\"Zebras\"',NULL),(251,'Graanski nogometni klub Dinamo Zagreb U 19','GNK Dinamo Zagreb U 19','1911-04-26 00:00:00','HR',1119,NULL,NULL,NULL,NULL),(252,'Graanski nogometni klub Dinamo Zagreb','GNK Dinamo Zagreb','1911-04-26 00:00:00','HR',1119,NULL,NULL,NULL,NULL),(253,'','1. FC Kollbach','1900-01-01 00:00:00','DE',1120,NULL,NULL,NULL,NULL),(254,'','SV Lohhof e. V. II','1900-01-01 00:00:00','DE',320,NULL,NULL,NULL,NULL),(255,'Fußball-Club Schönberg 95 e.V.','FC Schönberg 95','1995-07-01 00:00:00','DE',294,NULL,NULL,NULL,NULL),(256,' 	Chemnitzer Fußballclub e. V.','Chemnitzer FC','1966-01-15 00:00:00','DE',56,NULL,NULL,'\"Die Himmelblauen\"',NULL),(257,'Verein für Bewegungsspiele Stuttgart 1893 e. V. II','VfB Stuttgart II','1893-09-09 00:00:00','DE',310,NULL,NULL,NULL,NULL),(258,'TSV Neuland v. 1924 e. V.','TSV Neuland v. 1924 e. V.','1924-01-01 00:00:00','DE',449,NULL,NULL,NULL,50),(259,'VfL Jesteburg v. 1912 e. V.','VfL Jesteburg v. 1912 e. V.','1912-01-01 00:00:00','DE',164,NULL,NULL,'\"Die Rüsselkäfer\"',NULL),(260,'','Hamm United FC','1900-01-01 00:00:00','DE',449,NULL,NULL,'\"Die Geächteten vom Hammer Park\"',32),(261,'Afghanischer Sportverein Hamburg von 2007 e.V.','ASV Hamburg von 2007 e.V.','2007-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(262,'Spielvereinigung Greuther Fürth e. V.','SpVgg Greuther Fürth','1903-09-23 00:00:00','DE',122,NULL,NULL,'\"Die Kleeblätter\"',NULL),(263,'Spielvereinigung Unterhaching','SpVgg Unterhaching','1925-01-01 00:00:00','DE',319,NULL,NULL,NULL,NULL),(264,'Fußballclub Hansa Rostock e. V.','F.C. Hansa Rostock','1965-12-28 00:00:00','DE',280,NULL,NULL,NULL,NULL),(265,'FFC Nordlichter Norderstedt e. V','FFC Nordlichter Norderstedt e. V','1900-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(266,'','TSV Weddelbrook','1900-01-01 00:00:00','DE',1121,NULL,NULL,NULL,NULL),(267,'Fußball-Club Oberneuland von 1948 e.V.','FC Oberneuland','1948-04-13 00:00:00','DE',70,NULL,NULL,NULL,NULL),(268,'Turn- und Sportverein Hemdingen-Bilsen v. 1926 e. V.','TuS Hemdingen-Bilsen v. 1926 e. V.','1926-05-04 00:00:00','DE',149,NULL,NULL,NULL,NULL),(269,'S.S.D. Nikola Tesla e.V.','FK Nikola Tesla','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(270,'','FC Eintracht Norderstedt v. 2003','2003-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(271,'','TuSpo Lasfelde-Petershütte-Katzenstein von 1906','1900-01-01 00:00:00','DE',252,NULL,NULL,NULL,NULL),(272,'Spielvereinigung Göttingen 07 e.V.','SVG Göttingen 07','1907-01-01 00:00:00','DE',132,NULL,NULL,NULL,NULL),(273,'','VfL Pinneberg e. V.','1900-01-01 00:00:00','DE',259,NULL,NULL,NULL,NULL),(274,'','SV Osdorfer Born v. 1969 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(275,'Freie Turn- und Sportvereinigung Komet Blankenese von 1907 e. V. II','FTSV Komet Blankenese von 1907 e. V. II','1907-05-07 00:00:00','DE',449,NULL,NULL,NULL,NULL),(276,'Turn- und Sportgemeinschaft Hoffenheim 1899 e. V.','TSG 1899 Hoffenheim','1899-07-01 00:00:00','DE',303,NULL,NULL,NULL,NULL),(277,'Hamburger Sportverein III','Hamburger SV III','1887-09-29 00:00:00','DE',449,NULL,NULL,'HSV Drei',NULL),(278,'FK BATE Baryssau','FK BATE Baryssau','1973-01-01 00:00:00','BY',1122,NULL,NULL,NULL,NULL),(279,'Spiel und Sportverein Jersbek von 1913 e. V','SSV Jersbek von 1913 e. V','1913-01-01 00:00:00','DE',163,NULL,NULL,NULL,NULL),(280,'','TSV Trittau von 1899 e.V.','1900-01-01 00:00:00','DE',317,NULL,NULL,NULL,NULL),(281,'FC Bergedorf 85 e. V.','FC Bergedorf 85 e. V.','2009-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(282,'Spielvereinigung Lieth von 1934 e.V.','SV Lieth von 1934 e.V.','1934-01-01 00:00:00','DE',105,NULL,NULL,NULL,NULL),(283,'Eisenbahner Turn- und Sportverein Hamburg v. 1924 e. V.','ETSV Hamburg v. 1924 e. V.','1924-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(284,'','Rellinger FC 2010 e. V.','2010-01-01 00:00:00','DE',276,NULL,NULL,NULL,NULL),(285,'','FC Eintracht Rellingen v. 1987 e. V. II','1987-01-01 00:00:00','DE',276,NULL,NULL,NULL,NULL),(286,'Spielvereinigung Greuther Fürth e. V. U 17','SpVgg Greuther Fürth U 17','1903-09-23 00:00:00','DE',122,NULL,NULL,'\"Die Kleeblätter\"',NULL),(287,'Fußball-Club Augsburg 1907 U 7','FC Augsburg U 17','1907-08-08 00:00:00','DE',29,NULL,NULL,NULL,NULL),(288,'','Kummerfelder SV e. V. 1960','1960-01-01 00:00:00','DE',185,NULL,NULL,NULL,NULL),(289,'Walddörfer Sportverein  v. 1924 e. V.','Walddörfer SV  v. 1924 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,72),(290,'','FC Maihan Hamburg e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(291,'Farmsener Turnverein von 1926 e.V','Farmsener TV von 1926 e.V','1926-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(292,'','SV Vorwärts 93 Ost e.V.','1893-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(293,'Turn- und Sportverein Berne e. V. III','TuS Berne e. V. III','1924-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(294,'Glashütter Sport-Verein von 1924 e.V. II','Glashütter SV v. 1924 e. V. II','1924-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(295,'Beijing Guoan Football Club','Beijing Guoan FC','1992-01-01 00:00:00','CN',8,NULL,NULL,NULL,NULL),(296,'','Bowen Soccer Academy (U18)','1900-01-01 00:00:00','AU',1123,NULL,NULL,NULL,NULL),(297,'','Yali middle school Changsha (U 18)','1900-01-01 00:00:00','CN',1124,NULL,NULL,NULL,NULL),(298,'','Footskill FC (U 18)','1900-01-01 00:00:00','AU',1125,NULL,NULL,NULL,NULL),(299,'','Tsu Technical High School (U 18)','1900-01-01 00:00:00','JP',1126,NULL,NULL,NULL,NULL),(300,'Beijing Yitong Kuju','Beijing Yitong Kuju','2012-01-01 00:00:00','CN',8,NULL,NULL,NULL,NULL),(301,'','Hebei Zhongji Football Club','2010-05-28 00:00:00','CN',1127,NULL,NULL,NULL,NULL),(302,'Hangzhou Nabel Greentown Football Club','Hangzhou Nabel Greentown FC','1998-01-01 00:00:00','CN',1128,NULL,NULL,NULL,NULL),(303,'Sportverein Eidelstedt Hamburg v. 1880 e. V. III','SV Eidelstedt Hamburg v. 1880 e. V. III','1880-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(304,'','SV Hörnerkirchen e. V.','1900-01-01 00:00:00','DE',1052,NULL,NULL,NULL,NULL),(305,'','SV Heiligenstedtenerkamp SV von 1985','1900-01-01 00:00:00','DE',1130,NULL,NULL,NULL,NULL),(306,'Fußballclub Türkiye Wilhelmsburg 2000 e.V.','FC Türkiye Wilhelmsburg','2000-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(307,'','SV Hamwarde e. V.','1900-01-01 00:00:00','DE',1131,NULL,NULL,NULL,NULL),(308,'','FC Bayern München (Frauen) II','1900-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(309,'','TSG 1899 Hoffenheim (Frauen)','1900-01-01 00:00:00','DE',303,NULL,NULL,NULL,NULL),(310,'Fußball-Club Ismaning e.V.','FC Ismaning','1921-01-01 00:00:00','DE',160,NULL,NULL,NULL,NULL),(311,'Würzburger Fußballverein e. V.','Würzburger FV','1981-05-22 00:00:00','DE',1132,NULL,NULL,'WFV',NULL),(312,'Sportverein Falkensee-Finkenkrug e. V.','SV Falkensee-Finkenkrug','1913-01-01 00:00:00','DE',113,NULL,NULL,NULL,NULL),(313,'Eisenhüttenstädter Fußball-Club Stahl e.V.','Eisenhüttenstädter FC Stahl','1990-05-19 00:00:00','DE',1133,NULL,NULL,NULL,NULL),(314,'Sportclub Schwarzenbek v. 1916 e.V.','SC Schwarzenbek v. 1916 e.V.','1916-01-01 00:00:00','DE',296,NULL,NULL,NULL,NULL),(315,'1. FußballClub Köln 01/07 e. V.','1. FC Köln','1948-02-13 00:00:00','DE',178,NULL,NULL,'\"Die Geißböcke\"',NULL),(316,'Fußball Club Offenbüttel 68 e.V.','FC Offenbüttel 68 e.V.','1968-01-01 00:00:00','DE',249,NULL,NULL,NULL,NULL),(317,'Spielgemeinschaft Geest 05','SG Geest 05','2005-01-01 00:00:00','DE',1134,NULL,NULL,NULL,NULL),(318,'Freier Turn- und Sportverein Altenwerder von 1918 e.V.','FTSV Altenwerder von 1918 e.V.','1918-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(319,'Turn- und Sportverein Wandsetal Hamburg von 1890 e.V.','TSV Wandsetal','1998-04-24 00:00:00','DE',449,NULL,NULL,NULL,NULL),(320,'','SG Egels-Popens e. V.','1900-01-01 00:00:00','DE',32,NULL,NULL,NULL,NULL),(321,'Hertha Berliner Sport Club e. V. U 19','Hertha BSC U 19','1892-06-25 00:00:00','DE',42,NULL,NULL,NULL,NULL),(322,'','VfR 1920 Ilbenstadt e. V.','1900-01-01 00:00:00','DE',234,NULL,NULL,NULL,NULL),(323,'','SV 1920 Germania Ockstadt e. V.','1900-01-01 00:00:00','DE',1135,NULL,NULL,NULL,NULL),(324,'Olympique de Marseille','Olympique Marseille','1899-08-31 00:00:00','FR',348,NULL,NULL,NULL,NULL),(325,'RasenBallsport Leipzig e. V.','RB Leipzig','2009-05-19 00:00:00','DE',11,NULL,NULL,NULL,NULL),(326,'','Inter Eidelstedt e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(327,'','AC Italia Hamburg','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(328,'','SV Este 06/70','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(329,'','Hamburger SV (Frauen)','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(330,'','FC Bayern München (Frauen)','1900-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(331,'Turn- und Sportclub Wellingsbüttel von 1937 e.V.','TSC Wellingsbüttel v. 1937 e. V.','1937-01-01 00:00:00','DE',449,NULL,NULL,'\"Welle\"',NULL),(332,'','VfL Leverkusen  04/14 e. V. U 19','1950-07-25 00:00:00','DE',192,NULL,NULL,NULL,NULL),(333,'','JFC 09 Mondorf-Rheidt U 19','2009-01-01 00:00:00','DE',1136,NULL,NULL,NULL,NULL),(334,'','TSV Bayer 04 Leverkusen U 15','1904-07-01 00:00:00','DE',192,NULL,NULL,NULL,NULL),(335,'Deutscher Sportclub Arminia Bielefeld e. V. U 17','DSC Arminia Bielefeld U 15','1905-05-03 00:00:00','DE',51,NULL,NULL,NULL,NULL),(336,'','Groß-Flottbeker SpVgg v. 1923 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(337,'Sportverein Eidelstedt Hamburg v. 1880 e. V. II','SV Eidelstedt Hamburg v. 1880 e. V. II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(338,'Fußball Club Sylt','FC Sylt','2008-04-01 00:00:00','DE',1137,NULL,NULL,NULL,NULL),(339,'SC Paderborn 07 e.V.','SC Paderborn 07','1907-01-01 00:00:00','DE',255,NULL,NULL,NULL,NULL),(340,'1. Fußballclub Union Berlin e. V.','1. FC Union Berlin','1966-01-20 00:00:00','DE',42,NULL,NULL,'\"Die Eisernen\"',NULL),(341,'All India Football Federation','Indien','1937-06-23 00:00:00','IN',352,NULL,NULL,NULL,NULL),(342,'','VfL Tremsbüttel v. 1968 e. V.','1968-01-01 00:00:00','DE',316,NULL,NULL,NULL,NULL),(343,'','SSV Pölitz v. 1927 e. V.','1927-01-01 00:00:00','DE',1138,NULL,NULL,NULL,NULL),(344,'','VfB Ginsheim 1916 e. V.','1916-01-01 00:00:00','DE',130,NULL,NULL,NULL,NULL),(345,'','Usinger TSG 1846 e. V.','1900-01-01 00:00:00','DE',1139,NULL,NULL,NULL,NULL),(346,'','Breitenfelder SV v. 1924 e. V. II','1924-01-01 00:00:00','DE',68,NULL,NULL,NULL,NULL),(347,'','SV Steinhorst/Labenz e.V.','1900-01-01 00:00:00','DE',1140,NULL,NULL,NULL,NULL),(348,'Kasseler Sport-Verein Hessen e. V.','KSV Hessen Kassel','1998-02-03 00:00:00','DE',169,NULL,NULL,NULL,NULL),(350,'','FC Dynamo Hamburg 09 e.V.','2009-07-25 00:00:00','DE',449,NULL,NULL,NULL,NULL),(351,'Sportverein St. Georg von 1895 e.V. ','SV St. Georg von 1895 e.V. ','1895-06-03 00:00:00','DE',449,NULL,NULL,NULL,NULL),(352,'Männer-Turnverein Leck von 1889 e. V.','MTV Leck von 1889 e. V.','1889-01-01 00:00:00','DE',190,NULL,NULL,NULL,NULL),(353,'Flensburger Sportvereinigung von 1908 e.V. II','Flensburg 08 II','1908-04-15 00:00:00','DE',114,NULL,NULL,NULL,NULL),(354,'','TuS Aumühle-Wohltorf von 1910 e. V.','1910-01-01 00:00:00','DE',31,NULL,NULL,NULL,NULL),(355,'','SC Concordia v. 1907 e. V.','1907-05-09 00:00:00','DE',449,NULL,NULL,'\"Cordi\"',NULL),(356,'Düsseldorfer Turn- und Sportverein Fortuna 1895 e. V. II','Fortuna Düsseldorf II','1895-05-05 00:00:00','DE',98,NULL,NULL,NULL,NULL),(357,'Foot-Ball Club Unione Venezia','FBC Unione Venezia','2009-07-27 00:00:00','IT',367,NULL,NULL,NULL,NULL),(358,'Associazione Sportiva Dilettantistica Sanvitese','A. S. D. Sanvitese','1920-01-01 00:00:00','IT',1141,NULL,NULL,NULL,NULL),(359,'Inter Genclik Spor Kulübü Bergedorf 2000','Inter GSK Bergedorf 2000','2000-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(360,'','TuS Jevenstedt v. 1919 e. V.','1900-01-01 00:00:00','DE',165,NULL,NULL,NULL,NULL),(361,'Fußballclub Fockbek von 1986 e. V.','FC Fockbek von 1986 e. V.','1986-01-01 00:00:00','DE',1142,NULL,NULL,NULL,NULL),(362,'Sport Hamburg Benfica Von 1987 e.V.','Sport Hamburg Benfica Von 1987 e.V.','1987-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(363,'Eimsbütteler Turnverband e. V. II','Eimsbütteler Turnverband e. V. II','1889-06-12 00:00:00','DE',449,NULL,NULL,NULL,23),(364,'Spielvereinigung Unterhaching U 17','SpVgg Unterhaching U 17','1925-01-01 00:00:00','DE',319,NULL,NULL,NULL,NULL),(365,'FC Bayern München U 17','FC Bayern München U 17','1900-02-27 00:00:00','DE',220,NULL,NULL,'Die Roten',NULL),(366,'Karlsruher Sport-Club Mühlburg-Phönix e. V. II','Karlsruher SC II','1894-06-06 00:00:00','DE',168,NULL,NULL,NULL,NULL),(367,'NK Maribor','NK Maribor','1960-01-01 00:00:00','SI',412,NULL,NULL,NULL,NULL),(368,'Rangers Football Club','Rangers FC','1873-01-01 00:00:00','SS',1143,NULL,NULL,'\"The Gers\"',NULL),(369,'Fussballclub Zürich','FC Zürich','1896-08-01 00:00:00','CH',1144,NULL,NULL,NULL,NULL),(370,'TSV Eching e.V.','TSV Eching e.V.','1900-01-01 00:00:00','DE',101,NULL,NULL,NULL,NULL),(371,'Sportverein Wacker Burghausen e. V. II','SV Wacker Burghausen II','1930-11-13 00:00:00','DE',1145,NULL,NULL,NULL,NULL),(372,'Hummelsbütteler Sportverein von 1929 e.V.','Hummelsbütteler SV von 1929 e.V.','1929-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(373,'','SV Muslime Hamburg e. V.','2008-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(374,'','Altonaer FC v. 1893 II','1893-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(375,'','FC Teutonia Ottensen von 1905 e.V. II','1905-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(376,'','Bramfelder SV v. 1945 e.V. II','1945-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(377,'SV Tonndorf-Lohe e. V. v. 1921','SV Tonndorf-Lohe e. V. v. 1921','1921-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(378,'','VfL Lohbrügge v. 1892 II','1892-02-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(379,'Fußballclub Carl Zeiss Jena e. V.','FC Carl Zeiss Jena','1966-01-20 00:00:00','DE',162,NULL,NULL,NULL,NULL),(380,'Kroatische Kulturgemeinschaft von 1985 e. V.','Croatia Hamburg','1985-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(381,'Weiss-Blau Groß Borstel 1963','Weiss-Blau Groß Borstel 1963','1963-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(382,'','SG Holsatia / TSV Sparrieshoop 1. Alte Herren','1900-01-01 00:00:00','DE',105,NULL,NULL,NULL,NULL),(383,'','FSG Südheide 2001','1900-01-01 00:00:00','DE',1146,NULL,NULL,NULL,NULL),(384,'','SC Tewel v. 1920 e. V.','1900-01-01 00:00:00','DE',313,NULL,NULL,NULL,NULL),(385,'Flensburger Sportvereinigung von 1908 e.V. II','Flensburg 08','1908-04-15 00:00:00','DE',114,NULL,NULL,NULL,NULL),(387,'Verein für Leibesübungen Herzlake von 1921 e. V.','VfL Herzlake','1921-01-01 00:00:00','DE',153,NULL,NULL,NULL,NULL),(388,'','SV Borussia 08 Neuenhaus e. V.','1900-01-01 00:00:00','DE',1147,NULL,NULL,NULL,NULL),(389,'Sportgemeinschaft 2000 Mülheim-Kärlich 1921 e.V..','SG 2000 Mülheim-Kärlich','2011-01-01 00:00:00','DE',218,NULL,NULL,NULL,NULL),(390,'FSV Salmrohr 1921 e.V.','FSV Salmrohr','1921-01-01 00:00:00','DE',1148,NULL,NULL,NULL,NULL),(391,'Turn- und Spielvereinigung Koblenz 1911 e.V.','TuS Koblenz','1934-01-01 00:00:00','DE',177,NULL,NULL,NULL,NULL),(392,'','SG Ellscheid','1900-01-01 00:00:00','DE',1149,NULL,NULL,NULL,NULL),(393,'SV Wehen 1926 – Taunusstein e. V.','SV Wehen Wiesbaden','1926-01-01 00:00:00','DE',329,NULL,NULL,NULL,NULL),(395,'Deutscher Sportclub Arminia Bielefeld e. V. II','DSC Arminia Bielefeld II','1905-05-03 00:00:00','DE',51,NULL,NULL,NULL,NULL),(396,'Märkischer Sportverein 1919 Neuruppin e.V.','MSV Neuruppin','1919-01-01 00:00:00','DE',233,NULL,NULL,NULL,NULL),(397,'','SC Europa 1992 e. V.','1992-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(398,'','Barsbütteler SV v. 1948 e. V.','1948-01-01 00:00:00','DE',39,NULL,NULL,NULL,NULL),(399,'Grevesmühlener Fußball Club e. V.','Grevesmühlener FC e. V. ','1998-01-19 00:00:00','DE',135,NULL,NULL,NULL,NULL),(400,'','SG Groß Stieten 1951 e.V.','1951-01-01 00:00:00','DE',1150,NULL,NULL,NULL,NULL),(401,'Football Club Internazionale Milano','Inter Milano','1908-03-09 00:00:00','IT',362,NULL,NULL,NULL,NULL),(402,'Al-Wakrah Sport Club','al-Wakrah SC','1959-01-01 00:00:00','QA',1151,NULL,NULL,NULL,NULL),(403,'','Katar','1900-01-01 00:00:00','QA',1152,NULL,NULL,NULL,NULL),(404,'','Usbekistan','1900-01-01 00:00:00','UZ',1153,NULL,NULL,NULL,NULL),(405,'','Südkorea (Frauen)','1900-01-01 00:00:00','KR',1154,NULL,NULL,NULL,NULL),(406,'','China (Frauen)','1900-01-01 00:00:00','CN',1155,NULL,NULL,NULL,NULL),(407,'Wing Yee Football Team','Wing Yee FT','2006-01-01 00:00:00','HK',1158,NULL,NULL,NULL,NULL),(408,'','Yuen Long District Sports Association Limited','1900-01-01 00:00:00','HK',1158,NULL,NULL,NULL,NULL),(409,'','Mutual FC Limited \"Pontic Football Team\"','1900-01-01 00:00:00','HK',1158,NULL,NULL,NULL,NULL),(410,'','Hong Kong Rangers FC \"Biu Chun\"','1950-01-01 00:00:00','HK',1158,NULL,NULL,NULL,NULL),(411,'Caile Ferate Romane 1907 Cluj','CFR Cluj','1907-01-01 00:00:00','RO',402,NULL,NULL,NULL,NULL),(412,'','Rahlstedter SC v. 1905','1905-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(413,'FC Basel 1893','FC Basel','1893-11-15 00:00:00','CH',408,NULL,NULL,NULL,NULL),(414,'Kauno futbolo beisbolo klubas','FBK Kaunas','1993-01-01 00:00:00','LT',375,NULL,NULL,NULL,NULL),(415,'','Lithuania U19','1900-01-01 00:00:00','LT',1159,NULL,NULL,NULL,NULL),(416,'','Wedeler TSV von 1863 e.V.','1863-01-01 00:00:00','DE',323,NULL,NULL,NULL,NULL),(417,'Nigerian Community Germany Football Club Hamburg','NCG FC Hamburg','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(418,'Sport-Club Pinneberg von 1918 e.V.','SC Pinneberg von 1918 e.V.','1918-01-01 00:00:00','DE',259,NULL,NULL,NULL,NULL),(419,'Hamburger Turnerschaft von 1816 r. V.','Hamburger Turnerschaft von 1816','1900-01-01 00:00:00','DE',449,NULL,NULL,'HT 16',NULL),(420,'Verein für Sport- und Gemeinschaftspflege Stapelfeld v. 1968 e. V. II','VSG Stapelfeld v. 1968 e. V. II','1968-01-01 00:00:00','DE',307,NULL,NULL,NULL,NULL),(421,'','TSV Bobingen 1910 e. V.','1910-01-01 00:00:00','DE',52,NULL,NULL,NULL,NULL),(422,'','SV Untermeitingen e.V.','1928-01-01 00:00:00','DE',1160,NULL,NULL,NULL,NULL),(423,'Eckernförder Sportverein von 1923 e. V.','Eckernförder SV v. 1923 e. V.','1923-05-02 00:00:00','DE',103,NULL,NULL,NULL,NULL),(424,'1. Schleswiger Sportverein von 1906','1. Schleswiger SV von 1906','1906-01-01 00:00:00','DE',1161,NULL,NULL,NULL,NULL),(425,'','Bostelbeker SV v. 1922 II','1922-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(426,'','SVS Mesopotamien von 1997 e.V. II','1997-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(427,'','Trentino-Auswahl','1900-01-01 00:00:00','IT',360,NULL,NULL,NULL,NULL),(428,'','Moorreger SV v. 1947','1947-01-01 00:00:00','DE',215,NULL,NULL,NULL,NULL),(429,'DJK Spielverein Eintracht Heessen 22/26','DJK SV Eintracht Heessen 22/26','1900-01-01 00:00:00','DE',140,NULL,NULL,NULL,NULL),(430,'Rot Weiss Ahlen e.V.','Rot Weiss Ahlen','1996-06-01 00:00:00','DE',19,NULL,NULL,NULL,NULL),(431,'','TSV Seestermüher Marsch v. 1924 e. V','1924-01-01 00:00:00','DE',300,NULL,NULL,NULL,NULL),(432,'','Holsatia Elmshorn im EMTV von 1960 e. V. II','1900-01-01 00:00:00','DE',105,NULL,NULL,NULL,NULL),(433,'Deutscher Sportclub Arminia Bielefeld e. V.','DSC Arminia Bielefeld','1905-05-03 00:00:00','DE',51,NULL,NULL,NULL,NULL),(434,'Zentraler Sportklub der Armee Sofia','PFK ZSKA Sofia','1948-05-05 00:00:00','BG',1162,NULL,NULL,NULL,NULL),(435,'','SV Eintracht Lüneburg','1903-08-18 00:00:00','DE',202,NULL,NULL,NULL,NULL),(436,'','TSV Müden-Dieckhorst v. 1910','1910-01-01 00:00:00','DE',217,NULL,NULL,NULL,NULL),(437,'Freie Turnerschaft Preetz e.V. von 1897','FT Preetz e.V. von 1897','1897-01-01 00:00:00','DE',266,NULL,NULL,NULL,NULL),(438,'','Raisdorfer TSV v. 1922 e. V.','1900-01-01 00:00:00','DE',1163,NULL,NULL,NULL,NULL),(439,'Fußballsportverein Optik Rathenow e. V.','FSV Optik Rathenow','1991-02-21 00:00:00','DE',271,NULL,NULL,NULL,NULL),(440,'Ludwigsfelder Fußballclub e.V.','Ludwigsfelder FC','1996-05-30 00:00:00','DE',1164,NULL,NULL,NULL,NULL),(441,'','FC Teutonia Ottensen von 1905 e.V.','1905-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(442,'Turn- und Sportgemeinschaft Hoffenheim 1899 e. V. U 17','TSG 1899 Hoffenheim U 17','1899-01-01 00:00:00','DE',303,NULL,NULL,NULL,NULL),(443,'Uetersener Turn- und Sportverein 1898 e.V.','TSV Uetersen v. 1898 e. V.','1946-01-01 00:00:00','DE',318,NULL,NULL,NULL,NULL),(444,'','VfL Hammonia von 1922 e.V.','1922-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(445,'','TSV Reinbek von 1892 e.V.','1892-01-01 00:00:00','DE',274,NULL,NULL,NULL,NULL),(446,'','SV Börnsen v. 1948 II','1900-01-01 00:00:00','DE',57,NULL,NULL,NULL,NULL),(447,'Turn und Sportverein Hamburg von 1880 r.V.','TuS Hamburg 1880','1880-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(448,'','SV Uhlenhorst-Adler v. 1911/25 e.V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(449,'','S.C. Vorwärts-Wacker von 1904 e.V.','1904-04-03 00:00:00','DE',449,NULL,NULL,NULL,NULL),(450,'','FC St. Pauli v. 1910 III','1910-05-15 00:00:00','DE',449,NULL,NULL,NULL,NULL),(451,'','Tennis Borussia Berlin e. V (Frauen)','1902-04-09 00:00:00','DE',42,NULL,NULL,'\"TEBE\"',NULL),(452,'Verein für Leibesübungen Hamburg von 1893 e.V.','VfL 93 Hamburg','1893-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(453,'','DJK Schwarz-Weiss Neukölln 1920 e. V.','1920-01-01 00:00:00','DE',42,NULL,NULL,NULL,NULL),(454,'','KSF Anadolu Umutspor 1970 e.V.','1970-01-01 00:00:00','DE',42,NULL,NULL,NULL,NULL),(455,'Sportverein Rot-Gelb Harburg von 1950 e.V.','SV Rot-Gelb Harburg von 1950 e.V.','1950-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(456,'','Harburger Türksport von 1979 e. V. II','1979-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(457,'Football Club Girondins de Bordeaux','FC Girondins de Bordeaux','1881-10-01 00:00:00','FR',346,NULL,NULL,NULL,NULL),(458,'Sport-Club Nienstedten v. 1907 e.V.','SC Nienstedten v. 1907 e.V.','1907-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(459,'','Wuppertaler SV','1954-07-08 00:00:00','DE',337,NULL,NULL,NULL,NULL),(460,'','SC Osterbek von 1973 e.V.','1973-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(461,'Sportclub Sperber von 1898 e.V.','SC Sperber von 1898 e.V. II','1898-07-05 00:00:00','DE',449,NULL,NULL,NULL,NULL),(462,'Verein für Rasenspiele Wormatia 08 Worms e.V.','VfR Wormatia 08 Worms e.V.','1908-05-23 00:00:00','DE',336,NULL,NULL,NULL,NULL),(463,'','SC Verl von 1924 e. V.','1924-09-06 00:00:00','DE',321,NULL,NULL,NULL,NULL),(464,'Lemsaler Sportverein von 1967 e.V.','Lemsaler SV von 1967 e.V.','1967-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(465,'Post-Sportverein Hamburg von 1925 e.V.','Post-SV Hamburg von 1925 e.V.','1925-06-25 00:00:00','DE',449,NULL,NULL,NULL,NULL),(466,'Sport Club Persia Hamburg 2004 e.V. ','SC Persia Hamburg 2004 e.V. ','2004-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(467,'Sportverein K. S. Polonia von 1988 e. V.','SV K. S. Polonia von 1988 e. V.','1988-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(468,'Spielvereinigung Neckarelz e.V.','SpVgg Neckarelz','1921-06-01 00:00:00','DE',1166,NULL,NULL,NULL,NULL),(469,'Fußballsportverein Frankfurt 1899 e. V. U 23','FSV Frankfurt U 23','1900-01-01 00:00:00','DE',116,NULL,NULL,NULL,NULL),(470,'','SV Viktoria 01 e.V.','1900-01-01 00:00:00','DE',1167,NULL,NULL,NULL,NULL),(471,'','SV 98 Schwetzingen e.V.','1898-10-31 00:00:00','DE',298,NULL,NULL,NULL,NULL),(472,'Sportverein Waldhof Mannheim 07 e. V. U 19','SV Waldhof Mannheim 07 e. V. U 19','1907-04-11 00:00:00','DE',1168,NULL,NULL,NULL,NULL),(473,'','TSV Detag Wernberg','1900-01-01 00:00:00','DE',327,NULL,NULL,NULL,NULL),(474,'','1. FC Rötz e.V.','1900-01-01 00:00:00','DE',1169,NULL,NULL,NULL,NULL),(475,'Verein für Bewegungsspiele Auerbach 1906 e.V. ','VfB Auerbach 1906 e.V. ','1991-01-01 00:00:00','DE',28,NULL,NULL,NULL,NULL),(476,'Zipsendorfer Fußballclub Meuselwitz e.V.','ZFC Meuselwitz e. V.','1990-01-01 00:00:00','DE',211,NULL,NULL,NULL,NULL),(477,'Athletic Club Sparta Praha fotbal, a. s. II','AC Sparta Praha II','1893-01-01 00:00:00','CZ',417,NULL,NULL,NULL,NULL),(478,'FK Baník Sokolov a.s.','FK Banik Sokolov','1948-01-01 00:00:00','CZ',421,NULL,NULL,NULL,NULL),(479,'Uhlenhorster Sport-Club \"Paloma\" von 1909 e. V. II','USC Paloma Hamburg II','1909-08-01 00:00:00','DE',449,NULL,NULL,'Die Tuben',NULL),(480,'','Lüneburger SK Hansa von 2008 e.V.','1900-01-01 00:00:00','DE',202,NULL,NULL,NULL,NULL),(481,'','FC Anadolu Bayern','1982-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(482,'','SC Oberweikertshofen e. V.','1900-01-01 00:00:00','DE',1170,NULL,NULL,NULL,NULL),(483,'','SV Pullach im Isartal e.V.','1946-01-01 00:00:00','DE',1171,NULL,NULL,NULL,NULL),(484,'','DJK München Pasing e.V. 1956','1956-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(485,'','SV Wendisch Evern e.V. seit 1984','1984-01-01 00:00:00','DE',324,NULL,NULL,NULL,NULL),(486,'VfL Wolfsburg-Fußball GmbH U 17','VfL Wolfsburg U 17','1945-09-12 00:00:00','DE',333,NULL,NULL,'Wölfe',NULL),(487,'Turn- und Sportverein Crailsheim 1846 e.V.','TSV Crailsheim 1846 e. V.','1900-01-01 00:00:00','DE',88,NULL,NULL,NULL,NULL),(488,'Fortuna Sittard Combinatie','Fortuna Sittard','1968-07-01 00:00:00','NL',384,NULL,NULL,NULL,NULL),(489,'Möllner Sportvereinigung v. 1862 e.V.','Möllner SV v. 1862 e. V.','1862-01-01 00:00:00','DE',212,NULL,NULL,NULL,NULL),(490,'Fußballclub Energie Cottbus e.V.','FC Energie Cottbus e. V.','1966-01-31 00:00:00','DE',86,NULL,NULL,NULL,NULL),(491,'','SV Wilhelmsburg v. 1888 e. V.','1888-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(492,'Barenburger Sportverein Kickers Emden e. V.','BSV Kickers Emden','1946-03-24 00:00:00','DE',108,NULL,NULL,NULL,NULL),(493,'','Club Africain','1920-01-01 00:00:00','TN',425,NULL,NULL,NULL,NULL),(494,'','Club Sportif Sfaxien','1928-05-28 00:00:00','TN',424,NULL,NULL,NULL,NULL),(495,'','Türkiyemspor Berlin 1978 e. V.','1978-01-01 00:00:00','DE',42,NULL,NULL,NULL,NULL),(496,'','TuS Appen von 1947 e.V. II','1947-01-01 00:00:00','DE',25,NULL,NULL,NULL,NULL),(497,'','ASV Bergedorf-Lohbrügge von 1885 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(498,'','Sporting Clube de Portugal','1906-07-01 00:00:00','PT',395,NULL,NULL,NULL,NULL),(499,'','Al-Wehda Club','1914-01-01 00:00:00','SA',1172,NULL,NULL,'Knights of Mecca',NULL),(500,'','Vereinigte Arabische Emirate','1900-01-01 00:00:00','AE',1173,NULL,NULL,'Die Falken (Al Sukoor)',NULL),(501,'','Saudi-Arabien','1900-01-01 00:00:00','SA',1174,NULL,NULL,'Grüne Falken',NULL),(502,'','Olympique Lyonnais','1950-08-03 00:00:00','FR',347,NULL,NULL,NULL,NULL),(503,'Fußballclub Energie Cottbus e. V. II','FC Energie Cottbus e. V. II','1966-01-31 00:00:00','DE',86,NULL,NULL,NULL,NULL),(504,'','SV Krupunder / Lohkamp e. V.','1958-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(505,'','Standard Alu e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(506,'Associazione Calcio Firenze Fiorentina S.p.A.','ACF Fiorentina','1926-08-26 00:00:00','IT',361,NULL,NULL,NULL,NULL),(507,'Verein für Sport- und Gemeinschaftspflege Stapelfeld v. 1968 e. V.','VSG Stapelfeld v. 1968 e. V.','1968-01-01 00:00:00','DE',307,NULL,NULL,NULL,NULL),(508,'Karlsruher Sport-Club Mühlburg-Phönix e. V.','Karlsruher SC','1894-06-06 00:00:00','DE',168,NULL,NULL,NULL,NULL),(509,'','TuS Hoisdorf v. 1958','1958-01-01 00:00:00','DE',154,NULL,NULL,NULL,NULL),(510,'','TSV Bargteheide v. 1868 e.V.','1900-01-01 00:00:00','DE',38,NULL,NULL,NULL,NULL),(511,'','Finnland','1900-01-01 00:00:00','FI',345,NULL,NULL,NULL,NULL),(512,'','Deutschland','1900-01-01 00:00:00','DE',116,NULL,NULL,NULL,NULL),(513,'','FC Eintracht Rellingen v. 1987 e. V.','1987-01-01 00:00:00','DE',276,NULL,NULL,NULL,NULL),(514,'','TuS Hasloh v. 1928 e. V.','1900-01-01 00:00:00','DE',146,NULL,NULL,NULL,NULL),(515,'Turn- und Sportverein Sasel v. 1925','TSV Sasel','1925-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(516,'','TSV Eppendorf / Groß- Borstel von 1908 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(517,'','F.C. Lauenburg e.V.','1900-01-01 00:00:00','DE',189,NULL,NULL,NULL,NULL),(518,'','FC Süderelbe von 1949 e.V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(519,'Sport Club Westfalia 04 e.V. Herne','SC Westfalia 04 e.V. Herne','1904-06-13 00:00:00','DE',152,NULL,NULL,NULL,NULL),(520,'','VfB 48/64 Hüls e. V.','1900-01-01 00:00:00','DE',1175,NULL,NULL,NULL,NULL),(521,'','Rot-Weiß Essen II','1900-01-01 00:00:00','DE',1093,NULL,NULL,NULL,NULL),(522,'','Hamburger SV U 17','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(523,'','Breitenfelder SV v. 1924 e. V.','1900-01-01 00:00:00','DE',68,NULL,NULL,NULL,NULL),(524,'','FSG Südstormarn v. 1997','1997-01-01 00:00:00','DE',1176,NULL,NULL,NULL,NULL),(525,'','TSV Zarpen e.V.','1900-01-01 00:00:00','DE',338,NULL,NULL,NULL,NULL),(526,'','FC Zwolle','1990-07-01 00:00:00','NL',385,NULL,NULL,NULL,NULL),(527,'','Real Valladolid','1928-06-20 00:00:00','ES',1177,NULL,NULL,NULL,NULL),(528,'','Kuba','1900-01-01 00:00:00','CU',1178,NULL,NULL,NULL,NULL),(529,'','SC Alstertal-Langenhorn e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(530,'','HSV Barmbek-Uhlenhorst v. 1923 U 19','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(531,'','Hamburger SV U 19','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(532,'','Mohun Bagan Athletic Club','1889-01-01 00:00:00','IN',353,NULL,NULL,'The Mariners',NULL),(533,'Breloher Sport-Club v. 1949','Breloher SC v. 1949','1949-01-01 00:00:00','DE',1079,NULL,NULL,NULL,NULL),(534,'',' SG Bomlitz - Lönsheide von 1919 und 1946 e.V.','1900-01-01 00:00:00','DE',1179,NULL,NULL,NULL,NULL),(535,'','Lüneburger SK v. 1901','1900-01-01 00:00:00','DE',202,NULL,NULL,NULL,NULL),(536,'','SV Eintracht Nordhorn e. V.','1900-01-01 00:00:00','DE',245,NULL,NULL,NULL,NULL),(537,'Futbolny klub Senit Sankt-Peterburg','FK Zenit Sankt Petersburg','1925-01-01 00:00:00','RU',401,NULL,NULL,NULL,NULL),(538,'','Füchse Berlin Reinickendorf e. V. Berliner Turn- und Sportverein von 1891','1891-01-28 00:00:00','DE',42,NULL,NULL,NULL,NULL),(539,'Sport-Club Charlottenburg e. V.','SC Charlottenburg e. V.','1902-09-15 00:00:00','DE',42,NULL,NULL,NULL,NULL),(540,'','Borussia Dortmund II','1900-01-01 00:00:00','DE',92,NULL,NULL,NULL,NULL),(541,'ŠK Slovan Bratislava futbal a.s.','ŠK Slovan Bratislava','1919-05-03 00:00:00','SK',413,NULL,NULL,NULL,NULL),(542,'Football Club Spartak Trnava','FC Spartak Trnava','1923-03-30 00:00:00','SK',1180,NULL,NULL,NULL,NULL),(543,'','Mümmelmannsberger SV Hamburg v. 1974','1974-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(544,'Royal Sporting Club Anderlecht','RSC Anderlecht','1908-05-27 00:00:00','BE',6,NULL,NULL,NULL,NULL),(545,'VfL Wolfsburg-Fußball GmbH II','VfL Wolfsburg II','1945-09-12 00:00:00','DE',333,NULL,NULL,'Jungwölfe',NULL),(546,'Turn- und Sportverein München-Großhadern von 1926','TSV München-Großhadern von 1926 e.V.','1926-01-01 00:00:00','DE',220,NULL,NULL,NULL,NULL),(547,'','Aberdeen FC','1900-01-01 00:00:00','SS',410,NULL,NULL,NULL,NULL),(548,'','FSV Geesthacht 07 II','1900-01-01 00:00:00','DE',124,NULL,NULL,NULL,NULL),(549,'','FSV Geesthacht 07','1900-01-01 00:00:00','DE',124,NULL,NULL,NULL,NULL),(550,'','FC Voran Ohe v. 1949 II','1900-01-01 00:00:00','DE',275,NULL,NULL,NULL,NULL),(551,'','SC Sperber von 1898 e.V.','1898-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(552,'','SC Herford','1972-06-16 00:00:00','DE',151,NULL,NULL,NULL,NULL),(553,'','VfL Herford e.V','1900-01-01 00:00:00','DE',151,NULL,NULL,NULL,NULL),(554,'','Sporting Clube de Braga','1921-01-19 00:00:00','PT',394,NULL,NULL,NULL,NULL),(555,'Inter Genclik Spor Kulübü Bergedorf 2000 II','Inter GSK Bergedorf 2000 II','2000-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(556,'','Juventude do Minho 1987 e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(557,'Toronto Football Club','Toronto FC','2006-05-11 00:00:00','CA',369,NULL,NULL,NULL,NULL),(558,'','New England Revolution','1900-01-01 00:00:00','US',1181,NULL,NULL,NULL,NULL),(559,'','SV Ilmenau von 1923 e.V.','1923-01-01 00:00:00','DE',209,NULL,NULL,NULL,NULL),(560,'','TuS Bodenteich von 1911 e.V.','1900-01-01 00:00:00','DE',1182,NULL,NULL,NULL,NULL),(561,'Clube de Futebol Os Belenenses','Belenenses Lissabon','1919-09-23 00:00:00','PT',395,NULL,NULL,NULL,NULL),(562,'Fußballclub Viktoria Köln 1904 e. V.','FC Viktoria Köln','2010-06-22 00:00:00','DE',178,NULL,NULL,NULL,NULL),(563,'','TuS Erndtebrück','1900-01-01 00:00:00','DE',1183,NULL,NULL,NULL,NULL),(564,'Sport Lisboa e Benfica','Benfica Lissabon','1904-04-28 00:00:00','PT',395,NULL,NULL,'Águias (Adler)',NULL),(565,'','Wales','1900-01-01 00:00:00','WW',434,NULL,NULL,NULL,NULL),(566,'SC Sternschanze von 1911 e.V.','SC Sternschanze von 1911 e.V.','1970-04-22 00:00:00','DE',449,NULL,NULL,NULL,NULL),(567,'Sportverein Stuttgarter Kickers e. V.','SV Stuttgarter Kickers','1899-09-21 00:00:00','DE',310,NULL,NULL,NULL,NULL),(568,'','England','1900-01-01 00:00:00','EN',339,NULL,NULL,NULL,NULL),(569,'Reial Club Deportiu Mallorca','RCD Mallorca','1916-01-01 00:00:00','ES',416,NULL,NULL,NULL,NULL),(570,'','VfB Oldenburg','1897-10-17 00:00:00','DE',250,NULL,NULL,NULL,NULL),(571,'Fussballclub Schaffhausen','FC Schaffhausen','1896-01-01 00:00:00','CH',409,NULL,NULL,NULL,NULL),(572,'','SV Werder Bremen U 19','1899-02-04 00:00:00','DE',70,NULL,NULL,NULL,NULL),(573,'Turn- und Sportverein Plön von 1864 e.V.','TSV Plön','1864-01-01 00:00:00','DE',262,NULL,NULL,NULL,NULL),(574,'','TSV Kronshagen v. 1924','1900-01-01 00:00:00','DE',1184,NULL,NULL,NULL,NULL),(575,'','ESV Einigkeit Wilhelmsburg v. 1908','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(576,'','FC Energie Cottbus e. V. (a) II','1900-01-01 00:00:00','DE',86,NULL,NULL,NULL,NULL),(577,'Sportverein Süden Forst e.V.','SV Süden Forst','1907-01-01 00:00:00','DE',1185,NULL,NULL,NULL,NULL),(578,'','Willinghusener SC v. 1958 e. V. II','1900-01-01 00:00:00','DE',41,NULL,NULL,NULL,NULL),(579,'Breiten- und Freizeit Sportverein Atlantik 1997','BFSV Atlantik 97','1997-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(580,'','TSG Bergedorf v. 1860','1860-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(581,'','TSV Gut Heil Heist von 1910 e.V.','1900-01-01 00:00:00','DE',1186,NULL,NULL,NULL,NULL),(582,'Sportverein Meppen 1912 e. V.','SV Meppen','1912-11-29 00:00:00','DE',210,NULL,NULL,NULL,NULL),(583,'Associazione Calcio Milan S.p.A.','AC Milan','1899-12-13 00:00:00','IT',362,NULL,NULL,NULL,NULL),(584,'','SC Bosna 1992 e. V.','1992-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(585,'','Sarajevo SV v. 1994 e. V.','1994-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(586,'','FC Geesthacht e. V.','1900-01-01 00:00:00','DE',124,NULL,NULL,NULL,NULL),(587,'Real Madrid Club de Fútbol','Real Madrid','1902-03-06 00:00:00','ES',415,NULL,NULL,NULL,NULL),(588,'Aachener Turn- und Sportverein Alemannia 1900 e. V.','Alemannia Aachen','1900-12-16 00:00:00','DE',18,NULL,NULL,NULL,NULL),(589,'1. Fußball-Club Saarbrücken e.V.','1. FC Saarbrücken','1903-04-18 00:00:00','DE',286,NULL,NULL,NULL,NULL),(590,'Sharjah Sports & Cultural Club','Al Sharjah SCC','1966-01-01 00:00:00','AE',1187,NULL,NULL,'The King & The Century Club',NULL),(591,'','Al-Ahli Club Dubai','1970-01-01 00:00:00','AE',431,NULL,NULL,NULL,NULL),(592,'','SV Blau Weiß Polz e. V.','1900-01-01 00:00:00','DE',263,NULL,NULL,NULL,NULL),(593,'Sport Club Urania e.V. von 1931','SC Urania e.V. von 1931','1931-06-17 00:00:00','DE',449,NULL,NULL,NULL,NULL),(594,'Sport Club Teutonia von 1910 e.V.','SC Teutonia von 1910 e.V.','1910-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(595,'','SV Blau-Weiß von 1896 Schenefeld e.V.','1900-01-01 00:00:00','DE',289,NULL,NULL,NULL,NULL),(596,'Fußballclub Rumeln 2001 Duisburg e.V.','FCR 2001 Duisburg','2001-01-01 00:00:00','DE',95,NULL,NULL,NULL,NULL),(597,'Spielvereinigung Drochtersen/Assel e. V.','SV Drochtersen/Assel e. V.','1977-04-19 00:00:00','DE',94,NULL,NULL,NULL,NULL),(598,'','TSV Schlutup von 1907 e.V.','1900-01-01 00:00:00','DE',195,NULL,NULL,NULL,NULL),(599,'','FC Normannia 1906 Harburg','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(600,'','Panteras Negras e.V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(601,'','FC Winterhude e. V.','2004-01-18 00:00:00','DE',449,NULL,NULL,NULL,NULL),(602,'Turn- und Sportverein Hohenhorst von 1963 e.V.','TSV Hohenhorst von 1963 e.V.','1963-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(603,'','FC St. Georg-Horn im Horner TV','2000-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(604,'','TuS Osdorf von 1907','1907-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(605,'','Polizei-Sportverein Union Neumünster v. 1973 e.V.','1900-01-01 00:00:00','DE',230,NULL,NULL,NULL,NULL),(606,'','SC Langenhagen','1945-01-01 00:00:00','DE',187,NULL,NULL,NULL,NULL),(607,'Turn- und Sportverein Fortuna Sachsenross von 1891 e.V.','TSV Fortuna Sachsenross von 1891 e.V.','1891-01-01 00:00:00','DE',141,NULL,NULL,NULL,NULL),(608,'','San Marino','1900-01-01 00:00:00','SM',405,NULL,NULL,NULL,NULL),(609,'Alliance Club Horsens','AC Horsens','1994-01-01 00:00:00','DK',15,NULL,NULL,NULL,NULL),(610,'1. Fußballclub Magdeburg e.V.','1. FC Magdeburg','1965-12-22 00:00:00','DE',204,NULL,NULL,'\"Der Club\"',NULL),(611,'','TuS Lehmden von 1908 e.V.','1900-01-01 00:00:00','DE',270,NULL,NULL,NULL,NULL),(612,'','SV Barmbek von 1939 e. V.','1939-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(614,'','SV Bergstedt v. 1948','1948-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(615,'','Italien','1900-01-01 00:00:00','IT',364,NULL,NULL,NULL,NULL),(616,'','Ukraine','1900-01-01 00:00:00','UA',1188,NULL,NULL,NULL,NULL),(617,'','Regionalauswahl Göttingen','1900-01-01 00:00:00','DE',132,NULL,NULL,NULL,NULL),(618,'','Mexiko','1900-01-01 00:00:00','MX',1189,NULL,NULL,NULL,NULL),(619,'','VfB Fallersleben','1945-08-02 00:00:00','DE',333,NULL,NULL,NULL,NULL),(620,'','Anadolu SV Göttingen','1900-01-01 00:00:00','DE',132,NULL,NULL,NULL,NULL),(621,'','Vereinigte Staaten von Amerika','1900-01-01 00:00:00','US',1190,NULL,NULL,NULL,NULL),(622,'','Lettland','1900-01-01 00:00:00','LV',374,NULL,NULL,NULL,NULL),(623,'','Long Island Rough Riders','1994-01-01 00:00:00','US',430,NULL,NULL,'\"Rough Riders\"',NULL),(624,'','Richmond Kickers','1993-01-01 00:00:00','US',1191,NULL,NULL,NULL,NULL),(625,'','New York Red Bulls','1995-01-01 00:00:00','US',1192,NULL,NULL,NULL,NULL),(626,'','U 21 Schleswig-Holstein','1900-01-01 00:00:00','DE',171,NULL,NULL,NULL,NULL),(627,'','Bonner Sport-Club 01/04 e. V.','1965-06-18 00:00:00','DE',61,NULL,NULL,NULL,NULL),(628,'1. Fußball-Club Kaiserslautern e. V.','1. FC Kaiserslautern','1900-06-02 00:00:00','DE',166,NULL,NULL,'\"Rote Teufel\"',NULL),(629,'Sportverein Lichtenberg 47 e. V.','SV Lichtenberg 47','1947-04-26 00:00:00','DE',42,NULL,NULL,NULL,NULL),(630,'Berliner Fußball-Club Germania 1888 e. V.','BFC Germania 1888','1888-04-15 00:00:00','DE',42,NULL,NULL,NULL,NULL),(631,'Sportverein Babelsberg 03 e. V. II','SV Babelsberg 03 II','1903-10-01 00:00:00','DE',264,NULL,NULL,NULL,NULL),(632,'','SC Oberhavel Velten','1900-01-01 00:00:00','DE',1193,NULL,NULL,NULL,NULL),(633,'Club Athlétique Bizertin','Club Athlétique Bizertin','1926-07-12 00:00:00','TN',423,NULL,NULL,NULL,NULL),(634,'','Espérance Sportive de Tunis','1919-01-15 00:00:00','TN',425,NULL,NULL,NULL,NULL),(636,'L’Association sportive des Forces armées royales','AS.FAR','1958-09-01 00:00:00','MA',379,NULL,NULL,NULL,NULL),(637,'','Voßocher SV','1977-07-25 00:00:00','DE',60,NULL,NULL,NULL,NULL),(639,'','SC Pinneberg von 1918 e.V. II','1918-01-01 00:00:00','DE',259,NULL,NULL,NULL,NULL),(640,'','VfR Horst','1949-01-01 00:00:00','DE',157,NULL,NULL,NULL,NULL),(641,'Ball-Spiel-Club Brunsbüttel von 1967 e.V.','BSC Brunsbüttel v. 1967 e. V.','1967-04-21 00:00:00','DE',76,NULL,NULL,NULL,NULL),(642,'Turn- und Sportverein Güldenstern Stade e.V.','TuS Güldenstern Stade','1924-01-01 00:00:00','DE',306,NULL,NULL,NULL,NULL),(643,'','SV Blau-Weiß Bornreihe','1932-01-01 00:00:00','DE',322,NULL,NULL,NULL,NULL),(644,'','Tunesien','1900-01-01 00:00:00','TN',425,NULL,NULL,NULL,NULL),(645,'','Sambia','1900-01-01 00:00:00','ZM',1194,NULL,NULL,NULL,NULL),(646,'','Togo','1900-01-01 00:00:00','TG',1195,NULL,NULL,NULL,NULL),(647,'','Kongo','1900-01-01 00:00:00','CD',1196,NULL,NULL,NULL,NULL),(648,'','Ägypten team','1900-01-01 00:00:00','EG',2,NULL,NULL,NULL,NULL),(649,'','Libyen','1900-01-01 00:00:00','LY',1197,NULL,NULL,NULL,NULL),(650,'Persepolis Football Club Tehran','Persepolis FC Teheran','1963-01-01 00:00:00','IR',354,NULL,NULL,NULL,NULL),(651,'Fußballclub Rot-Weiß Erfurt e. V.','FC Rot-Weiß Erfurt','1966-01-26 00:00:00','DE',109,NULL,NULL,NULL,NULL),(652,'','SV Altengamme v. 1928 e. V.','1928-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(653,'Club Brugge Koninklijke Voetbalvereniging','Club Brugge KV','1891-11-13 00:00:00','BE',5,NULL,NULL,NULL,NULL),(654,'','Rendsburger TSV v. 1859 e.V.','1859-01-01 00:00:00','DE',279,NULL,NULL,NULL,NULL),(655,'Turn- und Sportverein Altenholz von 1948','TSV Altenholz','1948-05-21 00:00:00','DE',23,NULL,NULL,NULL,NULL),(656,'Itzehoer Sportverein 1909 e.V.','Itzehoer SV v. 1909','1909-10-03 00:00:00','DE',161,NULL,NULL,NULL,NULL),(657,'Freie Turn- und Sportvereinigung Lorbeer-Rothenburgsort von 1896','FTSV Lorbeer Rothenburgsort v. 1896','1896-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(658,'Harburger Sportclub 1904/07 e.V. Borussia Rasensport','Harburger SC 1904/07 e.V. ','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(659,'Sportverein Rot-Weiss Cuxhaven 1990 e.V.','SV Rot-Weiss Cuxhaven','1990-01-01 00:00:00','DE',89,NULL,NULL,NULL,NULL),(660,'Brinkumer Sportverein von 1924 e. V.','Brinkumer SV von 1924 e. V.','1961-03-13 00:00:00','DE',309,NULL,NULL,NULL,NULL),(661,'Verein für Rasensport Neumünster von 1910 e.V.','VfR Neumünster','1910-01-01 00:00:00','DE',230,NULL,NULL,NULL,NULL),(662,'','Bremer Turn- und Sportgemeinde Neustadt v. 1859','1859-01-01 00:00:00','DE',70,NULL,NULL,NULL,NULL),(663,'urn- und Sportverein Woltmershausen von 1890','TS Woltmershausen v. 1890','1890-01-01 00:00:00','DE',70,NULL,NULL,NULL,NULL),(664,'','FC Erzgebirge Aue','1900-01-01 00:00:00','DE',27,NULL,NULL,NULL,NULL),(665,'','TSV Stellingen v. 1888 e.V. II','1898-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(666,'','Freie Sportvereinigung Harburg v. 1893','1893-06-06 00:00:00','DE',449,NULL,NULL,NULL,NULL),(668,'','SV Vahdet-Hamburg v. 1999 II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(669,'','FC Oliveirense e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(670,'','SSC Italia Amburgo e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(671,'','TuS Berne e. V. II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(672,'','Salomonen Inseln','1900-01-01 00:00:00','SB',404,NULL,NULL,NULL,NULL),(673,'','Australien','1900-01-01 00:00:00','AU',4,NULL,NULL,NULL,NULL),(674,'New Zealand Knights Football Club','New Zealand Knights FC','2004-01-01 00:00:00','NZ',1199,NULL,NULL,NULL,NULL),(675,'','Sydney FC','2004-01-01 00:00:00','AU',4,NULL,NULL,NULL,NULL),(676,'','FC Reher/Puls','1900-01-01 00:00:00','DE',1200,NULL,NULL,NULL,NULL),(677,'Melbourne Victory Football Club','Melbourne Victory FC','2004-01-01 00:00:00','AU',1201,NULL,NULL,NULL,NULL),(679,'','Borussia Dortmund U 19','1900-01-01 00:00:00','DE',92,NULL,NULL,NULL,NULL),(680,'','Borussia Mönchengladbach U 19','1900-01-01 00:00:00','DE',213,NULL,NULL,NULL,NULL),(681,'','TSV Duwo 08','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(682,'','SV Fortuna 72 Hamburg','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(683,'','SC Hansa 1910 /11 e.V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(684,'','Hamburger Gehörlosen SV von 1904 e.V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(685,'','TSV Büsum e.V.','1900-01-01 00:00:00','DE',80,NULL,NULL,NULL,NULL),(686,'Heider Sportverein von 1925 e.V.','Heider SV','1925-10-14 00:00:00','DE',148,NULL,NULL,NULL,NULL),(687,'','SV Soltau v. 1912 e.V.','1900-01-01 00:00:00','DE',305,NULL,NULL,NULL,NULL),(688,'','Leinebergland-Auswahl','1900-01-01 00:00:00','DE',22,NULL,NULL,NULL,NULL),(689,'','Nordirland','1900-01-01 00:00:00','nn',386,NULL,NULL,NULL,NULL),(690,'Athlone Town Association Football Club','Athlone Town A.F.C.','1887-01-01 00:00:00','IE',355,NULL,NULL,NULL,NULL),(691,'Cobh Ramblers Football Club','Cobh Ramblers F.C. ','1922-01-01 00:00:00','IE',1202,NULL,NULL,NULL,NULL),(692,'','Irland U 21','1900-01-01 00:00:00','IE',356,NULL,NULL,NULL,NULL),(693,'','Israel U 21','1900-01-01 00:00:00','IL',359,NULL,NULL,NULL,NULL),(694,'Spielvereinigung Germania 90 Schöneiche','SV Germania 90 Schöneiche','1894-01-01 00:00:00','DE',295,NULL,NULL,NULL,NULL),(695,'Brandenburger Sportclub Süd 05 e.V.','Brandenburger SC Süd 05','1905-10-13 00:00:00','DE',1203,NULL,NULL,NULL,NULL),(696,'','1. FSV Mainz 05 II','1900-01-01 00:00:00','DE',205,NULL,NULL,NULL,NULL),(697,'Spielverein Schermbeck e.V. 1912','SV Schermbeck 1912','1912-01-01 00:00:00','DE',1204,NULL,NULL,NULL,NULL),(698,'FC Viktoria Harburg von 1910 e.V.','FC Viktoria Harburg','1910-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(699,'','Inter Wilhelmsburg e. V.','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(700,'Turn- und Sportverein Bordesholm von 1906 e.V.','TSV Bordesholm','1973-06-27 00:00:00','DE',62,NULL,NULL,NULL,NULL),(701,'Turn- und Sportverein e.V. von 1946','TSV Kropp','1946-02-06 00:00:00','DE',183,NULL,NULL,NULL,NULL),(702,'1. Frauenfußballclub Turbine Potsdam 71 e. V.','1. FFC Turbine Potsdam','1999-04-01 00:00:00','DE',264,NULL,NULL,NULL,NULL),(703,'Berliner Fussballclub Preussen 1894 e. V.','Berliner FC Preussen 1894 e. V.','1894-05-01 00:00:00','DE',42,NULL,NULL,NULL,NULL),(704,'1. Fußballclub Union Berlin e. V. II','1. FC Union Berlin II','1900-01-01 00:00:00','DE',42,NULL,NULL,'\"Die Eisernen\"',NULL),(705,'','Estland','1900-01-01 00:00:00','EE',344,NULL,NULL,NULL,NULL),(706,'','Slowakei','1900-01-01 00:00:00','SK',413,NULL,NULL,NULL,NULL),(707,'Turn- und Sportverein Sparrieshoop von 1951','TSV Sparrieshoop von 1951','1951-01-01 00:00:00','DE',1205,NULL,NULL,NULL,NULL),(708,'Kieler Sportvereinigung Holstein von 1900 e.V. II','Holstein Kiel II','1900-01-01 00:00:00','DE',171,NULL,NULL,'\"Die Störche\"',NULL),(709,'Football Club Twente','FC Twente Enschede','1965-07-01 00:00:00','NL',382,NULL,NULL,NULL,NULL),(710,'Betaald Voetbal De Graafschap','BV De Graafschap','1954-02-01 00:00:00','NL',1206,NULL,NULL,NULL,NULL),(711,'','TSV Bayer Dormagen 1920 e.V.','1920-01-01 00:00:00','DE',91,NULL,NULL,NULL,NULL),(712,'Meidericher Spielverein 02 e. V. Duisburg II','MSV Duisburg II','1900-01-01 00:00:00','DE',95,NULL,NULL,'\"Die Zebrs\"',NULL),(713,'','SV Austria Salzburg','1900-01-01 00:00:00','AT',1207,NULL,NULL,NULL,NULL),(714,'','Marokko','1900-01-01 00:00:00','MA',379,NULL,NULL,NULL,NULL),(715,'','Kenia','1900-01-01 00:00:00','KE',1208,NULL,NULL,NULL,NULL),(716,'','FT Eider Büdelsdorf','1900-01-01 00:00:00','DE',78,NULL,NULL,NULL,NULL),(717,'VfL Oldesloe von 1862 e.V.','VfL Oldesloe','1862-01-01 00:00:00','DE',37,NULL,NULL,NULL,NULL),(718,'','Hamburg FC Algerien Nady e.V. ','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(719,'','HIRA-Kurdischer SV','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(720,'','Lauenburger SV','1900-01-01 00:00:00','DE',189,NULL,NULL,NULL,NULL),(721,'','FC Sörup-Sterup v.1999 e.V.','1999-01-01 00:00:00','DE',1209,NULL,NULL,NULL,NULL),(722,'','TSV Duwo 08 II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(723,'','Hoisbütteler SV v. 1955 II','1900-01-01 00:00:00','DE',24,NULL,NULL,NULL,NULL),(724,'Buxtehuder Sportverein v. 1862 e. v. II','Buxtehuder SV v. 1862 e. v. II','1900-01-01 00:00:00','DE',81,NULL,NULL,NULL,NULL),(725,'Sportverein Grün-Weiß Eimsbüttel von 1901 e.V.','ESV Grün-Weiß Eimsbüttel','1901-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(726,'SV Wilhelmshaven Germania 05 e.V.','SV Wilhelmshaven','1900-01-01 00:00:00','DE',330,NULL,NULL,NULL,NULL),(727,'','Meiendorfer SV v. 1949 II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(728,'','SK Sigma Olomouc','1900-01-01 00:00:00','CZ',1210,NULL,NULL,NULL,NULL),(729,'Leichtathletik Rasensport Ahlen e.V.','LR Ahlen','1996-06-01 00:00:00','DE',19,NULL,NULL,NULL,NULL),(730,'Moadon Kaduregel Maccabi Tel Aviv','Maccabi Tel Aviv','1906-01-01 00:00:00','IL',359,NULL,NULL,NULL,NULL),(731,'Norderstedter Sport- u. Freizeitverein e.V.','Norderstedter SV e. V.','1900-01-01 00:00:00','DE',235,NULL,NULL,NULL,NULL),(732,'','Leezener SC e.V. II','1900-01-01 00:00:00','DE',1211,NULL,NULL,NULL,NULL),(733,'Ballspielverein Cloppenburg e.V. von 1919','BV Cloppenburg','1919-03-23 00:00:00','DE',85,NULL,NULL,NULL,NULL),(734,'','TSV Wandsbek-Jenfeld v. 1881','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(735,'Sport-Club Hamm von 1902 e.V.','SC Hamm von 1902 e.V.','1902-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(736,'Sportgemeinde Eintracht e.V. 1902 Bad Kreuznach','SG Eintracht e.V. 1902 Bad Kreuznach','1902-01-01 00:00:00','DE',35,NULL,NULL,NULL,NULL),(737,'','Eintracht Frankfurt II','1900-01-01 00:00:00','DE',116,NULL,NULL,NULL,NULL),(738,'Association Sportive de Monaco Football Club','AS Monaco','1919-01-01 00:00:00','MC',1212,NULL,NULL,NULL,NULL),(739,'','SV Curslack-Neuengamme v. 1919 e. V. II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(740,'Dulsberger Sport Club Hanseat von 1899 e. V.','Dulsberger SC Hanseat von 1899 e. V.','1899-05-15 00:00:00','DE',449,NULL,NULL,NULL,NULL),(741,'1. Fußballclub Hellbrook von 1967 e.V.','1. FC Hellbrook von 1967 e.V.','1967-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(742,'','Hannover 96 U 19','1900-01-01 00:00:00','DE',141,NULL,NULL,NULL,NULL),(743,'Verein für Leibesübungen von 1899 e. V. II','VfL Osnabrück II','1899-04-17 00:00:00','DE',251,NULL,NULL,NULL,NULL),(744,'','FC Bremerhaven von 1899 e. V.','1899-06-01 00:00:00','DE',75,NULL,NULL,NULL,NULL),(745,'','Kickers Halstenbek','1975-01-01 00:00:00','DE',139,NULL,NULL,'Pink Panther',NULL),(746,'','SV Henstedt-Rhen v. 1963','1963-01-01 00:00:00','DE',150,NULL,NULL,NULL,NULL),(747,'','VfL Sittensen v. 1904','1904-01-01 00:00:00','DE',304,NULL,NULL,NULL,NULL),(748,'Shelbourne Football Club','Shelbourne FC','1895-01-01 00:00:00','IE',356,NULL,NULL,NULL,NULL),(749,'Bohemian Football Club Dublin','Bohemians Dublin','1890-01-01 00:00:00','IE',356,NULL,NULL,NULL,NULL),(750,'','Irland','1900-01-01 00:00:00','IE',356,NULL,NULL,NULL,NULL),(751,'','Rumänien','1900-01-01 00:00:00','RO',403,NULL,NULL,NULL,NULL),(752,'SpVgg Rot-Weiß Moisling v. 1911 e.V','SpVgg Rot-Weiß Moisling','1911-10-11 00:00:00','DE',195,NULL,NULL,NULL,NULL),(753,'Oldenburger Sportverein von 1865 e.V.','Oldenburger Sportverein von 1865 e.V.','1865-01-01 00:00:00','DE',1213,NULL,NULL,NULL,NULL),(754,'Verein für Bewegungsspiele Lübeck von 1919 e.  V. II','VfB Lübeck v. 1919 II','1900-01-01 00:00:00','DE',195,NULL,NULL,NULL,NULL),(755,'Düneberger Sportverein von 1919 e.V.','Düneberger SV von 1919 e. V.','1919-01-01 00:00:00','DE',124,NULL,NULL,NULL,NULL),(756,'First Vienna Football Club 1894','First Vienna FC 1894','1894-08-22 00:00:00','AT',390,NULL,NULL,NULL,NULL),(757,'Floridsdorfer Athletiksport-Club','Floridsdorfer AC','1904-01-01 00:00:00','AT',390,NULL,NULL,'\"FAC\"',NULL),(758,'','Harburger TB v. 1865','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(759,'','Istanbulspor Anonim Sirketi','1926-01-01 00:00:00','TR',422,NULL,NULL,NULL,NULL),(760,'','Elazigspor Kulübü','1967-01-01 00:00:00','TR',1214,NULL,NULL,NULL,NULL),(761,'','CS Grevenmacher','1900-01-01 00:00:00','LU',376,NULL,NULL,NULL,NULL),(762,'','Union Sportive Luxembourg','1900-01-01 00:00:00','LU',1215,NULL,NULL,NULL,NULL),(763,'','GSK Bergedorf 2000','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(764,'Eisenbahner Turn- und Sportverein Hamburg v. 1924 e. V. II','ETSV Hamburg v. 1924 e. V. II','1924-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(765,'','TSV Wandsbek-Jenfeld v. 1881 II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(766,'','TSV Glinde von 1930 e.V. II','1900-01-01 00:00:00','DE',131,NULL,NULL,NULL,NULL),(767,'','SV Örnek-Türkspor Hamburg','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(768,'','FK \"Dinamo\" Moskwa','1900-01-01 00:00:00','RU',399,NULL,NULL,NULL,NULL),(769,'','Kaltenkirchener Turnerschaft von 1894','1894-01-01 00:00:00','DE',167,NULL,NULL,NULL,NULL),(770,'Hamrun Spartans Football Club','Hamrun Spartans FC','1907-01-01 00:00:00','MT',1216,NULL,NULL,NULL,NULL),(771,'','Valletta FC','1900-01-01 00:00:00','MT',1217,NULL,NULL,NULL,NULL),(772,'Olympischer Sport-Club Bremerhaven v. 1972 e.V.','Olympischer SC Bremerhaven v. 1972 e. V.','1972-01-01 00:00:00','DE',75,NULL,NULL,NULL,NULL),(773,'','TSV Lesum-Burgmann v. 1876 e. V.','1900-01-01 00:00:00','DE',70,NULL,NULL,NULL,NULL),(774,'','Tangstedter SV v. 1950','1950-01-01 00:00:00','DE',312,NULL,NULL,NULL,NULL),(775,'','Sportfreunde Uetersen Dostlukspor e. V.','1900-01-01 00:00:00','DE',318,NULL,NULL,NULL,NULL),(776,'','FK Dnipro Dnjpropetrowsk','1918-01-01 00:00:00','UA',426,NULL,NULL,NULL,NULL),(777,'','VfL Jesteburg v. 1912 e. V. II','1900-01-01 00:00:00','DE',164,NULL,NULL,NULL,NULL),(778,'','TSV Auetal v. 1910 e. V. II','1900-01-01 00:00:00','DE',1218,NULL,NULL,NULL,NULL),(779,'Sportverein Hafen Rostock von 1961 e. V.','SV Hafen Rostock v. 1961 e. V.','1961-10-27 00:00:00','DE',280,NULL,NULL,NULL,NULL),(780,'','Rostocker FC v. 1895 e.V.','1900-01-01 00:00:00','DE',280,NULL,NULL,NULL,NULL),(781,'Verein für Rasensport Schleswig','VfR Schleswig','1919-01-01 00:00:00','DE',1161,NULL,NULL,NULL,NULL),(782,'','SC Concordia v. 1907 e. V. II','1907-05-09 00:00:00','DE',449,NULL,NULL,NULL,NULL),(783,'Sportverein Buchonia Flieden 1912 e.V.','SV Buchonia Flieden 1912 e.V.','1912-01-01 00:00:00','DE',115,NULL,NULL,NULL,NULL),(784,'Verein für Bewegungsspiele 1905 Marburg e. V.','VfB 1905 Marburg','1905-05-13 00:00:00','DE',1219,NULL,NULL,NULL,NULL),(785,'','Liechtenstein','1900-01-01 00:00:00','LI',373,NULL,NULL,NULL,NULL),(786,'','Türkei','1900-01-01 00:00:00','TR',1220,NULL,NULL,NULL,NULL),(787,'','Sparkasse FC Blau-Weiß Feldkirch','1900-01-01 00:00:00','AT',387,NULL,NULL,NULL,NULL),(788,'','SV Seekirchen 1945','1900-01-01 00:00:00','AT',1221,NULL,NULL,NULL,NULL),(789,'','FC Blumenland Hard','1922-06-25 00:00:00','AT',388,NULL,NULL,NULL,NULL),(790,'','FC Viktoria 62 Bregenz','1900-01-01 00:00:00','AT',1222,NULL,NULL,NULL,NULL),(791,'Turn- und Sportverein Heeslingen e.V.','TuS Heeslingen','1906-01-01 00:00:00','DE',147,NULL,NULL,NULL,NULL),(792,'Männerturnverein Gifhorn von 1861 e. V.','MTV Gifhorn','1861-01-01 00:00:00','DE',1223,NULL,NULL,NULL,NULL),(793,'1. FC Phönix Lübeck e.V.','1. FC Phönix Lübeck','1903-01-13 00:00:00','DE',195,NULL,NULL,NULL,NULL),(794,'','TSV Neuenkirchen v. 1921 e. V.','1921-01-01 00:00:00','DE',229,NULL,NULL,NULL,NULL),(795,'','SC Weende Göttingen v. 1913','1913-01-01 00:00:00','DE',132,NULL,NULL,NULL,NULL),(796,'Lokstedter Fussball-Club \"Eintracht\" von 1908 e. V.','Lokstedter FC \"Eintracht\" v. 1908 e. V.','1908-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(797,'','TSV Stelle v. 1907/1919','1900-01-01 00:00:00','DE',308,NULL,NULL,NULL,NULL),(798,'','MTV Moisburg','1900-01-01 00:00:00','DE',1224,NULL,NULL,NULL,NULL),(799,'','TSV Glinde von 1930 e.V.','1900-01-01 00:00:00','DE',131,NULL,NULL,NULL,NULL),(800,'','FC Ahrensburg 1953 e.V.','1953-01-01 00:00:00','DE',20,NULL,NULL,NULL,NULL),(801,'','TuS Borstel-Hohenraden II','1900-01-01 00:00:00','DE',64,NULL,NULL,NULL,NULL),(802,'','TSV Gut Heil Heist von 1910 e.V. II','1900-01-01 00:00:00','DE',1186,NULL,NULL,NULL,NULL),(803,'','Farmsener TV von 1926 e.V II','1900-01-01 00:00:00','DE',449,NULL,NULL,NULL,NULL),(804,'','TSV Eintracht Hittfeld von 1905 e.V.','1900-01-01 00:00:00','DE',1225,NULL,NULL,NULL,NULL),(805,'','TV Meckelfeld v. 1920','1920-01-01 00:00:00','DE',1226,NULL,NULL,NULL,NULL),(806,'','Hoisbütteler SV v. 1955','1955-01-01 00:00:00','DE',24,NULL,NULL,NULL,NULL),(807,'Profesionalen futbolen klub Botew Plowdiw','PFK Botew Plowdiw','1912-03-01 00:00:00','BG',1228,NULL,NULL,NULL,NULL),(808,'Profesionalen futbolen klub Lewski Sofia','PFK Lewski Sofia','1914-05-24 00:00:00','BG',1162,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vereine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vereinsnamen`
--

DROP TABLE IF EXISTS `vereinsnamen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vereinsnamen` (
  `lfd_nr` int(11) NOT NULL AUTO_INCREMENT,
  `verein_id` int(11) NOT NULL,
  `name_vor_ae` varchar(264) NOT NULL,
  `von_jahr` char(4) DEFAULT NULL,
  `bis_jahr` char(4) DEFAULT NULL,
  PRIMARY KEY (`lfd_nr`,`verein_id`,`name_vor_ae`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vereinsnamen`
--

LOCK TABLES `vereinsnamen` WRITE;
/*!40000 ALTER TABLE `vereinsnamen` DISABLE KEYS */;
/*!40000 ALTER TABLE `vereinsnamen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `versionshistorie`
--

DROP TABLE IF EXISTS `versionshistorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `versionshistorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(20) NOT NULL,
  `bugfix` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `versionshistorie`
--

LOCK TABLES `versionshistorie` WRITE;
/*!40000 ALTER TABLE `versionshistorie` DISABLE KEYS */;
INSERT INTO `versionshistorie` VALUES (1,'1.00','- Fehler bei Spiele-Filtern behoben: Bei einigen Filtern wurde kein richtiges Ergebnis ausgegeben'),(2,'1.00','- Falsche Werte bei den Reisekosten wurden korrigiert'),(3,'1.00','- Versionierung wurde eingebaut'),(4,'1.00','- Erstbesuch-Länderpunkt deaktiviert'),(5,'1.00','- Alphabetische Sortierung bei den Spiele-Filtern verbessert'),(6,'1.00','- Ergebnis-Anzahl bei den Spiele-Filtern eingebaut'),(7,'1.00','- Doppelte Anzeige der Torschützen korrigiert'),(8,'1.00','- Problem beim Anlegen der Reisestrecke korrigiert'),(9,'1.00','- Prüfung auf doppelten Eintrag beim Anlegen/Bearbeiten eines Spielers'),(10,'1.00','- Korrektur: Karte mit bereisten Ländern wird jetzt richtig angezeigt'),(11,'1.00','- GUI Theme auf Graphite geändert und das Hintergrund-Bild auf Stone gesetzt'),(12,'1.00','- Spiele anlegen und editieren: Flaggen im Feld Wettbewerb eingefügt'),(22,'1.10','- Fehler bei der Prüfung der doppelten Spieler behoben'),(23,'1.10','- Fehler bei der Sonderzeichen-Erkennung behoben'),(24,'1.10','- Medien-Upload: Dateinamen individualisiert'),(25,'1.10','- Automatisches Bild-Upload via Webscan für Spieler hinzugefügt'),(26,'1.10','- Automatisches Bild-Upload via Webscan für Mannschaften hinzugefügt'),(27,'1.10','- Automatisches Bild-Upload via Webscan für Stadien hinzugefügt'),(28,'1.10','- Automatisches Bild-Upload via Webscan für Schiedsrichter hinzugefügt'),(29,'1.10','- Automatisches Bild-Upload via Webscan für Trainer hinzugefügt');
/*!40000 ALTER TABLE `versionshistorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mundialdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `addBegleiter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addBegleiter`(`Var_name` VARCHAR(264))
root:BEGIN

Declare Var_anzahl int;
Declare Var_begleiter_id int;
Declare Var_geb_datum date;

Start Transaction;


set Var_geb_datum = '1900-01-01';

Insert into mundialdb.begleiter
(
name,
geb_datum)
 Values(
Var_name,
Var_geb_datum);

set Var_anzahl = ROW_COUNT();

set Var_begleiter_id = (Select max(begleiter_id) from mundialdb.begleiter);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_begleiter_id AS begleiter_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_begleiter_id AS begleiter_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addGaengiger_Name` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addGaengiger_Name`()
BEGIN
DECLARE var_verein_id int;
Declare var_vereinsname varchar(264);
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR 
SELECT verein_id, vereinsname  FROM vereine;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;


SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_verein_id, var_vereinsname;

WHILE NOT var_done DO

Update mundialdb.vereine set gaengiger_name = var_vereinsname where verein_id = var_verein_id;



SET var_done = 0;
FETCH myCursor INTO var_verein_id, var_vereinsname;

END WHILE;
CLOSE myCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addOrt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrt`(`Var_ort` VARCHAR(200), `Var_land` CHAR(2), `Var_bundesLand` VARCHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_ort_id int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT -99 AS ergebnis;
 Leave root;
 End IF;

Insert into mundialdb.orte
( 
ort,
code,
bundesland_id)
 Values(
Var_ort,
Var_land,
Var_bundesLand);

set Var_anzahl = ROW_COUNT();

set Var_ort_id = (Select max(ort_id) from mundialdb.orte);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_ort_id AS ort_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_ort_id AS ort_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addRoute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRoute`(`Var_spiel_id` INT, `Var_routenpunkt1` VARCHAR(250), `Var_routenpunkt2` VARCHAR(250), `Var_ort_id1` INT, `Var_ort_id2` INT, `Var_land1` CHAR(2), `Var_land2` CHAR(2), `Var_entfernung_km` DECIMAL(12,2), `Var_verkehrsmittel` VARCHAR(200), `Var_verkehrsmittel_zus` VARCHAR(200), `Var_map_lnk` LONGTEXT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;

INSERT into mobil
(spiel_id,
routenpunkt1,
routenpunkt2,
ort_id1,
ort_id2,
land1,
land2,
entfernung_km,
verkehrsmittel,
verkehrsmittel_zus,
map_lnk
) 
VALUES
(
Var_spiel_id,
Var_routenpunkt1,
Var_routenpunkt2,
Var_ort_id1,
Var_ort_id2,
Var_land1,
Var_land2,
Var_entfernung_km,
Var_verkehrsmittel,
Var_verkehrsmittel_zus,
Var_map_lnk
);

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSchiri` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSchiri`(`Var_name` VARCHAR(264), `Var_land` CHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_schiri_id int;
Declare Var_geb_datum date;

Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;

set Var_geb_datum = '1900-01-01';

Insert into mundialdb.schiris
(
name,
land,
geb_datum)
 Values(
Var_name,
Var_land,
Var_geb_datum);

set Var_anzahl = ROW_COUNT();

set Var_schiri_id = (Select max(schiri_id) from mundialdb.schiris);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_schiri_id AS schiri_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_schiri_id AS schiri_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSpiele` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSpiele`(`Var_sp_datum` DATE, `Var_zeit` VARCHAR(5), `Var_erg` VARCHAR(5), `Var_erg_halb` VARCHAR(5), `Var_ort` INT, `Var_land` CHAR(2), `Var_verein_a` INT, `Var_verein_h` INT, `Var_trainer_a` INT, `Var_trainer_h` INT, `Var_schiri` INT, `Var_stadion_id` INT, `Var_stadion_id_alt` INT, `Var_erg_zusatz` CHAR(5), `Var_zusch_anzahl` INT, `Var_gaestefans` INT, `Var_sp_bericht` LONGTEXT, `Var_bes_vork` MEDIUMTEXT, `Var_wettbewerb` INTEGER, `Var_sprit` DECIMAL(8,2), `Var_bahn` DECIMAL(8,2), `Var_flieger` DECIMAL(8,2), `Var_uebernachtung` DECIMAL(8,2), `Var_verpflegung` DECIMAL(8,2), `Var_eintrittskarte` DECIMAL(8,2), `Var_sonstige` DECIMAL(8,2), `Var_sprit_anteilig` DECIMAL(8,2), `Var_schiff` DECIMAL(8,2), `Var_taxi` DECIMAL(8,2), `Var_handy` DECIMAL(8,2), `Var_souvenir` DECIMAL(8,2), `Var_wettbewerb_zusatz` VARCHAR(200), `Var_elfer` CHAR(5), `Var_ausverkauft` BIT)
root:BEGIN

Declare Var_anzahl int;
Declare Var_spiel_id int;


if Var_land not in (select code from laender) then
SELECT 99 AS ergebnis;
 Leave root;
 End IF;
 
if Var_wettbewerb not in (select liga_id from ligen) then
SELECT 98 AS ergebnis;
 Leave root;
 End IF;
 
If Var_schiri != NULL then
if Var_schiri not in (select schiri_id from schiris) then
SELECT 97 AS ergebnis;
 Leave root;
 End IF;
End IF;
 
if Var_verein_a not in (select verein_id from vereine)
then
SELECT 96 AS ergebnis;
 Leave root;
 End IF;
 
 if Var_verein_h not in (select verein_id from vereine)
then
SELECT 96 AS ergebnis;
 Leave root;
 End IF;

if Var_trainer_h != NULL
Then
  if  Var_trainer_h not in (select trainer_id from trainer)
  then
  SELECT 95 AS ergebnis;
  Leave root;
  End IF;
End IF;
 
if Var_trainer_a != NULL
Then
  if  Var_trainer_a not in (select trainer_id from trainer)
  then
  SELECT 95 AS ergebnis;
  Leave root;
  End IF;
End IF;

     
Start Transaction;

INSERT into mundialdb.sp_besuche
(sp_datum , 					
ort , 						
land , 						
zeit , 						
ergebnis , 					
erg_halb , 					
verein_id_a , 				
verein_id_h , 				
trainer_id_a , 				
trainer_id_h , 				
schiri_id , 				
stadion_id , 				
stadion_id_alt , 			
erg_zusatz , 				
zusch_anzahl , 				
gaestefans , 				
sp_bericht , 				
bes_vork , 					
liga_id , 					
sprit ,
eintrittskarte, 					
bahn , 						
flieger , 					
uebernachtung , 			
verpflegung , 				
sonstige , 		
sprit_anteilig,
schiff,
taxi,
handy,
souvenir,			
wettbewerb_zusatz,
erg_elfer, 
ausverkauft) VALUES
(
Var_sp_datum,
Var_ort,
Var_land,
Var_zeit,
Var_erg,
Var_erg_halb,
Var_verein_a,
Var_verein_h,
Var_trainer_a,
Var_trainer_h,
Var_schiri,
Var_stadion_id,
Var_stadion_id_alt,
Var_erg_zusatz,
Var_zusch_anzahl,
Var_gaestefans,
Var_sp_bericht,
Var_bes_vork,
Var_wettbewerb,
Var_sprit,
Var_eintrittskarte,
Var_bahn,
Var_flieger,
Var_uebernachtung,
Var_verpflegung,
Var_sonstige,
Var_sprit_anteilig,
Var_schiff,
Var_taxi,
Var_handy,
Var_souvenir,
Var_wettbewerb_zusatz,
Var_elfer,
Var_ausverkauft);

set Var_anzahl = ROW_COUNT();

set Var_spiel_id = (select max(spiel_id) from sp_besuche);

call `changeOrderSpiele`();

 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, -1 as spiel_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_spiel_id as spiel_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addSpieler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addSpieler`(`Var_name` VARCHAR(264), `Var_vorname` VARCHAR(264), `Var_land` CHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_spieler_id int;
Declare Var_geb_datum date;

Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;

set Var_geb_datum = '1900-01-01';

Insert into mundialdb.spieler
(
name,
vorname,
land,
geb_datum)
 Values(
Var_name,
Var_vorname,
Var_land,
Var_geb_datum);

set Var_anzahl = ROW_COUNT();

set Var_spieler_id = (Select max(spieler_id) from mundialdb.spieler);





 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_spieler_id AS spieler_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_spieler_id AS spieler_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addStadion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStadion`(`Var_stadionname` VARCHAR(200), `Var_ort` INT, `Var_land` CHAR(2), `Var_bundesLand` VARCHAR(2))
root:BEGIN

Declare Var_anzahl int;

Declare Var_stadion_id int;






Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT -99 AS ergebnis;
 Leave root;
 End IF;

Insert into mundialdb.stadionliste
(
stadionname,
ort,
land,
bundesland_id)
 Values(

Var_stadionname,
Var_ort,
Var_land,
Var_bundesLand);

set Var_anzahl = ROW_COUNT();

set Var_stadion_id = (Select max(stadion_id) from mundialdb.stadionliste);





 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_stadion_id AS stadion_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_stadion_id AS stadion_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addStadtteil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addStadtteil`(`Var_stadtteil` VARCHAR(200), `Var_ort_id` INT)
root:BEGIN

Declare Var_anzahl int;
Declare Var_stadtteil_id int;


Start Transaction;

Insert into mundialdb.stadtteile
( 
name,
ort_id)
 Values(
Var_stadtteil,
Var_ort_id);

set Var_anzahl = ROW_COUNT();

set Var_stadtteil_id = (Select max(stadtteil_id) from mundialdb.stadtteile);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_stadtteil_id AS stadtteil_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_stadtteil_id AS stadtteil_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addTrainer`(`Var_name` VARCHAR(264), `Var_land` CHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_trainer_id int;
Declare Var_geb_datum date;

Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;

set Var_geb_datum = '1900-01-01';

Insert into mundialdb.trainer
(
name,
land,
geb_datum)
 Values(
Var_name,
Var_land,
Var_geb_datum);

set Var_anzahl = ROW_COUNT();

set Var_trainer_id = (Select max(trainer_id) from mundialdb.trainer);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_trainer_id AS trainer_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_trainer_id AS trainer_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addVerein` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addVerein`(`Var_vereinsName` VARCHAR(264), `Var_gaengiger_name` VARCHAR(264), `Var_ort` INT, `Var_land` CHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_verein_id int;
Declare Var_gr_datum date;

Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;

set Var_gr_datum = '1900-01-01';

Insert into mundialdb.vereine
(
vereinsname,
gaengiger_name,
ort,
land,
gr_datum)
 Values(
Var_vereinsName,
Var_gaengiger_name,
Var_ort,
Var_land,
Var_gr_datum);

set Var_anzahl = ROW_COUNT();

set Var_verein_id = (Select max(verein_id) from mundialdb.vereine);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_verein_id AS verein_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_verein_id AS verein_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addWettbewerb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addWettbewerb`(`Var_liga_bez` VARCHAR(264), `Var_land` CHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_liga_id int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT -99 AS ergebnis;
 Leave root;
 End IF;

Insert into mundialdb.ligen
( 
liga_bez,
land)
 Values(
Var_liga_bez,
Var_land);

set Var_anzahl = ROW_COUNT();

set Var_liga_id = (Select max(liga_id) from mundialdb.ligen);


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_liga_id AS liga_id;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_liga_id AS liga_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `begleiterSpielAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `begleiterSpielAdd`(`Var_spiel_id` INT, `Var_begleiter_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
Insert into mundialdb.sp_begleiter_spiel_tabelle
(spiel_id, begleiter_id) 
values(Var_spiel_id, Var_begleiter_id);

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeNrs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeNrs`()
BEGIN
DECLARE var_lfd_nr int;
Declare var_fakeCode char(2) default 'QQ';
Declare var_land varchar(64);
Declare var_newNr int default 0;
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR 
SELECT lfd_nr, land FROM stadionliste a left join laender b on land = code 
order by b.de, ort, stadtteil;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;


SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_lfd_nr, var_land;

WHILE NOT var_done DO
if var_fakeCode != var_land
then set var_newNr = 1;
set var_fakeCode = var_land;
else set var_newNr = var_newNr + 1;
end if;
Update mundialdb.stadionliste set nr = var_newNr where lfd_nr = var_lfd_nr;



SET var_done = 0;
FETCH myCursor INTO var_lfd_nr, var_land;

END WHILE;
CLOSE myCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeNrsLand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeNrsLand`()
BEGIN
Declare var_code char(2);
Declare var_erstbesuch date;
Declare var_newNr int default 0;
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR 
SELECT code, erstbesuch FROM laender where erstbesuch != '1900-01-01' order by erstbesuch asc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;


SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_code, var_erstbesuch;

WHILE NOT var_done DO

set var_newNr = var_newNr + 1;
Update laender set laenderpunkt_nr = var_newNr where code = var_code;


SET var_done = 0;
FETCH myCursor INTO var_code, var_erstbesuch;

END WHILE;
CLOSE myCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeNrsNebenBolz` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeNrsNebenBolz`()
BEGIN
DECLARE var_lfd_nr int;
Declare var_newNr int default 0;
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR 
SELECT stadion_id FROM stadionliste s left join orte o on s.ort = o.ort_id where land = 'nb' order by o.ort;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;


SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_lfd_nr;

WHILE NOT var_done DO
set var_newNr = var_newNr + 1;

Update mundialdb.stadionliste set nr = var_newNr where stadion_id = var_lfd_nr;



SET var_done = 0;
FETCH myCursor INTO var_lfd_nr;

END WHILE;
CLOSE myCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeOrderSpiele` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeOrderSpiele`()
BEGIN
DECLARE var_lfd_nr int;
Declare var_newNr int default 0;
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR 
SELECT spiel_id FROM sp_besuche order by sp_datum asc, zeit asc;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;


SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_lfd_nr;

WHILE NOT var_done DO
set var_newNr = var_newNr + 1;

Update mundialdb.sp_besuche set nr = var_newNr where spiel_id = var_lfd_nr;



SET var_done = 0;
FETCH myCursor INTO var_lfd_nr;

END WHILE;
CLOSE myCursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeOrte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeOrte`()
BEGIN

DECLARE var_ort varchar(64);
DECLARE var_ort_id int;
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR SELECT ort_id, ort FROM orte;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;

SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_ort_id, var_ort;

WHILE NOT var_done DO

Update mundialdb.vereine set ort = var_ort_id where ort = var_ort;

SET var_done = 0;
FETCH myCursor INTO var_ort_id, var_ort;

END WHILE;
CLOSE myCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStadFrontCover` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStadFrontCover`(`Var_stadion_id` INT, `Var_media_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;

SET SQL_SAFE_UPDATES=0;
update media set art = 'ga' where ref = 'st' and art = 'fr' and id = Var_stadion_id;


update mundialdb.media set art = 'fr' where id = Var_stadion_id and media_id = Var_media_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStadName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStadName`(`Var_stadion_id` INT, `Var_stadionname` VARCHAR(200), `Var_name_vor_ae` VARCHAR(200), `Var_von_jahr` CHAR(4), `Var_bis_jahr` CHAR(4))
root:BEGIN

Declare Var_anzahl int;
Declare Var_anzahl_2 int;


Start Transaction;
Insert into mundialdb.stadionnamen
(stadion_id, name_vor_ae, von_jahr, bis_jahr)
Values (Var_stadion_id, Var_name_vor_ae, Var_von_jahr, Var_bis_jahr)
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
 SELECT Var_anzahl AS ergebnis, 0 as ergebnis2;
 Leave root;
 Else
 Update stadionliste set stadionname = Var_stadionname
 where stadion_id = Var_stadion_id;
 
 set Var_anzahl_2 = ROW_COUNT();
 
IF Var_anzahl_2 = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_anzahl_2 as ergebnis2;
 Leave root;
 End IF;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_anzahl_2 as ergebnis2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeStadtteile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeStadtteile`()
BEGIN

DECLARE var_stadtteil_id int;
DECLARE var_name varchar(200);
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR SELECT stadtteil_id, name FROM stadtteile;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;

SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_stadtteil_id, var_name;

WHILE NOT var_done DO

Update mundialdb.stadionliste set stadtteil = var_stadtteil_id where stadtteil = var_name;

SET var_done = 0;
FETCH myCursor INTO var_stadtteil_id, var_name;

END WHILE;
CLOSE myCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeVereinFrontCover` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeVereinFrontCover`(`Var_verein_id` INT, `Var_media_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;

SET SQL_SAFE_UPDATES=0;
update media set art = 'ga' where ref = 'vn' and art = 'fr' and id = Var_verein_id;


update mundialdb.media set art = 'fr' where id = Var_verein_id and media_id = Var_media_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `changeVereinsName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `changeVereinsName`(`Var_verein_id` INT, `Var_vereinsname` VARCHAR(200), `Var_name_vor_ae` VARCHAR(200), `Var_von_jahr` CHAR(4), `Var_bis_jahr` CHAR(4))
root:BEGIN

Declare Var_anzahl int;
Declare Var_anzahl_2 int;


Start Transaction;
Insert into mundialdb.vereinsnamen
(verein_id, name_vor_ae, von_jahr, bis_jahr)
Values (Var_verein_id, Var_name_vor_ae, Var_von_jahr, Var_bis_jahr)
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
 SELECT Var_anzahl AS ergebnis, 0 as ergebnis2;
 Leave root;
 Else
 Update vereine set vereinsname = Var_vereinsname
 where verein_id = Var_verein_id;
 
 set Var_anzahl_2 = ROW_COUNT();
 
IF Var_anzahl_2 = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis, Var_anzahl_2 as ergebnis2;
 Leave root;
 End IF;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis, Var_anzahl_2 as ergebnis2;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `codeMap` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `codeMap`()
BEGIN

DECLARE var_code char(2);
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR SELECT code FROM laender;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;

SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_code;

WHILE NOT var_done DO

Update laender set codeMap = var_code where code = var_code;

SET var_done = 0;
FETCH myCursor INTO var_code;

END WHILE;
CLOSE myCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteBegleiter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteBegleiter`(`Var_begleiter_id` INT)
root:BEGIN


Declare Var_anzahl int;

if Var_begleiter_id in (select begleiter_id from sp_begleiter_spiel_tabelle)
then
Select -2 as ergebnis;
Leave root;
end If;
if Var_begleiter_id in (select id from media where ref = 'bg')
then
Select -1 as ergebnis;
Leave root;
end If;



Start Transaction;
delete from mundialdb.begleiter where begleiter_id = Var_begleiter_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteOrt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOrt`(`Var_ort_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_ort_id in (select ort from stadionliste)
then
Select -1 as ergebnis;
Leave root;
end If;

if Var_ort_id in (select ort from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;

if Var_ort_id in (select ort_id from stadtteile)
then
Select -3 as ergebnis;
Leave root;
end If;

if Var_ort_id in (select ort from vereine)
then
Select -4 as ergebnis;
Leave root;
end If;

Start Transaction;
delete from mundialdb.orte where ort_id = Var_ort_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteRoute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteRoute`(`Var_lfd_nr` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
delete from mobil where lfd_nr = Var_lfd_nr;

set Var_anzahl = ROW_COUNT();




if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteSchiri` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSchiri`(`Var_schiri_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_schiri_id in (select schiri_id from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;

if Var_schiri_id in (select id from media where ref = 'sr')
then
Select -1 as ergebnis;
Leave root;
end If;



Start Transaction;
delete from mundialdb.schiris where schiri_id = Var_schiri_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteSpiel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSpiel`(`Var_spiel_id` INT)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;
delete from mundialdb.sp_besuche where spiel_id = Var_spiel_id;

set Var_anzahl = ROW_COUNT();


if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SET SQL_SAFE_UPDATES=0;
delete from mundialdb.sp_begleiter_spiel_tabelle where spiel_id = Var_spiel_id;
delete from mundialdb.sp_spieler_spiel_tabelle where spiel_id = Var_spiel_id;
delete from mundialdb.sp_tore_spiel_tabelle where spiel_id = Var_spiel_id;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteSpieler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteSpieler`(`Var_spieler_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_spieler_id in (select id from media where ref = 'sp')
then
Select -1 as ergebnis;
Leave root;
end If;

if Var_spieler_id in (select spieler_id from sp_spieler_spiel_tabelle)
then
Select -2 as ergebnis;
Leave root;
end If;




Start Transaction;
delete from mundialdb.spieler where spieler_id = Var_spieler_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStadBild` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStadBild`(`Var_stadion_id` INT, `Var_media_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
delete from mundialdb.media where id = Var_stadion_id and media_id = Var_media_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStadBildFrontCover` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStadBildFrontCover`(`Var_stadion_id` INT, `Var_media_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
SET SQL_SAFE_UPDATES=0;
update media set art = 'ga' where ref = 'st' and art = 'fr' and id = Var_stadion_id and media_id = Var_media_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStadion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStadion`(`Var_stadion_id` INT, `Var_land` CHAR(2))
root:BEGIN

Declare Var_anzahl int;

if Var_stadion_id in (select id from media where ref = 'st')
then
Select -1 as ergebnis;
Leave root;
end If;

if Var_stadion_id in (select stadion_id from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;

if Var_stadion_id in (select stadion_id from stad_verein_tabelle)
then
Select -3 as ergebnis;
Leave root;
end If;

Start Transaction;
DELETE FROM stadionliste 
WHERE
    stadion_id = Var_stadion_id;

set Var_anzahl = ROW_COUNT();

if Var_land not in (Select land from stadionliste)
then
Update laender set erstbesuch = '1900-01-01',
laenderpunkt_nr = NULL Where code = Var_land;
end if;

call `changeNrsLand`();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStadionVerein` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStadionVerein`(`Var_lfd_nr` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
delete from mundialdb.stad_verein_tabelle where lfd_nr in (Var_lfd_nr);

set Var_anzahl = ROW_COUNT();

if Var_anzahl = 0
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStadName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStadName`(`Var_lfd_nr` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
delete from mundialdb.stadionnamen where lfd_nr = Var_lfd_nr;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteStadtteil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteStadtteil`(`Var_stadtteil_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_stadtteil_id in (select stadtteil from stadionliste)
then
Select -1 as ergebnis;
Leave root;
end If;


if Var_stadtteil_id in (select stadtteil from vereine)
then
Select -2 as ergebnis;
Leave root;
end If;

Start Transaction;
delete from mundialdb.stadtteile where stadtteil_id = Var_stadtteil_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteTrainer`(`Var_trainer_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_trainer_id in (select id from media where ref = 'tr')
then
Select -1 as ergebnis;
Leave root;
end If;

if Var_trainer_id in (select trainer_id_a from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;

if Var_trainer_id in (select trainer_id_h from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;




Start Transaction;
delete from mundialdb.trainer where trainer_id = Var_trainer_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteVerein` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVerein`(`Var_verein_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_verein_id in (select id from media where ref = 'vn')
then
Select -1 as ergebnis;
Leave root;
end If;

if Var_verein_id in (select verein_id_h from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;

if Var_verein_id in (select verein_id_a from sp_besuche)
then
Select -2 as ergebnis;
Leave root;
end If;

if Var_verein_id in (select verein_id from stad_verein_tabelle)
then
Select -3 as ergebnis;
Leave root;
end If;

Start Transaction;
delete from mundialdb.vereine where verein_id = Var_verein_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteVereinsBildFrontCover` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVereinsBildFrontCover`(`Var_id` INT, `Var_media_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
SET SQL_SAFE_UPDATES=0;
update media set art = 'ga' where ref = 'vn' and art = 'fr' and id = Var_id and media_id = Var_media_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteVereinsName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteVereinsName`(`Var_lfd_nr` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
delete from mundialdb.vereinsnamen where lfd_nr = Var_lfd_nr;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteWettbewerb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteWettbewerb`(`Var_liga_id` INT)
root:BEGIN

Declare Var_anzahl int;

if Var_liga_id in (select liga_id from sp_besuche)
then
Select -1 as ergebnis;
Leave root;
end If;



Start Transaction;
delete from mundialdb.ligen where liga_id = Var_liga_id;

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
Then 
Rollback;
SELECT Var_anzahl AS ergebnis;
Leave root;
end If;

SELECT Var_anzahl AS ergebnis;
Commit;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editBegleiter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editBegleiter`(`Var_begleiter_id` INT, `Var_name` VARCHAR(264), `Var_spitzname` VARCHAR(264), `Var_geb_datum` DATE)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

UPDATE mundialdb.begleiter 
SET 
    name = Var_name,
    spitzname = Var_spitzname,
    geb_datum = Var_geb_datum
WHERE
    begleiter_id = Var_begleiter_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editOrt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editOrt`(`Var_ort_id` INT, `Var_ort` VARCHAR(200), `Var_land` CHAR(2), `Var_bundesLand` VARCHAR(2))
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;


Update mundialdb.orte
set ort = Var_ort,
code = Var_land,
bundesland_id = Var_bundesLand
where ort_id = Var_ort_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editRoute` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editRoute`(`Var_lfd_nr` INT, `Var_spiel_id` INT, `Var_routenpunkt1` VARCHAR(250), `Var_routenpunkt2` VARCHAR(250), `Var_ort_id1` INT, `Var_ort_id2` INT, `Var_land1` CHAR(2), `Var_land2` CHAR(2), `Var_entfernung_km` DECIMAL(12,2), `Var_verkehrsmittel` VARCHAR(200), `Var_verkehrsmittel_zus` VARCHAR(200), `Var_map_lnk` LONGTEXT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;

Update mobil set
spiel_id = Var_spiel_id,
routenpunkt1 = Var_routenpunkt1,
routenpunkt2 = Var_routenpunkt2,
ort_id1 = Var_ort_id1,
ort_id2 = Var_ort_id2,
land1 = Var_land1,
land2 = Var_land2,
entfernung_km = Var_entfernung_km,
verkehrsmittel = Var_verkehrsmittel,
verkehrsmittel_zus = Var_verkehrsmittel_zus,
map_lnk = Var_map_lnk
Where lfd_nr = Var_lfd_nr;


set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editSchiri` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editSchiri`(`Var_schiri_id` INT, `Var_name` VARCHAR(264), `Var_land` CHAR(2), `Var_ort` INT, `Var_verein` INT, `Var_geb_datum` DATE)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;
 

UPDATE mundialdb.schiris 
SET 
    name = Var_name,
    land = Var_land,
    geb_datum = Var_geb_datum,
    verein_id = Var_verein,
    ort_id = Var_ort
WHERE
    schiri_id = Var_schiri_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editSpiele` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editSpiele`(`Var_spiel_id` INT, `Var_sp_datum` DATE, `Var_zeit` VARCHAR(5), `Var_erg` VARCHAR(5), `Var_erg_halb` VARCHAR(5), `Var_ort` INT, `Var_land` CHAR(2), `Var_verein_a` INT, `Var_verein_h` INT, `Var_trainer_a` INT, `Var_trainer_h` INT, `Var_schiri` INT, `Var_stadion_id` INT, `Var_stadion_id_alt` INT, `Var_erg_zusatz` CHAR(5), `Var_zusch_anzahl` INT, `Var_gaestefans` INT, `Var_sp_bericht` LONGTEXT, `Var_bes_vork` MEDIUMTEXT, `Var_wettbewerb` INTEGER, `Var_sprit` DECIMAL(8,2), `Var_bahn` DECIMAL(8,2), `Var_flieger` DECIMAL(8,2), `Var_uebernachtung` DECIMAL(8,2), `Var_verpflegung` DECIMAL(8,2), `Var_eintrittskarte` DECIMAL(8,2), `Var_sonstige` DECIMAL(8,2), `Var_sprit_anteilig` DECIMAL(8,2), `Var_schiff` DECIMAL(8,2), `Var_taxi` DECIMAL(8,2), `Var_handy` DECIMAL(8,2), `Var_souvenir` DECIMAL(8,2), `Var_wettbewerb_zusatz` VARCHAR(200), `Var_erg_elfer` VARCHAR(5), `Var_ausverkauft` BIT)
root:BEGIN

Declare Var_anzahl int;


if Var_land not in (select code from laender) then
SELECT 99 AS ergebnis;
 Leave root;
 End IF;
 
if Var_wettbewerb not in (select liga_id from ligen) then
SELECT 98 AS ergebnis;
 Leave root;
 End IF;
 
If Var_schiri != NULL then
if Var_schiri not in (select schiri_id from schiris) then
SELECT 97 AS ergebnis;
 Leave root;
 End IF;
End IF;
 
if Var_verein_a not in (select verein_id from vereine)
then
SELECT 96 AS ergebnis;
 Leave root;
 End IF;
 
if Var_trainer_h != NULL
Then
  if  Var_trainer_h not in (select trainer_id from trainer)
  then
  SELECT 95 AS ergebnis;
  Leave root;
  End IF;
End IF;
 
if Var_trainer_a != NULL
Then
  if  Var_trainer_a not in (select trainer_id from trainer)
  then
  SELECT 95 AS ergebnis;
  Leave root;
  End IF;
End IF;
 

  
Start Transaction;
Update mundialdb.sp_besuche
set sp_datum = Var_sp_datum,
ort = Var_ort,
land = Var_land,
zeit = Var_zeit,
ergebnis = Var_erg,
erg_halb = Var_erg_halb,
verein_id_a = Var_verein_a,
verein_id_h = Var_verein_h,
trainer_id_a = Var_trainer_a,
trainer_id_h = Var_trainer_h,
schiri_id = Var_schiri,
stadion_id = Var_stadion_id,
stadion_id_alt = Var_stadion_id_alt,
erg_zusatz = Var_erg_zusatz,
zusch_anzahl = Var_zusch_anzahl,
gaestefans = Var_gaestefans,
sp_bericht = Var_sp_bericht,
bes_vork = Var_bes_vork,
liga_id = Var_wettbewerb,
sprit = Var_sprit,
bahn = Var_bahn,
flieger = Var_flieger,
uebernachtung = Var_uebernachtung,
verpflegung = Var_verpflegung,
sonstige = Var_sonstige,
sprit_anteilig = Var_sprit_anteilig,
schiff = Var_schiff,
taxi = Var_taxi,
handy = Var_handy,
souvenir = Var_souvenir,
eintrittskarte = Var_eintrittskarte,
wettbewerb_zusatz = Var_wettbewerb_zusatz,
erg_elfer = Var_erg_elfer,
ausverkauft = Var_ausverkauft
where spiel_id = Var_spiel_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editSpieler` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editSpieler`(`Var_spieler_id` INT, `Var_name` VARCHAR(264), `Var_vorname` VARCHAR(264), `Var_land` CHAR(2), `Var_geb_datum` DATE, `Var_position` CHAR(2), `Var_trikot_nr` INT, `Var_nati_spieler` BIT, `Var_status` BIT)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;
 
IF Var_status = 0
Then 
  Set Var_anzahl = (Select count(*) from spieler where concat(trim(vorname),' ',trim(name)) = concat(trim(Var_vorname),' ',trim(Var_name)));
    If Var_anzahl > 1 then
    SELECT 66 AS ergebnis;
    Leave root;
  End if; 
End if;
 
UPDATE spieler
SET 
    name = Var_name,
    vorname = Var_vorname ,
    land = Var_land,
    geb_datum = Var_geb_datum,
    position = Var_position,
    trikot_nr = Var_trikot_nr,
    nati_spieler = Var_nati_spieler
WHERE
    spieler_id = Var_spieler_id;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editStadion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editStadion`(`Var_stadion_id` INT, `Var_stadionname` VARCHAR(200), `Var_ort` INT, `Var_land` CHAR(2), `Var_erstbesuch` DATE, `Var_stadtteil` VARCHAR(64), `Var_anschrift` VARCHAR(200), `Var_kapazitaet` INT, `Var_zusch_rek` INT, `Var_historie` MEDIUMTEXT, `Var_er_jahr` CHAR(4), `Var_abriss` BIT, `Var_gr_nr` INTEGER, `Var_bundesLand` VARCHAR(2))
root:BEGIN

Declare Var_anzahl int;
Declare Var_bundesland_id varchar(2);


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;


Update mundialdb.stadionliste
set stadionname = Var_stadionname,
ort = Var_ort,
land = Var_land,
stadtteil = Var_stadtteil,
anschrift = Var_anschrift,
kapazitaet = Var_kapazitaet,
zusch_rek = Var_zusch_rek,
historie = Var_historie,
er_jahr = Var_er_jahr,
abriss = Var_abriss,
gr_nr = Var_gr_nr,
bundesland_id = Var_bundesLand
where stadion_id = Var_stadion_id;

set Var_anzahl = ROW_COUNT();


Update laender set erstbesuch = Var_erstbesuch where code = Var_land;

set Var_anzahl = Var_anzahl + ROW_COUNT();

set Var_bundesland_id = (Select ifnull(rtrim(bundesland_id),'--') from orte where ort_id = Var_ort); 

if Var_bundesland_id != '--' or Var_bundesland_id != Var_bundesLand
then
Update orte set bundesland_id =  Var_bundesLand where ort_id = Var_ort;
end if;


call `changeNrsLand`();



 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editStadtteil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editStadtteil`(`Var_stadtteil_id` INT, `Var_stadtteil` VARCHAR(200), `Var_ort_id` INT)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;


Update mundialdb.stadtteile
set name = Var_stadtteil,
ort_id = Var_ort_id
where stadtteil_id = Var_stadtteil_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editTrainer`(`Var_trainer_id` INT, `Var_name` VARCHAR(264), `Var_land` CHAR(2), `Var_geb_datum` DATE)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;
 

UPDATE mundialdb.trainer 
SET 
    name = Var_name,
    land = Var_land,
    geb_datum = Var_geb_datum
WHERE
    trainer_id = Var_trainer_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editUser`(IN `Var_UserID` INT, IN `Var_admin` CHAR(1), IN `Var_status` CHAR(1), IN `Var_e_mail` VARCHAR(264), IN `Var_user` VARCHAR(15))
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
Update mundialdb.users set
admin = Var_admin,
status = Var_status,
email = Var_e_mail
Where UserID = Var_UserID;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1  Then 
 Rollback;
 Select Var_anzahl as ergebnis, Var_UserID as UserID;
 Leave root;
 End IF;
 
commit;
Select Var_anzahl as ergebnis, Var_UserID as UserID;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editVerein` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editVerein`(`Var_verein_id` INT, `Var_vereinsname` VARCHAR(264), `Var_gaengiger_name` VARCHAR(264), `Var_ort` INT, `Var_land` CHAR(2), `Var_gr_datum` DATE, `Var_historie` LONGTEXT, `Var_spitzname` VARCHAR(264), `Var_stadtteil` INT)
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;


Update mundialdb.vereine
set vereinsname = Var_vereinsname,
gaengiger_name = Var_gaengiger_name,
ort = Var_ort,
land = Var_land,
gr_datum = Var_gr_datum,

historie = Var_historie,
spitzname = Var_spitzname,
stadtteil = Var_stadtteil
where verein_id = Var_verein_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `editWettbewerb` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `editWettbewerb`(`Var_liga_id` INT, `Var_liga_bez` VARCHAR(264), `Var_land` CHAR(2), `Var_zusatz` VARCHAR(100))
root:BEGIN

Declare Var_anzahl int;


Start Transaction;

if Var_land not in (select code from laender)
then
Rollback;
SELECT 99 AS ergebnis;
 Leave root;
 End IF;


Update mundialdb.ligen
set liga_bez = Var_liga_bez,
land = Var_land,
zusatz = Var_zusatz
where liga_id = Var_liga_id
;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl = 0
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findLand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findLand`(`Var_ort_id` INT)
BEGIN

Declare Var_land char(2);
Declare Var_bundesland varchar(2);

set Var_land = (select distinct code from orte where ort_id = Var_ort_id);
set Var_bundesland = (select distinct ifnull(bundesland_id, '--') from orte where ort_id = Var_ort_id);


if length(Var_land) = 0
then  Select '--' as land;
end if; 

if length(Var_bundesland) = 0
then Select '--' as bundesland;
end if; 

Select Var_land as land, Var_bundesland as bundesland;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findNat` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findNat`(`Var_code` VARCHAR(3))
BEGIN

Declare Var_land_id char(2);

set Var_land_id = (SELECT code From laender  WHERE  code2 = Var_code);


if length(Var_land_id) > 0
then Select Var_land_id as land_id;
else Select '--' as land_id;
end if; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findOrt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findOrt`(`Var_verein_id` INT)
BEGIN
Declare Var_ort_id int;

set Var_ort_id = (select distinct ort from vereine where verein_id = Var_verein_id);

if length(Var_ort_id) > 0
then Select Var_ort_id as ort;
else Select '--' as ort;
end if; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findStadion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findStadion`(`Var_verein_id` INT)
BEGIN
Declare Var_stadion_id int;

set Var_stadion_id = (select distinct stadion_id from stad_verein_tabelle where verein_id = Var_verein_id);

if length(Var_stadion_id) > 0
then Select Var_stadion_id as stadion_id;
else Select '--' as stadion_id;
end if; 





END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findStadLand` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findStadLand`(`Var_verein_id` INT)
BEGIN
Declare Var_land char(2);

set Var_land = (select distinct land from vereine where verein_id = Var_verein_id);

if length(Var_land) > 0
then Select Var_land as land;
else Select '--' as land;
end if; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findStadNameDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findStadNameDates`(`Var_stadion_id` INT)
BEGIN
Declare Var_von_jahr char(4);
Declare Var_bis_jahr char(4);

set Var_von_jahr = (select max(bis_jahr) from stadionnamen where stadion_id = Var_stadion_id);


Select Var_von_jahr as von_jahr, year(curdate()) as bis_jahr;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `findVereinsNameDates` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `findVereinsNameDates`(`Var_id` INT)
BEGIN
Declare Var_von_jahr char(4);
Declare Var_bis_jahr char(4);

set Var_von_jahr = (select max(bis_jahr) from vereinsnamen where verein_id = Var_id);


Select Var_von_jahr as von_jahr, year(curdate()) as bis_jahr;




END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginProc`(IN `Var_benutzer` VARCHAR(50), IN `Var_passwort` VARCHAR(400))
root:Begin
  Declare Var_ergebnis int;
  Declare Var_loginCount smallint;
  Declare Var_loginTime datetime;
  Declare Var_timeOut datetime;
  Declare Var_status char(1);
  Declare Var_admin char(1);
  
  
  SET Var_loginCount = (Select ifnull(loginCount,0)  from mundialdb.users where benutzer = Var_benutzer);
  SET Var_loginTime = (Select ifnull(loginTime,CURTIME()) from mundialdb.users where benutzer = Var_benutzer);
  SET Var_timeOut = (Select timeOut from mundialdb.users where benutzer = Var_benutzer);  

  
  
  IF TIMESTAMPDIFF(MINUTE, Var_timeOut, CURTIME()) < 30 OR Var_timeOut != NULL 
  THEN
    Select -99 as Ergebnis, NULL as admin, NULL as 'status';
    LEAVE root;
  
  ELSE
  SET SQL_SAFE_UPDATES=0;
    Update users set timeOut = NULL where benutzer = Var_benutzer;
  END IF;

    
    Set Var_ergebnis = (Select count(Concat(benutzer,passwort)) from mundialdb.users where benutzer = Var_benutzer and passwort = Var_passwort
    group by admin, status);
    Set Var_status = (Select status from mundialdb.users where benutzer = Var_benutzer and passwort = Var_passwort
    group by admin, status);
    Set Var_admin = (Select admin from mundialdb.users where benutzer = Var_benutzer and passwort = Var_passwort
    group by admin, status);
    
    If Var_ergebnis = 1
    THEN
		IF Var_status != 'O'
		THEN
			Update mundialdb.users set loginCount = 0, loginTime = NULL, timeOut = NULL, onlineTime = CURTIME(), logoutTime = NULL where benutzer = Var_benutzer;
			Select Var_ergebnis as Ergebnis, Var_admin as admin, Var_status as status;
			LEAVE root;
		ELSE
			Update mundialdb.users set loginCount = 0, loginTime = NULL, timeOut = NULL where benutzer = Var_benutzer;
			Select Var_ergebnis as Ergebnis, Var_admin as admin, Var_status as status;
			LEAVE root;
		END IF;
    ELSE
    
      If not exists (select 1 from mundialdb.users where benutzer = Var_benutzer)
      THEN
        Select 0 as Ergebnis, NULL as admin, NULL as 'status'; 
        LEAVE root;
      
      Else
      
        if Var_loginCount <= 2 
        THEN
          If TIMESTAMPDIFF(MINUTE, Var_loginTime, CURTIME()) < 10
          THEN
            Update mundialdb.users set loginCount = Var_loginCount +1, loginTime = CURTIME() where benutzer = Var_benutzer;
            Select 0 as Ergebnis, NULL as admin, NULL as 'status'; 
            LEAVE root;
          
          ELSE
          
            Update mundialdb.users set loginCount = 1, loginTime = CURTIME() where benutzer = Var_benutzer;
            Select 0 as Ergebnis, NULL as admin, NULL as 'status'; 
            LEAVE root;
          END IF;
        
        ELSE
         
          Update mundialdb.users set loginCount = 0, loginTime = NULL, timeOut = CURTIME() where benutzer = Var_benutzer;
          Select -98 as Ergebnis, NULL as admin, NULL as 'status'; 
          LEAVE root;
       
      END IF;
    END IF;
  END IF;
  SET SQL_SAFE_UPDATES=1;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `logoutProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logoutProc`(`Var_user` VARCHAR(15))
root:BEGIN

DECLARE Var_anzahl int;

SET SQL_SAFE_UPDATES=0;
Update mundialdb.users set logoutTime = CURTIME(), onlineTime = NULL where benutzer = Var_user;

Set Var_anzahl = ROW_COUNT();

 IF Var_anzahl != 1 
 Then 
   Select -99 as ergebnis;
   Leave root;
 Else 
   Select Var_anzahl as ergebnis;
   Leave root;
 End IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mediaUpload` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `mediaUpload`(`Var_bild_name` VARCHAR(200), `Var_ref` CHAR(2), `Var_id` INT, `Var_bild_art` VARCHAR(2))
root:Begin
Declare Var_anzahl int;  

if Var_bild_name in (select dateiname from media)
then Select 99 as ergebnis;
Leave root;
End if;

Start Transaction;  

if Var_bild_art = 'fr'
then 
SET SQL_SAFE_UPDATES=0;
update media set art = 'ga' where ref = Var_ref and art = 'fr' and id = Var_id;
end if;

insert into media (ref, dateiname, id, art)
Values(Var_ref, Var_bild_name, Var_id, Var_bild_art);
 
Set Var_anzahl = ROW_COUNT(); 

 
 IF Var_anzahl != 1 
 Then 
 Rollback;
 Select Var_anzahl as ergebnis;
 Leave root;
 End IF;
commit;

Select Var_anzahl as ergebnis; 
 
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectMedisAlle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectMedisAlle`()
BEGIN

SELECT 
    medi_id,
    medi_name,
    bestand,
    ROUND(bestand / (morgens + mittags + abends + nachts),1) AS haelt_tage,  
    CASE WHEN left(substring((ROUND(bestand / (morgens + mittags + abends + nachts),1)),-2),1) = '.'
    THEN
    CASE WHEN left(substring((ROUND(bestand / (morgens + mittags + abends + nachts),1)),-1),1) >= 5
    THEN DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY) else
    DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY) end
    else DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)
    end AS haelt_bis,   
     CASE WHEN left(substring((ROUND(bestand / (morgens + mittags + abends + nachts),1)),-2),1) = '.'
    THEN
    CASE WHEN left(substring((ROUND(bestand / (morgens + mittags + abends + nachts),1)),-1),1) >= 5
    THEN 
	  CASE
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 0 THEN 'Montag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 1 THEN 'Dienstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 2 THEN 'Mittwoch'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 3 THEN 'Donnerstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 4 THEN 'Freitag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 5 THEN 'Samstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts))+1 DAY)) = 6 THEN 'Sonntag'
    END
	else 
	  CASE
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 0 THEN 'Montag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 1 THEN 'Dienstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 2 THEN 'Mittwoch'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 3 THEN 'Donnerstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 4 THEN 'Freitag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 5 THEN 'Samstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 6 THEN 'Sonntag'
    END	
	end
    else 
	  CASE
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 0 THEN 'Montag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 1 THEN 'Dienstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 2 THEN 'Mittwoch'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 3 THEN 'Donnerstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 4 THEN 'Freitag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 5 THEN 'Samstag'
        WHEN WEEKDAY(DATE_ADD(CURDATE(),INTERVAL (bestand / (morgens + mittags + abends + nachts)) DAY)) = 6 THEN 'Sonntag'
    END
	end AS tag,
    case when left(substring((ROUND(bestand / (morgens + mittags + abends + nachts),1)),-2),1) = '.'
    then
    case when left(substring((ROUND(bestand / (morgens + mittags + abends + nachts),1)),-1),1) >= 5
    then 'Vorsicht' else '' end
    else '' end AS bemerkung,     
    medi_einheit,
    masseinheit,
    wirkstoff AS wirkstoff,
    medi_art AS medi_art,
    morgens,
    mittags,
    abends,
    nachts,
    aktiv,
    beschreibung,
    (morgens + mittags + abends + nachts) * medi_einheit AS tag_verbr_masseinheit,
    (morgens + mittags + abends + nachts) AS tag_verbr_stk,
    firma
FROM
    vitaldb_po.medi_table;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `selectStadionListe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `selectStadionListe`()
BEGIN

Select stadion_id as lfd_nr, nr, stadionname, ort, er_jahr, stadtteil, Ifnull(de,land) as land, code,kapazitaet,
zusch_rek, anschrift, historie, abriss
from stadionliste left join laender on land = code order by de, nr, ort, stadtteil;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set11` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set11`(`Var_spiel_id_11` INT, `Var_Spiel_id_akt` INT, `Var_status` CHAR(2), `Var_status2` CHAR(1), `Var_team` CHAR(1))
root:BEGIN

Declare Var_anzahl int;

Start Transaction;

SET SQL_SAFE_UPDATES=0;
Delete from sp_spieler_spiel_tabelle where spiel_id = Var_Spiel_id_akt and status = Var_status and status2 = Var_team;

Insert into mundialdb.sp_spieler_spiel_tabelle
(spiel_id, spieler_id, status, status2) 
(Select Var_Spiel_id_akt, spieler_id, status, Var_team from sp_spieler_spiel_tabelle where spiel_id = Var_spiel_id_11
and status = Var_status and status2 = Var_status2);

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 11
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spielerSpielAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spielerSpielAdd`(`Var_spiel_id` INT, `Var_Spieler_id` INT, `Var_status` CHAR(2), `Var_status2` CHAR(1))
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
Insert into mundialdb.sp_spieler_spiel_tabelle
(spiel_id, spieler_id, status, status2) values(Var_spiel_id, Var_Spieler_id, Var_status, Var_status2);

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spielerSpielAddBank` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spielerSpielAddBank`(`Var_spiel_id` INT, `Var_Spieler_id` INT, `Var_status` CHAR(2), `Var_status2` CHAR(1), `Var_aw_minute` VARCHAR(3), `Var_aw_spieler` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
Insert into mundialdb.sp_spieler_spiel_tabelle
(spiel_id, spieler_id, status, status2, aw, aw_minute) 
values(Var_spiel_id, Var_Spieler_id, Var_status, Var_status2, '2', Var_aw_minute);

set Var_anzahl = ROW_COUNT();

update mundialdb.sp_spieler_spiel_tabelle
set aw = '1', aw_minute = Var_aw_minute
Where spieler_id = Var_aw_spieler and spiel_id = Var_spiel_id;


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spielerVereinAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spielerVereinAdd`(`Var_verein_id` INT, `Var_Spieler_id` INT, `Var_merkmal` VARCHAR(5))
root:BEGIN

Declare Var_anzahl int;
Declare Var_status bit;

if Var_merkmal = 'ex'
then set Var_status = 0;
else set Var_status = 1;
end if;

Start Transaction;
Insert into mundialdb.verein_spieler_tabelle
(verein_id, spieler_id, aktuell) values(Var_verein_id, Var_Spieler_id, Var_status);

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spieleToreAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spieleToreAdd`(`Var_spiel_id` INT, `Var_Spieler_id` INT, `Var_spielstand` VARCHAR(5), `Var_sp_minute` INT, `Var_besonderheit` VARCHAR(10), `Var_team` CHAR(1))
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
if Var_team = 'h'
then
Insert into mundialdb.sp_tore_spiel_tabelle
(spiel_id, spieler_id_h, sp_minute, besonderheit, spielstand, team) values
(Var_spiel_id, Var_Spieler_id, Var_sp_minute, Var_besonderheit, Var_spielstand, Var_team);
End if;

if Var_team = 'a'
then
Insert into mundialdb.sp_tore_spiel_tabelle
(spiel_id, spieler_id_a, sp_minute, besonderheit, spielstand, team) values
(Var_spiel_id, Var_Spieler_id, Var_sp_minute, Var_besonderheit, Var_spielstand, Var_team);
End if;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spieleToreAdd_Elfer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spieleToreAdd_Elfer`(`Var_spiel_id` INT, `Var_Spieler_id` INT, `Var_spielstand` VARCHAR(5), `Var_elfer` INT, `Var_team` CHAR(1))
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
if Var_team = 'h'
then
Insert into mundialdb.sp_tore_spiel_tabelle
(spiel_id, spieler_id_h, elfer, spielstand, team) values
(Var_spiel_id, Var_Spieler_id, Var_elfer, Var_spielstand, Var_team);
End if;

if Var_team = 'a'
then
Insert into mundialdb.sp_tore_spiel_tabelle
(spiel_id, spieler_id_a, elfer, spielstand, team) values
(Var_spiel_id, Var_Spieler_id, Var_elfer, Var_spielstand, Var_team);
End if;

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `stadionVereinAdd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `stadionVereinAdd`(`Var_verein_id` INT, `Var_stadion_id` INT)
root:BEGIN

Declare Var_anzahl int;

Start Transaction;
Insert into mundialdb.stad_verein_tabelle
(verein_id, stadion_id) values(Var_verein_id, Var_stadion_id);

set Var_anzahl = ROW_COUNT();


 IF Var_anzahl != 1
 Then 
 Rollback;
SELECT Var_anzahl AS ergebnis;
 Leave root;
 End IF;
commit;
SELECT Var_anzahl AS ergebnis;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `testCur` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `testCur`()
BEGIN

DECLARE var_land char(2);
DECLARE var_ort int;
DECLARE var_done INT DEFAULT 0;
DECLARE myCursor CURSOR FOR SELECT land,  ort FROM stadionliste;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_done = 1;

SET var_done = 0;
SET SQL_SAFE_UPDATES=0;
OPEN myCursor;
FETCH myCursor INTO var_land, var_ort;

WHILE NOT var_done DO

Update mundialdb.orte set code = var_land where ort_id = var_ort;

SET var_done = 0;
FETCH myCursor INTO var_land, var_ort;

END WHILE;
CLOSE myCursor;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserAddProc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserAddProc`(IN `Var_benutzer` VARCHAR(50), IN `Var_passwort` VARCHAR(40), IN `Var_email` VARCHAR(64))
root:begin

declare Var_anzahl int;
declare Var_userID int DEFAULT 0;
declare Var_admin char(1) DEFAULT 'N';
declare Var_status char(1) DEFAULT 'O';

IF CHAR_LENGTH(Var_benutzer) = 0 or CHAR_LENGTH(Var_passwort) = 0
THEN
Select 0 as ergebnis; 
LEAVE root;
End If;



if exists (Select * from mundialdb.users where benutzer = Var_benutzer)
THEN
Select -1 as ergebnis, Var_userID as userID; 
LEAVE root;
End If;

INSERT INTO mundialdb.Users 
( benutzer, Passwort, admin, status, email) VALUES (Var_benutzer, Var_passwort, Var_admin, Var_status, Var_email); 

set Var_anzahl = ROW_COUNT();

if Var_anzahl != 1
THEN
Select -2 as ergebnis; 
LEAVE root;
End IF;

SET Var_userID = (Select max(userID) from Users);

select Var_anzahl as ergebnis, Var_userID as userID;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-14 18:07:58
