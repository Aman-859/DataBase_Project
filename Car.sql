-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: gtm
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `Booking_Id` int NOT NULL,
  `Customer_Id` int DEFAULT NULL,
  `Car_id` int DEFAULT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  `Total_Price` int DEFAULT NULL,
  PRIMARY KEY (`Booking_Id`),
  KEY `Customer_Id` (`Customer_Id`),
  KEY `Car_id` (`Car_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Customer_Id`) REFERENCES `customer` (`Customer_Id`),
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Car_id`) REFERENCES `cars` (`Car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,1,2,'2024-03-01','2024-03-05',7200),(2,2,4,'2024-03-06','2024-03-10',14000),(3,3,1,'2024-03-02','2024-03-03',1500),(4,4,3,'2024-03-08','2024-03-12',10000),(5,5,5,'2024-03-09','2024-03-13',8000);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `Car_id` int NOT NULL,
  `Model` varchar(20) DEFAULT NULL,
  `Brand` varchar(20) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Price_Per_Day` int DEFAULT NULL,
  `Availability` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Swift','Maruti',2021,1500,'Rented'),(2,'i20','Hyundai',2020,1800,'Rented'),(3,'City','Honda',2019,2500,'Rented'),(4,'Thar','Mahindra',2022,3500,'Rented'),(5,'Ertiga','Maruti',2021,2000,'Rented'),(6,'Creta','Hyundai',2023,3360,'Available'),(7,'Baleno','Maruti',2022,1700,'Available');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `Customer_Id` int NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Customer_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Amit Sharma','9876543210','amit.sharma@example.com'),(2,'Priya Verma','9988776655','priya.verma@example.com'),(3,'Rahul Singh','9123456789','rahul.singh@example.com'),(4,'Sneha Iyer','9234567890','sneha.iyer@example.com'),(5,'Vikram Mehta','9345678901','vikram.mehta@example.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emp`
--

DROP TABLE IF EXISTS `emp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emp` (
  `id` int NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `manager` varchar(20) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`manager_id`) REFERENCES `emp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emp`
--

LOCK TABLES `emp` WRITE;
/*!40000 ALTER TABLE `emp` DISABLE KEYS */;
INSERT INTO `emp` VALUES (1,'aman','adhitya',1),(2,'zaid','adhitya',1);
/*!40000 ALTER TABLE `emp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `Location_Id` int NOT NULL,
  `Booking_Id` int DEFAULT NULL,
  `Pickup_Location` varchar(50) DEFAULT NULL,
  `Drop_Location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Location_Id`),
  KEY `Booking_Id` (`Booking_Id`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`Booking_Id`) REFERENCES `booking` (`Booking_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,1,'Delhi','Jaipur'),(2,2,'Mumbai','Pune'),(3,3,'Bangalore','Mysore'),(4,4,'Chennai','Hyderabad'),(5,5,'Kolkata','Patna');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `Payment_Id` int NOT NULL,
  `Booking_Id` int DEFAULT NULL,
  `Amount` int DEFAULT NULL,
  `Payment_Date` date DEFAULT NULL,
  `Payment_Method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Payment_Id`),
  KEY `Booking_Id` (`Booking_Id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Booking_Id`) REFERENCES `booking` (`Booking_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,7200,'2024-03-01','Credit Card'),(2,2,14000,'2024-03-06','UPI'),(3,3,1500,'2024-03-02','Cash'),(4,4,10000,'2024-03-08','Debit Card'),(5,5,8000,'2024-03-09','Net Banking');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 12:04:21
