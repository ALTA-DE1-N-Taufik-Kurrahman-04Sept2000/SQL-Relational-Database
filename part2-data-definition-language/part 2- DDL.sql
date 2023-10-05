-- 1. Membuat Database
create database alta_online_shop;

-- 2. Membuat Table
-- a. create table user
-- *table user diganti pelanggan karena akan error jika menggunakan user
create table pelanggan (
	id_user serial,
	nama text not null,
	alamat text,
	email text unique,
	primary key(id_user)
);

-- b. create table product, product_type, product_description, payment_method
create table product_type (
	id_type serial,
	nama_tipe text,
	primary key(id_type)
);

create table product (
	id_product serial,
	nama_produk text,
	stok int,
	harga int not null,
	SKU text unique,
	id_type int,
	primary key(id_product),
	foreign key(id_type) references product_type(id_type)
);

create table product_description (
	deskripsi text,
	id_product int,
	foreign key(id_product) references product(id_product)
);

create table payment_method (
	id_payment serial,
	payment_method text,
	primary key(id_payment)
);

-- c. create table transaction, transaction_detail
create table transaksi (
	id_transaksi serial,
	total_harga int,
	id_pelanggan int,
	id_product int,
	id_payment int,
	primary key(id_transaksi),
	foreign key(id_pelanggan) references pelanggan(id_user),
	foreign key(id_product) references product(id_product),
	foreign key(id_payment) references payment_method(id_payment)
);

create table detail_transaksi (
	id_transaksi int,
	tanggal date,
	total_barang int,
	total_harga int,
	foreign key(id_transaksi) references transaksi(id_transaksi)
);

-- 3. create table kurir
create table kurir (
	id serial,
	name text,
	created_at date,
	updated_at date,
	primary key(id)
);

-- 4. tambah kolom
alter table kurir add column ongkos_dasar int;

-- 5. rename table
ALTER TABLE kurir
RENAME TO shipping;

-- 6. hapus table
drop table shipping;