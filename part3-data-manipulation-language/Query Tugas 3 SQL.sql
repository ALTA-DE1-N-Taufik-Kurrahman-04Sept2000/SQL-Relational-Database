SELECT * from product;
-- a. Insert 3 Product Type
INSERT INTO product_type (id, nama) values
	('1','Smartphone'),
	('2','Laptop'),
	('3','Aksesoris');
	
INSERT INTO product (id, nama, stok, harga, product_type_id) values
	(1,'Iphone 15',10,20000000,1),
	(2,'Iphone 15 Pro Max',10,30000000,1);

INSERT INTO product (id, nama, stok, harga, product_type_id) values
	(3,'Laptop HP Victus',15,14000000,2),
	(4,'MacBook Air M2',5,20000000,2),
	(5,'Asus ROG Flow',10,20000000,2);

SELECT * FROM product where product_type_id=3;
INSERT INTO product (id, nama, stok, harga, product_type_id) values
	(6,'Keyboard Gamen Titan',25,300000,3),
	(7,'Apple AirPods Gen2',20,1700000,3),
	(8,'Headset Sony WH-1000',10,3800000,3);

SELECT * FROM product_description;
INSERT INTO product_description (id, description) values
	(1,'Iphone Terbaru, Memory 256 GB'),
	(2,'Iphone Terbaik, Memory 512 GB'),
	(3,'AMD Ryzen 5, RAM 16 GB'),
	(4,'M2 Chip 8Core, RAM 8 GB'),
	(5, 'Intel i9, RAM 16 GB'),
	(6, 'RGB, Ergonomic Design'),
	(7, 'High Fidelity, Noice Cancelling'),
	(8, 'Noice Cancelling, Audio SoC');
update product set product_desc_id = 1 where id = 1;
update product set product_desc_id = 2 where id = 2;
update product set product_desc_id = 3 where id = 3;
update product set product_desc_id = 4 where id = 4;
update product set product_desc_id = 5 where id = 5;
update product set product_desc_id = 6 where id = 6;
update product set product_desc_id = 7 where id = 7;
update product set product_desc_id = 8 where id = 8;

SELECT * FROM payment_method;
INSERT INTO payment_method (id, nama) values
	(1,'Cash/Tunai'),
	(2,'Debit'),
	(3,'e-Wallet');
	
SELECT * FROM pelanggan;
INSERT INTO pelanggan (id, nama, alamat, tanggal_lahir, gender, created_at, email) values
	(1,'Adam','Jakarta Pusat','2000-01-01','Laki-Laki','2023-09-15','adam@gm.com'),
	(2,'Nurul','Bekasi','2000-02-02','Perempuan','2023-09-05','nurul@gm.com'),
	(3,'Taufik','Jakarta Utara','2000-03-03','Laki-Laki','2023-09-01','taufik@gm.com'),
	(4,'Kurrahman','Malang','2000-04-04','Laki-Laki','2023-09-10','kurrahman@gm.com'),
	(5,'Amanda Nisa','Bandung','2000-05-09','Perempuan','2023-09-09','mandanisa@gm.com');
	
SELECT * FROM transaksi;
INSERT INTO transaksi (id, pelanggan_id, payment_method_id, tanggal, paid_amount) values
	(1,1,1,'2023-09-01',20000000),
	(2,1,2,'2023-09-02',5000000),
	(3,1,3,'2023-09-03',10000000),
	(4,2,1,'2023-09-02',20000000),
	(5,2,2,'2023-09-03',15000000),
	(6,2,3,'2023-09-04',25000000),
	(7,3,1,'2023-09-05',2000000),
	(8,3,2,'2023-09-06',10000000),
	(9,3,3,'2023-09-07',20000000),
	(10,4,2,'2023-09-09',50000000),
	(11,5,3,'2023-09-12',30000000);
	
SELECT * FROM transaksi_detail;
INSERT INTO transaksi_detail (id, transaksi_id, product_id, qty, harga) values
	(1,1,3,1,14000000),
	(2,1,6,1,300000),
	(3,1,8,1,3800000),
	(4,2,8,1,3800000),
	(5,2,6,1,300000),
	(6,2,3,1,3000000),
	(7,3,1,1,20000000),
	(8,3,4,1,20000000),
	(9,3,7,1,17000000),
	(10,4,2,1,30000000),
	(11,4,5,1,20000000),
	(12,4,7,1,17000000),
	(13,5,1,1,20000000),
	(14,5,2,1,30000000),
	(15,5,3,1,14000000),
	(16,6,4,1,20000000),
	(17,6,5,1,20000000),
	(18,6,6,1,300000),
	(19,7,7,1,17000000),
	(20,7,8,1,3800000),
	(21,7,1,1,20000000),
	(22,8,3,1,14000000),
	(23,8,5,1,2000000),
	(24,8,7,1,17000000),
	(25,9,2,1,30000000),
	(26,9,4,1,20000000),
	(27,9,6,1,300000),
	(28,10,8,1,3800000),
	(29,10,7,1,17000000),
	(30,10,6,1,300000),
	(31,11,5,1,20000000),
	(32,11,4,1,20000000),
	(33,11,3,1,14000000);

SELECT * FROM pelanggan WHERE gender='Laki-Laki';

SELECT * FROM product WHERE id=3;

SELECT * FROM pelanggan 
WHERE created_at=current_date - interval '7 days' AND nama like '%a%';

SELECT COUNT(*) AS Jumlah_User_Perempuan FROM pelanggan 
WHERE gender='Perempuan';

SELECT * FROM pelanggan order by nama asc;

SELECT * FROM transaksi_detail WHERE product_id=1;

SELECT transaksi.id, product_id,qty,harga,pelanggan_id,tanggal FROM transaksi
JOIN transaksi_detail on transaksi.id=transaksi_detail.transaksi_id
WHERE product_id=3;

SELECT * FROM product WHERE id=1;

SELECT * FROM product WHERE product_type_id=1;
--
UPDATE product SET nama='product dummy' WHERE id=1;
---
UPDATE transaksi_detail SET qty=3 WHERE product_id=1;
--
DELETE FROM product WHERE product_type_id=1;
--
SELECT * FROM transaksi WHERE pelanggan_id=1
UNION
SELECT * FROM transaksi WHERE pelanggan_id=2;
--
SELECT pelanggan.id,pelanggan.nama,SUM(paid_amount) AS Total_Harga 
FROM transaksi 
JOIN pelanggan ON transaksi.pelanggan_id=pelanggan.id 
WHERE pelanggan_id=1 GROUP BY pelanggan.id,nama;
--
SELECT COUNT(transaksi.id) AS Total_Transaksi FROM transaksi
JOIN transaksi_detail ON transaksi.id=transaksi_detail.transaksi_id
JOIN product on product.id=transaksi_detail.product_id
WHERE product_type_id=2;
--
SELECT * FROM product;
JOIN product_type ON product.product_type_id=product_type.id;
--
SELECT transaksi.id AS Id_Transaksi,pelanggan_id,payment_method_id,tanggal,paid_amount, 
product.nama AS Nama_Product, pelanggan.nama AS Nama_Pelanggan FROM transaksi
JOIN pelanggan ON transaksi.pelanggan_id=pelanggan.id
JOIN transaksi_detail ON transaksi.id=transaksi_detail.transaksi_id
JOIN product ON product.id=transaksi_detail.product_id;
--
SELECT * FROM product WHERE product.id NOT IN
(SELECT product_id FROM transaksi_detail);