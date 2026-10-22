-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: universitydb
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academic_year`
--

DROP TABLE IF EXISTS `academic_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_year` (
  `Year_Id` int NOT NULL,
  `Year_Name` varchar(50) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Year_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_year`
--

LOCK TABLES `academic_year` WRITE;
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` VALUES (1,'2027/2028','2027-01-01','2027-12-31');
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda` (
  `Agenda_Id` int NOT NULL,
  `Meeting_Id` int DEFAULT NULL,
  `Template_Id` int DEFAULT NULL,
  `Responsible_Staff_Id` int DEFAULT NULL,
  `Item_No` int DEFAULT NULL,
  `Title` varchar(200) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`Agenda_Id`),
  KEY `Meeting_Id` (`Meeting_Id`),
  KEY `Template_Id` (`Template_Id`),
  KEY `Responsible_Staff_Id` (`Responsible_Staff_Id`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`),
  CONSTRAINT `agenda_ibfk_2` FOREIGN KEY (`Template_Id`) REFERENCES `agenda_template` (`Template_Id`),
  CONSTRAINT `agenda_ibfk_3` FOREIGN KEY (`Responsible_Staff_Id`) REFERENCES `staff` (`Staff_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agenda_template`
--

DROP TABLE IF EXISTS `agenda_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agenda_template` (
  `Template_Id` int NOT NULL,
  `Template_Name` varchar(100) DEFAULT NULL,
  `Meeting_Type_Id` int DEFAULT NULL,
  PRIMARY KEY (`Template_Id`),
  KEY `Meeting_Type_Id` (`Meeting_Type_Id`),
  CONSTRAINT `agenda_template_ibfk_1` FOREIGN KEY (`Meeting_Type_Id`) REFERENCES `meeting_type` (`Meeting_Type_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda_template`
--

LOCK TABLES `agenda_template` WRITE;
/*!40000 ALTER TABLE `agenda_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `agenda_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `industry_person`
--

DROP TABLE IF EXISTS `industry_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `industry_person` (
  `Industry_Person_Id` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Contact` varchar(20) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `Company` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Industry_Person_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industry_person`
--

LOCK TABLES `industry_person` WRITE;
/*!40000 ALTER TABLE `industry_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `industry_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting`
--

DROP TABLE IF EXISTS `meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting` (
  `Meeting_Id` int NOT NULL,
  `Meeting_Type_Id` int DEFAULT NULL,
  `Semester_Id` int DEFAULT NULL,
  `Year_Id` int DEFAULT NULL,
  `Venue_Id` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Meeting_Id`),
  KEY `Meeting_Type_Id` (`Meeting_Type_Id`),
  KEY `Semester_Id` (`Semester_Id`),
  KEY `Year_Id` (`Year_Id`),
  KEY `Venue_Id` (`Venue_Id`),
  CONSTRAINT `meeting_ibfk_1` FOREIGN KEY (`Meeting_Type_Id`) REFERENCES `meeting_type` (`Meeting_Type_Id`),
  CONSTRAINT `meeting_ibfk_2` FOREIGN KEY (`Semester_Id`) REFERENCES `semester` (`Semester_Id`),
  CONSTRAINT `meeting_ibfk_3` FOREIGN KEY (`Year_Id`) REFERENCES `academic_year` (`Year_Id`),
  CONSTRAINT `meeting_ibfk_4` FOREIGN KEY (`Venue_Id`) REFERENCES `venue` (`Venue_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting`
--

LOCK TABLES `meeting` WRITE;
/*!40000 ALTER TABLE `meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_industry_person`
--

DROP TABLE IF EXISTS `meeting_industry_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_industry_person` (
  `Meeting_Id` int NOT NULL,
  `Industry_Person_Id` int NOT NULL,
  PRIMARY KEY (`Meeting_Id`,`Industry_Person_Id`),
  KEY `Industry_Person_Id` (`Industry_Person_Id`),
  CONSTRAINT `meeting_industry_person_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`),
  CONSTRAINT `meeting_industry_person_ibfk_2` FOREIGN KEY (`Industry_Person_Id`) REFERENCES `industry_person` (`Industry_Person_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_industry_person`
--

LOCK TABLES `meeting_industry_person` WRITE;
/*!40000 ALTER TABLE `meeting_industry_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_industry_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_student_representative`
--

DROP TABLE IF EXISTS `meeting_student_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_student_representative` (
  `Meeting_Id` int NOT NULL,
  `Student_Rep_Id` int NOT NULL,
  PRIMARY KEY (`Meeting_Id`,`Student_Rep_Id`),
  KEY `Student_Rep_Id` (`Student_Rep_Id`),
  CONSTRAINT `meeting_student_representative_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`),
  CONSTRAINT `meeting_student_representative_ibfk_2` FOREIGN KEY (`Student_Rep_Id`) REFERENCES `student_representative` (`Student_Rep_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_student_representative`
--

LOCK TABLES `meeting_student_representative` WRITE;
/*!40000 ALTER TABLE `meeting_student_representative` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_student_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_type`
--

DROP TABLE IF EXISTS `meeting_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_type` (
  `Meeting_Type_Id` int NOT NULL,
  `Meeting_Name` varchar(100) DEFAULT NULL,
  `Frequency` varchar(50) DEFAULT NULL,
  `Short_Code` varchar(20) DEFAULT NULL,
  `Is_Fixed` tinyint(1) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`Meeting_Type_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_type`
--

LOCK TABLES `meeting_type` WRITE;
/*!40000 ALTER TABLE `meeting_type` DISABLE KEYS */;
INSERT INTO `meeting_type` VALUES (1,'Project Evaluation','Monthly','PE',1,'Final year eval');
/*!40000 ALTER TABLE `meeting_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `Notification_Id` int NOT NULL,
  `Meeting_Id` int DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `Sent_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Notification_Id`),
  KEY `Meeting_Id` (`Meeting_Id`),
  CONSTRAINT `notification_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_evaluation`
--

DROP TABLE IF EXISTS `project_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_evaluation` (
  `Evaluation_Id` int NOT NULL,
  `Meeting_Id` int DEFAULT NULL,
  `Project_Group_Id` int DEFAULT NULL,
  PRIMARY KEY (`Evaluation_Id`),
  KEY `Meeting_Id` (`Meeting_Id`),
  KEY `Project_Group_Id` (`Project_Group_Id`),
  CONSTRAINT `project_evaluation_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`),
  CONSTRAINT `project_evaluation_ibfk_2` FOREIGN KEY (`Project_Group_Id`) REFERENCES `project_group` (`Project_Group_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_evaluation`
--

LOCK TABLES `project_evaluation` WRITE;
/*!40000 ALTER TABLE `project_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_group`
--

DROP TABLE IF EXISTS `project_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_group` (
  `Project_Group_Id` int NOT NULL,
  `Group_Name` varchar(100) DEFAULT NULL,
  `Project_Title` varchar(200) DEFAULT NULL,
  `Batch_Year` int DEFAULT NULL,
  PRIMARY KEY (`Project_Group_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_group`
--

LOCK TABLES `project_group` WRITE;
/*!40000 ALTER TABLE `project_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reschedule_history`
--

DROP TABLE IF EXISTS `reschedule_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reschedule_history` (
  `History_Id` int NOT NULL,
  `Meeting_Id` int DEFAULT NULL,
  `Reason` text,
  `Date` date DEFAULT NULL,
  `Old_Date` date DEFAULT NULL,
  `New_Date` date DEFAULT NULL,
  `Old_Time` time DEFAULT NULL,
  `New_Time` time DEFAULT NULL,
  `Changed_By` int DEFAULT NULL,
  `Changed_Date` datetime DEFAULT NULL,
  PRIMARY KEY (`History_Id`),
  KEY `Meeting_Id` (`Meeting_Id`),
  CONSTRAINT `reschedule_history_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reschedule_history`
--

LOCK TABLES `reschedule_history` WRITE;
/*!40000 ALTER TABLE `reschedule_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `reschedule_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `Role_Id` int NOT NULL,
  `Role_Name` varchar(100) DEFAULT NULL,
  `Description` text,
  PRIMARY KEY (`Role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin','Full System Access'),(2,'Lecturer','Can manage meetings');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `Semester_Id` int NOT NULL,
  `Semester_Name` varchar(50) DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`Semester_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (1,'Semester 1','2027-01-01','2027-03-31');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `Staff_Id` int NOT NULL,
  `First_Name` varchar(100) DEFAULT NULL,
  `Last_Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Role_Id` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Staff_Id`),
  KEY `Role_Id` (`Role_Id`),
  CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`Role_Id`) REFERENCES `role` (`Role_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_availability`
--

DROP TABLE IF EXISTS `staff_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_availability` (
  `Availability_Id` int NOT NULL,
  `Staff_Id` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Availability_Id`),
  KEY `Staff_Id` (`Staff_Id`),
  CONSTRAINT `staff_availability_ibfk_1` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_availability`
--

LOCK TABLES `staff_availability` WRITE;
/*!40000 ALTER TABLE `staff_availability` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_meeting`
--

DROP TABLE IF EXISTS `staff_meeting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_meeting` (
  `Meeting_Id` int NOT NULL,
  `Staff_Id` int NOT NULL,
  PRIMARY KEY (`Meeting_Id`,`Staff_Id`),
  KEY `Staff_Id` (`Staff_Id`),
  CONSTRAINT `staff_meeting_ibfk_1` FOREIGN KEY (`Meeting_Id`) REFERENCES `meeting` (`Meeting_Id`),
  CONSTRAINT `staff_meeting_ibfk_2` FOREIGN KEY (`Staff_Id`) REFERENCES `staff` (`Staff_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_meeting`
--

LOCK TABLES `staff_meeting` WRITE;
/*!40000 ALTER TABLE `staff_meeting` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_representative`
--

DROP TABLE IF EXISTS `student_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_representative` (
  `Student_Rep_Id` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Batch` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Student_Rep_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_representative`
--

LOCK TABLES `student_representative` WRITE;
/*!40000 ALTER TABLE `student_representative` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venue`
--

DROP TABLE IF EXISTS `venue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venue` (
  `Venue_Id` int NOT NULL,
  `Venue_Name` varchar(100) DEFAULT NULL,
  `Location` varchar(150) DEFAULT NULL,
  `Capacity` int DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Venue_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venue`
--

LOCK TABLES `venue` WRITE;
/*!40000 ALTER TABLE `venue` DISABLE KEYS */;
INSERT INTO `venue` VALUES (1,'Main Hall','Admin Building',200,'Available');
/*!40000 ALTER TABLE `venue` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22 20:59:35
