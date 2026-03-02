-- ==============================================
-- DIGITAL MARKETPLACE DATABASE
-- FILE: 02-aggregate-conditional.sql
-- DESCRIPTION: Query agregat dan logika kondisional
-- ==============================================
USE digital_marketplace;

-- ==============================================
-- 1. HITUNG TOTAL USER YANG TERDAFTAR
-- ==============================================
SELECT 
    COUNT(user_id) AS 'Total User Terdaftar',
    COUNT(CASE WHEN role = 'buyer' THEN 1 END) AS 'Total Buyer',
    COUNT(CASE WHEN role = 'seller' THEN 1 END) AS 'Total Seller',
    COUNT(CASE WHEN role = 'admin' THEN 1 END) AS 'Total Admin'
FROM Users;

-- ==============================================
-- 2. HITUNG TOTAL PRODUK YANG TERSEDIA
-- ==============================================
SELECT 
    COUNT(product_id) AS 'Total Produk Tersedia',
    COUNT(CASE WHEN stock > 0 THEN 1 END) AS 'Produk yang Tersedia',
    COUNT(CASE WHEN stock = 0 THEN 1 END) AS 'Produk yang Habis'
FROM Product;

-- ==============================================
-- 3. JUMLAH PRODUK PER KATEGORI
-- ==============================================
SELECT 
    pc.category_name AS 'Nama Kategori',
    COUNT(p.product_id) AS 'Jumlah Produk',
    CASE 
        WHEN COUNT(p.product_id) >= 5 THEN 'Banyak'
        WHEN COUNT(p.product_id) >= 2 THEN 'Sedang'
        ELSE 'Sedikit'
    END AS 'Kategori Kuantitas'
FROM Product_Category pc
LEFT JOIN Product p ON pc.category_id = p.category_id
GROUP BY pc.category_name
ORDER BY COUNT(p.product_id) DESC;

-- ==============================================
-- 4. RATA-RATA HARGA PRODUK PER KATEGORI
-- ==============================================
SELECT 
    pc.category_name AS 'Nama Kategori',
    COUNT(p.product_id) AS 'Jumlah Produk',
    CONCAT('Rp ', FORMAT(AVG(p.price), 0, 'id_ID')) AS 'Rata-Rata Harga',
    CONCAT('Rp ', FORMAT(MIN(p.price), 0, 'id_ID')) AS 'Harga Terendah',
    CONCAT('Rp ', FORMAT(MAX(p.price), 0, 'id_ID')) AS 'Harga Tertinggi'
FROM Product_Category pc
LEFT JOIN Product p ON pc.category_id = p.category_id
GROUP BY pc.category_name
ORDER BY AVG(p.price) DESC;

-- ==============================================
-- 5. KATEGORI YANG MEMILIKI LEBIH DARI 3 PRODUK
-- ==============================================
SELECT 
    pc.category_name AS 'Nama Kategori',
    COUNT(p.product_id) AS 'Jumlah Produk'
FROM Product_Category pc
INNER JOIN Product p ON pc.category_id = p.category_id
GROUP BY pc.category_name
HAVING COUNT(p.product_id) > 3
ORDER BY COUNT(p.product_id) DESC;

-- Catatan: Saat ini belum ada kategori dengan lebih dari 3 produk.
-- Jika ingin mendapatkan hasil, bisa menambah data produk pada salah satu kategori.