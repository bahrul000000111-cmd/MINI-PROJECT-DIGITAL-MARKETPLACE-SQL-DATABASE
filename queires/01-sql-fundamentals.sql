-- ==============================================
-- DIGITAL MARKETPLACE DATABASE
-- FILE: 01-sql-fundamentals.sql
-- DESCRIPTION: Query dasar untuk mengambil data produk
-- ==============================================
USE digital_marketplace;

-- ==============================================
-- 1. TAMPILKAN SELURUH PRODUK
-- ==============================================
SELECT 
    product_id,
    product_name,
    category_id,
    seller_id,
    price,
    stock,
    uploaded_at
FROM Product
ORDER BY product_id;

-- ==============================================
-- 2. TAMPILKAN NAMA DAN HARGA PRODUK SAJA
-- ==============================================
SELECT 
    product_name AS 'Nama Produk',
    CONCAT('Rp ', FORMAT(price, 0, 'id_ID')) AS 'Harga Produk'
FROM Product
ORDER BY price DESC;

-- ==============================================
-- 3. PRODUK DENGAN HARGA ANTARA 50.000 - 200.000
-- ==============================================
SELECT 
    product_name AS 'Nama Produk',
    CONCAT('Rp ', FORMAT(price, 0, 'id_ID')) AS 'Harga',
    stock AS 'Stok Tersedia'
FROM Product
WHERE price BETWEEN 50000 AND 200000
ORDER BY price ASC;

-- ==============================================
-- 4. PRODUK DENGAN STOK 0 ATAU HARGA DI ATAS 500.000
-- ==============================================
SELECT 
    product_name AS 'Nama Produk',
    stock AS 'Stok',
    CONCAT('Rp ', FORMAT(price, 0, 'id_ID')) AS 'Harga'
FROM Product
WHERE stock = 0 OR price > 500000
ORDER BY price DESC;

-- ==============================================
-- 5. 5 PRODUK DENGAN HARGA TER TINGGI
-- ==============================================
SELECT 
    product_name AS 'Nama Produk',
    CONCAT('Rp ', FORMAT(price, 0, 'id_ID')) AS 'Harga Tertinggi'
FROM Product
ORDER BY price DESC
LIMIT 5;