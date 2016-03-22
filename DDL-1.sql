 create database ganteng;

 use ganteng;

 create table mhs(
	nim varchar(10) primary key,
	nama varchar(25) not null,
	jurusan varchar(30) not null
 );

 -- show tables;
 -- drop table [namanya];
 -- alter table mhs add column (usia varchar(5) not null);
 -- alter table mhs modify usia int;
 -- alter table mhs drop column usia;

 create table matkul(
 	kd_matkul varchar(10) primary key,
 	nama_matkul varchar(20)not null
 );

 create table kontrak(
 	id_kontrak int primary key,
 	nim varchar(10) not null,
 	kd_matkul varchar(10) not null,
 	foreign key(nim) references mahasiswa(nim),
 	foreign key(kd_matkul) references matkul(kd_matkul)
 );