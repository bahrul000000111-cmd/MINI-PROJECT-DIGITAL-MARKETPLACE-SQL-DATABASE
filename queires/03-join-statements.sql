-- ==============================================
-- DIGITAL MARKETPLACE DATABASE
-- FILE: 03-join-statements.sql
-- DESCRIPTION: Query dengan JOIN antar tabel
-- ==============================================
USE digital_marketplace;

-- ==============================================
-- 1. DAFTAR PRODUK BESERTA NAMA KATEGORINYA
-- ==============================================
SELECT 
    p.product_id AS 'ID Produk',
    p.product_name AS 'Nama Produk',
    pc.category_name AS 'Nama Kategori',
    CONCAT('Rp ', FORMAT(p.price, 0, 'id_ID')) AS 'Harga'
FROM Product p
INNER JOIN Product_Category pc ON p.category_id = pc.category_id
ORDER BY pc.category_name ASC, p.product_name ASC;

-- ==============================================
-- 2. SEMUA KATEGORI MESKIPUN BELUM MEMILIKI PRODUK
-- ==============================================
SELECT 
    pc.category_id AS 'ID Kategori',
    pc.category_name AS 'Nama Kategori',
    IFNULL(p.product_name, '- Belum ada produk -') AS 'Nama Produk'
FROM Product_Category pc
LEFT JOIN Product p ON pc.category_id = p.category_id
ORDER BY pc.category_name ASC;

-- ==============================================
-- 3. SEMUA USER MESKIPUN BELUM PERNAH MEMBELI PRODUK
-- ==============================================
SELECT 
    u.user_id AS 'ID User',
    u.full_name AS 'Nama Lengkap',
    u.role AS 'Peran User',
    IFNULL(t.transaction_id, '- Belum ada transaksi -') AS 'ID Transaksi'
FROM Users u
LEFT JOIN Transactions t ON u.user_id = t.buyer_id
ORDER BY u.role ASC, u.full_name ASC;

-- ==============================================
-- 4. DAFTAR TRANSAKSI BESERTA NAMA BUYER
-- ==============================================
SELECT 
    t.transaction_id AS 'ID Transaksi',
    u.full_name AS 'Nama Buyer',
    p.product_name AS 'Produk yang Dibeli',
    CONCAT('Rp ', FORMAT(t.total_amount, 0, 'id_ID')) AS 'Total Pembayaran',
    t.status AS 'Status Transaksi',
    DATE_FORMAT(t.transaction_date, '%d %M %Y %H:%i') AS 'Waktu Transaksi'
FROM Transactions t
INNER JOIN Users u ON t.buyer_id = u.user_id
INNER JOIN Product p ON t.product_id = p.product_id
ORDER BY t.transaction_date DESC;

-- ==============================================
-- 5. DAFTAR PRODUK BESERTA NAMA SELLER
-- ==============================================
SELECT 
    p.product_id AS 'ID Produk',
    p.product_name AS 'Nama Produk',
    u.full_name AS 'Nama Seller',
    pc.category_name AS 'Kategori Produk',
    CONCAT('Rp ', FORMAT(p.price, 0, 'id_ID')) AS 'Harga Produk'
FROM Product p
INNER JOIN Users u ON p.seller_id = u.user_id
INNER JOIN Product_Category pc ON p.category_id = pc.category_id
ORDER BY u.full_name ASC, p.product_name ASC;