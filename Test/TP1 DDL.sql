/*

Tugas Praktikum 1 Basis data (DDL)
Nama				: Fadhil Farras HN
NIM 				: 1501496
Kelas	 			: KOM-2C
Tanggal pengerjaan 	: 27/02/2016

*/

/* 1.Ada sebuah perpustakaan terdapat sistem informasi, yang terdiri dari entitas berikut :
• Mahasiswa dengan atribut nim, nama, jurusan, no_hp, alamat_mhs, angkatan.
• Buku dengan atribut kd_buku, jenis buku, judul_buku, tahun_terbit.
• Peminjaman dengan atribut id_pinjam, tgl_pinjam, nim, kd_buku.
• Lemari_buku dengan atribut kd_lemari, kd_buku.
• Petugas_perpus dengan atribut kd_petugas, nama, jenis_kelamin, usia, no_hp,
alamat_ptgs. */

--buat database
create database perpustakaan;
	use perpustakaan;
	/*
	show databases;
	+--------------------+
	| Database           |
	+--------------------+
	| information_schema |
	| cdcol              |
	| ganteng            |
	| mysql              |
	| performance_schema |
	| perpustakaan       | <<< sudah ada
	| phpmyadmin         |
	| tabel_db           |
	| test               |
	| webauth            |
	+--------------------+
	*/

	--buat entitas:
	create table mahasiswa(
		nim varchar(9) primary key,
		nama varchar(32) not null,
		jurusan varchar(32) not null,
		no_hp varchar(13) not null,
		alamat_mhs varchar(64) not null,
		angkatan int not null
	);

	/*
		desc mahasiswa;
		+------------+-------------+------+-----+---------+-------+
		| Field      | Type        | Null | Key | Default | Extra |
		+------------+-------------+------+-----+---------+-------+
		| nim        | varchar(9)  | NO   | PRI | NULL    |       |
		| nama       | varchar(32) | NO   |     | NULL    |       |
		| jurusan    | varchar(32) | NO   |     | NULL    |       |
		| no_hp      | varchar(13) | NO   |     | NULL    |       |
		| alamat_mhs | varchar(50) | NO   |     | NULL    |       |
		| angkatan   | int(11)     | NO   |     | NULL    |       |
		+------------+-------------+------+-----+---------+-------+
	*/

	create table buku(
		kd_buku varchar(9) primary key,
		jenis_buku varchar(18) not null,
		judul_buku varchar(32) not null,
		tahun_terbit int not null
	);

	/*
		desc buku;
		+--------------+-------------+------+-----+---------+-------+
		| Field        | Type        | Null | Key | Default | Extra |
		+--------------+-------------+------+-----+---------+-------+
		| kd_buku      | varchar(9)  | NO   | PRI | NULL    |       |
		| jenis_buku   | varchar(18) | NO   |     | NULL    |       |
		| judul_buku   | varchar(32) | NO   |     | NULL    |       |
		| tahun_terbit | int(11)     | NO   |     | NULL    |       |
		+--------------+-------------+------+-----+---------+-------+
	*/

	create table peminjaman(
		id_pinjam varchar(9) primary key,
		tgl_pinjam date not null,
		nim varchar(9) not null,
		kd_buku varchar(9) not null,
		foreign key(nim) references mahasiswa(nim),
		foreign key(kd_buku) references buku(kd_buku)
	);

	/*
		desc peminjaman;
		+------------+------------+------+-----+---------+-------+
		| Field      | Type       | Null | Key | Default | Extra |
		+------------+------------+------+-----+---------+-------+
		| id_pinjam  | varchar(9) | NO   | PRI | NULL    |       |
		| tgl_pinjam | date       | NO   |     | NULL    |       |
		| nim        | varchar(9) | NO   | MUL | NULL    |       |
		| kd_buku    | varchar(9) | NO   | MUL | NULL    |       |
		+------------+------------+------+-----+---------+-------+
	*/

	create table lemari_buku(
		kd_lemari varchar(9) primary key,
		kd_buku varchar(9) not null,
		foreign key(kd_buku) references buku(kd_buku)
	);

	/*
		desc lemari_buku;
		+-----------+------------+------+-----+---------+-------+
		| Field     | Type       | Null | Key | Default | Extra |
		+-----------+------------+------+-----+---------+-------+
		| kd_lemari | varchar(9) | NO   | PRI | NULL    |       |
		| kd_buku   | varchar(9) | NO   | MUL | NULL    |       |
		+-----------+------------+------+-----+---------+-------+
	*/

	create table petugas_perpus(
		kd_petugas varchar(9) primary key,
		nama varchar(32) not null,
		jenis_kelamin char not null,
		usia int not null,
		no_hp varchar(13) not null,
		alamat_ptgs varchar(64) not null
	);

	/*
		desc petugas_perpus;
		+---------------+-------------+------+-----+---------+-------+
		| Field         | Type        | Null | Key | Default | Extra |
		+---------------+-------------+------+-----+---------+-------+
		| kd_petugas    | varchar(9)  | NO   | PRI | NULL    |       |
		| nama          | varchar(32) | NO   |     | NULL    |       |
		| jenis_kelamin | char(1)     | NO   |     | NULL    |       |
		| usia          | int(11)     | NO   |     | NULL    |       |
		| no_hp         | varchar(13) | NO   |     | NULL    |       |
		| alamat_ptgs   | varchar(50) | NO   |     | NULL    |       |
		+---------------+-------------+------+-----+---------+-------+
	*/



--2. Buatlah DDL untuk merubah nama kolom jenis_kelamin pada table petugas_perpus menjadi jk!

alter table petugas_perpus change jenis_kelamin jk char;


/* 3. Tambahkan kolom :
	-stok pada tabel buku
	-tgl_pengembalian pada tabel peminjaman */

alter table buku add column (stock int not null);
alter table peminjaman add column (tgl_pengembalian date not null);


/* 4. Rubahlah tipe data pada alamat mahasiswa dan alamat petugas 
menjadi tipe data text dengan jumlah karakter 50! */

alter table mahasiswa modify text(50);
alter table petugas_perpus modify text(50);


/* 5. Buatlah DDL untuk merubah nama tabel peminjaman menjadi pinjam! */

alter table peminjaman rename to pinjam;


/* 6. Hapus kolom petugas_perpus! */

drop table petugas_perpus;


/* 7. Tampilkan table dan database yang telah dibuat secara keseluruhan setelah
menjawab soal-soal sebelumnya! */