-- ==============================================
-- DIGITAL MARKETPLACE DATABASE
-- FILE: 01-create-structure.sql
-- DESCRIPTION: Membuat database dan struktur tabel
-- ==============================================

-- 1. BUAT DATABASE
DROP DATABASE IF EXISTS digital_marketplace;
CREATE DATABASE digital_marketplace;
USE digital_marketplace;

-- 2. TABEL USERS
-- Menyimpan data pengguna (buyer, seller, admin)
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL COMMENT 'Nama lengkap pengguna',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email pengguna (untuk login)',
    password VARCHAR(255) NOT NULL COMMENT 'Password yang sudah di-hash',
    role ENUM('buyer', 'seller', 'admin') NOT NULL DEFAULT 'buyer' COMMENT 'Peran pengguna',
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Waktu pendaftaran'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3. TABEL PRODUCT_CATEGORY
-- Menyimpan kategori produk digital
CREATE TABLE Product_Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE COMMENT 'Nama kategori produk',
    description TEXT NULL COMMENT 'Deskripsi singkat tentang kategori'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4. TABEL PRODUCT
-- Menyimpan data produk yang dijual di marketplace
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    seller_id INT NOT NULL COMMENT 'ID penjual (referensi ke tabel Users)',
    category_id INT NOT NULL COMMENT 'ID kategori (referensi ke tabel Product_Category)',
    product_name VARCHAR(100) NOT NULL COMMENT 'Nama produk',
    description TEXT NULL COMMENT 'Deskripsi detail produk',
    price DECIMAL(10,2) NOT NULL COMMENT 'Harga produk (dalam Rupiah)',
    stock INT NOT NULL DEFAULT 0 COMMENT 'Jumlah stok produk',
    file_url VARCHAR(255) NOT NULL COMMENT 'Link unduhan produk digital',
    uploaded_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Waktu upload produk',
    
    -- FOREIGN KEY CONSTRAINT
    FOREIGN KEY (seller_id) 
        REFERENCES Users(user_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    
    FOREIGN KEY (category_id) 
        REFERENCES Product_Category(category_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5. TABEL TRANSACTIONS
-- Menyimpan data transaksi pembelian produk
CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT NOT NULL COMMENT 'ID pembeli (referensi ke tabel Users)',
    product_id INT NOT NULL COMMENT 'ID produk yang dibeli',
    transaction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Waktu transaksi',
    total_amount DECIMAL(10,2) NOT NULL COMMENT 'Total jumlah pembayaran',
    status ENUM('completed', 'pending', 'cancelled') NOT NULL DEFAULT 'pending' COMMENT 'Status transaksi',
    
    -- FOREIGN KEY CONSTRAINT
    FOREIGN KEY (buyer_id) 
        REFERENCES Users(user_id) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE,
    
    FOREIGN KEY (product_id) 
        REFERENCES Product(product_id) 
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- NOTIFIKASI KESESUAIAN
SELECT 'Database dan tabel berhasil dibuat!' AS STATUS;