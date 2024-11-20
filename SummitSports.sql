CREATE DATABASE SummitSports;

--Create tables w/i the database
--create customer tbale

CREATE TABLE Customers (
	customer_id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	phone_number VARCHAR(15) UNIQUE NOT NULL,
);
--create products table
CREATE TABLE Products (
	product_id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	category VARCHAR(50) CHECK (category IN ('Clothing', 'Shoes', 'Accessories')),
	price DECIMAL(10, 2) CHECK (price > 0),
	stock INT CHECK (stock >= 0)
);	

--create orders table
CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	order_date DATE NOT NULL,
	customer_id INT NOT NULL,
	tot_amount DECIMAL (10, 2) CHECK (tot_amount >= 0),
	FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
);
--create orderitem table
CREATE TABLE OrderItems (
	order_item_id INT PRIMARY KEY,
	order_id INT NOT NULL,
	product_id INT NOT NULL,
	quantity INT CHECK (quantity > 0),
	price DECIMAL(10, 2) CHECK (price > 0),
	FOREIGN KEY (order_id) REFERENCES orders(order_id),
	FOREIGN KEY (product_id) REFERENCES Products(product_id),
);

--create Suppliers table
CREATE TABLE Suppliers (
	supplier_id INT PRIMARY KEY,
	name VARCHAR(50) UNIQUE NOT NULL,
	contact_person VARCHAR(50) NOT NULL,
	phone_number VARCHAR(15) UNIQUE,
	email VARCHAR(50) UNIQUE
);