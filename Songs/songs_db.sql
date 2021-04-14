-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: edudb.di.uoa.gr    Database: songs
-- ------------------------------------------------------
-- Server version	5.1.51-community

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
-- Table structure for table `cd_production`
--

DROP TABLE IF EXISTS `cd_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd_production` (
  `code_cd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `etaireia` varchar(45) CHARACTER SET greek NOT NULL,
  `etos` year(4) NOT NULL,
  PRIMARY KEY (`code_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=670681 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd_production`
--

LOCK TABLES `cd_production` WRITE;
/*!40000 ALTER TABLE `cd_production` DISABLE KEYS */;
INSERT INTO `cd_production` VALUES (400400,'ODEON',1987),(400401,'ODEON',1986),(400412,'COLUMBIA',1990),(400420,'COLUMBIA',1990),(400657,'LYRA',1965),(410000,'COLUMBIA',1962),(410001,'COLUMBIA',1964),(410003,'PHILIPS',1979),(410005,'PHILIPS',1971),(420430,'ODEON',2002),(420440,'LYRA',2005),(420450,'COLUMBIA',2009),(420460,'ODEON',2007),(420470,'PHILIPS',2008),(420480,'ODEON',2002),(420490,'COLUMBIA',2010),(500500,'SONY',1968),(500510,'SONY',1972),(600601,'COLUMBIA',1962),(600602,'COLUMBIA',1963),(600603,'ODEON',1964),(670670,'PHILIPS',1983),(670680,'COLUMBIA',2010);
/*!40000 ALTER TABLE `cd_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_prod`
--

DROP TABLE IF EXISTS `group_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_prod` (
  `cd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group` varchar(45) COLLATE latin1_general_cs NOT NULL,
  `title` varchar(60) CHARACTER SET greek NOT NULL,
  PRIMARY KEY (`cd`,`group`,`title`),
  KEY `FK_group_prod_2` (`group`),
  KEY `FK_group_prod_3` (`title`),
  CONSTRAINT `FK_group_prod_1` FOREIGN KEY (`cd`) REFERENCES `cd_production` (`code_cd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_group_prod_2` FOREIGN KEY (`group`) REFERENCES `sigrotima` (`onoma`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_group_prod_3` FOREIGN KEY (`title`) REFERENCES `tragoudi` (`titlos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=420491 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_prod`
--

LOCK TABLES `group_prod` WRITE;
/*!40000 ALTER TABLE `group_prod` DISABLE KEYS */;
INSERT INTO `group_prod` VALUES (420490,'TERMITES','ΑΝΕΜΟΛΟΓΙΟ');
/*!40000 ALTER TABLE `group_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kalitexnis`
--

DROP TABLE IF EXISTS `kalitexnis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kalitexnis` (
  `ar_taut` char(8) COLLATE latin1_general_cs NOT NULL,
  `onoma` varchar(36) CHARACTER SET greek DEFAULT NULL,
  `epitheto` varchar(45) CHARACTER SET greek NOT NULL,
  `etos_gen` year(4) DEFAULT NULL,
  PRIMARY KEY (`ar_taut`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kalitexnis`
--

LOCK TABLES `kalitexnis` WRITE;
/*!40000 ALTER TABLE `kalitexnis` DISABLE KEYS */;
INSERT INTO `kalitexnis` VALUES ('A111111','ΓΙΑΝΝΗΣ','ΣΠΑΝΟΣ',1938),('A210210','ΜΑΝΟΣ','ΕΛΕΥΘΕΡΙΟΥ',1938),('A214214','ΜΑΝΟΣ','ΧΑΤΖΙΔΑΚΗΣ',1928),('A300000','ΚΩΣΤΑΣ','ΤΡΙΠΟΛΙΤΗΣ',1948),('A300001','ΓΙΑΝΝΗΣ','ΚΟΥΤΡΑΣ',1946),('B210210','ΜΙΜΗΣ','ΠΛΕΣΣΑΣ',1928),('B214214','ΜΑΝΟΣ','ΛΟΙΖΟΣ',1938),('C210210','ΣΤΕΛΙΟΣ','ΚΑΖΑΝΤΖΙΔΗΣ',1930),('C214214','ΚΩΣΤΑΣ','ΚΑΠΝΙΣΗΣ',1922),('D210210','ΓΙΑΝΝΗΣ','ΠΟΥΛΟΠΟΥΛΟΣ',1940),('D214214','ΛΕΥΤΕΡΗΣ','ΠΑΠΑΔΟΠΟΥΛΟΣ',1939),('D214215','ΜΑΙΡΗ','ΛΙΝΤΑ',1935),('E210210','ΓΙΩΡΓΟΣ','ΚΑΤΣΑΡΟΣ',1935),('E214214','ΣΤΑΥΡΟΣ','ΞΑΡΧΑΚΟΣ',1938),('F210210','ΓΙΑΝΝΗΣ','ΠΑΡΙΟΣ',1944),('F214214','ΧΡΗΣΤΟΣ','ΛΕΟΝΤΗΣ',1937),('G210210','ΔΗΜΗΤΡΑ','ΓΑΛΑΝΗ',1950),('G214214','ΜΑΝΩΛΗΣ','ΜΗΤΣΙΑΣ',1945),('H210210','ΧΑΡΙΣ','ΑΛΕΞΙΟΥ',1944),('H214214','ΜΑΡΙΑ','ΦΑΡΑΝΤΟΥΡΗ',1948),('I210210','ΝΑΝΑ','ΜΟΥΣΧΟΥΡΗ',1932),('I214214','ΜΙΚΗΣ','ΘΕΟΔΩΡΑΚΗΣ',1925),('J210210','ΝΙΚΟΣ','ΓΚΑΤΣΟΣ',1925),('J214214','ΓΡΗΓΟΡΗΣ','ΜΠΙΘΙΚΩΤΣΗΣ',1922),('K210210','ΚΩΣΤΑΣ','ΒΑΡΝΑΛΗΣ',1916),('K214214','ΛΟΥΚΙΑΝΟΣ','ΚΗΛΑΙΔΟΝΗΣ',1945),('L210210','ΒΑΣΙΛΗΣ','ΠΑΠΑΚΩΝΣΤΑΝΤΙΝΟΥ',1950),('L214214','ΣΩΤΗΡΙΑ','ΜΠΕΛΟΥ',1920),('M214214','ΒΑΣΙΛΗΣ','ΤΣΙΤΣΑΝΗΣ',1918),('N214214','ΛΑΥΡΕΝΤΗΣ','ΜΑΧΑΙΡΙΤΣΑΣ',1946),('O214214','ΔΙΟΝΥΣΗΣ','ΤΣΑΚΝΗΣ',1948),('P214214','ΓΙΑΝΝΗΣ','ΑΓΓΕΛΑΚΑΣ',1951),('Q214214','ΜΑΝΩΛΗΣ','ΑΓΓΕΛΛΟΠΟΥΛΟΣ',1928),('R214214','ΦΩΤΗΣ','ΑΛΕΠΟΡΟΣ',1921),('S214214','ΗΛΙΑΣ','ΑΝΔΡΙΟΠΟΥΛΟΣ',1953),('T214214',NULL,'ΑΡΛΕΤΑ',1948),('U214214',NULL,'ΑΤΤΙΚ',1917),('W100100','ΤΟΛΗΣ','ΒΟΣΚΟΠΟΥΛΟΣ',1940),('W100101','','ΓΙΟΒΑΝΑ',1936),('W100110','ΓΙΑΝΝΗΣ','ΣΠΥΡΟΠΟΥΛΟΣ',1949),('X100100','ΓΙΩΡΓΟΣ','ΖΑΜΠΕΤΑΣ',1928),('X101101','ΜΑΡΚΟΣ','ΒΑΜΒΑΚΑΡΗΣ',1917),('X101102','ΧΑΡΑΛΑΜΠΟΣ','ΒΑΣΙΛΕΙΑΔΗΣ',1925),('X101103','ΠΑΝΟΣ','ΓΑΒΑΛΑΣ',1924),('X101104','ΓΙΑΝΝΗΣ','ΓΙΟΚΑΡΙΝΗΣ',1947),('X101105','ΠΟΣΕΙΔΩΝΑΣ','ΓΙΑΝΝΟΠΟΥΛΟΣ',1954),('X200200','ΒΙΚΥ','ΜΟΣΧΟΛΙΟΥ',1942),('X200201','ΖΩΗ','ΦΥΤΟΥΣΗ',1938),('X200202','ΔΙΟΝΥΣΗΣ','ΣΑΒΒΟΠΟΥΛΟΣ',1945),('X200203','ΑΛΚΗΣΤΙΣ','ΠΡΩΤΟΨΑΛΤΗ',1955),('X200204','ΘΑΝΟΣ','ΜΙΚΡΟΥΤΣΙΚΟΣ',1947),('X200205','ΑΛΕΚΟΣ','ΣΑΚΕΛΛΑΡΙΟΣ',1917),('X200206','ΝΩΤΗΣ','ΜΑΥΡΟΥΔΗΣ',1945),('X200207','ΣΤΑΥΡΟΣ','ΚΟΥΓΙΟΥΜΤΖΗΣ',1930),('X200208','ΓΙΩΡΓΟΣ','ΝΤΑΛΑΡΑΣ',1950),('X200209','ΛΙΝΑ','ΝΙΚΟΛΑΚΟΠΟΥΛΟΥ',1954),('X200210','ΣΤΑΜΑΤΗΣ','ΚΡΑΟΥΝΑΚΗΣ',1954),('X200215','ΕΥΤΥΧΙΑ','ΠΑΠΑΓΙΑΝΝΟΠΟΥΛΟΥ',1902),('X200216','ΔΗΜΗΤΡΗΣ','ΠΑΠΑΔΗΜΗΤΡΙΟΥ',1956),('X200217','ΣΠΥΡΟΣ','ΠΕΡΙΣΤΕΡΗΣ',1918),('X200218','ΒΑΓΓΕΛΗΣ','ΠΕΡΠΙΝΙΑΔΗΣ',1917),('X200220','ΜΙΧΑΛΗΣ','ΜΠΟΥΡΜΠΟΥΛΗΣ',1945),('X214214','ΑΝΤΩΝΗΣ','ΒΑΡΔΗΣ',1947),('X300300','ΓΙΑΝΝΗΣ','ΛΟΓΟΘΕΤΗΣ',1944),('X300301','ΣΑΚΗΣ','ΜΠΟΥΛΑΣ',1946),('X300302','ΔΗΜΗΤΡΗΣ','ΧΡΙΣΤΟΔΟΥΛΟΥ',1932),('X300305','ΓΙΑΝΝΗΣ','ΜΑΡΚΟΠΟΥΛΟΣ',1937),('X400300','ΙΑΚΩΒΟΣ','ΚΑΜΠΑΝΕΛΗΣ',1920),('X500501','ΑΝΤΩΝΗΣ','ΚΑΛΟΓΙΑΝΝΗΣ',1938),('X800000','ΔΗΜΟΣ','ΜΟΥΤΣΗΣ',1938),('X800001','ΣΤΑΜΑΤΗΣ','ΚΟΚΟΤΑΣ',1938),('X800002','ΠΕΤΡΗ','ΣΑΛΠΕΑ',1940),('X800003','ΔΗΜΗΤΡΗΣ','ΜΗΤΡΟΠΑΝΟΣ',1946);
/*!40000 ALTER TABLE `kalitexnis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigrotima`
--

DROP TABLE IF EXISTS `sigrotima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sigrotima` (
  `onoma` varchar(45) COLLATE latin1_general_cs NOT NULL,
  `im_dimiourgias` int(10) unsigned NOT NULL,
  PRIMARY KEY (`onoma`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigrotima`
--

LOCK TABLES `sigrotima` WRITE;
/*!40000 ALTER TABLE `sigrotima` DISABLE KEYS */;
INSERT INTO `sigrotima` VALUES ('IDOLS',1974),('STARS',1998),('TERMITES',1996),('U5',1998),('XILINA SPATHIA',1994);
/*!40000 ALTER TABLE `sigrotima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `singer_prod`
--

DROP TABLE IF EXISTS `singer_prod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `singer_prod` (
  `cd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tragoudistis` char(8) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  `title` varchar(60) CHARACTER SET greek NOT NULL,
  PRIMARY KEY (`cd`,`tragoudistis`,`title`),
  KEY `FK_ektelesi_2` (`tragoudistis`),
  KEY `FK_ektelesi_3` (`title`),
  CONSTRAINT `FK_ektelesi_1` FOREIGN KEY (`cd`) REFERENCES `cd_production` (`code_cd`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ektelesi_2` FOREIGN KEY (`tragoudistis`) REFERENCES `kalitexnis` (`ar_taut`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ektelesi_3` FOREIGN KEY (`title`) REFERENCES `tragoudi` (`titlos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=600604 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `singer_prod`
--

LOCK TABLES `singer_prod` WRITE;
/*!40000 ALTER TABLE `singer_prod` DISABLE KEYS */;
INSERT INTO `singer_prod` VALUES (420480,'A300001','ΑΝΕΜΟΛΟΓΙΟ'),(420480,'A300001','ΜΑΡΕΑ'),(600603,'D214215','ΑΠΑΓΩΓΗ'),(600602,'G210210','ΑΕΡΙΚΟ'),(600602,'G214214','ΑΠΟΨΕ ΦΘΙΝΟΠΩΡΙΑΣΕ'),(400400,'H214214','ΜΑΡΓΑΡΙΤΑ ΜΑΓΙΟΠΟΥΛΑ'),(400412,'H214214','ΕΙΧΑ ΦΥΤΕΨΕΙ ΜΙΑ ΚΑΡΔΙΑ'),(410000,'H214214','ΟΙ ΜΟΙΡΑΙΟΙ'),(410003,'H214214','Ο ΕΦΙΑΛΤΗΣ ΤΗΣ ΠΕΡΣΕΦΟΝΗΣ'),(400401,'J214214','ΜΑΡΓΑΡΙΤΑ ΜΑΓΙΟΠΟΥΛΑ'),(400420,'J214214','ΦΡΑΓΚΟΣΥΡΙΑΝΗ'),(410000,'J214214','ΟΙ ΜΟΙΡΑΙΟΙ'),(600601,'J214214','ΑΧ ΒΡΕ ΠΑΛΙΟΜΙΣΟΦΟΡΙΑ'),(500510,'W100100','ΑΓΩΝΙΑ'),(400657,'W100101','ΕΙΧΑ ΦΥΤΕΨΕΙ ΜΙΑ ΚΑΡΔΙΑ'),(400412,'X101101','ΚΑΡΑΒΟΤΣΑΚΙΣΜΑΤΑ'),(400412,'X101101','ΦΡΑΓΚΟΣΥΡΙΑΝΗ'),(500500,'X200203','ΑΥΤΕΣ ΟΙ ΞΕΝΕΣ ΑΓΚΑΛΙΕΣ'),(500500,'X500501','ΘΑ ΣΕ ΞΑΝΑΒΡΩ ΣΤΟΥΣ ΜΠΑΞΕΔΕΣ'),(410005,'X800002','ΑΓΙΟΣ ΦΕΒΡΟΥΑΡΙΟΣ'),(410005,'X800002','ΤΟ ΣΠΙΤΙ ΣΤΗΝ ΑΝΗΦΟΡΙΑ'),(410005,'X800003','ΑΛΛΟΣ ΓΙΑ ΧΙΟ ΤΡΑΒΗΞΕ');
/*!40000 ALTER TABLE `singer_prod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tragoudi`
--

DROP TABLE IF EXISTS `tragoudi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tragoudi` (
  `titlos` varchar(60) CHARACTER SET greek NOT NULL,
  `sinthetis` char(8) COLLATE latin1_general_cs DEFAULT NULL,
  `etos_par` year(4) DEFAULT NULL,
  `stixourgos` char(8) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`titlos`),
  KEY `FK_tragoudi_1` (`sinthetis`),
  KEY `FK_tragoudi_2` (`stixourgos`),
  CONSTRAINT `FK_tragoudi_1` FOREIGN KEY (`sinthetis`) REFERENCES `kalitexnis` (`ar_taut`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_tragoudi_2` FOREIGN KEY (`stixourgos`) REFERENCES `kalitexnis` (`ar_taut`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tragoudi`
--

LOCK TABLES `tragoudi` WRITE;
/*!40000 ALTER TABLE `tragoudi` DISABLE KEYS */;
INSERT INTO `tragoudi` VALUES ('ΑΓΙΟΣ ΦΕΒΡΟΥΑΡΙΟΣ','X800000',1970,'A210210'),('ΑΓΩΝΙΑ','X100100',1978,'X101102'),('ΑΕΡΙΚΟ','A214214',1970,'J210210'),('ΑΙΡΕΤΙΚΟ','P214214',2000,'P214214'),('ΑΛΑΤΙ','I214214',1988,'D214214'),('ΑΛΛΟΣ ΓΙΑ ΧΙΟ ΤΡΑΒΗΞΕ','X800000',1970,'A210210'),('ΑΝΕΜΟΛΟΓΙΟ','X200204',1998,'A300000'),('ΑΠΑΓΩΓΗ','I214214',1960,'I214214'),('ΑΠΟΝΗ ΖΩΗ','E214214',1967,'D214214'),('ΑΠΟΨΕ ΦΘΙΝΟΠΩΡΙΑΣΕ','A214214',1972,'J210210'),('ΑΣΠΡΗ ΜΕΡΑ','E214214',1967,'J210210'),('ΑΥΤΕΣ ΟΙ ΞΕΝΕΣ ΑΓΚΑΛΙΕΣ','S214214',1986,'A210210'),('ΑΧ ΒΡΕ ΠΑΛΙΟΜΙΣΟΦΟΡΙΑ','A214214',1959,'X200205'),('ΒΑΤΡΑΧΙΝΑ','X100100',1968,'X200215'),('ΔΙΔΥΜΟΤΕΙΧΟ BLUES','N214214',1979,'W100110'),('ΕΙΧΑ ΦΥΤΕΨΕΙ ΜΙΑ ΚΑΡΔΙΑ','I214214',1962,'J210210'),('ΕΡΗΜΑ ΒΟΥΝΑ','P214214',2001,'P214214'),('ΘΑ ΣΕ ΞΑΝΑΒΡΩ ΣΤΟΥΣ ΜΠΑΞΕΔΕΣ','S214214',1985,'A210210'),('ΚΑΗΜΟΣ','I214214',1963,'X300302'),('ΚΑΙΓΟΜΑΙ ΚΑΙΓΟΜΑΙ','E214214',1969,'J210210'),('ΚΑΡΑΒΟΤΣΑΚΙΣΜΑΤΑ','X101101',1945,'X101101'),('ΛΕΥΤΕΡΗ','E214214',1968,'J210210'),('ΜΑΝΑ ΜΟΥ ΕΛΛΑΣ','E214214',1998,'J210210'),('ΜΑΝΟΥΛΑ ΜΟΥ Ο ΓΙΟΚΑΣ ΣΟΥ','I214214',1963,'I214214'),('ΜΑΡΓΑΡΙΤΑ ΜΑΓΙΟΠΟΥΛΑ','I214214',1964,'X400300'),('ΜΑΡΕΑ','X200204',1998,'A300000'),('ΜΑΤΙΑ ΒΟΥΡΚΩΜΕΝΑ','E214214',1998,'J210210'),('ΜΕ ΤΟ ΒΟΡΙΑ','X100100',1976,'X300302'),('ΜΗ ΜΟΥ ΤΑΖΕΙΣ','X101104',1988,'X300301'),('ΜΗΝ ΚΛΑΙΣ','S214214',1987,'X200220'),('ΝΑΥΑΓΟΣ ΜΕΣ ΤΗΝ ΑΘΗΝΑ','X101104',1989,'X300300'),('ΝΟΣΤΑΛΓΟΣ ΤΟΥ ROCK & ROLL','X101104',1987,'X101104'),('ΝΥΝ ΚΑΙ ΑΕΙ','E214214',1978,'J210210'),('Ο ΕΦΙΑΛΤΗΣ ΤΗΣ ΠΕΡΣΕΦΟΝΗΣ','A214214',1978,'J210210'),('Ο ΠΑΝΤΕΛΗΣ','A214214',1970,'J210210'),('ΟΙ ΜΟΙΡΑΙΟΙ','I214214',1961,'K210210'),('ΣΤΑ ΧΕΡΙΑ ΣΟΥ ΜΕΓΑΛΩΣΑΝ','E214214',1998,'D214214'),('ΤΙ ΕΧΕΙ ΚΑΙ ΚΛΑΙΕΙ ΤΟ ΠΑΙΔΙ','E214214',1969,'X200215'),('ΤΟ ΔΙΧΤΥ','E214214',1998,'J210210'),('ΤΟ ΠΡΑΚΤΟΡΕΙΟ','E214214',1998,'J210210'),('ΤΟ ΣΠΙΤΙ ΣΤΗΝ ΑΝΗΦΟΡΙΑ','X800000',1970,'A210210'),('ΦΡΑΓΚΟΣΥΡΙΑΝΗ','X101101',1938,'X101101'),('ΩΡΕΣ ΜΕ ΘΡΕΦΕΙ Ο ΛΟΥΛΑΣ','X101101',1935,'X101101');
/*!40000 ALTER TABLE `tragoudi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-25 11:21:21
