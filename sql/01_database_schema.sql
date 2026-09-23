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

-- Dump completed on 2026-09-23 17:57:38
