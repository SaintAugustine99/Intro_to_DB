-- task_2.sql

-- Creates the database if it doesn't exist

CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Creates the authors table

CREATE TABLE IF NOT EXISTS Authors (
    author_name INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE,
    nationality VARCHAR(50)
);

-- Creates the books table

CREATE TABLE IF NOT EXISTS Books (
    book_name INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author_id INT,
    publication_date DATE,
    isbn VARCHAR(20) UNIQUE,
    price DECIMAL(10, 2),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL
);

-- Creates the customers table

CREATE TABLE IF NOT EXISTS Customers (
    customer_name INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100)
);

-- CreateS the orders table

CREATE TABLE IF NOT EXISTS Orders (
    order_name INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Creates the order_details table

CREATE TABLE IF NOT EXISTS Order_details (
    order_detail_name INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);