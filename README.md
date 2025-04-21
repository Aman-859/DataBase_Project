# 🚗 Car Rental Management System - SQL Project

This project is a **Car Rental Database Management System** built using **MySQL**. It includes a fully structured relational database with multiple related tables and real-world sample data, following best practices for normalization and foreign key usage.

---

## 📁 Project Contents

- `Car.sql`: SQL dump file to create the database, tables, and insert sample data.
- `Car_Rental_ER-Diagram.pdf`: Visual entity-relationship diagram representing the database design.

---

## 🧩 Tables & Relationships

1. **customer** – Stores customer info (ID, name, phone, email)
2. **cars** – Information about available cars (model, brand, price, availability)
3. **booking** – Booking details (linked to customer and car)
4. **location** – Pickup and drop-off locations (linked to booking)
5. **payment** – Payment details for each booking
6. **emp** – Employee table with self-referencing foreign key for manager-employee hierarchy

✅ **Relationships** are handled using foreign keys, for example:
- `booking.Customer_Id` → `customer.Customer_Id`
- `booking.Car_id` → `cars.Car_id`
- `location.Booking_Id` → `booking.Booking_Id`
- `payment.Booking_Id` → `booking.Booking_Id`
- `emp.manager_id` → `emp.id` (self-referencing)

---

## 📦 How to Use

1. **Import the Database in MySQL Workbench**
   - Open Workbench > Server > Data Import
   - Choose **“Import from Self-Contained File”**
   - Select `Car.sql`
   - Select target schema (or create a new one)
   - Click **Start Import**

2. **View Tables and Data**
   - You can browse and query tables to test the relationships and sample data.

---

## 📊 ER Diagram

Refer to `Car_Rental_ER-Diagram.pdf` to visually understand the table structure and relationships in the system.

---

## 📌 Use Cases

- Managing customer bookings
- Tracking car availability
- Handling payment transactions
- Monitoring pickup/drop locations
- Employee-management relationships

---

## 🧠 Skills Applied

- SQL Table Design
- Foreign Key Constraints
- Relational Database Design
- ER Modeling
- Data Normalization
- MySQL Workbench Usage

---

## 🤝 Author

**Aman**  
GitHub: [Aman-859](https://github.com/Aman-859)

---

## 📝 License

This project is open for educational use only.
