-- ==============================================
-- DIGITAL MARKETPLACE DATABASE
-- FILE: 02-insert-data.sql
-- DESCRIPTION: Mengisi data ke dalam semua tabel
-- ==============================================
USE digital_marketplace;

-- ==============================================
-- DATA TABEL USERS (15 RECORD)
-- ==============================================
INSERT INTO Users (full_name, email, password, role) VALUES
('Alya Rahmawati', 'alya.designer@example.com', '$2y$10$examplehash123', 'seller'),
('Budi Santoso', 'budi.developer@example.com', '$2y$10$examplehash123', 'seller'),
('Citra Dewi', 'citra.freelance@example.com', '$2y$10$examplehash123', 'buyer'),
('Dedi Permana', 'dedi.startup@example.com', '$2y$10$examplehash123', 'buyer'),
('Eka Wijaya', 'eka.creator@example.com', '$2y$10$examplehash123', 'seller'),
('Farah Nabila', 'farah.student@example.com', '$2y$10$examplehash123', 'buyer'),
('Gilang Pratama', 'gilang.webdev@example.com', '$2y$10$examplehash123', 'seller'),
('Hana Kusuma', 'hana.photographer@example.com', '$2y$10$examplehash123', 'buyer'),
('Irfan Maulana', 'irfan.marketer@example.com', '$2y$10$examplehash123', 'buyer'),
('Jasmine Putri', 'jasmine.uiux@example.com', '$2y$10$examplehash123', 'seller'),
('Kevin Sanjaya', 'kevin.programmer@example.com', '$2y$10$examplehash123', 'buyer'),
('Lina Marlina', 'lina.content@example.com', '$2y$10$examplehash123', 'seller'),
('Muhammad Rizky', 'rizky.entrepreneur@example.com', '$2y$10$examplehash123', 'buyer'),
('Nina Septiani', 'nina.admin@example.com', '$2y$10$examplehash123', 'admin'),
('Oscar Wijaya', 'oscar.itstaff@example.com', '$2y$10$examplehash123', 'buyer');

-- ==============================================
-- DATA TABEL PRODUCT_CATEGORY (10 RECORD)
-- ==============================================
INSERT INTO Product_Category (category_name, description) VALUES
('E-book', 'Buku digital dalam format PDF, EPUB, atau MOBI - cocok untuk pembelajaran atau bacaan umum'),
('Template Desain', 'Template siap pakai untuk poster, banner, sosial media, atau materi promosi'),
('Source Code', 'Kode program siap pakai untuk aplikasi web, mobile, atau desktop'),
('UI Kit', 'Komponen desain antarmuka pengguna untuk aplikasi atau website dengan format Figma/Adobe XD'),
('Preset Foto', 'Preset edit foto untuk Adobe Lightroom, Photoshop, atau aplikasi edit foto lainnya'),
('Audio Digital', 'Musik latar, efek suara, jingle, atau podcast siap pakai untuk konten'),
('Video Digital', 'Video tutorial, animasi, atau template video untuk keperluan bisnis atau pribadi'),
('Font Digital', 'Kumpulan font unik dan kreatif untuk desain grafis, website, atau produk cetak'),
('Plugin Aplikasi', 'Plugin tambahan untuk memperkuat fitur aplikasi atau software seperti WordPress'),
('Kursus Digital', 'Materi pembelajaran digital dalam bentuk video, modul, atau workshop online');

