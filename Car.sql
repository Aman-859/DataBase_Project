-- MySQL Dump for Database: gtm
-- Server version: 8.0.41

-- ========================
-- TABLE: customer
-- ========================
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Customer_Id` INT NOT NULL,
  `Name` VARCHAR(20),
  `Phone` VARCHAR(15),
  `Email` VARCHAR(40),
  PRIMARY KEY (`Customer_Id`)
);

INSERT INTO `customer` VALUES 
(1,'Amit Sharma','9876543210','amit.sharma@example.com'),
(2,'Priya Verma','9988776655','priya.verma@example.com'),
(3,'Rahul Singh','9123456789','rahul.singh@example.com'),
(4,'Sneha Iyer','9234567890','sneha.iyer@example.com'),
(5,'Vikram Mehta','9345678901','vikram.mehta@example.com');

-- ========================
-- TABLE: cars
-- ========================
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `Car_id` INT NOT NULL,
  `Model` VARCHAR(20),
  `Brand` VARCHAR(20),
  `Year` INT,
  `Price_Per_Day` INT,
  `Availability` VARCHAR(20),
  PRIMARY KEY (`Car_id`)
);

INSERT INTO `cars` VALUES 
(1,'Swift','Maruti',2021,1500,'Rented'),
(2,'i20','Hyundai',2020,1800,'Rented'),
(3,'City','Honda',2019,2500,'Rented'),
(4,'Thar','Mahindra',2022,3500,'Rented'),
(5,'Ertiga','Maruti',2021,2000,'Rented'),
(6,'Creta','Hyundai',2023,3360,'Available'),
(7,'Baleno','Maruti',2022,1700,'Available');

-- ========================
-- TABLE: booking
-- ========================
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `Booking_Id` INT NOT NULL,
  `Customer_Id` INT,
  `Car_id` INT,
  `Start_Date` DATE,
  `End_Date` DATE,
  `Total_Price` INT,
  PRIMARY KEY (`Booking_Id`),
  FOREIGN KEY (`Customer_Id`) REFERENCES `customer`(`Customer_Id`),
  FOREIGN KEY (`Car_id`) REFERENCES `cars`(`Car_id`)
);

INSERT INTO `booking` VALUES 
(1,1,2,'2024-03-01','2024-03-05',7200),
(2,2,4,'2024-03-06','2024-03-10',14000),
(3,3,1,'2024-03-02','2024-03-03',1500),
(4,4,3,'2024-03-08','2024-03-12',10000),
(5,5,5,'2024-03-09','2024-03-13',8000);

-- ========================
-- TABLE: location
-- ========================
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location` (
  `Location_Id` INT NOT NULL,
  `Booking_Id` INT,
  `Pickup_Location` VARCHAR(50),
  `Drop_Location` VARCHAR(50),
  PRIMARY KEY (`Location_Id`),
  FOREIGN KEY (`Booking_Id`) REFERENCES `booking`(`Booking_Id`)
);

INSERT INTO `location` VALUES 
(1,1,'Delhi','Jaipur'),
(2,2,'Mumbai','Pune'),
(3,3,'Bangalore','Mysore'),
(4,4,'Chennai','Hyderabad'),
(5,5,'Kolkata','Patna');

-- ========================
-- TABLE: payment
-- ========================
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `Payment_Id` INT NOT NULL,
  `Booking_Id` INT,
  `Amount` INT,
  `Payment_Date` DATE,
  `Payment_Method` VARCHAR(20),
  PRIMARY KEY (`Payment_Id`),
  FOREIGN KEY (`Booking_Id`) REFERENCES `booking`(`Booking_Id`)
);

INSERT INTO `payment` VALUES 
(1,1,7200,'2024-03-01','Credit Card'),
(2,2,14000,'2024-03-06','UPI'),
(3,3,1500,'2024-03-02','Cash'),
(4,4,10000,'2024-03-08','Debit Card'),
(5,5,8000,'2024-03-09','Net Banking');

-- ========================
-- TABLE: emp (Self-referencing)
-- ========================
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `id` INT NOT NULL,
  `name` VARCHAR(20),
  `manager` VARCHAR(20),
  `manager_id` INT,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`manager_id`) REFERENCES `emp`(`id`)
);

INSERT INTO `emp` VALUES 
(1,'aman','adhitya',1),
(2,'zaid','adhitya',1);
