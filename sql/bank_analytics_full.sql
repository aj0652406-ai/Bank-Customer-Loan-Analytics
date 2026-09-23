-- MySQL dump 10.13  Distrib 26.7.0, for macos15 (arm64)
--
-- Host: localhost    Database: bank_analytics
-- ------------------------------------------------------
-- Server version	26.7.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Accounts`
--

DROP TABLE IF EXISTS `Accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Accounts` (
  `AccountID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `AccountType` varchar(20) NOT NULL,
  `Balance` decimal(14,2) NOT NULL DEFAULT '0.00',
  `OpenDate` date NOT NULL,
  `BranchID` int NOT NULL,
  `Status` varchar(20) NOT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `fk_accounts_customer` (`CustomerID`),
  KEY `fk_accounts_branch` (`BranchID`),
  CONSTRAINT `fk_accounts_branch` FOREIGN KEY (`BranchID`) REFERENCES `Branches` (`BranchID`),
  CONSTRAINT `fk_accounts_customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Accounts`
--

LOCK TABLES `Accounts` WRITE;
/*!40000 ALTER TABLE `Accounts` DISABLE KEYS */;
INSERT INTO `Accounts` VALUES (1,1,'Savings',35500.00,'2022-02-18',1,'Active'),(2,2,'Current',56000.00,'2022-03-07',2,'Active'),(3,3,'Salary',76500.00,'2022-03-24',3,'Active'),(4,4,'Savings',49000.00,'2022-04-10',4,'Inactive'),(5,5,'Current',69500.00,'2022-04-27',5,'Active'),(6,6,'Salary',90000.00,'2022-05-14',6,'Closed'),(7,7,'Savings',110500.00,'2022-05-31',7,'Active'),(8,8,'Current',83000.00,'2022-06-17',8,'Active'),(9,9,'Salary',103500.00,'2022-07-04',1,'Active'),(10,10,'Savings',124000.00,'2022-07-21',2,'Inactive'),(11,11,'Current',144500.00,'2022-08-07',3,'Active'),(12,12,'Salary',117000.00,'2022-08-24',4,'Closed'),(13,13,'Savings',137500.00,'2022-09-10',5,'Active'),(14,14,'Current',158000.00,'2022-09-27',6,'Active'),(15,15,'Salary',178500.00,'2022-10-14',7,'Active'),(16,16,'Savings',151000.00,'2022-10-31',8,'Inactive'),(17,17,'Current',171500.00,'2022-11-17',1,'Active'),(18,18,'Salary',192000.00,'2022-12-04',2,'Closed'),(19,19,'Savings',212500.00,'2022-12-21',3,'Active'),(20,20,'Current',185000.00,'2023-01-07',4,'Active'),(21,21,'Salary',205500.00,'2023-01-24',5,'Active'),(22,22,'Savings',226000.00,'2023-02-10',6,'Inactive'),(23,23,'Current',246500.00,'2023-02-27',7,'Active'),(24,24,'Salary',219000.00,'2023-03-16',8,'Closed'),(25,25,'Savings',239500.00,'2023-04-02',1,'Active'),(26,26,'Current',260000.00,'2023-04-19',2,'Active'),(27,27,'Salary',280500.00,'2023-05-06',3,'Active'),(28,28,'Savings',253000.00,'2023-05-23',4,'Inactive'),(29,29,'Current',273500.00,'2023-06-09',5,'Active'),(30,30,'Salary',294000.00,'2023-06-26',6,'Closed'),(31,31,'Savings',314500.00,'2023-07-13',7,'Active'),(32,32,'Current',287000.00,'2023-07-30',8,'Active'),(33,33,'Salary',307500.00,'2023-08-16',1,'Active'),(34,34,'Savings',328000.00,'2023-09-02',2,'Inactive'),(35,35,'Current',348500.00,'2023-09-19',3,'Active'),(36,36,'Salary',321000.00,'2023-10-06',4,'Closed'),(37,37,'Savings',341500.00,'2023-10-23',5,'Active'),(38,38,'Current',362000.00,'2023-11-09',6,'Active'),(39,39,'Salary',382500.00,'2023-11-26',7,'Active'),(40,40,'Savings',355000.00,'2023-12-13',8,'Inactive'),(41,41,'Current',375500.00,'2023-12-30',1,'Active'),(42,42,'Salary',396000.00,'2024-01-16',2,'Closed'),(43,43,'Savings',416500.00,'2024-02-02',3,'Active'),(44,44,'Current',389000.00,'2024-02-19',4,'Active'),(45,45,'Salary',409500.00,'2024-03-07',5,'Active'),(46,1,'Current',37300.00,'2023-01-29',4,'Active'),(47,2,'Salary',52600.00,'2023-02-17',5,'Active'),(48,3,'Savings',40900.00,'2023-03-08',6,'Inactive'),(49,4,'Current',56200.00,'2023-03-27',7,'Active'),(50,5,'Salary',71500.00,'2023-04-15',8,'Closed'),(51,6,'Savings',59800.00,'2023-05-04',1,'Active'),(52,7,'Current',75100.00,'2023-05-23',2,'Active'),(53,8,'Salary',90400.00,'2023-06-11',3,'Active'),(54,9,'Savings',78700.00,'2023-06-30',4,'Inactive'),(55,10,'Current',94000.00,'2023-07-19',5,'Active'),(56,11,'Salary',109300.00,'2023-08-07',6,'Closed'),(57,12,'Savings',97600.00,'2023-08-26',7,'Active'),(58,13,'Current',112900.00,'2023-09-14',8,'Active'),(59,14,'Salary',128200.00,'2023-10-03',1,'Active'),(60,15,'Savings',116500.00,'2023-10-22',2,'Inactive'),(61,16,'Current',131800.00,'2023-11-10',3,'Active'),(62,17,'Salary',147100.00,'2023-11-29',4,'Closed'),(63,18,'Savings',135400.00,'2023-12-18',5,'Active'),(64,19,'Current',150700.00,'2024-01-06',6,'Active'),(65,20,'Salary',166000.00,'2024-01-25',7,'Active'),(66,21,'Savings',154300.00,'2024-02-13',8,'Inactive'),(67,22,'Current',169600.00,'2024-03-03',1,'Active'),(68,23,'Salary',184900.00,'2024-03-22',2,'Closed'),(69,24,'Savings',173200.00,'2024-04-10',3,'Active'),(70,25,'Current',188500.00,'2024-04-29',4,'Active');
/*!40000 ALTER TABLE `Accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Branches`
--

DROP TABLE IF EXISTS `Branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Branches` (
  `BranchID` int NOT NULL,
  `BranchName` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `ManagerName` varchar(100) NOT NULL,
  PRIMARY KEY (`BranchID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Branches`
--

LOCK TABLES `Branches` WRITE;
/*!40000 ALTER TABLE `Branches` DISABLE KEYS */;
INSERT INTO `Branches` VALUES (1,'Connaught Place Branch','Delhi','Delhi','Rajesh Khanna'),(2,'Saket Branch','Delhi','Delhi','Neeraj Sharma'),(3,'Bandra Branch','Mumbai','Maharashtra','Pooja Mehta'),(4,'Andheri Branch','Mumbai','Maharashtra','Amit Desai'),(5,'MG Road Branch','Bengaluru','Karnataka','Suresh Rao'),(6,'Sector 18 Branch','Noida','Uttar Pradesh','Kavita Singh'),(7,'Cyber City Branch','Gurugram','Haryana','Rohit Bansal'),(8,'Hinjewadi Branch','Pune','Maharashtra','Meena Kulkarni');
/*!40000 ALTER TABLE `Branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Occupation` varchar(80) DEFAULT NULL,
  `AnnualIncome` decimal(12,2) DEFAULT NULL,
  `JoinDate` date DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Aarav','Sharma','Male',25,'Delhi','Delhi','9810000001','aarav.sharma1@example.com','Analyst',437000.00,'2022-02-15'),(2,'Vivaan','Verma','Female',28,'Mumbai','Maharashtra','9810000002','vivaan.verma2@example.com','Engineer',514000.00,'2022-03-18'),(3,'Aditya','Singh','Male',31,'Bengaluru','Karnataka','9810000003','aditya.singh3@example.com','Teacher',591000.00,'2022-04-18'),(4,'Vihaan','Gupta','Female',34,'Noida','Uttar Pradesh','9810000004','vihaan.gupta4@example.com','Manager',668000.00,'2022-05-19'),(5,'Arjun','Mehta','Male',37,'Gurugram','Haryana','9810000005','arjun.mehta5@example.com','Consultant',620000.00,'2022-06-19'),(6,'Sai','Kumar','Female',40,'Pune','Maharashtra','9810000006','sai.kumar6@example.com','Accountant',697000.00,'2022-07-20'),(7,'Reyansh','Jain','Male',43,'Jaipur','Rajasthan','9810000007','reyansh.jain7@example.com','Designer',774000.00,'2022-08-20'),(8,'Ayaan','Yadav','Female',46,'Lucknow','Uttar Pradesh','9810000008','ayaan.yadav8@example.com','Developer',851000.00,'2022-09-20'),(9,'Krishna','Malhotra','Male',49,'Hyderabad','Telangana','9810000009','krishna.malhotra9@example.com','Sales Executive',928000.00,'2022-10-21'),(10,'Ishaan','Kapoor','Female',52,'Chennai','Tamil Nadu','9810000010','ishaan.kapoor10@example.com','Entrepreneur',880000.00,'2022-11-21'),(11,'Ananya','Agarwal','Male',55,'Delhi','Delhi','9810000011','ananya.agarwal11@example.com','Analyst',957000.00,'2022-12-22'),(12,'Diya','Bansal','Female',24,'Mumbai','Maharashtra','9810000012','diya.bansal12@example.com','Engineer',1034000.00,'2023-01-22'),(13,'Aadhya','Mishra','Male',27,'Bengaluru','Karnataka','9810000013','aadhya.mishra13@example.com','Teacher',1111000.00,'2023-02-22'),(14,'Myra','Tiwari','Female',30,'Noida','Uttar Pradesh','9810000014','myra.tiwari14@example.com','Manager',1188000.00,'2023-03-25'),(15,'Sara','Joshi','Male',33,'Gurugram','Haryana','9810000015','sara.joshi15@example.com','Consultant',1140000.00,'2023-04-25'),(16,'Ira','Saxena','Female',36,'Pune','Maharashtra','9810000016','ira.saxena16@example.com','Accountant',1217000.00,'2023-05-26'),(17,'Anika','Nair','Male',39,'Jaipur','Rajasthan','9810000017','anika.nair17@example.com','Designer',1294000.00,'2023-06-26'),(18,'Navya','Iyer','Female',42,'Lucknow','Uttar Pradesh','9810000018','navya.iyer18@example.com','Developer',1371000.00,'2023-07-27'),(19,'Riya','Reddy','Male',45,'Hyderabad','Telangana','9810000019','riya.reddy19@example.com','Sales Executive',1448000.00,'2023-08-27'),(20,'Meera','Patel','Female',48,'Chennai','Tamil Nadu','9810000020','meera.patel20@example.com','Entrepreneur',1400000.00,'2023-09-27'),(21,'Kabir','Das','Male',51,'Delhi','Delhi','9810000021','kabir.das21@example.com','Analyst',1477000.00,'2023-10-28'),(22,'Rohan','Roy','Female',54,'Mumbai','Maharashtra','9810000022','rohan.roy22@example.com','Engineer',1554000.00,'2023-11-28'),(23,'Rahul','Chopra','Male',23,'Bengaluru','Karnataka','9810000023','rahul.chopra23@example.com','Teacher',1631000.00,'2023-12-29'),(24,'Karan','Arora','Female',26,'Noida','Uttar Pradesh','9810000024','karan.arora24@example.com','Manager',1708000.00,'2024-01-29'),(25,'Nikhil','Khanna','Male',29,'Gurugram','Haryana','9810000025','nikhil.khanna25@example.com','Consultant',1660000.00,'2024-02-29'),(26,'Siddharth','Sethi','Female',32,'Pune','Maharashtra','9810000026','siddharth.sethi26@example.com','Accountant',1737000.00,'2024-03-31'),(27,'Manish','Bhatia','Male',35,'Jaipur','Rajasthan','9810000027','manish.bhatia27@example.com','Designer',1814000.00,'2024-05-01'),(28,'Deepak','Goyal','Female',38,'Lucknow','Uttar Pradesh','9810000028','deepak.goyal28@example.com','Developer',1891000.00,'2024-06-01'),(29,'Varun','Chauhan','Male',41,'Hyderabad','Telangana','9810000029','varun.chauhan29@example.com','Sales Executive',1968000.00,'2024-07-02'),(30,'Akash','Pandey','Female',44,'Chennai','Tamil Nadu','9810000030','akash.pandey30@example.com','Entrepreneur',1920000.00,'2024-08-02'),(31,'Priya','Shah','Male',47,'Delhi','Delhi','9810000031','priya.shah31@example.com','Analyst',1997000.00,'2024-09-02'),(32,'Neha','Desai','Female',50,'Mumbai','Maharashtra','9810000032','neha.desai32@example.com','Engineer',2074000.00,'2024-10-03'),(33,'Pooja','Kulkarni','Male',53,'Bengaluru','Karnataka','9810000033','pooja.kulkarni33@example.com','Teacher',2151000.00,'2024-11-03'),(34,'Sneha','Rao','Female',22,'Noida','Uttar Pradesh','9810000034','sneha.rao34@example.com','Manager',2228000.00,'2024-12-04'),(35,'Kavya','Menon','Male',25,'Gurugram','Haryana','9810000035','kavya.menon35@example.com','Consultant',2180000.00,'2025-01-04'),(36,'Nisha','Pillai','Female',28,'Pune','Maharashtra','9810000036','nisha.pillai36@example.com','Accountant',2257000.00,'2025-02-04'),(37,'Simran','Gill','Male',31,'Jaipur','Rajasthan','9810000037','simran.gill37@example.com','Designer',2334000.00,'2025-03-07'),(38,'Aditi','Kaur','Female',34,'Lucknow','Uttar Pradesh','9810000038','aditi.kaur38@example.com','Developer',2411000.00,'2025-04-07'),(39,'Tanya','Thakur','Male',37,'Hyderabad','Telangana','9810000039','tanya.thakur39@example.com','Sales Executive',2488000.00,'2025-05-08'),(40,'Ritika','Bose','Female',40,'Chennai','Tamil Nadu','9810000040','ritika.bose40@example.com','Entrepreneur',2440000.00,'2025-06-08'),(41,'Mohit','Sinha','Male',43,'Delhi','Delhi','9810000041','mohit.sinha41@example.com','Analyst',2517000.00,'2025-07-09'),(42,'Ravi','Tripathi','Female',46,'Mumbai','Maharashtra','9810000042','ravi.tripathi42@example.com','Engineer',2594000.00,'2025-08-09'),(43,'Sanjay','Dubey','Male',49,'Bengaluru','Karnataka','9810000043','sanjay.dubey43@example.com','Teacher',2671000.00,'2025-09-09'),(44,'Vikas','Srivastava','Female',52,'Noida','Uttar Pradesh','9810000044','vikas.srivastava44@example.com','Manager',2748000.00,'2025-10-10'),(45,'Amit','Jha','Male',55,'Gurugram','Haryana','9810000045','amit.jha45@example.com','Consultant',2700000.00,'2025-11-10'),(46,'Shreya','Bhatt','Female',24,'Pune','Maharashtra','9810000046','shreya.bhatt46@example.com','Accountant',2777000.00,'2025-12-11'),(47,'Isha','Mathur','Male',27,'Jaipur','Rajasthan','9810000047','isha.mathur47@example.com','Designer',2854000.00,'2026-01-11'),(48,'Payal','Madan','Female',30,'Lucknow','Uttar Pradesh','9810000048','payal.madan48@example.com','Developer',2931000.00,'2026-02-11'),(49,'Sakshi','Dutta','Male',33,'Hyderabad','Telangana','9810000049','sakshi.dutta49@example.com','Sales Executive',3008000.00,'2026-03-14'),(50,'Komal','Goel','Female',36,'Chennai','Tamil Nadu','9810000050','komal.goel50@example.com','Entrepreneur',2960000.00,'2026-04-14');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoanPayments`
--

DROP TABLE IF EXISTS `LoanPayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LoanPayments` (
  `PaymentID` int NOT NULL,
  `LoanID` int NOT NULL,
  `PaymentDate` date NOT NULL,
  `PaymentAmount` decimal(14,2) NOT NULL,
  `PaymentStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`PaymentID`),
  KEY `fk_payments_loan` (`LoanID`),
  CONSTRAINT `fk_payments_loan` FOREIGN KEY (`LoanID`) REFERENCES `Loans` (`LoanID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoanPayments`
--

LOCK TABLES `LoanPayments` WRITE;
/*!40000 ALTER TABLE `LoanPayments` DISABLE KEYS */;
INSERT INTO `LoanPayments` VALUES (1,1,'2023-04-21',15437.00,'Pending'),(2,1,'2023-05-21',15937.00,'Late'),(3,2,'2023-05-12',17000.00,'Late'),(4,2,'2023-06-11',17500.00,'Paid'),(5,3,'2023-06-02',16583.00,'Paid'),(6,3,'2023-07-02',17083.00,'Paid'),(7,4,'2023-06-23',17476.00,'Paid'),(8,4,'2023-07-23',17976.00,'Pending'),(9,5,'2023-07-14',23875.00,'Pending'),(10,5,'2023-08-13',24375.00,'Late'),(11,6,'2023-08-04',15958.00,'Late'),(12,6,'2023-09-03',16458.00,'Paid'),(13,7,'2023-08-25',19083.00,'Paid'),(14,7,'2023-09-24',19583.00,'Paid'),(15,8,'2023-09-15',20055.00,'Paid'),(16,8,'2023-10-15',20555.00,'Pending'),(17,9,'2023-10-06',18964.00,'Pending'),(18,9,'2023-11-05',19464.00,'Late'),(19,10,'2023-10-27',24916.00,'Late'),(20,10,'2023-11-26',25416.00,'Paid'),(21,11,'2023-11-17',16479.00,'Paid'),(22,11,'2023-12-17',16979.00,'Paid'),(23,12,'2023-12-08',21166.00,'Paid'),(24,12,'2024-01-07',21666.00,'Pending'),(25,13,'2023-12-29',23527.00,'Pending'),(26,13,'2024-01-28',24027.00,'Late'),(27,14,'2024-01-19',20452.00,'Late'),(28,14,'2024-02-18',20952.00,'Paid'),(29,15,'2024-02-09',25958.00,'Paid'),(30,15,'2024-03-10',26458.00,'Paid'),(31,16,'2024-03-01',17000.00,'Paid'),(32,16,'2024-03-31',17500.00,'Pending'),(33,17,'2024-03-22',23250.00,'Pending'),(34,17,'2024-04-21',23750.00,'Late'),(35,18,'2024-04-12',27000.00,'Late'),(36,18,'2024-05-12',27500.00,'Paid'),(37,19,'2024-05-03',21940.00,'Paid'),(38,19,'2024-06-02',22440.00,'Paid'),(39,20,'2024-05-24',27000.00,'Paid'),(40,20,'2024-06-23',27500.00,'Pending'),(41,21,'2024-06-14',17520.00,'Pending'),(42,21,'2024-07-14',18020.00,'Late'),(43,22,'2024-07-05',25333.00,'Late'),(44,22,'2024-08-04',25833.00,'Paid'),(45,23,'2024-07-26',30472.00,'Paid'),(46,23,'2024-08-25',30972.00,'Paid'),(47,24,'2024-08-16',23428.00,'Paid'),(48,24,'2024-09-15',23928.00,'Pending'),(49,25,'2024-09-06',28041.00,'Pending'),(50,25,'2024-10-06',28541.00,'Late'),(51,26,'2024-09-27',18041.00,'Late'),(52,26,'2024-10-27',18541.00,'Paid'),(53,27,'2024-10-18',27416.00,'Paid'),(54,27,'2024-11-17',27916.00,'Paid'),(55,28,'2024-11-08',33944.00,'Paid'),(56,28,'2024-12-08',34444.00,'Pending'),(57,29,'2024-11-29',24916.00,'Pending'),(58,29,'2024-12-29',25416.00,'Late'),(59,30,'2024-12-20',29083.00,'Late'),(60,30,'2025-01-19',29583.00,'Paid'),(61,31,'2025-01-10',18562.00,'Paid'),(62,31,'2025-02-09',19062.00,'Paid'),(63,32,'2025-01-31',29500.00,'Paid'),(64,32,'2025-03-02',30000.00,'Pending'),(65,33,'2025-02-21',37416.00,'Pending'),(66,33,'2025-03-23',37916.00,'Late'),(67,34,'2025-03-14',26404.00,'Late'),(68,34,'2025-04-13',26904.00,'Paid'),(69,35,'2025-04-04',30125.00,'Paid'),(70,35,'2025-05-04',30625.00,'Paid'),(71,36,'2024-06-07',17833.00,'Paid'),(72,36,'2024-07-07',18333.00,'Pending'),(73,37,'2024-06-30',25000.00,'Pending'),(74,37,'2024-07-30',25500.00,'Late'),(75,38,'2024-07-23',16125.00,'Late'),(76,38,'2024-08-22',16625.00,'Paid'),(77,39,'2024-08-15',19000.00,'Paid'),(78,39,'2024-09-14',19500.00,'Paid'),(79,40,'2024-09-07',20055.00,'Paid'),(80,40,'2024-10-07',20555.00,'Pending'),(81,41,'2024-09-30',19619.00,'Pending'),(82,41,'2024-10-30',20119.00,'Late'),(83,42,'2024-10-23',26250.00,'Late'),(84,42,'2024-11-22',26750.00,'Paid'),(85,43,'2024-11-15',16750.00,'Paid'),(86,43,'2024-12-15',17250.00,'Paid'),(87,44,'2024-12-08',21500.00,'Paid'),(88,44,'2025-01-07',22000.00,'Pending'),(89,45,'2024-12-31',24222.00,'Pending'),(90,45,'2025-01-30',24722.00,'Late'),(91,46,'2025-01-23',21404.00,'Late'),(92,46,'2025-02-22',21904.00,'Paid'),(93,47,'2025-02-15',27500.00,'Paid'),(94,47,'2025-03-17',28000.00,'Paid'),(95,48,'2025-03-10',17375.00,'Paid'),(96,48,'2025-04-09',17875.00,'Pending'),(97,49,'2025-04-02',24000.00,'Pending'),(98,49,'2025-05-02',24500.00,'Late'),(99,50,'2025-04-25',28388.00,'Late'),(100,50,'2025-05-25',28888.00,'Paid');
/*!40000 ALTER TABLE `LoanPayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Loans`
--

DROP TABLE IF EXISTS `Loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Loans` (
  `LoanID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `LoanType` varchar(30) NOT NULL,
  `LoanAmount` decimal(14,2) NOT NULL,
  `InterestRate` decimal(5,2) NOT NULL,
  `LoanDate` date NOT NULL,
  `TenureMonths` int NOT NULL,
  `LoanStatus` varchar(20) NOT NULL,
  PRIMARY KEY (`LoanID`),
  KEY `fk_loans_customer` (`CustomerID`),
  CONSTRAINT `fk_loans_customer` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Loans`
--

LOCK TABLES `Loans` WRITE;
/*!40000 ALTER TABLE `Loans` DISABLE KEYS */;
INSERT INTO `Loans` VALUES (1,1,'Home Loan',3225000.00,8.35,'2023-03-22',240,'Active'),(2,2,'Car Loan',900000.00,9.25,'2023-04-12',60,'Closed'),(3,3,'Personal Loan',525000.00,12.50,'2023-05-03',36,'Defaulted'),(4,4,'Education Loan',1300000.00,10.75,'2023-05-24',84,'Pending'),(5,5,'Business Loan',2625000.00,11.20,'2023-06-14',120,'Active'),(6,6,'Home Loan',3350000.00,8.35,'2023-07-05',240,'Active'),(7,7,'Car Loan',1025000.00,9.25,'2023-07-26',60,'Closed'),(8,8,'Personal Loan',650000.00,12.50,'2023-08-16',36,'Defaulted'),(9,9,'Education Loan',1425000.00,10.75,'2023-09-06',84,'Pending'),(10,10,'Business Loan',2750000.00,11.20,'2023-09-27',120,'Active'),(11,11,'Home Loan',3475000.00,8.35,'2023-10-18',240,'Active'),(12,12,'Car Loan',1150000.00,9.25,'2023-11-08',60,'Closed'),(13,13,'Personal Loan',775000.00,12.50,'2023-11-29',36,'Defaulted'),(14,14,'Education Loan',1550000.00,10.75,'2023-12-20',84,'Pending'),(15,15,'Business Loan',2875000.00,11.20,'2024-01-10',120,'Active'),(16,16,'Home Loan',3600000.00,8.35,'2024-01-31',240,'Active'),(17,17,'Car Loan',1275000.00,9.25,'2024-02-21',60,'Closed'),(18,18,'Personal Loan',900000.00,12.50,'2024-03-13',36,'Defaulted'),(19,19,'Education Loan',1675000.00,10.75,'2024-04-03',84,'Pending'),(20,20,'Business Loan',3000000.00,11.20,'2024-04-24',120,'Active'),(21,21,'Home Loan',3725000.00,8.35,'2024-05-15',240,'Active'),(22,22,'Car Loan',1400000.00,9.25,'2024-06-05',60,'Closed'),(23,23,'Personal Loan',1025000.00,12.50,'2024-06-26',36,'Defaulted'),(24,24,'Education Loan',1800000.00,10.75,'2024-07-17',84,'Pending'),(25,25,'Business Loan',3125000.00,11.20,'2024-08-07',120,'Active'),(26,26,'Home Loan',3850000.00,8.35,'2024-08-28',240,'Active'),(27,27,'Car Loan',1525000.00,9.25,'2024-09-18',60,'Closed'),(28,28,'Personal Loan',1150000.00,12.50,'2024-10-09',36,'Defaulted'),(29,29,'Education Loan',1925000.00,10.75,'2024-10-30',84,'Pending'),(30,30,'Business Loan',3250000.00,11.20,'2024-11-20',120,'Active'),(31,31,'Home Loan',3975000.00,8.35,'2024-12-11',240,'Active'),(32,32,'Car Loan',1650000.00,9.25,'2025-01-01',60,'Closed'),(33,33,'Personal Loan',1275000.00,12.50,'2025-01-22',36,'Defaulted'),(34,34,'Education Loan',2050000.00,10.75,'2025-02-12',84,'Pending'),(35,35,'Business Loan',3375000.00,11.20,'2025-03-05',120,'Active'),(36,1,'Education Loan',1330000.00,10.50,'2024-05-08',84,'Defaulted'),(37,2,'Business Loan',2760000.00,11.00,'2024-05-31',120,'Pending'),(38,3,'Home Loan',3390000.00,8.10,'2024-06-23',240,'Active'),(39,4,'Car Loan',1020000.00,9.40,'2024-07-16',60,'Closed'),(40,5,'Personal Loan',650000.00,12.25,'2024-08-08',36,'Active'),(41,6,'Education Loan',1480000.00,10.50,'2024-08-31',84,'Defaulted'),(42,7,'Business Loan',2910000.00,11.00,'2024-09-23',120,'Pending'),(43,8,'Home Loan',3540000.00,8.10,'2024-10-16',240,'Active'),(44,9,'Car Loan',1170000.00,9.40,'2024-11-08',60,'Closed'),(45,10,'Personal Loan',800000.00,12.25,'2024-12-01',36,'Active'),(46,11,'Education Loan',1630000.00,10.50,'2024-12-24',84,'Defaulted'),(47,12,'Business Loan',3060000.00,11.00,'2025-01-16',120,'Pending'),(48,13,'Home Loan',3690000.00,8.10,'2025-02-08',240,'Active'),(49,14,'Car Loan',1320000.00,9.40,'2025-03-03',60,'Closed'),(50,15,'Personal Loan',950000.00,12.25,'2025-03-26',36,'Active');
/*!40000 ALTER TABLE `Loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `TransactionID` int NOT NULL,
  `AccountID` int NOT NULL,
  `TransactionDate` date NOT NULL,
  `TransactionType` varchar(20) NOT NULL,
  `Amount` decimal(14,2) NOT NULL,
  `PaymentMode` varchar(30) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `fk_transactions_account` (`AccountID`),
  CONSTRAINT `fk_transactions_account` FOREIGN KEY (`AccountID`) REFERENCES `Accounts` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,7,'2025-01-04','Deposit',1875.00,'UPI'),(2,14,'2025-01-07','Withdrawal',3250.00,'Cash'),(3,21,'2025-01-10','Transfer',4625.00,'Card'),(4,28,'2025-01-13','Payment',6000.00,'Net Banking'),(5,35,'2025-01-16','Deposit',7375.00,'Cheque'),(6,42,'2025-01-19','Withdrawal',8750.00,'UPI'),(7,49,'2025-01-22','Transfer',10125.00,'Cash'),(8,56,'2025-01-25','Payment',11500.00,'Card'),(9,3,'2025-01-28','Deposit',12875.00,'Net Banking'),(10,10,'2025-01-31','Withdrawal',14250.00,'Cheque'),(11,17,'2025-02-03','Transfer',15625.00,'UPI'),(12,24,'2025-02-06','Payment',17000.00,'Cash'),(13,31,'2025-02-09','Deposit',18375.00,'Card'),(14,38,'2025-02-12','Withdrawal',19750.00,'Net Banking'),(15,45,'2025-02-15','Transfer',21125.00,'Cheque'),(16,52,'2025-02-18','Payment',22500.00,'UPI'),(17,59,'2025-02-21','Deposit',23875.00,'Cash'),(18,6,'2025-02-24','Withdrawal',25250.00,'Card'),(19,13,'2025-02-27','Transfer',26625.00,'Net Banking'),(20,20,'2025-03-02','Payment',28000.00,'Cheque'),(21,27,'2025-03-05','Deposit',29375.00,'UPI'),(22,34,'2025-03-08','Withdrawal',30750.00,'Cash'),(23,41,'2025-03-11','Transfer',32125.00,'Card'),(24,48,'2025-03-14','Payment',33500.00,'Net Banking'),(25,55,'2025-03-17','Deposit',34875.00,'Cheque'),(26,2,'2025-03-20','Withdrawal',36250.00,'UPI'),(27,9,'2025-03-23','Transfer',37625.00,'Cash'),(28,16,'2025-03-26','Payment',39000.00,'Card'),(29,23,'2025-03-29','Deposit',40375.00,'Net Banking'),(30,30,'2025-04-01','Withdrawal',41750.00,'Cheque'),(31,37,'2025-04-04','Transfer',43125.00,'UPI'),(32,44,'2025-04-07','Payment',44500.00,'Cash'),(33,51,'2025-04-10','Deposit',45875.00,'Card'),(34,58,'2025-04-13','Withdrawal',47250.00,'Net Banking'),(35,5,'2025-04-16','Transfer',48625.00,'Cheque'),(36,12,'2025-04-19','Payment',50000.00,'UPI'),(37,19,'2025-04-22','Deposit',51375.00,'Cash'),(38,26,'2025-04-25','Withdrawal',52750.00,'Card'),(39,33,'2025-04-28','Transfer',54125.00,'Net Banking'),(40,40,'2025-05-01','Payment',55500.00,'Cheque'),(41,47,'2025-05-04','Deposit',56875.00,'UPI'),(42,54,'2025-05-07','Withdrawal',58250.00,'Cash'),(43,1,'2025-05-10','Transfer',59625.00,'Card'),(44,8,'2025-05-13','Payment',61000.00,'Net Banking'),(45,15,'2025-05-16','Deposit',62375.00,'Cheque'),(46,22,'2025-05-19','Withdrawal',63750.00,'UPI'),(47,29,'2025-05-22','Transfer',65125.00,'Cash'),(48,36,'2025-05-25','Payment',66500.00,'Card'),(49,43,'2025-05-28','Deposit',67875.00,'Net Banking'),(50,50,'2025-05-31','Withdrawal',69250.00,'Cheque'),(51,57,'2025-06-03','Transfer',70625.00,'UPI'),(52,4,'2025-06-06','Payment',72000.00,'Cash'),(53,11,'2025-06-09','Deposit',73375.00,'Card'),(54,18,'2025-06-12','Withdrawal',74750.00,'Net Banking'),(55,25,'2025-06-15','Transfer',76125.00,'Cheque'),(56,32,'2025-06-18','Payment',77500.00,'UPI'),(57,39,'2025-06-21','Deposit',78875.00,'Cash'),(58,46,'2025-06-24','Withdrawal',80250.00,'Card'),(59,53,'2025-06-27','Transfer',81625.00,'Net Banking'),(60,60,'2025-06-30','Payment',83000.00,'Cheque'),(61,7,'2025-07-03','Deposit',84375.00,'UPI'),(62,14,'2025-07-06','Withdrawal',85750.00,'Cash'),(63,21,'2025-07-09','Transfer',87125.00,'Card'),(64,28,'2025-07-12','Payment',88500.00,'Net Banking'),(65,35,'2025-07-15','Deposit',89875.00,'Cheque'),(66,42,'2025-07-18','Withdrawal',91250.00,'UPI'),(67,49,'2025-07-21','Transfer',92625.00,'Cash'),(68,56,'2025-07-24','Payment',94000.00,'Card'),(69,3,'2025-07-27','Deposit',95375.00,'Net Banking'),(70,10,'2025-07-30','Withdrawal',1750.00,'Cheque'),(71,17,'2025-08-02','Transfer',3125.00,'UPI'),(72,24,'2025-08-05','Payment',4500.00,'Cash'),(73,31,'2025-08-08','Deposit',5875.00,'Card'),(74,38,'2025-08-11','Withdrawal',7250.00,'Net Banking'),(75,45,'2025-08-14','Transfer',8625.00,'Cheque'),(76,52,'2025-08-17','Payment',10000.00,'UPI'),(77,59,'2025-08-20','Deposit',11375.00,'Cash'),(78,6,'2025-08-23','Withdrawal',12750.00,'Card'),(79,13,'2025-08-26','Transfer',14125.00,'Net Banking'),(80,20,'2025-08-29','Payment',15500.00,'Cheque'),(81,27,'2025-09-01','Deposit',16875.00,'UPI'),(82,34,'2025-09-04','Withdrawal',18250.00,'Cash'),(83,41,'2025-09-07','Transfer',19625.00,'Card'),(84,48,'2025-09-10','Payment',21000.00,'Net Banking'),(85,55,'2025-09-13','Deposit',22375.00,'Cheque'),(86,2,'2025-09-16','Withdrawal',23750.00,'UPI'),(87,9,'2025-09-19','Transfer',25125.00,'Cash'),(88,16,'2025-09-22','Payment',26500.00,'Card'),(89,23,'2025-09-25','Deposit',27875.00,'Net Banking'),(90,30,'2025-09-28','Withdrawal',29250.00,'Cheque'),(91,37,'2025-10-01','Transfer',30625.00,'UPI'),(92,44,'2025-10-04','Payment',32000.00,'Cash'),(93,51,'2025-10-07','Deposit',33375.00,'Card'),(94,58,'2025-10-10','Withdrawal',34750.00,'Net Banking'),(95,5,'2025-10-13','Transfer',36125.00,'Cheque'),(96,12,'2025-10-16','Payment',37500.00,'UPI'),(97,19,'2025-10-19','Deposit',38875.00,'Cash'),(98,26,'2025-10-22','Withdrawal',40250.00,'Card'),(99,33,'2025-10-25','Transfer',41625.00,'Net Banking'),(100,40,'2025-10-28','Payment',43000.00,'Cheque'),(101,47,'2025-10-31','Deposit',44375.00,'UPI'),(102,54,'2025-11-03','Withdrawal',45750.00,'Cash'),(103,1,'2025-11-06','Transfer',47125.00,'Card'),(104,8,'2025-11-09','Payment',48500.00,'Net Banking'),(105,15,'2025-11-12','Deposit',49875.00,'Cheque'),(106,22,'2025-11-15','Withdrawal',51250.00,'UPI'),(107,29,'2025-11-18','Transfer',52625.00,'Cash'),(108,36,'2025-11-21','Payment',54000.00,'Card'),(109,43,'2025-11-24','Deposit',55375.00,'Net Banking'),(110,50,'2025-11-27','Withdrawal',56750.00,'Cheque'),(111,57,'2025-11-30','Transfer',58125.00,'UPI'),(112,4,'2025-12-03','Payment',59500.00,'Cash'),(113,11,'2025-12-06','Deposit',60875.00,'Card'),(114,18,'2025-12-09','Withdrawal',62250.00,'Net Banking'),(115,25,'2025-12-12','Transfer',63625.00,'Cheque'),(116,32,'2025-12-15','Payment',65000.00,'UPI'),(117,39,'2025-12-18','Deposit',66375.00,'Cash'),(118,46,'2025-12-21','Withdrawal',67750.00,'Card'),(119,53,'2025-12-24','Transfer',69125.00,'Net Banking'),(120,60,'2025-12-27','Payment',70500.00,'Cheque'),(121,7,'2025-12-30','Deposit',71875.00,'UPI'),(122,14,'2026-01-02','Withdrawal',73250.00,'Cash'),(123,21,'2026-01-05','Transfer',74625.00,'Card'),(124,28,'2026-01-08','Payment',76000.00,'Net Banking'),(125,35,'2026-01-11','Deposit',77375.00,'Cheque'),(126,42,'2026-01-14','Withdrawal',78750.00,'UPI'),(127,49,'2026-01-17','Transfer',80125.00,'Cash'),(128,56,'2026-01-20','Payment',81500.00,'Card'),(129,3,'2026-01-23','Deposit',82875.00,'Net Banking'),(130,10,'2026-01-26','Withdrawal',84250.00,'Cheque'),(131,17,'2026-01-29','Transfer',85625.00,'UPI'),(132,24,'2026-02-01','Payment',87000.00,'Cash'),(133,31,'2026-02-04','Deposit',88375.00,'Card'),(134,38,'2026-02-07','Withdrawal',89750.00,'Net Banking'),(135,45,'2026-02-10','Transfer',91125.00,'Cheque'),(136,52,'2026-02-13','Payment',92500.00,'UPI'),(137,59,'2026-02-16','Deposit',93875.00,'Cash'),(138,6,'2026-02-19','Withdrawal',95250.00,'Card'),(139,13,'2026-02-22','Transfer',1625.00,'Net Banking'),(140,20,'2026-02-25','Payment',3000.00,'Cheque'),(141,27,'2026-02-28','Deposit',4375.00,'UPI'),(142,34,'2026-03-03','Withdrawal',5750.00,'Cash'),(143,41,'2026-03-06','Transfer',7125.00,'Card'),(144,48,'2026-03-09','Payment',8500.00,'Net Banking'),(145,55,'2026-03-12','Deposit',9875.00,'Cheque'),(146,2,'2026-03-15','Withdrawal',11250.00,'UPI'),(147,9,'2026-03-18','Transfer',12625.00,'Cash'),(148,16,'2026-03-21','Payment',14000.00,'Card'),(149,23,'2026-03-24','Deposit',15375.00,'Net Banking'),(150,30,'2026-03-27','Withdrawal',16750.00,'Cheque'),(151,37,'2026-03-30','Transfer',18125.00,'UPI'),(152,44,'2026-04-02','Payment',19500.00,'Cash'),(153,51,'2026-04-05','Deposit',20875.00,'Card'),(154,58,'2026-04-08','Withdrawal',22250.00,'Net Banking'),(155,5,'2026-04-11','Transfer',23625.00,'Cheque'),(156,12,'2026-04-14','Payment',25000.00,'UPI'),(157,19,'2026-04-17','Deposit',26375.00,'Cash'),(158,26,'2026-04-20','Withdrawal',27750.00,'Card'),(159,33,'2026-04-23','Transfer',29125.00,'Net Banking'),(160,40,'2026-04-26','Payment',30500.00,'Cheque'),(161,47,'2026-04-29','Deposit',31875.00,'UPI'),(162,54,'2026-05-02','Withdrawal',33250.00,'Cash'),(163,1,'2026-05-05','Transfer',34625.00,'Card'),(164,8,'2026-05-08','Payment',36000.00,'Net Banking'),(165,15,'2026-05-11','Deposit',37375.00,'Cheque'),(166,22,'2026-05-14','Withdrawal',38750.00,'UPI'),(167,29,'2026-05-17','Transfer',40125.00,'Cash'),(168,36,'2026-05-20','Payment',41500.00,'Card'),(169,43,'2026-05-23','Deposit',42875.00,'Net Banking'),(170,50,'2026-05-26','Withdrawal',44250.00,'Cheque'),(171,57,'2026-05-29','Transfer',45625.00,'UPI'),(172,4,'2026-06-01','Payment',47000.00,'Cash'),(173,11,'2026-06-04','Deposit',48375.00,'Card'),(174,18,'2026-06-07','Withdrawal',49750.00,'Net Banking'),(175,25,'2026-06-10','Transfer',51125.00,'Cheque'),(176,32,'2026-06-13','Payment',52500.00,'UPI'),(177,39,'2026-06-16','Deposit',53875.00,'Cash'),(178,46,'2026-06-19','Withdrawal',55250.00,'Card'),(179,53,'2026-06-22','Transfer',56625.00,'Net Banking'),(180,60,'2025-01-01','Payment',58000.00,'Cheque'),(181,7,'2025-01-04','Deposit',59375.00,'UPI'),(182,14,'2025-01-07','Withdrawal',60750.00,'Cash'),(183,21,'2025-01-10','Transfer',62125.00,'Card'),(184,28,'2025-01-13','Payment',63500.00,'Net Banking'),(185,35,'2025-01-16','Deposit',64875.00,'Cheque'),(186,42,'2025-01-19','Withdrawal',66250.00,'UPI'),(187,49,'2025-01-22','Transfer',67625.00,'Cash'),(188,56,'2025-01-25','Payment',69000.00,'Card'),(189,3,'2025-01-28','Deposit',70375.00,'Net Banking'),(190,10,'2025-01-31','Withdrawal',71750.00,'Cheque'),(191,17,'2025-02-03','Transfer',73125.00,'UPI'),(192,24,'2025-02-06','Payment',74500.00,'Cash'),(193,31,'2025-02-09','Deposit',75875.00,'Card'),(194,38,'2025-02-12','Withdrawal',77250.00,'Net Banking'),(195,45,'2025-02-15','Transfer',78625.00,'Cheque'),(196,52,'2025-02-18','Payment',80000.00,'UPI'),(197,59,'2025-02-21','Deposit',81375.00,'Cash'),(198,6,'2025-02-24','Withdrawal',82750.00,'Card'),(199,13,'2025-02-27','Transfer',84125.00,'Net Banking'),(200,20,'2025-03-02','Payment',85500.00,'Cheque');
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'bank_analytics'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-23 17:50:07