-- ==============================================
-- DATA TABEL PRODUCT (15 RECORD)
-- ==============================================
INSERT INTO Product (seller_id, category_id, product_name, description, price, stock, file_url) VALUES
(1, 1, 'E-book Belajar Python untuk Pemula', 'Panduan lengkap belajar Python dari dasar sampai lanjutan dengan contoh proyek', 75000.00, 50, 'https://storage.digitalmarketplace.com/ebook-python.pdf'),
(1, 3, 'Source Code Aplikasi Todo List React.js', 'Aplikasi Todo List dengan fitur tambahan seperti filter dan pencarian', 150000.00, 20, 'https://storage.digitalmarketplace.com/todo-list-react.zip'),
(2, 2, 'Template Poster Promosi Produk Modern', 'Template poster dengan desain modern dan mudah disesuaikan menggunakan Canva', 50000.00, 100, 'https://storage.digitalmarketplace.com/poster-promosi.cdr'),
(2, 4, 'UI Kit Aplikasi Mobile Flutter', 'UI Kit dengan 50+ komponen untuk aplikasi mobile berbasis Flutter', 200000.00, 30, 'https://storage.digitalmarketplace.com/flutter-uikit.fig'),
(3, 5, 'Preset Foto Alam & Landscape', '15 preset foto dengan warna hangat dan alami untuk Adobe Lightroom', 65000.00, 75, 'https://storage.digitalmarketplace.com/preset-alam.dng'),
(3, 6, 'Musik Latar Kerja & Presentasi', '10 musik latar instrumental yang menenangkan untuk video presentasi atau konten', 85000.00, 40, 'https://storage.digitalmarketplace.com/musik-latar-kerja.mp3'),
(4, 7, 'Template Video Tutorial Edukasi', 'Template video tutorial dengan transisi menarik untuk Adobe Premiere Pro', 125000.00, 25, 'https://storage.digitalmarketplace.com/video-tutorial.prproj'),
(4, 8, 'Kumpulan Font Kreatif untuk Logo', '20 font unik dengan gaya minimalis dan kreatif untuk desain logo', 45000.00, 60, 'https://storage.digitalmarketplace.com/font-kreatif.zip'),
(5, 9, 'Plugin WordPress Galeri Foto Responsif', 'Plugin galeri foto dengan tampilan menarik dan responsif untuk website WordPress', 180000.00, 15, 'https://storage.digitalmarketplace.com/wp-galeri-plugin.zip'),
(5, 10, 'Kursus Desain UI/UX untuk Pemula', 'Kursus lengkap dengan 20 modul video dan proyek akhir membuat desain aplikasi', 550000.00, 10, 'https://storage.digitalmarketplace.com/kursus-uiux.mp4'),
(6, 1, 'E-book Belajar SQL Dasar sampai Lanjutan', 'Panduan praktis belajar SQL dengan contoh kasus nyata di dunia kerja', 80000.00, 45, 'https://storage.digitalmarketplace.com/ebook-sql.pdf'),
(6, 3, 'Source Code Website Portfolio Personal', 'Website portfolio dengan desain modern dan responsif menggunakan HTML CSS JS', 95000.00, 35, 'https://storage.digitalmarketplace.com/portfolio-website.zip'),
(7, 2, 'Template Banner Instagram Bisnis', '25 template banner dengan gaya berbeda untuk promosi bisnis di Instagram', 55000.00, 80, 'https://storage.digitalmarketplace.com/ig-banner-template.psd'),
(7, 4, 'UI Kit Website Bisnis Kecil', 'UI Kit dengan 40+ komponen untuk website profil bisnis kecil atau UMKM', 225000.00, 20, 'https://storage.digitalmarketplace.com/bisnis-uikit.xd'),
(8, 5, 'Preset Foto Portrait & Potret', '20 preset foto dengan efek profesional untuk foto portrait atau potret', 70000.00, 50, 'https://storage.digitalmarketplace.com/preset-portrait.xmp');

-- ==============================================
-- DATA TABEL TRANSACTIONS (10 RECORD)
-- ==============================================
INSERT INTO Transactions (buyer_id, product_id, total_amount, status) VALUES
(3, 1, 75000.00, 'completed'),
(3, 5, 65000.00, 'completed'),
(4, 2, 150000.00, 'completed'),
(5, 4, 200000.00, 'pending'),
(6, 7, 125000.00, 'completed'),
(7, 10, 550000.00, 'cancelled'),
(8, 6, 85000.00, 'completed'),
(9, 8, 45000.00, 'completed'),
(10, 9, 180000.00, 'completed'),
(11, 11, 80000.00, 'pending');

-- NOTIFIKASI KESESUAIAN
SELECT 'Data berhasil dimasukkan ke semua tabel!' AS STATUS;