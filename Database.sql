-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Jun 2022 pada 15.35
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aduhh`
--
CREATE DATABASE IF NOT EXISTS `aduhh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aduhh`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `akses_ruang`
--

CREATE TABLE `akses_ruang` (
  `id_akses_ruang` int(11) NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `waktu_akses` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `angkatan`
--

CREATE TABLE `angkatan` (
  `id_angkatan` int(11) NOT NULL,
  `nama_angkatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `angkatan`
--

INSERT INTO `angkatan` (`id_angkatan`, `nama_angkatan`) VALUES
(1, '2017/2018'),
(2, '2018/2019'),
(3, '2019/2020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(128) NOT NULL,
  `nidn` int(50) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rfid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`, `nidn`, `jurusan_id`, `user_id`, `rfid_id`) VALUES
(1, 'Missi Hikmatyar, S.T. M.Kom.', 431108904, 1, 2, 2),
(5, 'Gea Aristi, S.T. M.Kom', 419048903, 1, 6, 1),
(6, 'Yusuf Sumaryana, S.T. M.Kom', 407108205, 1, 7, 3),
(7, 'Randi Rizal, S.T. M.Kom', 427108704, 1, 11, 4),
(8, 'Apt, Srie Rizki', 4665267, 4, 14, 0),
(9, 'Aso Sudiarjo, M.Kom', 416018902, 1, 16, 0),
(10, 'Ruuhwan, S.T, M.Kom', 425029001, 1, 17, 0),
(11, 'Ade Maftuh, S.T. M.Kom', 427108711, 1, 18, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_matkul`
--

CREATE TABLE `dosen_matkul` (
  `id_dsn_mtkl` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen_matkul`
--

INSERT INTO `dosen_matkul` (`id_dsn_mtkl`, `dosen_id`, `matkul_id`) VALUES
(3, 5, 2),
(4, 8, 8),
(5, 7, 5),
(6, 6, 9),
(8, 1, 1),
(11, 1, 17),
(12, 5, 15),
(13, 5, 16),
(14, 5, 30),
(15, 5, 32),
(16, 5, 33),
(17, 5, 21),
(19, 1, 22),
(20, 1, 29),
(22, 6, 36),
(23, 6, 35),
(24, 5, 31),
(25, 6, 14),
(26, 7, 18),
(27, 7, 19),
(28, 7, 26),
(29, 7, 27),
(30, 9, 11),
(31, 9, 20),
(32, 9, 34),
(33, 10, 23),
(34, 11, 28),
(35, 10, 24),
(36, 10, 25);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL,
  `nama_hari` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id_hari`, `nama_hari`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kuliah`
--

CREATE TABLE `jadwal_kuliah` (
  `id_jadwal_kuliah` int(11) NOT NULL,
  `dsn_mtkl_id` int(11) NOT NULL,
  `jam_belajar_id` int(11) NOT NULL,
  `hari_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `ruangan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_belajar`
--

CREATE TABLE `jam_belajar` (
  `id_jam_belajar` int(11) NOT NULL,
  `jam_belajar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jam_belajar`
--

INSERT INTO `jam_belajar` (`id_jam_belajar`, `jam_belajar`) VALUES
(1, '08.00-08.50'),
(2, '08.50-09.30'),
(3, '09.40-10.30'),
(4, '10.30-11.20'),
(5, '11.20-12.10'),
(6, '12.10-13.00'),
(7, '13.00-13.50'),
(8, '13.50-14.40'),
(9, '14.40-15.30'),
(10, '15.30-16.20'),
(11, '16.20-17.10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(128) NOT NULL,
  `prodi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `prodi_id`) VALUES
(1, 'Teknik Informatika', 1),
(2, 'Teknik Sipil', 1),
(3, 'Manajemen', 2),
(4, 'Farmasi', 3),
(6, 'Bahasa Inggris', 4),
(7, 'Akuntansi', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(128) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `angkatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`, `angkatan_id`) VALUES
(1, 'TI-A17', 1, 1),
(2, 'TI-B17', 1, 1),
(3, 'TI-C17', 1, 1),
(5, 'MNJ-A17', 3, 1),
(6, 'MNJ-B17', 3, 1),
(8, 'MNJ-C17', 3, 1),
(9, 'FA-A17', 4, 1),
(10, 'FA-B17', 4, 1),
(12, 'TI-A18', 1, 2),
(13, 'TI-B18', 1, 2),
(14, 'TI-C18', 1, 2),
(15, 'TI-A19', 1, 3),
(16, 'TI-B19', 1, 3),
(17, 'TI-C19', 1, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama_mahasiswa` varchar(128) NOT NULL,
  `nim` int(50) NOT NULL,
  `angkatan_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `tanggal_lahir` varchar(128) NOT NULL,
  `tempat_tinggal` varchar(128) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama_mahasiswa`, `nim`, `angkatan_id`, `jurusan_id`, `kelas_id`, `tanggal_lahir`, `tempat_tinggal`, `no_hp`, `user_id`) VALUES
(1, 'Ega Nugraha', 1703010040, 1, 1, 1, '16 Agustus 1999', 'Pagerageung, Tasikmalaya', '08975568102', 3),
(3, 'Trisna Wahana', 1703010004, 1, 1, 1, '09 Mei 1999', 'Sukaraja, Tasikmalaya', '082251627189', 10),
(4, 'Radenda Dewabrata', 1703010044, 1, 1, 1, '20 Mei 1998', 'Ciawi, Tasikmalaya', '0872838278', 12),
(5, 'Risma Shafitri', 1703010090, 1, 3, 6, '20 Mei 1998', 'Jamanis, Tasikmalaya', '08281726352', 13),
(6, 'Aulia Nur Halimah', 1703010310, 1, 3, 8, '08 Agustus 1998', 'Cipacing, Tasikmalaya', '08287165267', 15),
(7, 'Iqbal Rapido', 1703010020, 1, 1, 1, '20 Mei 2020', 'Singaparna, Tasikmalaya', '08225162718', 19),
(8, 'Muhammad Faiz', 1703010002, 1, 1, 1, '09 Mei 1999', 'Sukaraja, Tasikmalaya', '082251627181', 20),
(9, 'Irfan Fauzi', 1703010021, 1, 1, 1, '12 Agustus 1999', 'Singaparna, Tasikmalaya', '082251627182', 21),
(10, 'Muhammad Gungun', 1703010009, 1, 1, 1, '09  Maret 1999', 'Sindangkasih, Tasikmalaya', '08975568111', 22),
(11, 'Panji Diyan', 1703010024, 1, 1, 1, '01 Februari 1999', 'Cipacing, Tasikmalaya', '08232718922', 23),
(12, 'Abdul Azis', 1703010033, 1, 1, 1, '08 Agustus 1998', 'Singaparna, Tasikmalaya', '082251627221', 24),
(13, 'Agung Nugraha', 1703010001, 1, 1, 1, '09 Januari 1998', 'Tasikmalaya', '081323748592', 25),
(14, 'Moch Raditya', 1703010028, 1, 1, 1, '17 September 1998', 'Tasikmalaya', '08766452678', 26),
(15, 'Arki Rahman', 1703010027, 1, 1, 1, '08 Agustus 1998', 'Rajapolah, Tasikmalaya', '085221836722', 27),
(16, 'Asep Nopiana', 1703010003, 1, 1, 1, '20 Mei 2020', 'Tasikmalaya', '08287165261', 28),
(17, 'Wildan Fadilah', 1703010011, 1, 1, 1, '12 Agustus 1999', 'Jamanis, Tasikmalaya', '08225162711', 29),
(18, 'Muhammad Farid', 1703010029, 1, 1, 1, '07 Desember 1999', 'Tasikmalaya', '08212212311', 30),
(19, 'Rizky Maulana Hidayat', 1703010038, 1, 1, 1, '19 November 1998', 'Tasikmalaya', '08234211232', 31),
(20, 'Reza Mahendra', 1703010026, 1, 1, 1, '06 April 1999', 'Tasikmalaya', '081323748522', 32),
(21, 'Naufal Ali', 1703010022, 1, 1, 1, '22 April 1999', 'Singaparna, Tasikmalaya', '0829382716', 33),
(22, 'Abdul Rizal Sidiq', 1703010042, 1, 1, 1, '20 Februari 1998', 'Sindangkasih, Tasikmalaya', '08324152871', 34),
(23, 'Julia Refoliani', 1703010012, 1, 1, 1, '07 Februari 1999', 'Tasikmalaya', '08132864627', 35),
(24, 'Rosna Miftahul', 1703010013, 1, 1, 1, '28 Mei 1999', 'Tasikmalaya', '08225162721', 36),
(25, 'Garnis Tri Lasmi', 1703010014, 1, 1, 1, '17 Juni 1999', 'Tasikmalaya', '082122123112', 37),
(26, 'Elsa Septira', 1703010015, 1, 1, 1, '18 September 1999', 'Tasikmalaya', '082817263511', 38),
(27, 'Bella Pertiwi', 1703010016, 1, 1, 1, '12 September 1998', 'Tasikmalaya', '081323748593', 39),
(28, 'Rizal Farid', 1703010099, 1, 1, 1, '18 April 1999', 'Tasikmalaya', '0892826715', 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(128) NOT NULL,
  `jumlah_sks` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_matkul`, `nama_matkul`, `jumlah_sks`, `jurusan_id`, `semester_id`, `jenis`) VALUES
(1, 'Metodologi Penelitian', 3, 1, 6, 'Teori'),
(2, 'Tata Kelola Audit', 3, 1, 7, 'Teori'),
(3, 'Pasar Modal', 2, 3, 6, 'Teori'),
(5, 'Sistem Terdistribusi', 2, 1, 5, 'Teori'),
(6, 'Struktur Bangunan', 3, 2, 7, 'Teori'),
(8, 'Belah Tikus', 3, 4, 6, 'Praktikum'),
(9, 'Multimedia', 3, 1, 6, 'Teori'),
(10, 'Manajemen Jaringan Komputer', 3, 1, 7, 'Teori'),
(11, 'Sistem Pendukung Keputusan', 3, 1, 6, 'Teori'),
(12, 'Ekonomi Syariah', 3, 3, 7, 'Teori'),
(13, 'Obat Terlarang', 2, 4, 5, 'Teori'),
(14, 'Kewirausahaan', 2, 1, 6, 'Teori'),
(15, 'Rekayasa Sistem', 3, 1, 6, 'Teori'),
(16, 'Komunikasi Antar Personal', 2, 1, 6, 'Teori'),
(17, 'Interaksi Manusia dan Komputer', 3, 1, 6, 'Teori'),
(18, 'Layanan Web', 3, 1, 6, 'Teori'),
(19, 'Data Mining', 3, 1, 6, 'Teori'),
(20, 'Metode Numerik', 3, 1, 4, 'Teori'),
(21, 'Teori Bahasa dan Otomata', 3, 1, 4, 'Teori'),
(22, 'Riset Operasi', 3, 1, 4, 'Teori'),
(23, 'Sistem Informasi', 3, 1, 4, 'Teori'),
(24, 'Sistem Operasi', 3, 1, 4, 'Teori'),
(25, 'Praktikum Sistem Operasi', 1, 1, 4, 'Praktikum'),
(26, 'Jaringan Komputer', 3, 1, 4, 'Teori'),
(27, 'Praktikum Jaringan Komputer', 1, 1, 4, 'Praktikum'),
(28, 'Kalkulus II', 3, 1, 2, 'Teori'),
(29, 'Logika Informatika', 3, 1, 2, 'Teori'),
(30, 'Basis Data', 3, 1, 2, 'Teori'),
(31, 'Praktikum Basis Data', 1, 1, 2, 'Praktikum'),
(32, 'Algoritma dan Struktur Data', 3, 1, 2, 'Teori'),
(33, 'Praktikum Algorithma & Struktur Data', 1, 1, 2, 'Praktikum'),
(34, 'Pendidikan Pancasila dan Kewarganegaraan', 2, 1, 2, 'Teori'),
(35, 'Bahasa Inggris', 2, 1, 2, 'Teori'),
(36, 'Seni Budaya dan Kearifan Lokal', 2, 1, 2, 'Teori');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `url`, `icon`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-fw fa-tachometer-alt'),
(2, 'Menu', 'menu', 'fas fa-fw fa-folder-minus'),
(6, 'User Akses', 'user_access', 'fas fa-fw fa-wheelchair'),
(8, 'Data Dosen', 'daftar_dosen', 'fas fa-fw fa-user-secret'),
(9, 'Data Mahasiswa', 'data_mahasiswa', 'fas fa-fw fa-user-graduate'),
(10, 'Manajemen Data', 'manajemen_data', 'fas fa-fw fa-box'),
(11, 'Manajemen Mata Kuliah', 'manajemen_matkul', 'fas fa-fw fa-pencil-ruler'),
(13, 'Manajemen Jadwal', 'manajemen_jadwal', 'fas fa-fw fa-calendar-check');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`) VALUES
(1, 'Teknik'),
(2, 'Ekonomi'),
(3, 'Kesehatan'),
(4, 'Bahasa'),
(6, 'Pendidikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rfid`
--

CREATE TABLE `rfid` (
  `id_rfid` int(11) NOT NULL,
  `uid_rfid` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rfid`
--

INSERT INTO `rfid` (`id_rfid`, `uid_rfid`) VALUES
(1, '79:e4:67:40:ba'),
(2, '1a:51:42:6b:62'),
(3, '2c:ca:c0:17:31'),
(4, 'aa:91:a4:1a:85');

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Admin'),
(2, 'Dosen'),
(3, 'Mahasiswa'),
(4, 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama_ruangan` varchar(128) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama_ruangan`, `kapasitas`, `jenis`) VALUES
(1, 'A1 Gedung Solihin', 40, 'Teori'),
(2, 'A2 Gedung Solihin', 40, 'Teori'),
(4, 'A3 Gedung Solihin', 40, 'Teori'),
(5, 'A4 Gedung Solihin', 40, 'Teori'),
(6, 'A5 Gedung Solihin', 40, 'Teori'),
(7, 'B1 Gedung Solihin', 40, 'Teori'),
(8, 'L01 Point 1', 30, 'Lab');

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `nama_semester` int(2) NOT NULL,
  `angkatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`id_semester`, `nama_semester`, `angkatan_id`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 2),
(4, 4, 2),
(5, 5, 1),
(6, 6, 1),
(7, 7, 0),
(8, 8, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester_aktif`
--

CREATE TABLE `semester_aktif` (
  `id_semester_aktif` int(11) NOT NULL,
  `nama_semester` varchar(128) NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `semester_aktif`
--

INSERT INTO `semester_aktif` (`id_semester_aktif`, `nama_semester`, `is_active`) VALUES
(0, 'Genap', 1),
(1, 'Ganjil', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sks_waktu`
--

CREATE TABLE `sks_waktu` (
  `id_waktu` int(11) NOT NULL,
  `waktu_sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sks_waktu`
--

INSERT INTO `sks_waktu` (`id_waktu`, `waktu_sks`) VALUES
(1, 50);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tes_jadwal`
--

CREATE TABLE `tes_jadwal` (
  `id_tes` int(11) NOT NULL,
  `a` int(11) NOT NULL,
  `b` int(11) NOT NULL,
  `c` int(11) NOT NULL,
  `d` int(11) NOT NULL,
  `e` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `role_id`) VALUES
(1, 'admin@xuniversity.ac.id', '$2y$10$Jfq0fEv7TVOjudC8MVbLOuuOKM4tTF/C77ZpVC.IFe7jFJUrN4gFa', 1),
(2, 'missihikmatyar@gmail.com', '$2y$10$Jfq0fEv7TVOjudC8MVbLOuuOKM4tTF/C77ZpVC.IFe7jFJUrN4gFa', 2),
(3, 'nugrahaega261@gmail.com', '$2y$10$/Lg/xPpF2AzEkHYGuHhIMeXyS7oEqi3.antMaGEuHMg/Q4ByAXrn2', 3),
(6, 'geaaristi@gmail.com', '$2y$10$et1.vFlPyVGq1Ke1/rSCl.v60okyTQEj7VOoUujUZtlQxj6IBaHHe', 2),
(7, 'yusufsumaryana@gmail.com', '$2y$10$Y/63iFg3rvkIAUjy3qtrQu7bfoF7RspHnSzFTByyfeLSQ6hi9zcnW', 2),
(10, 'trisnawahanaid@gmail.com', '$2y$10$TrPkmmLV23XqdMZzI3FD1eF6.zSOV0S1stt.29onffxQ8bD2FxQg2', 3),
(11, 'randirizal@gmail.com', '$2y$10$7lDg4M8eYr/kuXprYykM5.7wxBa6INOyDu8WEumu.kI6BmHjwzVVm', 2),
(12, 'dewangga@unper.ac.id', '$2y$10$InicB6/mPe9LbD/rhuq0u.Yvi2egIdV9pdORlX3Jb7jwH55V5rhre', 3),
(13, 'rismashafitri@gmail.com', '$2y$10$WR96PG8RMUWfx9ysC1b6Ne1DKMBWcre2/JARg47BnS/phEnOy6CQO', 3),
(14, 'srierizki@gmail.com', '$2y$10$PcHhIGwSy4ZXJK9o4/WfBu3qZUkdYzfqvQJh.2/LQJAbQoo2YeEjS', 2),
(15, 'aulianurhalimah@gmail.com', '$2y$10$.tez9gqW8AwAVNfNIWTlkerWG2TwIZqzSWKXJQ3NHtqKVJ3cCkmVm', 3),
(16, 'asosudiarjo@gmail.com', '$2y$10$2GCVlIoYI1qtF7BfKODuyefWF.DVhaOrnj0N2xlarZWxP8M5z4nta', 2),
(17, 'Ruhwan@gmail.com', '$2y$10$SfNyIP/jsOpnFaYKwFekJe816Y6Xj9mmORiK6rBFFE4IB9k8jQsU.', 2),
(18, 'ademaftuh@gmail.com', '$2y$10$gt5nqhabRbLamySJAEl.W.7hxqrq9AB6nzYjRnZxYEMwOqTN0tFv2', 2),
(19, 'iqbalrapido@gmail.com', '$2y$10$lOA0mXAY2kYdKYrWtBkhHOQil5JS1EJlVo8qEP9dOOyUELK4E/iUa', 3),
(20, 'muhammadfaiz@gmail.com', '$2y$10$gtFDPIjYQaUVNx3cphXqWubgaHi.hGaT12WeNIYrwQdhBTpPj70OG', 3),
(21, 'Irfan@gmail.com', '$2y$10$SPGxivnF39OJi9ZZe7rZ6ehu8ARidq.p5U6Xar74qzRCpdHckDZ7S', 3),
(22, 'Gungun@gmail.com', '$2y$10$RLs88pygMZT9Qehe2l19/OQa9Wehh1DanePF6UxAoSEmvhb5D0cPi', 3),
(23, 'Panji@gmail.com', '$2y$10$xDi3QmefTQiDZVOTea0NW.D0L75Kj.KFNXMBfCSbKtzGwaKxEhl/G', 3),
(24, 'Azis@gmail.com', '$2y$10$PipPy114vxGQ9EdMeGXSru1wzuda103Wf4rJ1AtsZ7KCGJ2OR3qfq', 3),
(25, 'Agung@gmail.com', '$2y$10$P4C/G0tTStChz1IcCkXgj.3QmP6N3wnw/ryvgyGgfijY5EyTvbrhS', 3),
(26, 'Radit@gmail.com', '$2y$10$U0enmHwIFLFw8gc5ZgznNOK0ekHYEEUTlbEfhhSJqhYwZN8Cuh.6q', 3),
(27, 'arki@gmail.com', '$2y$10$qoyXqte7XzZb/HYCMuHG7OtZpUlLtB5SWrbyV7yfHU.ITqW7XH1U6', 3),
(28, 'Asep@gmail.com', '$2y$10$uXiNnnTfkMX8ykHOzmauZuSwikezywGMtz/3ADl6JMcImPFyYZqle', 3),
(29, 'wildan@gmail.com', '$2y$10$XEWDlE/nEzwIcXvvqIov2OhPaacmdyvMOJli3YZ1LfL6hvbc5hU82', 3),
(30, 'farid@gmail.com', '$2y$10$0AhpBp//rLRN/iT091A7xufCsqpM1fGVoA9omlWfp.GgHpDG4jRW2', 3),
(31, 'rizky@gmail.com', '$2y$10$QsroF8vPQ7Q8s/0Qj0HUyOUFYiloOQV1n0HM.bdbjCagE7nv5ye/2', 3),
(32, 'reza@gmail.com', '$2y$10$EA1XmO.3InyY.K2FN6NY2uAj7RoohHoec10opC1MtgRZt1PmRvuly', 3),
(33, 'naufal@gmail.com', '$2y$10$pTtqt0k15yn7qbQ5pE7K6ulXLLIOx0vZ.ZTF9M8zF8p1sLtgFZxzq', 3),
(34, 'abdul@gmail.com', '$2y$10$iiN8E7e2ZVN8dEvtLAbX7exIGDeQtcXXjf3ifHe6NM6V1NkLsJcsa', 3),
(35, 'julia@gmail.com', '$2y$10$6LgyOlTbwQG5Jdc5eg.RauN.OQ1UchdpYNbiBICfFCkwpmfSwSFFS', 3),
(36, 'Rosna@gmail.com', '$2y$10$lSYXWPdXaM471nP2IfUJH.zkEefWeYeCKMLraqdGsiHClAeFu/p6e', 3),
(37, 'garnis@gmail.com', '$2y$10$0rkGEvmHYlTfJBcaDoJvU.N8qMj.bf4ebZoBZs/XgRtqA.m.xozmi', 3),
(38, 'elsa@gmail.com', '$2y$10$DOneYqEETu49VvPNgCDwze4gYJyiaACpCUwrMrAPVz6xSgWQ57NDW', 3),
(39, 'bella@gmail.com', '$2y$10$et1ED0jGDAnuSgCr01dBBOxKTsxJ8ipHdOViqIIiOgNyqu4yNvDeu', 3),
(40, 'rizal@gmail.com', '$2y$10$RrsOQ2QiQxQ64dgRjVhGY.VzznZOF.PgApusgbg/C08gh.IAMO8vy', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id_user_access` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id_user_access`, `menu_id`, `role_id`) VALUES
(5, 1, 3),
(10, 1, 4),
(11, 6, 1),
(13, 2, 1),
(17, 8, 1),
(18, 9, 1),
(19, 10, 1),
(20, 1, 1),
(22, 11, 1),
(23, 1, 2),
(24, 12, 1),
(25, 13, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `akses_ruang`
--
ALTER TABLE `akses_ruang`
  ADD PRIMARY KEY (`id_akses_ruang`);

--
-- Indeks untuk tabel `angkatan`
--
ALTER TABLE `angkatan`
  ADD PRIMARY KEY (`id_angkatan`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indeks untuk tabel `dosen_matkul`
--
ALTER TABLE `dosen_matkul`
  ADD PRIMARY KEY (`id_dsn_mtkl`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indeks untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  ADD PRIMARY KEY (`id_jadwal_kuliah`);

--
-- Indeks untuk tabel `jam_belajar`
--
ALTER TABLE `jam_belajar`
  ADD PRIMARY KEY (`id_jam_belajar`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indeks untuk tabel `rfid`
--
ALTER TABLE `rfid`
  ADD PRIMARY KEY (`id_rfid`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indeks untuk tabel `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `semester_aktif`
--
ALTER TABLE `semester_aktif`
  ADD PRIMARY KEY (`id_semester_aktif`);

--
-- Indeks untuk tabel `sks_waktu`
--
ALTER TABLE `sks_waktu`
  ADD PRIMARY KEY (`id_waktu`);

--
-- Indeks untuk tabel `tes_jadwal`
--
ALTER TABLE `tes_jadwal`
  ADD PRIMARY KEY (`id_tes`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id_user_access`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `akses_ruang`
--
ALTER TABLE `akses_ruang`
  MODIFY `id_akses_ruang` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `angkatan`
--
ALTER TABLE `angkatan`
  MODIFY `id_angkatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `dosen_matkul`
--
ALTER TABLE `dosen_matkul`
  MODIFY `id_dsn_mtkl` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  MODIFY `id_jadwal_kuliah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jam_belajar`
--
ALTER TABLE `jam_belajar`
  MODIFY `id_jam_belajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `rfid`
--
ALTER TABLE `rfid`
  MODIFY `id_rfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `sks_waktu`
--
ALTER TABLE `sks_waktu`
  MODIFY `id_waktu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tes_jadwal`
--
ALTER TABLE `tes_jadwal`
  MODIFY `id_tes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id_user_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- Database: `apotek`
--
CREATE DATABASE IF NOT EXISTS `apotek` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apotek`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(1000) NOT NULL,
  `isiberita` longtext NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tanggal` varchar(213) NOT NULL,
  `penulis` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isiberita`, `gambar`, `tanggal`, `penulis`) VALUES
(4, 'Mengapa Merokok Membahayakan Kesehatan?', '<p>Efek rokok pada tubuh Menurut data American Cancer Society, perokok memiliki harapan hidup 10 tahun lebih rendah daripada mereka yang tidak merokok. Bahkan, Pusat Pencegahan dan Pengendalian Penyakit AS (CDC) mengklaim merokok adalah penyebab kematian terbanyak daripada peristiwa berikut: kecelakaan kenderaan bermotor penggunaanalkohol dannarkoba insiden terkait senjata api. Bahaya merokok dinilai sangat besar karena kandungan karbon monoksidan dan tar di dalamnya. Pasalnya, karbon monoksida bisa menggantikan oksigen dalam darah sehingga organ tubuh tidak bisa berfungsi dengan benar. Selain itu, tar dalam rokok juga bisa melapisi paru-paru sehingga mempengaruhi pernapasan. Secara rinci, berikut efek rokok pada setiap bagian tubuh:</p>\r\n\r\n<p>1. Otak Merokok dapat meningkatkan risiko stroke sebanyak dua hingga empat kal lipat.<br />\r\n2. Jantung Bahan kimia dalam asap tembakau juga bisa meningkatkan risko masalah jantung dan penyakit kardiovaskular. Merokok menyebabkan aterosklerosis, yaitu penumpukan plak di darah dan menempel di dinding arteri. Ha ini akan membuat arteri jantung menyempit sehingga aliran darah berkurang dan risiko pembekuan darah semakin tinggi. Selain itu karbon monoksida dan nikotin dalam rokok membuat jantung bekerja lebih keras dan lebih cepat sehingga memicu berbagai masalah kardiovaskular.</p>\r\n\r\n<p>3. Tulang Menurut National Institutes of Health (NIH), merokok mengurangi kepadatan tulang, membuat tulang lebih lemah dan lebih rapuh. Merokok juga dapat mengganggu penyembuhan tulang setelah patah tulang. Para peneliti belum menekukan penyebab pasti efek langsung merokok dengan kesehatan tulang. Namun, ahli kesehatan menyakini ha ini karena adanya faktor risiko lain yang lazim pada orang yang merokok seperti penurunan berat badan dan aktivitas fisik yang rendah.<br />\r\n<br />\r\n5. Paru-Paru Merokok dapat merusak saluran udara dan kantung udara - yang dikenal sebagai alveoli - di paru-paru. Hal ini bisa memicu berbagai masasalah kesehatan seperti berikut: penyakit paru obstruktif kronik yang menyebabkan sesak napas dan sesak dada. bronkitis kronis yang terjadi ketika saluran udara menghasilkan terlalu banyak lendir sehingga menyebabkan batukdan radang di saluran udara. Merokok juga bisa memicu berbagai masalah pada paru-paru seperti pneumonia, asma, dan TBC.<br />\r\n<br />\r\n6. Mulut Merokok dapat memiliki beberapa efek pada kesehatan mulut dan memicu berbagai masalah berikut: halitosis atau bau mulut noda pada gigi mulut kering indra perasa berkurang iritasi pada jaringan gusi.<br />\r\n<br />\r\n7. Organ reproduksi Merokok juga dapat memengaruhi sistem reproduksi dan kesuburan. Wanita yang merokok bisa lebih sulit hamil. Pada pria, merokok juga dapat menyebabkan impotensi dengan merusak pembuluh darah di area penis. Kondisi ini juga dapat merusak sperma dan mempengaruhi jumlah sperma. Menurut beberapa penelitian, pria yang merokok memiliki jumlah sperma yang lebih rendah daripada mereka yang tidak. Selain itu, merokok saat hamil meningkatkan sejumlah risiko bagi bayi seperti: lahir prematur keguguran berat badan lahir rendah sindrom kematian bayi mendadak.<br />\r\n<br />\r\n8. Kulit Merokok mengurangi jumlah oksigen yang mencapai kulit. Hal ini bisa mempercepat proses penuaan dan membuat kulit tampak kusam. Merokok juga bisa menyebabkan berbagai masalah berikut: kerutan wajah, terutama di sekitar bibir warna kulit yang tidak merata, seperti warna kuning atau abu-abu kulit kering dan kasar. &nbsp;<br />\r\n<br />\r\n&nbsp;</p>\r\n', 'berita1.jpg', '22:23:57 13-07-2020', 'Radenda'),
(5, 'RS Mata SMEC Hadirkan Layanan Konsultasi Virtual dengan Harga Terjangkau', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Pusat pelayanan kesehatan mata, Rumah Sakit (RS) Mata Sabang Merauke Eye Center (SMEC) kini telah menyediakan layanan terbaru yang diberi nama SMEC Virtual Care. SMEC Virtual Care adalah layanan untuk memberikan konsultasi kesehatan mata melalui medium digital atau secara daring. Pada bidang kesehatan mata, istilah digitalisasi ini populer disebut tele-medicine atau tele-oftalmologi. Masyarakat yang mempunyai keluhan kesehatan mata ringan, kini tak perlu lagi datang ke rumah sakit atau klinik. Lewat SMEC Virtual Care tele-oftalmologi, konsultasi dapat dilakukan secara daring dari manapun melalui situs www.rsmatasmec.com/virtualcare dengan biaya sebesar Rp 25.000. CEO SMEC Group Dr. Imsyah Satari, Sp.M, mengatakan SMEC Virtual Care adalah suatu layanan berbasis virtual, dimana tujuannya untuk mengefektifkan pengeluaran dana pasien terhadap pemeriksaan kesehatan mata. &ldquo;Dalam proses konsultasi masalah mata, pemeriksaan yang tepat dan efektif memang seharusnya dilakukan secara tatap muka dengan menggunakan alat khusus di rumah sakit atau klinik mata,&rdquo; ungkapnya. Dr. Imsyah menambahkan, SMEC Virtual Care mencoba menyederhanakan proses pemeriksaan mata secara jarak jauh dengan bantuan teknologi telekomunikasi, terutama untuk pasien yang tidak dapat pergi ke rumah sakit atau klinik mata. SMEC Virtual Care sangat menjunjung tinggi keamanan dan kerahasiaan data pasien sesuai dengan etika kedokteran. Layanan ini telah terintegrasi dengan data rekam medis pasien RS Mata SMEC. Dengan data yang ada, dokter RS Mata SMEC dapat memberikan arahan yang lebih mendalam dan menyeluruh berdasarkan riwayat medis pasien. &ldquo;Saat ini sudah lumrah bahkan sifatnya wajib untuk rumah sakit dan klinik mata beradaptasi terhadap perubahan zaman. Utamanya dalam masa sulit seperti wabah virus corona baru ini yang mengharuskan masyarakat untuk tetap di rumah,&rdquo; terang Dr. Imsyah. Dr. Imsyah menambahkan, pasien yang keluhan matanya tidak terjawab dan butuh tahap lain setelah menggunakan SMEC Virtual Care tidak perlu khawatir RS Mata SMEC akan merujuknya ke layanan lanjutan kami yang tersedia di seluruh cabang rumah sakit dan klinik SMEC. Teknologi informasi dipercaya akan mengubah etos pelayanan kesehatan secara menyeluruh di masa depan. SMEC Virtual Care diproyeksikan menjadi lini pelayanan baru dari RS Mata SMEC. Layanan itu diharapkan dapat menjadi solusi praktis dan terjangkau untuk menjawab kebutuhan kesehatan mata, terutama di masa pandemi Covid-19 seperti sekarang ini. RS Mata SMEC menyediakan layanan yang bisa diakses dirumah saja, dimana saja, kapan saja melalui cek mata SMEC Virtual Care. Hal itu merupakan bentuk kepedulian RS Mata SMEC terhadap kebijakan pemerintah. Semua upaya yang dilakukan RS Mata SMEC tak lain bertujuan untuk memutus mata rantai penyebaran Covid-19.</span></span><br />\r\n<br />\r\n&nbsp;</p>\r\n', '13.jpg', '01:42:24 15-07-2020', 'Radenda'),
(6, 'Kabur Dari Klinik, Pasien Yang 4 Kali Hasil Swab Positif Corona Tolak Dibawa Petugas', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:16px\">Seorang pasien positif Covid-19 asal Kecamatan Kunduran, Kabupaten Blora, Jawa Tengah yang kabur dari Klinik Bhakti Padma, Blora ternyata bersembunyi&nbsp;di rumah orang tuanya.&nbsp; Meski sudah diketahui keberadaannya, namun keluarga&nbsp;pasien laki-laki berusia 18 tahun itu menolak untuk dibawa petugas ke Klinik Bhakti Padma guna menjalani perawatan kembali. Plt Kepala Dinkes Blora, Lilik Hernanto, menyampaikan, orangtua dari santri Klaster Temboro, Magetan, Jatim tersebut memilih untuk merawat anaknya sendiri dengan cara isolasi mandiri di rumah. Dinkes Blora dan&nbsp;pemerintah desa setempat sudah berupaya memberi pemahaman kepada keluarga pasien tersebut, namun mereka tetap bersikeras tak mau anaknya dirawat di klinik kesehatan. &quot;Kemarin ditemukan di rumah orangtuanya. Hanya saja meski sudah dikasih pengertian, keluarganya tetap menolak dan tak mau anaknya dirawat. Edukasi dan upaya persuasif tetap ditolak. Sehingga kami sarankan untuk menjalani isolasi mandiri,&quot;&nbsp;kata Lilik saat dihubungi Kompas.com melalui ponsel, Sabtu (6/6/2020). Baca juga: Santri Klaster Temboro Positif Corona Kabur dari Klinik, Diduga Kangen Keluarga Dijelaskan Lilik, pasien yang melarikan diri dari Klinik Bakti Padma pada Kamis (4/6/2020) pagi itu, sudah menjalani&nbsp;pemeriksaan&nbsp;swab Polymerase Chain Reaction (PCR)&nbsp;sebanyak empat kali. Namun, kata dia, hasil swab tetap saja terkonfirmasi positif Covid-19. Karena pihak keluarga pasien positif Covid-19 memilih untuk isolasi mandiri, dalam perkembangannya akan diawasi oleh bidan desa serta Satgas covid-19 sesuai&nbsp;protokol kesehatan yang ketat. &quot;Hasil swab positif hingga empat kali. Untuk isolasi mandiri, semua anggota keluarga yang tinggal bersama pasien tidak boleh keluar rumah. Kemudian, ada protokol kesehatan yang harus dilaksanakan bersama. Ada juga yang sembuh kok. Ini risiko yang mereka pilih,&quot; kata Lilik. Dengan kaburnya pasien positif Covid-19 tersebut, Dinkes Blora sudah melakukan tracing hingga menggelar rapid test kepada 10 orang yang kontak dengan remaja tersebut.<br />\r\nUntuk diketahui, seorang pasien positif virus Corona alias Covid-19 asal Kecamatan Kunduran, Kabupaten Blora, Jawa Tengah kabur dalam masa perawatannya&nbsp;di Klinik Bhakti Padma, Blora, Kamis (4/6/2020).</span></span><br />\r\n&nbsp;</p>\r\n', '14.jpg', '01:46:47 15-07-2020', 'Radenda');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_about`
--

CREATE TABLE `fasilitas_about` (
  `id` int(11) NOT NULL,
  `gambar` varchar(123) NOT NULL,
  `keterangan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fasilitas_about`
--

INSERT INTO `fasilitas_about` (`id`, `gambar`, `keterangan`) VALUES
(15, '25.jpg', 'Ruang Pemeriksaan'),
(16, '1.jpg', 'Ruang Tunggu'),
(17, '27.jpg', 'Ruang Pendaftaran'),
(18, '22.jpg', 'Ruang Rontgen'),
(19, 'detail21.jpg', 'Ruang Obat'),
(20, 'detail11.jpg', 'Ruang USG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_admin`
--

CREATE TABLE `menu_admin` (
  `id` int(11) NOT NULL,
  `icon` varchar(123) NOT NULL,
  `nama_menu` varchar(120) NOT NULL,
  `link` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu_admin`
--

INSERT INTO `menu_admin` (`id`, `icon`, `nama_menu`, `link`) VALUES
(1, '', 'Dashboard', 'admin'),
(2, '', 'Menu', 'admin/menu'),
(3, '', 'Tampilan Home', 'admin/tampilanhome');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id` int(11) NOT NULL,
  `nama` varchar(123) NOT NULL,
  `keluhan` varchar(123) NOT NULL,
  `jamperiksa` varchar(123) NOT NULL,
  `nohp` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id`, `nama`, `keluhan`, `jamperiksa`, `nohp`) VALUES
(14, 'dewa', 'asma', '21-09-2020 10.00', '089673588881');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesan`
--

CREATE TABLE `pesan` (
  `id` int(11) NOT NULL,
  `message` varchar(10000) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `subject` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pesan`
--

INSERT INTO `pesan` (`id`, `message`, `name`, `email`, `subject`) VALUES
(4, 'saya sering merasa enakan sekarang', 'Trisna wahana', 'trisnawahana@gmail,cin', 'koinsultasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `gambar` mediumtext NOT NULL,
  `nama` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `staff`
--

INSERT INTO `staff` (`id`, `gambar`, `nama`) VALUES
(3, '281.jpg', 'Nana supriatna'),
(4, '291.jpg', 'Budi'),
(5, '312.jpg', 'Rima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tampilan_about`
--

CREATE TABLE `tampilan_about` (
  `id` int(11) NOT NULL,
  `background` varchar(128) NOT NULL,
  `visi` longtext NOT NULL,
  `misi` longtext NOT NULL,
  `mutiara` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tampilan_about`
--

INSERT INTO `tampilan_about` (`id`, `background`, `visi`, `misi`, `mutiara`) VALUES
(1, 'banks.jpg', '<p><span style=\"font-size:36px\"><span style=\"font-family:Times New Roman,Times,serif\">Turut mendukung sarana kesehatan di kabupaten dan kota</span></span></p>', '<p style=\"text-align:justify\"><span style=\"font-size:36px\"><span style=\"font-family:Times New Roman,Times,serif\">1.Menciptakan interaksi yang baik dan pelayanan yang baik tehadap pasien;</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:36px\"><span style=\"font-family:Times New Roman,Times,serif\">2.Memfasilitasi semua yang berhubungan dengan kesehatan;</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:36px\"><span style=\"font-family:Times New Roman,Times,serif\">3.Meningkatkan derajat kesehatan masyarakat</span></span></p>', '<p><span style=\"font-size:20px\">Kamu tidak perlu mendiagnosa penyakit yang ada di hatiku,karena obat terbaiknya adalah kamu.Cukup dengan kabar baik dari mu,maka itu sudah menjadi obat dari segala gejala buruk yang menimpaku &quot;Dr.Dadang RK&quot;</span></p>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tampilan_home`
--

CREATE TABLE `tampilan_home` (
  `id` int(11) NOT NULL,
  `background` varchar(128) NOT NULL,
  `sambutan` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tampilan_home`
--

INSERT INTO `tampilan_home` (`id`, `background`, `sambutan`) VALUES
(1, '131.jpg', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">Dokter&nbsp;yang&nbsp;baik&nbsp;bisa&nbsp;menyembuhkan&nbsp;penyakit</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">Dokter&nbsp;</span></span><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">yang&nbsp;hebat&nbsp;menyembuhkan&nbsp;pasien&nbsp;yang&nbsp;terkena&nbsp;</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">penyakit</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">1.Kami peduli tentang KESEHATAN anda</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">2.Kami peduli tentang KEBAHAGIAAN anda</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:26px\">3.Kami peduli tentang MASA DEPAN anda</span></span></p>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `jabatan` varchar(128) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `image` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `jabatan`, `username`, `password`, `image`) VALUES
(1, 'Radenda', 'superadmin', 'dewa', '123', '12.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fasilitas_about`
--
ALTER TABLE `fasilitas_about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_admin`
--
ALTER TABLE `menu_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tampilan_about`
--
ALTER TABLE `tampilan_about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tampilan_home`
--
ALTER TABLE `tampilan_home`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_about`
--
ALTER TABLE `fasilitas_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `menu_admin`
--
ALTER TABLE `menu_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tampilan_about`
--
ALTER TABLE `tampilan_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tampilan_home`
--
ALTER TABLE `tampilan_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `belajar`
--
CREATE DATABASE IF NOT EXISTS `belajar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `belajar`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `perintah`
--

CREATE TABLE `perintah` (
  `id_perintah` int(11) NOT NULL,
  `data` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `perintah`
--

INSERT INTO `perintah` (`id_perintah`, `data`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rfid`
--

CREATE TABLE `rfid` (
  `id_data` int(11) NOT NULL,
  `id_device` int(11) NOT NULL,
  `uid_rfid` varchar(50) NOT NULL,
  `waktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rfid`
--

INSERT INTO `rfid` (`id_data`, `id_device`, `uid_rfid`, `waktu`) VALUES
(1, 101, 'A0:FF:BB:22:DA', 1571613076),
(2, 101, '10:5F:CB:52:FF', 1571613195),
(3, 22, '5b-1f-cf-2b-a0', 1571621696),
(4, 22, 'c6-3c-65-a5-3a', 1571621740),
(5, 22, '1d-c4-1f-a3-65', 1571621757),
(6, 12, '10:5F:CB:52:FF', 1613882591),
(7, 12, '2c-ca-c0-17-31', 1613882848),
(8, 12, '1a-51-42-6b-62', 1613882869),
(9, 12, '2c-ca-c0-17-31', 1613882938),
(10, 12, '1a-51-42-6b-62', 1613883006),
(11, 12, '1a-51-42-6b-62', 1613892166);

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor`
--

CREATE TABLE `sensor` (
  `id_sensor` int(11) NOT NULL,
  `data_sensor` decimal(10,2) NOT NULL,
  `waktu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `sensor`
--

INSERT INTO `sensor` (`id_sensor`, `data_sensor`, `waktu`) VALUES
(1, '15.00', 1563836562),
(2, '10.00', 1563836593),
(3, '10.33', 1563836609),
(4, '9.00', 1563836716),
(5, '8.00', 1563837521);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `perintah`
--
ALTER TABLE `perintah`
  ADD PRIMARY KEY (`id_perintah`);

--
-- Indeks untuk tabel `rfid`
--
ALTER TABLE `rfid`
  ADD PRIMARY KEY (`id_data`);

--
-- Indeks untuk tabel `sensor`
--
ALTER TABLE `sensor`
  ADD PRIMARY KEY (`id_sensor`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `perintah`
--
ALTER TABLE `perintah`
  MODIFY `id_perintah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rfid`
--
ALTER TABLE `rfid`
  MODIFY `id_data` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `sensor`
--
ALTER TABLE `sensor`
  MODIFY `id_sensor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `cobalaravel`
--
CREATE DATABASE IF NOT EXISTS `cobalaravel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `cobalaravel`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_05_120927_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `company`
--
CREATE DATABASE IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `company`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id` int(11) NOT NULL,
  `judul` varchar(1000) NOT NULL,
  `isiberita` longtext NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tanggal` varchar(213) NOT NULL,
  `penulis` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id`, `judul`, `isiberita`, `gambar`, `tanggal`, `penulis`) VALUES
(1, 'Ega Ganteng', '<p>asd</p>\r\n\r\n<p>sad</p>\r\n\r\n<p>asd</p>\r\n\r\n<p>ad</p>\r\n\r\n<p>sa</p>\r\n', 'unnamed.jpg', '09:25:43 02-07-2020', 'ega nugraha'),
(2, 'nawa jelek', '<p>asdsa</p>\r\n\r\n<p>sda</p>\r\n\r\n<p>d</p>\r\n\r\n<p>asdsads</p>\r\n\r\n<p>ad</p>\r\n\r\n<p>sa</p>\r\n', '41R-VkcmjcL__SL500_AC_SS350_.jpg', '09:43:12 02-07-2020', 'Trisna Wahana'),
(3, 'Smanic atasi wabah corona', '<p>Covid 19 is number one to solved</p>\r\n\r\n<p>i approve with the repons&nbsp;from&nbsp;goverment about covid 19, we are must social distancing and always washing hand if we are touch anything..</p>\r\n\r\n<p>thank you iam ega nugraha from berlin keep healthy and save your life&nbsp;&nbsp;</p>\r\n', 'ass.png', '09:54:40 02-07-2020', 'Trisna Wahana');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas_about`
--

CREATE TABLE `fasilitas_about` (
  `id` int(11) NOT NULL,
  `gambar` varchar(123) NOT NULL,
  `keterangan` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `fasilitas_about`
--

INSERT INTO `fasilitas_about` (`id`, `gambar`, `keterangan`) VALUES
(1, 'unnamed1.jpg', 'saya'),
(2, 'img_5170_1489733155.jpg', 'Lapangan'),
(3, '1_Fasilitas-Lab-Bahasa.jpg', 'Lab Bahasa'),
(4, 'download.jpg', 'Perpustakaan'),
(5, 'DSCN2267-Copy.jpg', 'Lab Komputer'),
(6, 'images.jpg', 'Perpustakaan 2'),
(7, 'kelasx.png', 'Kelas x'),
(8, 'lab_pc.jpg', 'Ruang rapat'),
(9, 'sd-muhammadiyah18-ruang-kelas.jpg', 'Kelas xi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_admin`
--

CREATE TABLE `menu_admin` (
  `id` int(11) NOT NULL,
  `icon` varchar(123) NOT NULL,
  `nama_menu` varchar(120) NOT NULL,
  `link` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu_admin`
--

INSERT INTO `menu_admin` (`id`, `icon`, `nama_menu`, `link`) VALUES
(1, '', 'Dashboard', 'admin'),
(2, '', 'Menu', 'admin/menu'),
(3, '', 'Tampilan Home', 'admin/tampilanhome');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tampilan_about`
--

CREATE TABLE `tampilan_about` (
  `id` int(11) NOT NULL,
  `background` varchar(128) NOT NULL,
  `visi` longtext NOT NULL,
  `misi` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tampilan_about`
--

INSERT INTO `tampilan_about` (`id`, `background`, `visi`, `misi`) VALUES
(1, '41R-VkcmjcL__SL500_AC_SS350_.jpg', '<p>AssalamualaikumWr.Wb. Sehubungan akan dilaksanakan Kegiatan &ldquo;Kerja Praktek&rdquo;, dengan ini saya yang bertanda tangan di bawah ini : Nama : Ega Nugraha NIM : 1703010040 Program Studi : Teknik Informatika Tempat Kerja Praktek : SMAN 1 Ciawi Tasikmalaya Alamat : Jalan Pasirhuni No. 10 Ciawi Kabupaten Tasikmalaya. Maka saya memohon untuk meminta surat pengantar yang ditujukan untuk intansi tersebut demi kelancaran dan kesuksesan bersama . Demikian surat permohonan ini saya sampaikan, atas perhatiannya saya ucapkan terimakasih. WassalamualaikumWr.Wb.</p>', '<p>Saya Ega Nugraha salah satu mahasiswa program studi Teknik Informatika dari Universitas Perjuangan ingin ikut berpartisipasi untuk menghimbau kepada masyarakat dalam rangka melakukan pencegahan COVID-19 yang terjadi saat ini. Pemerintah menghimbau kepada masyarakat untuk menerapkan social distancing, phisical distancing, serta untuk tetap tinggal dirumah. Berdasarkan data pada hari Selasa (28/4/2020) ada 9.511 kasus positif diIndonesia. Seperti yang kita ketahui bahwa penularan virus corona yang banyak terjadi karena berinteraksi dengan orang lain yang mengidap virus tersebut. Kita tidak dapat mengetahui dengan indera kita apakah orang-orang disekitar kita mengidap covid-19 atau tidak. Maka dari itu pemerintah menghimbau kepada masyarakat untuk menerapkan social distancing, phisical distancing, serta untuk tetap tinggal dirumah.</p>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tampilan_home`
--

CREATE TABLE `tampilan_home` (
  `id` int(11) NOT NULL,
  `background` varchar(128) NOT NULL,
  `sambutan_ks` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tampilan_home`
--

INSERT INTO `tampilan_home` (`id`, `background`, `sambutan_ks`) VALUES
(1, 'smanic1.jpg', '<p>1. Ketuhanan Yang Maha Esa</p>\r\n\r\n<p>2. Kemanusiaan yang beradab</p>\r\n\r\n<p>3. Persatuan Indonesia</p>');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nip` varchar(123) NOT NULL,
  `jabatan` varchar(128) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `image` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `nip`, `jabatan`, `username`, `password`, `image`) VALUES
(1, 'ega nugraha', '17030100040', 'superadmin', 'ega', '123', 'ega.jpg'),
(2, 'Trisna Wahana', '170301010004', 'pendekar', 'nawa', '123', 'diansastro.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `fasilitas_about`
--
ALTER TABLE `fasilitas_about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_admin`
--
ALTER TABLE `menu_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tampilan_about`
--
ALTER TABLE `tampilan_about`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tampilan_home`
--
ALTER TABLE `tampilan_home`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `fasilitas_about`
--
ALTER TABLE `fasilitas_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `menu_admin`
--
ALTER TABLE `menu_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tampilan_about`
--
ALTER TABLE `tampilan_about`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tampilan_home`
--
ALTER TABLE `tampilan_home`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `contoh_penjadwalan`
--
CREATE DATABASE IF NOT EXISTS `contoh_penjadwalan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `contoh_penjadwalan`;
--
-- Database: `db_websekolah`
--
CREATE DATABASE IF NOT EXISTS `db_websekolah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_websekolah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_agenda`
--

CREATE TABLE `tbl_agenda` (
  `agenda_id` int(11) NOT NULL,
  `agenda_nama` varchar(200) DEFAULT NULL,
  `agenda_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `agenda_deskripsi` text DEFAULT NULL,
  `agenda_mulai` date DEFAULT NULL,
  `agenda_selesai` date DEFAULT NULL,
  `agenda_tempat` varchar(90) DEFAULT NULL,
  `agenda_waktu` varchar(30) DEFAULT NULL,
  `agenda_keterangan` varchar(200) DEFAULT NULL,
  `agenda_author` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_agenda`
--

INSERT INTO `tbl_agenda` (`agenda_id`, `agenda_nama`, `agenda_tanggal`, `agenda_deskripsi`, `agenda_mulai`, `agenda_selesai`, `agenda_tempat`, `agenda_waktu`, `agenda_keterangan`, `agenda_author`) VALUES
(1, 'Penyembelihan Hewan Kurban Idul Adha 2017', '2017-01-22 06:18:01', 'Idul Adha yang biasa disebut lebaran haji atapun lebaran kurban sangat identik dengan penyembelihan hewan kurban. M-Sekolah tahun ini juga melakukan penyembelihan hewan kurban. Yang rencananya akan dihadiri oleh guru-guru, siswa dan pengurus OSIS.', '2017-01-22', '2017-01-22', 'M-Sekolah', '08.00 - 11.00 WIB', 'Dihadiri oleh guru-guru, siswa dan pengurus OSIS', 'M Fikri Setiadi'),
(2, 'Peluncuran Website Resmi M-Sekolah', '2017-01-22 06:26:33', 'Peluncuran website resmi  M-Sekolah, sebagai media informasi dan akademik online untuk pelayanan pendidikan yang lebih baik kepada siswa, orangtua, dan masyarakat pada umumnya semakin meningkat.', '2017-01-04', '2017-01-04', 'M-Sekolah', '07.30 - 12.00 WIB', '-', 'M Fikri Setiadi'),
(3, 'Penerimaan Raport Semester Ganjil Tahun Ajaran 2017-2018', '2017-01-22 06:29:49', 'Berakhirnya semester ganjil tahun pelajaran 2016-2017, ditandai dengan pembagian laporan hasil belajar.', '2017-02-17', '2017-02-17', 'M-Sekolah', '07.30 - 12.00 WIB', 'Untuk kelas XI dan XII, pembagian raport dimulai pukul 07.30 WIB. Sedangkan untuk kelas X pada pukul 09.00 WIB. Raport diambil oleh orang tua/wali murid masing-masing.', 'M Fikri Setiadi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_album`
--

CREATE TABLE `tbl_album` (
  `album_id` int(11) NOT NULL,
  `album_nama` varchar(50) DEFAULT NULL,
  `album_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `album_pengguna_id` int(11) DEFAULT NULL,
  `album_author` varchar(60) DEFAULT NULL,
  `album_count` int(11) DEFAULT 0,
  `album_cover` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_album`
--

INSERT INTO `tbl_album` (`album_id`, `album_nama`, `album_tanggal`, `album_pengguna_id`, `album_author`, `album_count`, `album_cover`) VALUES
(1, 'Kedatangan Tamu Asing', '2016-09-08 13:00:55', 1, 'M Fikri Setiadi', 5, '202aa754590dfc1070c624bad294abbc.jpg'),
(3, 'Pemilu Osis 2016-2017', '2017-01-21 01:58:16', 1, 'M Fikri Setiadi', 3, 'dc088a9fb62333012ff7a601828219d7.jpg'),
(4, 'Kegiatan Belajar Siswa', '2017-01-24 01:31:13', 1, 'M Fikri Setiadi', 7, '203bc0411a07ed0430d39bcc38ec2c56.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_files`
--

CREATE TABLE `tbl_files` (
  `file_id` int(11) NOT NULL,
  `file_judul` varchar(120) DEFAULT NULL,
  `file_deskripsi` text DEFAULT NULL,
  `file_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `file_oleh` varchar(60) DEFAULT NULL,
  `file_download` int(11) DEFAULT 0,
  `file_data` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_files`
--

INSERT INTO `tbl_files` (`file_id`, `file_judul`, `file_deskripsi`, `file_tanggal`, `file_oleh`, `file_download`, `file_data`) VALUES
(2, 'Dasar-dasar CSS', 'Modul dasar-dasar CSS 3. Modul ini membantu anda untuk memahami struktur dasar CSS', '2017-01-23 04:30:01', 'Drs. Joko', 0, 'ab9a183ff240deadbedaff78e639af2f.pdf'),
(3, '14 Teknik Komunikasi Yang Paling Efektif', 'Ebook 14 teknik komunikasi paling efektif membantu anda untuk berkomunikasi dengan baik dan benar', '2017-01-23 15:26:06', 'Drs. Joko', 0, 'ab2cb34682bd94f30f2347523112ffb9.pdf'),
(4, 'Bagaimana Membentuk Pola Pikir yang Baru', 'Ebook ini membantu anda membentuk pola pikir baru.', '2017-01-23 15:27:07', 'Drs. Joko', 0, '30f588eb5c55324f8d18213f11651855.pdf'),
(5, '7 Tips Penting mengatasi Kritik', '7 Tips Penting mengatasi Kritik', '2017-01-23 15:27:44', 'Drs. Joko', 0, '329a62b25ad475a148e1546aa3db41de.docx'),
(6, '8 Racun dalam kehidupan kita', '8 Racun dalam kehidupan kita', '2017-01-23 15:28:17', 'Drs. Joko', 0, '8e38ad4948ba13758683dea443fbe6be.docx'),
(7, 'Jurnal Teknolgi Informasi', 'Jurnal Teknolgi Informasi', '2017-01-25 03:18:53', 'Gunawan, S.Pd', 0, '87ae0f009714ddfdd79e2977b2a64632.pdf'),
(8, 'Jurnal Teknolgi Informasi 2', 'Jurnal Teknolgi Informasi', '2017-01-25 03:19:22', 'Gunawan, S.Pd', 0, 'c4e966ba2c6e142155082854dc5b3602.pdf'),
(9, 'Naskah Publikasi IT', 'Naskah Teknolgi Informasi', '2017-01-25 03:21:04', 'Gunawan, S.Pd', 0, '71380b3cf16a17a02382098c028ece9c.pdf'),
(10, 'Modul Teknologi Informasi', 'Modul Teknologi Informasi', '2017-01-25 03:22:08', 'Gunawan, S.Pd', 0, '029143a3980232ab2900d94df36dbb0c.pdf'),
(11, 'Modul Teknologi Informasi Part II', 'Modul Teknologi Informasi', '2017-01-25 03:22:54', 'Gunawan, S.Pd', 0, 'ea8f3f732576083156e509657614f551.pdf'),
(12, 'Modul Teknologi Informasi Part III', 'Modul Teknologi Informasi', '2017-01-25 03:23:21', 'Gunawan, S.Pd', 0, 'c5e5e7d16e4cd6c3d22c11f64b0db2af.pdf');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_galeri`
--

CREATE TABLE `tbl_galeri` (
  `galeri_id` int(11) NOT NULL,
  `galeri_judul` varchar(60) DEFAULT NULL,
  `galeri_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `galeri_gambar` varchar(40) DEFAULT NULL,
  `galeri_album_id` int(11) DEFAULT NULL,
  `galeri_pengguna_id` int(11) DEFAULT NULL,
  `galeri_author` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_galeri`
--

INSERT INTO `tbl_galeri` (`galeri_id`, `galeri_judul`, `galeri_tanggal`, `galeri_gambar`, `galeri_album_id`, `galeri_pengguna_id`, `galeri_author`) VALUES
(4, 'Diskusi Pemilihan Ketua Osis', '2017-01-21 14:04:53', '9b10fa300633f62f105e9b52789fc8f3.jpg', 3, 1, 'M Fikri Setiadi'),
(5, 'Panitia Pemilu Osis', '2017-01-22 04:13:20', '0ec0c2f9aae6501d7ed7930995d48b57.jpg', 3, 1, 'M Fikri Setiadi'),
(6, 'Proses Pemilu Osis', '2017-01-22 04:13:43', 'bfbe6cc1c8096f5f36c68e93da53c248.jpg', 3, 1, 'M Fikri Setiadi'),
(7, 'Belajar dengan native speaker', '2017-01-24 01:26:22', '831e5ad43ccc3c851d50c128ff095541.jpg', 1, 1, 'M Fikri Setiadi'),
(8, 'Diskusi dengan native speaker', '2017-01-24 01:27:05', '84afbf1d3ad45932f1d7ac47b8a00949.jpg', 1, 1, 'M Fikri Setiadi'),
(9, 'Foto bareng native speaker', '2017-01-24 01:27:28', 'a99ab060d5d5bf8c96f24fe385f7dd8b.jpg', 1, 1, 'M Fikri Setiadi'),
(10, 'Foto bareng native speaker', '2017-01-24 01:28:40', 'd70cedba6391b7b3c74b914efd82953f.jpg', 1, 1, 'M Fikri Setiadi'),
(11, 'Foto bareng native speaker', '2017-01-24 01:28:54', '10de99f425b9961ce1e87c5e5575f8f4.jpg', 1, 1, 'M Fikri Setiadi'),
(12, 'Belajar sambil bermain', '2017-01-24 01:31:42', '9df82241493b94d1e06b461129cf57b2.jpg', 4, 1, 'M Fikri Setiadi'),
(13, 'Belajar sambil bermain', '2017-01-24 01:31:55', '5374415f11683ad6dd31572a7bbf8a7b.jpg', 4, 1, 'M Fikri Setiadi'),
(14, 'Belajar komputer programming', '2017-01-24 01:32:24', '82b91bd35706b21c3ab04e205e358eb6.jpg', 4, 1, 'M Fikri Setiadi'),
(15, 'Belajar komputer programming', '2017-01-24 01:32:34', '93048f2a103987bce8c8ec8d6912de06.jpg', 4, 1, 'M Fikri Setiadi'),
(16, 'Belajar komputer programming', '2017-01-24 01:32:44', '41f46be181f2f8452c2041b5e79a05a5.jpg', 4, 1, 'M Fikri Setiadi'),
(17, 'Belajar sambil bermain', '2017-01-24 01:33:08', '2858b0555c252690e293d29b922ba8e6.jpg', 4, 1, 'M Fikri Setiadi'),
(18, 'Makan bersama', '2017-01-24 01:33:24', '90d67328e33a31d3f5eecd7dcb25b55d.jpg', 4, 1, 'M Fikri Setiadi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_guru`
--

CREATE TABLE `tbl_guru` (
  `guru_id` int(11) NOT NULL,
  `guru_nip` varchar(30) DEFAULT NULL,
  `guru_nama` varchar(70) DEFAULT NULL,
  `guru_jenkel` varchar(2) DEFAULT NULL,
  `guru_tmp_lahir` varchar(80) DEFAULT NULL,
  `guru_tgl_lahir` varchar(80) DEFAULT NULL,
  `guru_mapel` varchar(120) DEFAULT NULL,
  `guru_photo` varchar(40) DEFAULT NULL,
  `guru_tgl_input` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_guru`
--

INSERT INTO `tbl_guru` (`guru_id`, `guru_nip`, `guru_nama`, `guru_jenkel`, `guru_tmp_lahir`, `guru_tgl_lahir`, `guru_mapel`, `guru_photo`, `guru_tgl_input`) VALUES
(1, '927482658274982', 'M Fikri Setiadi', 'L', 'Padang', '25 September 1993', 'Teknik Komputer', 'f6bbe1e04e78e0d715e9830a605794aa.jpg', '2017-01-26 07:49:43'),
(2, '927482658274981', 'Thomas Muller', 'L', 'Germany', '25 September 1989', 'Olahgara', NULL, '2017-01-26 13:38:54'),
(3, '-', 'Joko Subroto', 'L', 'Jakarta', '25 September 1989', 'PPKN, Matematika', NULL, '2017-01-26 13:41:20'),
(4, '-', 'Kusta Otomo', 'L', 'Jakarta', '25 September 1989', 'Seni Budaya', NULL, '2017-01-26 13:42:08'),
(5, '-', 'Yuliani Ningsih', 'P', 'Padang', '27 September 1993', 'Bahasa Indonesia', NULL, '2017-01-26 13:42:48'),
(6, '927482658274993', 'Ari Hidayat', 'L', 'Padang', '25 September 1993', 'Bahasa Inggris', NULL, '2017-01-26 13:43:46'),
(7, '927482658274998', 'Irma Cantika', 'P', 'Padang', '25 September 1993', 'Bahasa Inggris, IPA', '4200d2514abf45755943526b74474c16.jpg', '2017-01-26 13:45:11'),
(8, '-', 'Ririn Febriesta', 'P', 'Padang', '27 September 1994', 'Pend. Agama Islam', NULL, '2017-01-27 04:28:23');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_inbox`
--

CREATE TABLE `tbl_inbox` (
  `inbox_id` int(11) NOT NULL,
  `inbox_nama` varchar(40) DEFAULT NULL,
  `inbox_email` varchar(60) DEFAULT NULL,
  `inbox_kontak` varchar(20) DEFAULT NULL,
  `inbox_pesan` text DEFAULT NULL,
  `inbox_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `inbox_status` int(11) DEFAULT 1 COMMENT '1=Belum dilihat, 0=Telah dilihat'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_inbox`
--

INSERT INTO `tbl_inbox` (`inbox_id`, `inbox_nama`, `inbox_email`, `inbox_kontak`, `inbox_pesan`, `inbox_tanggal`, `inbox_status`) VALUES
(2, 'M Fikri Setiadi', 'fikrifiver97@gmail.com', '-', 'Ping !', '2017-06-21 03:44:12', 0),
(3, 'M Fikri Setiadi', 'fikrifiver97@gmail.com', '-', 'Ini adalah pesan ', '2017-06-21 03:45:57', 0),
(5, 'M Fikri Setiadi', 'fikrifiver97@gmail.com', '-', 'Ping !', '2017-06-21 03:53:19', 0),
(7, 'M Fikri Setiadi', 'fikrifiver97@gmail.com', '-', 'Hi, there!', '2017-07-01 07:28:08', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(30) DEFAULT NULL,
  `kategori_tanggal` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`kategori_id`, `kategori_nama`, `kategori_tanggal`) VALUES
(1, 'Pendidikan', '2016-09-06 05:49:04'),
(2, 'Politik', '2016-09-06 05:50:01'),
(3, 'Sains', '2016-09-06 05:59:39'),
(5, 'Penelitian', '2016-09-06 06:19:26'),
(6, 'Prestasi', '2016-09-07 02:51:09'),
(13, 'Olah Raga', '2017-01-13 13:20:31');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `kelas_id` int(11) NOT NULL,
  `kelas_nama` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`kelas_id`, `kelas_nama`) VALUES
(1, 'Kelas X.1'),
(2, 'Kelas X.2'),
(3, 'Kelas X.3'),
(4, 'Kelas X.4'),
(5, 'Kelas X.5'),
(6, 'Kelas X.6'),
(7, 'Kelas X.7'),
(8, 'Kelas XI IPA.1'),
(9, 'Kelas XI IPA.2'),
(10, 'Kelas XI IPA.3'),
(11, 'Kelas XI IPA.4'),
(12, 'Kelas XI IPA.5'),
(13, 'Kelas XI IPA.6'),
(14, 'Kelas XI IPA.7'),
(15, 'Kelas XI IPS.1'),
(16, 'Kelas XI IPS.2'),
(17, 'Kelas XI IPS.3'),
(18, 'Kelas XI IPS.4'),
(19, 'Kelas XI IPS.5'),
(20, 'Kelas XI IPS.6'),
(21, 'Kelas XI IPS.7');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_komentar`
--

CREATE TABLE `tbl_komentar` (
  `komentar_id` int(11) NOT NULL,
  `komentar_nama` varchar(30) DEFAULT NULL,
  `komentar_email` varchar(50) DEFAULT NULL,
  `komentar_isi` varchar(120) DEFAULT NULL,
  `komentar_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `komentar_status` varchar(2) DEFAULT NULL,
  `komentar_tulisan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_log_aktivitas`
--

CREATE TABLE `tbl_log_aktivitas` (
  `log_id` int(11) NOT NULL,
  `log_nama` text DEFAULT NULL,
  `log_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `log_ip` varchar(20) DEFAULT NULL,
  `log_pengguna_id` int(11) DEFAULT NULL,
  `log_icon` blob DEFAULT NULL,
  `log_jenis_icon` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengguna`
--

CREATE TABLE `tbl_pengguna` (
  `pengguna_id` int(11) NOT NULL,
  `pengguna_nama` varchar(50) DEFAULT NULL,
  `pengguna_moto` varchar(100) DEFAULT NULL,
  `pengguna_jenkel` varchar(2) DEFAULT NULL,
  `pengguna_username` varchar(30) DEFAULT NULL,
  `pengguna_password` varchar(35) DEFAULT NULL,
  `pengguna_tentang` text DEFAULT NULL,
  `pengguna_email` varchar(50) DEFAULT NULL,
  `pengguna_nohp` varchar(20) DEFAULT NULL,
  `pengguna_facebook` varchar(35) DEFAULT NULL,
  `pengguna_twitter` varchar(35) DEFAULT NULL,
  `pengguna_linkdin` varchar(35) DEFAULT NULL,
  `pengguna_google_plus` varchar(35) DEFAULT NULL,
  `pengguna_status` int(2) DEFAULT 1,
  `pengguna_level` varchar(3) DEFAULT NULL,
  `pengguna_register` timestamp NULL DEFAULT current_timestamp(),
  `pengguna_photo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengguna`
--

INSERT INTO `tbl_pengguna` (`pengguna_id`, `pengguna_nama`, `pengguna_moto`, `pengguna_jenkel`, `pengguna_username`, `pengguna_password`, `pengguna_tentang`, `pengguna_email`, `pengguna_nohp`, `pengguna_facebook`, `pengguna_twitter`, `pengguna_linkdin`, `pengguna_google_plus`, `pengguna_status`, `pengguna_level`, `pengguna_register`, `pengguna_photo`) VALUES
(1, 'M Fikri Setiadi', 'Just do it', 'L', 'admin', '12345678', 'I am a mountainner. to me mountainerring is a life', 'fikrifiver97@gmail.com', '081277159401', 'facebook.com/m_fikri_setiadi', 'twitter.com/fiver_fiver', '', '', 1, '1', '2016-09-03 06:07:55', '1aa9ff5088173edccb446df1de95607c.jpg'),
(3, 'Mario Gotze', NULL, 'L', 'gotze', '202cb962ac59075b964b07152d234b70', NULL, 'gotze@gmail.com', '081288831443', NULL, NULL, NULL, NULL, 1, '1', '2017-01-12 03:29:47', 'ea682f37eef8fa2ca3e037d30323ecca.jpg'),
(4, 'Manuel Neuer', NULL, 'L', 'neuer', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'neuer@gmail.com', '0285937599', NULL, NULL, NULL, NULL, 1, '1', '2017-01-12 14:20:42', 'file_1484230842.jpg'),
(5, 'Ega', NULL, 'L', 'eganugrahaid', '12345678', NULL, 'nugrahaega261@gmail.com', '08975568102', NULL, NULL, NULL, NULL, 1, '2', '2021-02-08 02:48:45', 'b7dc9bfb7e68ff03358966cf4411bfd4.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengumuman`
--

CREATE TABLE `tbl_pengumuman` (
  `pengumuman_id` int(11) NOT NULL,
  `pengumuman_judul` varchar(150) DEFAULT NULL,
  `pengumuman_deskripsi` text DEFAULT NULL,
  `pengumuman_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `pengumuman_author` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengumuman`
--

INSERT INTO `tbl_pengumuman` (`pengumuman_id`, `pengumuman_judul`, `pengumuman_deskripsi`, `pengumuman_tanggal`, `pengumuman_author`) VALUES
(1, 'Pengumuman Libur Semester Ganjil Tahun Ajaran 2016-2017', 'Libur semester ganjil tahun ajaran 2016-2017 dimulai dari tanggal 3 Maret 2017 sampai dengan tanggal 7 Maret 207.', '2017-01-21 01:17:30', 'M Fikri Setiadi'),
(2, 'Pengumuman Pembagian Raport Semester Ganjil Tahun Ajaran 2016-2017', 'Menjelang berakhirnya proses belajar-mengajar di semester ganjil tahun ajaran 2016-2017, maka akan diadakan pembagian hasil belajar/raport pada tanggal 4 Maret 2017 pukul 07.30 WIB.\r\nYang bertempat di M-Sekolah. Raport diambil oleh orang tua/wali kelas murid masing-masing', '2017-01-21 01:16:20', 'M Fikri Setiadi'),
(3, 'Pengumuman Peresmian dan Launching Website Perdana M-Sekolah', 'Peresmian dan launching website resmi M-Sekolah akan diadakan pada hari 23 Desember 2016 pukul 10.00, bertepatan dengan pembagian raport semester ganjil tahun ajaran 2016-2017', '2017-01-22 07:16:16', 'M Fikri Setiadi'),
(4, 'Pengumuman Proses Belajar Mengajar di Semester Genap Tahun Ajaran 2016-2017', 'Setelah libur semester ganjil tahun ajaran 2016-2017, proses belajar mengajar di semester genap tahun ajaran 2016-2017 mulai aktif kembali tanggal 2 Maret 2017.', '2017-01-22 07:15:28', 'M Fikri Setiadi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pengunjung`
--

CREATE TABLE `tbl_pengunjung` (
  `pengunjung_id` int(11) NOT NULL,
  `pengunjung_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `pengunjung_ip` varchar(40) DEFAULT NULL,
  `pengunjung_perangkat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_pengunjung`
--

INSERT INTO `tbl_pengunjung` (`pengunjung_id`, `pengunjung_tanggal`, `pengunjung_ip`, `pengunjung_perangkat`) VALUES
(1, '2016-08-11 23:52:20', '127.0.0.1', 'Firefox'),
(2, '2016-08-12 17:14:20', '127.0.0.1', 'Firefox'),
(3, '2016-08-13 05:23:19', '127.0.0.1', 'Firefox'),
(4, '2016-08-13 05:27:05', '127.0.0.1', 'Firefox'),
(5, '2016-08-13 05:27:37', '127.0.0.1', 'Firefox'),
(6, '2016-08-13 06:54:58', '127.0.0.1', 'Firefox'),
(7, '2016-08-13 06:55:59', '127.0.0.1', 'Firefox'),
(8, '2016-08-13 07:00:06', '127.0.0.1', 'Firefox'),
(9, '2016-08-13 07:00:34', '127.0.0.1', 'Firefox'),
(10, '2016-09-18 20:24:39', '127.0.0.1', 'Firefox'),
(11, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(12, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(13, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(14, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(15, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(16, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(17, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(18, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(19, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(20, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(21, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(22, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(23, '2016-09-18 20:24:43', '127.0.0.1', 'Firefox'),
(24, '2017-02-04 18:06:52', '::1', 'Chrome'),
(25, '2017-02-04 18:07:16', '127.0.0.1', 'Firefox'),
(26, '2017-02-04 18:08:31', '::1', 'Chrome'),
(27, '2017-02-05 19:33:14', '::1', 'Chrome'),
(28, '2017-02-05 20:20:59', '127.0.0.1', 'Firefox'),
(29, '2017-02-06 18:21:08', '::1', 'Chrome'),
(30, '2017-02-09 01:07:51', '::1', 'Chrome'),
(31, '2017-02-10 20:12:05', '::1', 'Chrome'),
(32, '2017-02-20 20:46:21', '::1', 'Chrome'),
(33, '2017-02-22 04:04:16', '::1', 'Chrome'),
(34, '2017-02-27 18:47:25', '::1', 'Chrome'),
(35, '2017-03-02 06:09:25', '::1', 'Chrome'),
(36, '2017-03-04 08:18:51', '::1', 'Chrome'),
(37, '2017-03-12 20:40:32', '::1', 'Chrome'),
(38, '2017-03-13 20:34:32', '::1', 'Chrome'),
(39, '2017-03-23 04:08:15', '::1', 'Firefox'),
(40, '2017-03-25 09:39:02', '::1', 'Firefox'),
(41, '2017-03-25 10:16:45', '::1', 'Firefox'),
(42, '2017-03-28 14:11:23', '::1', 'Firefox'),
(43, '2017-03-29 22:39:17', '::1', 'Firefox'),
(44, '2017-03-30 10:52:11', '::1', 'Firefox'),
(45, '2017-03-31 22:48:46', '::1', 'Firefox'),
(46, '2017-04-06 22:33:58', '::1', 'Firefox'),
(47, '2017-04-08 00:25:37', '::1', 'Firefox'),
(48, '2017-04-08 10:00:14', '::1', 'Firefox'),
(49, '2017-04-09 10:06:03', '::1', 'Firefox'),
(50, '2017-04-10 12:20:50', '::1', 'Firefox'),
(51, '2017-04-11 11:46:50', '117.102.64.98', 'Chrome'),
(52, '2017-04-11 11:46:57', '125.165.129.35', 'Firefox'),
(53, '2017-04-11 12:52:18', '69.171.225.46', 'Other'),
(54, '2017-04-11 12:54:33', '69.171.225.12', 'Other'),
(55, '2017-04-11 12:55:04', '69.171.225.21', 'Other'),
(56, '2017-04-11 12:55:18', '69.171.225.18', 'Other'),
(57, '2017-04-11 13:03:44', '36.83.246.250', 'Chrome'),
(58, '2017-04-11 13:05:55', '202.62.17.121', 'Chrome'),
(59, '2017-04-11 13:06:45', '106.187.46.205', 'Chrome'),
(60, '2017-04-11 13:06:47', '173.252.98.28', 'Other'),
(61, '2017-04-11 13:10:36', '107.167.103.241', 'Opera'),
(62, '2017-04-11 13:16:14', '202.67.41.244', 'Chrome'),
(63, '2017-04-11 13:18:24', '36.72.192.194', 'Chrome'),
(64, '2017-04-11 13:19:40', '112.215.175.62', 'Chrome'),
(65, '2017-04-11 13:20:09', '173.252.102.112', 'Other'),
(66, '2017-04-11 13:20:17', '112.215.154.56', 'Firefox'),
(67, '2017-04-11 13:20:26', '158.140.170.23', 'Chrome'),
(68, '2017-04-11 13:22:33', '36.81.37.52', 'Chrome'),
(69, '2017-04-11 13:23:14', '120.188.65.243', 'Chrome'),
(70, '2017-04-11 13:26:16', '124.153.33.11', 'Chrome'),
(71, '2017-04-11 13:26:21', '112.215.172.240', 'Chrome'),
(72, '2017-04-11 13:27:34', '132.255.240.27', 'Chrome'),
(73, '2017-04-11 13:28:22', '103.213.131.147', 'Chrome'),
(74, '2017-04-11 13:29:38', '36.84.225.114', 'Chrome'),
(75, '2017-04-11 13:29:45', '180.253.158.87', 'Chrome'),
(76, '2017-04-11 13:33:35', '173.252.84.52', 'Other'),
(77, '2017-04-11 13:34:51', '202.67.35.20', 'Chrome'),
(78, '2017-04-11 13:37:02', '202.67.40.210', 'Chrome'),
(79, '2017-04-11 13:39:43', '120.188.76.26', 'Chrome'),
(80, '2017-04-11 13:41:05', '173.252.123.186', 'Other'),
(81, '2017-04-11 13:45:29', '110.139.8.41', 'Mozilla'),
(82, '2017-04-11 13:53:12', '202.80.216.219', 'Chrome'),
(83, '2017-04-11 13:55:16', '223.255.230.13', 'Safari'),
(84, '2017-04-11 13:55:38', '36.78.69.101', 'Chrome'),
(85, '2017-04-11 14:02:53', '180.251.173.137', 'Chrome'),
(86, '2017-04-11 14:03:05', '125.161.185.216', 'Chrome'),
(87, '2017-04-11 14:16:22', '139.192.226.49', 'Chrome'),
(88, '2017-04-11 14:18:10', '107.167.112.88', 'Opera'),
(89, '2017-04-11 14:18:13', '180.247.26.15', 'Chrome'),
(90, '2017-04-11 14:20:04', '204.44.65.210', 'Internet Explorer'),
(91, '2017-04-11 14:22:58', '36.78.96.198', 'Chrome'),
(92, '2017-04-11 14:23:40', '138.197.192.28', 'Chrome'),
(93, '2017-04-11 14:24:07', '112.215.151.61', 'Chrome'),
(94, '2017-04-11 14:25:46', '202.51.104.154', 'Chrome'),
(95, '2017-04-11 14:32:42', '202.67.44.7', 'Firefox'),
(96, '2017-04-11 14:36:53', '118.136.122.84', 'Chrome'),
(97, '2017-04-11 14:39:25', '61.247.21.51', 'Chrome'),
(98, '2017-04-11 14:41:38', '114.124.180.250', 'Chrome'),
(99, '2017-04-11 14:41:55', '120.188.64.226', 'Chrome'),
(100, '2017-04-11 14:43:14', '180.247.204.243', 'Chrome'),
(101, '2017-04-11 14:44:48', '125.161.179.203', 'Chrome'),
(102, '2017-04-11 14:46:06', '114.125.55.58', 'Chrome'),
(103, '2017-04-11 14:50:14', '158.140.182.11', 'Chrome'),
(104, '2017-04-11 14:54:09', '202.67.33.22', 'Chrome'),
(105, '2017-04-11 14:58:44', '120.188.65.30', 'Chrome'),
(106, '2017-04-11 14:59:55', '120.188.77.153', 'Chrome'),
(107, '2017-04-11 15:02:32', '125.167.185.147', 'Mozilla'),
(108, '2017-04-11 15:04:23', '118.136.84.45', 'Chrome'),
(109, '2017-04-11 15:04:41', '110.136.129.138', 'Chrome'),
(110, '2017-04-11 15:04:52', '36.75.108.223', 'Chrome'),
(111, '2017-04-11 15:05:46', '36.72.38.146', 'Chrome'),
(112, '2017-04-11 15:06:31', '120.188.5.85', 'Chrome'),
(113, '2017-04-11 15:09:53', '180.253.90.210', 'Chrome'),
(114, '2017-04-11 15:12:18', '107.167.99.179', 'Opera'),
(115, '2017-04-11 15:12:49', '112.215.171.165', 'Chrome'),
(116, '2017-04-11 15:14:55', '203.166.201.206', 'Chrome'),
(117, '2017-04-11 15:15:21', '107.167.99.208', 'Opera'),
(118, '2017-04-11 15:15:25', '36.73.194.145', 'Mozilla'),
(119, '2017-04-11 15:16:25', '107.167.113.164', 'Opera'),
(120, '2017-04-11 15:16:42', '120.92.32.177', 'Chrome'),
(121, '2017-04-11 15:17:23', '180.245.132.122', 'Chrome'),
(122, '2017-04-11 15:17:56', '120.188.80.236', 'Chrome'),
(123, '2017-04-11 15:17:57', '114.125.89.57', 'Chrome'),
(124, '2017-04-11 15:18:01', '139.0.186.187', 'Chrome'),
(125, '2017-04-11 15:18:25', '125.166.215.131', 'Chrome'),
(126, '2017-04-11 15:18:29', '120.188.6.216', 'Mozilla'),
(127, '2017-04-11 15:19:06', '125.161.98.148', 'Chrome'),
(128, '2017-04-11 15:20:10', '36.73.9.148', 'Chrome'),
(129, '2017-04-11 15:20:15', '114.125.182.65', 'Chrome'),
(130, '2017-04-11 15:21:07', '114.125.40.100', 'Chrome'),
(131, '2017-04-11 15:21:45', '120.188.86.219', 'Chrome'),
(132, '2017-04-11 15:22:35', '118.136.103.194', 'Mozilla'),
(133, '2017-04-11 15:23:47', '36.81.10.230', 'Chrome'),
(134, '2017-04-11 15:23:47', '114.125.164.4', 'Chrome'),
(135, '2017-04-11 15:24:28', '107.167.112.218', 'Chrome'),
(136, '2017-04-11 15:24:50', '107.167.98.132', 'Opera'),
(137, '2017-04-11 15:25:44', '180.246.19.210', 'Chrome'),
(138, '2017-04-11 15:26:12', '120.188.1.85', 'Chrome'),
(139, '2017-04-11 15:27:50', '139.195.66.235', 'Chrome'),
(140, '2017-04-11 15:28:06', '115.178.198.211', 'Chrome'),
(141, '2017-04-11 15:28:17', '115.178.235.88', 'Chrome'),
(142, '2017-04-11 15:28:49', '36.84.87.138', 'Mozilla'),
(143, '2017-04-11 15:29:05', '114.121.232.136', 'Chrome'),
(144, '2017-04-11 15:29:23', '118.96.227.216', 'Chrome'),
(145, '2017-04-11 15:29:45', '36.68.184.231', 'Mozilla'),
(146, '2017-04-11 15:30:18', '120.188.3.198', 'Chrome'),
(147, '2017-04-11 15:32:44', '61.94.133.70', 'Chrome'),
(148, '2017-04-11 15:32:44', '8.37.235.44', 'Safari'),
(149, '2017-04-11 15:33:19', '110.136.254.232', 'Chrome'),
(150, '2017-04-11 15:34:17', '36.83.28.90', 'Chrome'),
(151, '2017-04-11 15:34:25', '120.188.80.239', 'Chrome'),
(152, '2017-04-11 15:34:50', '114.125.72.8', 'Chrome'),
(153, '2017-04-11 15:34:59', '180.247.33.166', 'Safari'),
(154, '2017-04-11 15:35:10', '180.214.232.22', 'Chrome'),
(155, '2017-04-11 15:35:47', '61.5.92.125', 'Chrome'),
(156, '2017-04-11 15:36:22', '36.69.222.51', 'Chrome'),
(157, '2017-04-11 15:36:24', '182.253.139.130', 'Chrome'),
(158, '2017-04-11 15:36:36', '120.188.86.170', 'Chrome'),
(159, '2017-04-11 15:36:56', '139.228.97.115', 'Chrome'),
(160, '2017-04-11 15:37:18', '36.67.61.15', 'Chrome'),
(161, '2017-04-11 15:37:20', '114.4.78.184', 'Chrome'),
(162, '2017-04-11 15:38:09', '202.67.40.221', 'Chrome'),
(163, '2017-04-11 15:39:03', '112.215.172.66', 'Chrome'),
(164, '2017-04-11 15:39:11', '36.74.207.97', 'Chrome'),
(165, '2017-04-11 15:39:36', '64.233.173.4', 'Chrome'),
(166, '2017-04-11 15:40:07', '36.84.136.234', 'Chrome'),
(167, '2017-04-11 15:41:24', '202.62.16.49', 'Chrome'),
(168, '2017-04-11 15:41:28', '125.167.120.95', 'Chrome'),
(169, '2017-04-11 15:41:46', '168.235.207.168', 'Firefox'),
(170, '2017-04-11 15:41:52', '120.188.64.235', 'Chrome'),
(171, '2017-04-11 15:42:10', '120.188.81.204', 'Chrome'),
(172, '2017-04-11 15:42:26', '125.162.245.169', 'Chrome'),
(173, '2017-04-11 15:43:20', '180.242.10.170', 'Chrome'),
(174, '2017-04-11 15:44:03', '64.233.173.6', 'Chrome'),
(175, '2017-04-11 15:44:11', '112.215.174.87', 'Chrome'),
(176, '2017-04-11 15:44:37', '36.71.46.157', 'Chrome'),
(177, '2017-04-11 15:45:07', '103.56.235.74', 'Chrome'),
(178, '2017-04-11 15:45:18', '120.188.66.124', 'Chrome'),
(179, '2017-04-11 15:45:25', '69.171.225.33', 'Other'),
(180, '2017-04-11 15:46:14', '114.125.202.40', 'Chrome'),
(181, '2017-04-11 15:46:45', '120.188.87.93', 'Chrome'),
(182, '2017-04-11 15:46:46', '118.136.85.176', 'Chrome'),
(183, '2017-04-11 15:46:51', '64.233.173.8', 'Chrome'),
(184, '2017-04-11 15:47:32', '36.79.200.132', 'Chrome'),
(185, '2017-04-11 15:48:01', '120.188.35.53', 'Chrome'),
(186, '2017-04-11 15:49:39', '110.138.153.190', 'Chrome'),
(187, '2017-04-11 15:49:44', '114.125.73.228', 'Chrome'),
(188, '2017-04-11 15:49:52', '36.81.119.196', 'Chrome'),
(189, '2017-04-11 15:50:22', '120.188.65.140', 'Chrome'),
(190, '2017-04-11 15:51:05', '125.161.188.27', 'Chrome'),
(191, '2017-04-11 15:51:23', '124.40.251.74', 'Firefox'),
(192, '2017-04-11 15:51:31', '139.228.108.66', 'Chrome'),
(193, '2017-04-11 15:51:33', '180.254.57.164', 'Chrome'),
(194, '2017-04-11 15:53:07', '180.247.95.40', 'Chrome'),
(195, '2017-04-11 15:53:20', '103.205.56.66', 'Chrome'),
(196, '2017-04-11 15:53:20', '103.56.232.196', 'Chrome'),
(197, '2017-04-11 15:53:52', '180.241.167.242', 'Chrome'),
(198, '2017-04-11 15:53:54', '112.215.171.106', 'Chrome'),
(199, '2017-04-11 15:55:12', '114.125.214.65', 'Chrome'),
(200, '2017-04-11 15:55:40', '36.71.48.50', 'Firefox'),
(201, '2017-04-11 15:57:12', '103.9.227.1', 'Chrome'),
(202, '2017-04-11 15:57:16', '202.62.17.134', 'Chrome'),
(203, '2017-04-11 15:57:40', '36.74.110.84', 'Chrome'),
(204, '2017-04-11 15:57:54', '112.215.173.135', 'Chrome'),
(205, '2017-04-11 15:58:17', '36.80.43.86', 'Chrome'),
(206, '2017-04-11 15:59:04', '45.76.207.98', 'Chrome'),
(207, '2017-04-11 15:59:23', '180.214.233.30', 'Chrome'),
(208, '2017-04-11 15:59:28', '36.78.97.242', 'Mozilla'),
(209, '2017-04-11 15:59:58', '61.94.220.130', 'Chrome'),
(210, '2017-04-11 16:00:03', '8.37.230.63', 'Safari'),
(211, '2017-04-11 16:00:20', '125.162.99.169', 'Chrome'),
(212, '2017-04-11 16:00:31', '223.255.227.25', 'Chrome'),
(213, '2017-04-11 16:01:07', '114.121.244.144', 'Chrome'),
(214, '2017-04-11 16:01:24', '114.125.214.143', 'Chrome'),
(215, '2017-04-11 16:01:43', '8.37.235.230', 'Safari'),
(216, '2017-04-11 16:01:49', '120.188.86.129', 'Chrome'),
(217, '2017-04-11 16:02:10', '120.188.74.41', 'Chrome'),
(218, '2017-04-11 16:02:25', '115.178.239.193', 'Chrome'),
(219, '2017-04-11 16:02:49', '202.67.46.8', 'Chrome'),
(220, '2017-04-11 16:02:56', '36.80.211.28', 'Chrome'),
(221, '2017-04-11 16:03:54', '139.195.162.58', 'Chrome'),
(222, '2017-04-11 16:04:16', '202.154.180.10', 'Chrome'),
(223, '2017-04-11 16:04:34', '114.125.184.7', 'Chrome'),
(224, '2017-04-11 16:05:01', '120.188.85.253', 'Chrome'),
(225, '2017-04-11 16:05:32', '139.195.209.21', 'Chrome'),
(226, '2017-04-11 16:05:57', '120.188.33.114', 'Chrome'),
(227, '2017-04-11 16:06:03', '8.37.233.52', 'Safari'),
(228, '2017-04-11 16:06:09', '36.79.130.99', 'Chrome'),
(229, '2017-04-11 16:06:21', '36.74.24.2', 'Chrome'),
(230, '2017-04-11 16:06:43', '114.125.186.131', 'Chrome'),
(231, '2017-04-11 16:06:45', '202.62.17.197', 'Chrome'),
(232, '2017-04-11 16:07:31', '118.96.232.253', 'Chrome'),
(233, '2017-04-11 16:08:05', '36.79.188.51', 'Chrome'),
(234, '2017-04-11 16:08:13', '36.74.122.45', 'Chrome'),
(235, '2017-04-11 16:08:23', '36.84.110.69', 'Chrome'),
(236, '2017-04-11 16:08:23', '112.215.172.153', 'Chrome'),
(237, '2017-04-11 16:08:37', '36.82.30.206', 'Chrome'),
(238, '2017-04-11 16:09:03', '180.214.232.2', 'Chrome'),
(239, '2017-04-11 16:09:38', '107.167.112.128', 'Opera'),
(240, '2017-04-11 16:09:40', '36.70.178.105', 'Chrome'),
(241, '2017-04-11 16:09:55', '139.195.130.19', 'Chrome'),
(242, '2017-04-11 16:10:31', '114.125.57.214', 'Chrome'),
(243, '2017-04-11 16:10:41', '120.188.85.184', 'Chrome'),
(244, '2017-04-11 16:10:52', '125.163.107.41', 'Firefox'),
(245, '2017-04-11 16:11:15', '114.125.41.144', 'Chrome'),
(246, '2017-04-11 16:11:21', '61.94.103.59', 'Chrome'),
(247, '2017-04-11 16:12:08', '36.76.30.210', 'Chrome'),
(248, '2017-04-11 16:12:26', '36.73.134.193', 'Chrome'),
(249, '2017-04-11 16:12:31', '112.215.173.16', 'Chrome'),
(250, '2017-04-11 16:13:18', '120.188.92.195', 'Chrome'),
(251, '2017-04-11 16:13:20', '125.163.92.209', 'Chrome'),
(252, '2017-04-11 16:14:19', '182.253.142.24', 'Chrome'),
(253, '2017-04-11 16:14:28', '120.188.86.148', 'Chrome'),
(254, '2017-04-11 16:14:56', '182.253.163.61', 'Chrome'),
(255, '2017-04-11 16:16:02', '36.74.148.31', 'Chrome'),
(256, '2017-04-11 16:16:57', '8.37.233.156', 'Safari'),
(257, '2017-04-11 16:17:04', '114.125.56.121', 'Firefox'),
(258, '2017-04-11 16:17:12', '158.140.165.20', 'Chrome'),
(259, '2017-04-11 16:17:17', '125.164.97.226', 'Chrome'),
(260, '2017-04-11 16:17:18', '120.188.92.249', 'Chrome'),
(261, '2017-04-11 16:17:26', '118.137.208.31', 'Chrome'),
(262, '2017-04-11 16:17:30', '180.244.71.107', 'Chrome'),
(263, '2017-04-11 16:17:37', '120.188.87.220', 'Chrome'),
(264, '2017-04-11 16:17:57', '112.215.172.199', 'Safari'),
(265, '2017-04-11 16:18:23', '110.138.44.236', 'Chrome'),
(266, '2017-04-11 16:18:35', '168.235.195.254', 'Safari'),
(267, '2017-04-11 16:18:40', '180.245.98.188', 'Chrome'),
(268, '2017-04-11 16:18:58', '114.125.183.102', 'Chrome'),
(269, '2017-04-11 16:19:18', '125.164.38.13', 'Chrome'),
(270, '2017-04-11 16:19:27', '114.121.239.102', 'Chrome'),
(271, '2017-04-11 16:20:03', '168.235.206.137', 'Safari'),
(272, '2017-04-11 16:20:32', '202.80.213.87', 'Chrome'),
(273, '2017-04-11 16:21:18', '180.246.73.3', 'Chrome'),
(274, '2017-04-11 16:22:02', '36.75.32.145', 'Mozilla'),
(275, '2017-04-11 16:22:04', '112.215.154.115', 'Chrome'),
(276, '2017-04-11 16:22:09', '36.73.96.185', 'Mozilla'),
(277, '2017-04-11 16:22:38', '8.37.232.215', 'Safari'),
(278, '2017-04-11 16:22:53', '36.68.233.0', 'Chrome'),
(279, '2017-04-11 16:23:08', '36.84.224.73', 'Chrome'),
(280, '2017-04-11 16:23:29', '66.220.151.86', 'Other'),
(281, '2017-04-11 16:24:01', '120.188.75.121', 'Chrome'),
(282, '2017-04-11 16:24:19', '207.241.226.233', 'Mozilla'),
(283, '2017-04-11 16:24:35', '36.73.181.116', 'Chrome'),
(284, '2017-04-11 16:25:38', '198.186.192.44', 'Other'),
(285, '2017-04-11 16:25:56', '114.4.78.117', 'Chrome'),
(286, '2017-04-11 16:26:38', '36.72.95.85', 'Firefox'),
(287, '2017-04-11 16:27:26', '120.188.81.107', 'Chrome'),
(288, '2017-04-11 16:28:19', '114.124.149.112', 'Chrome'),
(289, '2017-04-11 16:28:29', '114.125.205.41', 'Chrome'),
(290, '2017-04-11 16:28:54', '125.163.78.202', 'Chrome'),
(291, '2017-04-11 16:29:17', '114.125.52.130', 'Firefox'),
(292, '2017-04-11 16:29:45', '114.4.78.150', 'Chrome'),
(293, '2017-04-11 16:29:47', '114.121.156.129', 'Chrome'),
(294, '2017-04-11 16:29:51', '112.215.172.8', 'Chrome'),
(295, '2017-04-11 16:30:30', '114.125.166.163', 'Chrome'),
(296, '2017-04-11 16:30:35', '139.195.187.141', 'Chrome'),
(297, '2017-04-11 16:30:53', '36.72.21.12', 'Chrome'),
(298, '2017-04-11 16:32:34', '8.37.225.108', 'Firefox'),
(299, '2017-04-11 16:32:39', '180.248.6.118', 'Chrome'),
(300, '2017-04-11 16:33:44', '8.37.233.95', 'Safari'),
(301, '2017-04-11 16:34:16', '120.188.80.6', 'Safari'),
(302, '2017-04-11 16:34:52', '211.227.156.112', 'Chrome'),
(303, '2017-04-11 16:34:54', '125.167.187.126', 'Chrome'),
(304, '2017-04-11 16:35:32', '107.167.112.72', 'Chrome'),
(305, '2017-04-11 16:35:57', '112.215.152.98', 'Mozilla'),
(306, '2017-04-11 16:36:06', '180.251.167.150', 'Chrome'),
(307, '2017-04-11 16:36:27', '36.82.76.215', 'Chrome'),
(308, '2017-04-11 16:37:45', '168.235.206.238', 'Safari'),
(309, '2017-04-11 16:38:09', '124.153.33.39', 'Chrome'),
(310, '2017-04-11 16:38:39', '168.235.197.19', 'Firefox'),
(311, '2017-04-11 16:38:44', '36.73.87.46', 'Chrome'),
(312, '2017-04-11 16:38:45', '188.166.218.174', 'Firefox'),
(313, '2017-04-11 16:39:03', '36.78.54.201', 'Firefox'),
(314, '2017-04-11 16:39:24', '139.228.95.10', 'Chrome'),
(315, '2017-04-11 16:39:24', '120.188.80.114', 'Chrome'),
(316, '2017-04-11 16:39:35', '182.253.203.58', 'Chrome'),
(317, '2017-04-11 16:39:54', '36.78.66.34', 'Chrome'),
(318, '2017-04-11 16:40:56', '120.188.79.185', 'Mozilla'),
(319, '2017-04-11 16:41:35', '118.96.235.203', 'Chrome'),
(320, '2017-04-11 16:41:44', '180.253.236.103', 'Chrome'),
(321, '2017-04-11 16:43:18', '125.161.188.207', 'Chrome'),
(322, '2017-04-11 16:44:08', '36.66.72.178', 'Chrome'),
(323, '2017-04-11 16:44:16', '36.84.13.131', 'Chrome'),
(324, '2017-04-11 16:44:46', '112.215.45.240', 'Firefox'),
(325, '2017-04-11 16:45:01', '49.182.76.246', 'Chrome'),
(326, '2017-04-11 16:45:09', '180.247.77.200', 'Chrome'),
(327, '2017-04-11 16:45:19', '36.88.158.84', 'Chrome'),
(328, '2017-04-11 16:45:38', '202.62.17.12', 'Chrome'),
(329, '2017-04-11 16:46:05', '182.253.163.51', 'Firefox'),
(330, '2017-04-11 16:46:11', '139.195.94.117', 'Chrome'),
(331, '2017-04-11 16:46:41', '114.4.83.68', 'Chrome'),
(332, '2017-04-11 16:47:30', '114.125.37.46', 'Safari'),
(333, '2017-04-11 16:47:32', '173.252.74.105', 'Other'),
(334, '2017-04-11 16:49:04', '112.215.200.30', 'Chrome'),
(335, '2017-04-11 16:50:22', '120.188.81.20', 'Chrome'),
(336, '2017-04-11 16:50:32', '120.188.33.140', 'Chrome'),
(337, '2017-04-11 16:51:06', '114.4.79.120', 'Chrome'),
(338, '2017-04-11 16:51:27', '139.194.221.74', 'Chrome'),
(339, '2017-04-11 16:51:29', '120.188.87.99', 'Firefox'),
(340, '2017-04-11 16:51:48', '36.73.62.30', 'Chrome'),
(341, '2017-04-11 16:51:53', '112.215.45.120', 'Firefox'),
(342, '2017-04-11 16:51:54', '112.215.153.184', 'Safari'),
(343, '2017-04-11 16:51:59', '36.78.67.111', 'Chrome'),
(344, '2017-04-11 16:52:31', '120.188.80.165', 'Chrome'),
(345, '2017-04-11 16:52:37', '61.94.100.166', 'Chrome'),
(346, '2017-04-11 16:52:48', '180.252.168.2', 'Chrome'),
(347, '2017-04-11 16:52:50', '36.84.64.22', 'Chrome'),
(348, '2017-04-11 16:52:56', '198.144.107.187', 'Chrome'),
(349, '2017-04-11 16:53:42', '120.188.80.158', 'Chrome'),
(350, '2017-04-11 16:54:47', '180.244.55.126', 'Chrome'),
(351, '2017-04-11 16:55:18', '107.167.112.118', 'Opera'),
(352, '2017-04-11 16:55:43', '36.73.63.156', 'Chrome'),
(353, '2017-04-11 16:56:44', '125.167.92.123', 'Safari'),
(354, '2017-04-11 16:58:15', '180.247.136.78', 'Chrome'),
(355, '2017-04-11 16:59:23', '114.124.148.228', 'Chrome'),
(356, '2017-04-11 16:59:44', '120.188.80.220', 'Chrome'),
(357, '2017-04-11 16:59:50', '180.248.179.126', 'Chrome'),
(358, '2017-04-11 17:00:03', '36.78.194.86', 'Chrome'),
(359, '2017-04-11 17:00:12', '202.67.46.46', 'Chrome'),
(360, '2017-04-11 17:00:34', '113.210.202.42', 'Chrome'),
(361, '2017-04-11 17:01:47', '114.120.233.30', 'Chrome'),
(362, '2017-04-11 17:02:34', '202.182.55.230', 'Chrome'),
(363, '2017-04-11 17:02:44', '180.244.73.72', 'Chrome'),
(364, '2017-04-11 17:03:16', '49.213.16.227', 'Chrome'),
(365, '2017-04-11 17:04:03', '36.73.177.201', 'Chrome'),
(366, '2017-04-11 17:04:12', '112.215.152.124', 'Chrome'),
(367, '2017-04-11 17:08:38', '120.188.0.47', 'Chrome'),
(368, '2017-04-11 17:09:43', '36.84.58.187', 'Chrome'),
(369, '2017-04-11 17:12:18', '111.94.229.133', 'Chrome'),
(370, '2017-04-11 17:12:31', '118.136.18.255', 'Chrome'),
(371, '2017-04-11 17:13:11', '36.74.212.125', 'Chrome'),
(372, '2017-04-11 17:13:20', '103.206.245.142', 'Chrome'),
(373, '2017-04-11 17:14:21', '36.71.129.27', 'Chrome'),
(374, '2017-04-11 17:18:44', '180.252.123.165', 'Chrome'),
(375, '2017-04-11 17:19:01', '180.253.138.223', 'Chrome'),
(376, '2017-04-11 17:19:11', '66.249.79.83', 'Googlebot'),
(377, '2017-04-11 17:19:27', '36.80.242.230', 'Chrome'),
(378, '2017-04-11 17:19:54', '223.255.231.154', 'Chrome'),
(379, '2017-04-11 17:19:55', '114.125.200.74', 'Chrome'),
(380, '2017-04-11 17:21:24', '66.249.79.78', 'Googlebot'),
(381, '2017-04-11 17:21:45', '114.4.83.180', 'Mozilla'),
(382, '2017-04-11 17:23:55', '139.192.11.235', 'Chrome'),
(383, '2017-04-11 17:24:10', '125.160.66.244', 'Firefox'),
(384, '2017-04-11 17:24:17', '112.215.170.139', 'Chrome'),
(385, '2017-04-11 17:25:01', '112.215.153.158', 'Safari'),
(386, '2017-04-11 17:25:29', '110.139.187.176', 'Chrome'),
(387, '2017-04-11 17:25:38', '111.94.122.151', 'Chrome'),
(388, '2017-04-11 17:25:46', '112.215.153.252', 'Chrome'),
(389, '2017-04-11 17:27:24', '112.215.170.48', 'Chrome'),
(390, '2017-04-11 17:28:36', '125.160.51.241', 'Chrome'),
(391, '2017-04-11 17:29:53', '66.249.79.85', 'Googlebot'),
(392, '2017-04-11 17:30:04', '120.188.83.178', 'Chrome'),
(393, '2017-04-11 17:30:26', '112.215.170.170', 'Chrome'),
(394, '2017-04-11 17:30:27', '139.228.17.159', 'Chrome'),
(395, '2017-04-11 17:30:32', '107.167.112.5', 'Opera'),
(396, '2017-04-11 17:31:33', '180.249.17.245', 'Chrome'),
(397, '2017-04-11 17:31:38', '182.253.163.14', 'Chrome'),
(398, '2017-04-11 17:32:08', '202.80.215.217', 'Chrome'),
(399, '2017-04-11 17:32:45', '120.188.95.126', 'Chrome'),
(400, '2017-04-11 17:32:55', '118.136.247.154', 'Firefox'),
(401, '2017-04-11 17:33:04', '66.102.6.211', 'Chrome'),
(402, '2017-04-11 17:33:04', '66.102.6.207', 'Chrome'),
(403, '2017-04-11 17:33:05', '66.102.6.209', 'Chrome'),
(404, '2017-04-11 17:34:10', '36.84.9.122', 'Firefox'),
(405, '2017-04-11 17:34:34', '120.188.94.195', 'Chrome'),
(406, '2017-04-11 17:34:55', '36.84.2.91', 'Chrome'),
(407, '2017-04-11 17:35:12', '125.164.16.170', 'Chrome'),
(408, '2017-04-11 17:35:35', '125.164.15.224', 'Chrome'),
(409, '2017-04-11 17:36:04', '114.125.70.243', 'Chrome'),
(410, '2017-04-11 17:36:29', '180.241.222.250', 'Chrome'),
(411, '2017-04-11 17:36:55', '112.215.44.57', 'Safari'),
(412, '2017-04-11 17:39:53', '114.4.82.125', 'Chrome'),
(413, '2017-04-11 17:39:58', '120.188.5.175', 'Chrome'),
(414, '2017-04-11 17:40:27', '103.233.157.202', 'Chrome'),
(415, '2017-04-11 17:44:13', '37.34.62.205', 'Other'),
(416, '2017-04-11 17:45:37', '120.188.32.191', 'Chrome'),
(417, '2017-04-11 17:46:53', '168.235.198.107', 'Safari'),
(418, '2017-04-11 17:47:00', '36.84.0.75', 'Chrome'),
(419, '2017-04-11 17:47:43', '182.253.163.7', 'Chrome'),
(420, '2017-04-11 17:47:49', '36.68.52.209', 'Safari'),
(421, '2017-04-11 17:48:03', '103.47.132.52', 'Chrome'),
(422, '2017-04-11 17:49:58', '36.66.211.11', 'Chrome'),
(423, '2017-04-11 17:50:12', '112.215.171.166', 'Chrome'),
(424, '2017-04-11 17:51:49', '103.4.167.243', 'Chrome'),
(425, '2017-04-11 17:51:51', '120.188.85.6', 'Chrome'),
(426, '2017-04-11 17:52:02', '120.188.81.83', 'Chrome'),
(427, '2017-04-11 17:52:52', '120.188.83.233', 'Chrome'),
(428, '2017-04-11 17:53:37', '125.165.48.195', 'Firefox'),
(429, '2017-04-11 17:54:20', '203.130.236.249', 'Chrome'),
(430, '2017-04-11 17:54:28', '115.178.238.196', 'Mozilla'),
(431, '2017-04-11 17:54:49', '202.179.189.74', 'Mozilla'),
(432, '2017-04-11 17:56:50', '182.253.62.114', 'Chrome'),
(433, '2017-04-11 17:57:37', '112.215.154.28', 'Chrome'),
(434, '2017-04-11 17:57:53', '110.137.169.204', 'Chrome'),
(435, '2017-04-11 17:57:56', '223.255.227.26', 'Chrome'),
(436, '2017-04-11 17:58:01', '112.215.63.20', 'Chrome'),
(437, '2017-04-11 17:58:46', '139.194.53.216', 'Chrome'),
(438, '2017-04-11 17:59:15', '27.50.17.11', 'Chrome'),
(439, '2017-04-11 17:59:34', '182.253.163.50', 'Firefox'),
(440, '2017-04-11 17:59:47', '36.76.123.254', 'Chrome'),
(441, '2017-04-11 18:00:20', '103.47.132.22', 'Chrome'),
(442, '2017-04-11 18:00:30', '8.37.233.83', 'Safari'),
(443, '2017-04-11 18:00:46', '114.125.180.165', 'Chrome'),
(444, '2017-04-11 18:01:39', '180.252.143.230', 'Chrome'),
(445, '2017-04-11 18:01:45', '163.53.185.146', 'Chrome'),
(446, '2017-04-11 18:02:33', '114.125.207.121', 'Chrome'),
(447, '2017-04-11 18:02:40', '36.72.9.120', 'Chrome'),
(448, '2017-04-11 18:04:44', '61.5.60.185', 'Chrome'),
(449, '2017-04-11 18:04:46', '36.80.153.97', 'Chrome'),
(450, '2017-04-11 18:05:41', '180.252.239.223', 'Chrome'),
(451, '2017-04-11 18:07:10', '120.188.33.120', 'Chrome'),
(452, '2017-04-11 18:07:10', '118.97.50.22', 'Chrome'),
(453, '2017-04-11 18:08:05', '118.97.50.23', 'Chrome'),
(454, '2017-04-11 18:09:09', '36.84.229.118', 'Chrome'),
(455, '2017-04-11 18:09:12', '114.125.11.225', 'Chrome'),
(456, '2017-04-11 18:09:49', '182.23.59.66', 'Firefox'),
(457, '2017-04-11 18:10:16', '118.97.50.24', 'Chrome'),
(458, '2017-04-11 18:10:59', '175.111.91.19', 'Firefox'),
(459, '2017-04-11 18:11:01', '121.101.131.66', 'Chrome'),
(460, '2017-04-11 18:11:16', '2.235.170.197', 'Chrome'),
(461, '2017-04-11 18:11:43', '180.247.185.142', 'Chrome'),
(462, '2017-04-11 18:12:38', '36.80.179.43', 'Firefox'),
(463, '2017-04-11 18:12:53', '36.75.240.166', 'Chrome'),
(464, '2017-04-11 18:13:31', '118.97.241.130', 'Chrome'),
(465, '2017-04-11 18:13:31', '101.128.85.22', 'Chrome'),
(466, '2017-04-11 18:13:48', '182.253.122.110', 'Chrome'),
(467, '2017-04-11 18:14:31', '120.188.65.57', 'Chrome'),
(468, '2017-04-11 18:14:38', '115.164.60.248', 'Chrome'),
(469, '2017-04-11 18:14:42', '180.250.206.226', 'Chrome'),
(470, '2017-04-11 18:15:06', '125.165.103.49', 'Chrome'),
(471, '2017-04-11 18:15:25', '104.237.243.90', 'Firefox'),
(472, '2017-04-11 18:15:30', '180.254.241.158', 'Chrome'),
(473, '2017-04-11 18:15:50', '36.85.5.162', 'Chrome'),
(474, '2017-04-11 18:15:56', '120.188.67.11', 'Chrome'),
(475, '2017-04-11 18:15:58', '38.80.23.2', 'Firefox'),
(476, '2017-04-11 18:16:01', '61.94.194.3', 'Chrome'),
(477, '2017-04-11 18:16:02', '222.124.22.228', 'Chrome'),
(478, '2017-04-11 18:16:07', '180.178.93.249', 'Chrome'),
(479, '2017-04-11 18:16:32', '36.80.213.229', 'Chrome'),
(480, '2017-04-11 18:17:27', '175.184.250.82', 'Chrome'),
(481, '2017-04-11 18:17:56', '103.31.109.2', 'Chrome'),
(482, '2017-04-11 18:18:11', '168.235.202.213', 'Safari'),
(483, '2017-04-11 18:18:43', '120.188.85.102', 'Chrome'),
(484, '2017-04-11 18:18:49', '61.5.84.239', 'Chrome'),
(485, '2017-04-11 18:18:51', '36.73.220.140', 'Chrome'),
(486, '2017-04-11 18:18:57', '180.247.181.120', 'Chrome'),
(487, '2017-04-11 18:19:50', '36.73.22.116', 'Chrome'),
(488, '2017-04-11 18:21:09', '36.84.229.80', 'Chrome'),
(489, '2017-04-11 18:21:23', '120.188.67.170', 'Chrome'),
(490, '2017-04-11 18:21:24', '36.85.13.189', 'Chrome'),
(491, '2017-04-11 18:22:18', '66.96.246.66', 'Chrome'),
(492, '2017-04-11 18:22:48', '111.68.27.251', 'Chrome'),
(493, '2017-04-11 18:23:31', '202.80.212.117', 'Chrome'),
(494, '2017-04-11 18:23:59', '112.215.171.69', 'Mozilla'),
(495, '2017-04-11 18:24:35', '222.124.214.250', 'Chrome'),
(496, '2017-04-11 18:24:53', '140.0.203.15', 'Chrome'),
(497, '2017-04-11 18:24:58', '116.254.126.142', 'Chrome'),
(498, '2017-04-11 18:25:13', '120.188.66.255', 'Chrome'),
(499, '2017-04-11 18:25:33', '168.235.194.213', 'Safari'),
(500, '2017-04-11 18:25:48', '114.125.9.160', 'Safari'),
(501, '2017-04-11 18:25:54', '112.215.201.184', 'Safari'),
(502, '2017-04-11 18:25:57', '125.163.255.80', 'Chrome'),
(503, '2017-04-11 18:26:09', '168.235.200.204', 'Safari'),
(504, '2017-04-11 18:26:37', '128.199.233.142', 'Safari'),
(505, '2017-04-11 18:28:11', '112.215.154.169', 'Firefox'),
(506, '2017-04-11 18:28:25', '168.235.195.242', 'Safari'),
(507, '2017-04-11 18:29:06', '223.25.97.210', 'Chrome'),
(508, '2017-04-11 18:30:24', '203.176.183.20', 'Chrome'),
(509, '2017-04-11 18:30:50', '180.253.126.127', 'Chrome'),
(510, '2017-04-11 18:31:06', '36.78.129.171', 'Chrome'),
(511, '2017-04-11 18:33:51', '14.102.152.234', 'Chrome'),
(512, '2017-04-11 18:34:09', '8.37.230.53', 'Safari'),
(513, '2017-04-11 18:34:27', '112.215.172.183', 'Chrome'),
(514, '2017-04-11 18:35:45', '112.215.65.96', 'Safari'),
(515, '2017-04-11 18:36:42', '110.5.102.56', 'Chrome'),
(516, '2017-04-11 18:37:05', '114.121.246.246', 'Chrome'),
(517, '2017-04-11 18:37:17', '110.139.27.171', 'Chrome'),
(518, '2017-04-11 18:39:05', '120.188.65.207', 'Chrome'),
(519, '2017-04-11 18:39:31', '180.254.64.231', 'Chrome'),
(520, '2017-04-11 18:39:34', '202.133.6.54', 'Chrome'),
(521, '2017-04-11 18:40:40', '36.68.41.249', 'Chrome'),
(522, '2017-04-11 18:43:08', '125.163.57.73', 'Chrome'),
(523, '2017-04-11 18:44:21', '114.121.157.148', 'Chrome'),
(524, '2017-04-11 18:44:46', '140.0.229.214', 'Chrome'),
(525, '2017-04-11 18:46:15', '103.55.216.76', 'Firefox'),
(526, '2017-04-11 18:47:25', '120.188.4.116', 'Chrome'),
(527, '2017-04-11 18:48:03', '202.124.205.203', 'Mozilla'),
(528, '2017-04-11 18:48:11', '202.80.212.84', 'Chrome'),
(529, '2017-04-11 18:48:52', '36.74.26.7', 'Chrome'),
(530, '2017-04-11 18:48:52', '210.57.215.142', 'Chrome'),
(531, '2017-04-11 18:48:56', '202.43.183.130', 'Chrome'),
(532, '2017-04-11 18:49:16', '61.94.50.125', 'Chrome'),
(533, '2017-04-11 18:50:14', '139.192.185.41', 'Chrome'),
(534, '2017-04-11 18:50:46', '36.72.118.174', 'Chrome'),
(535, '2017-04-11 18:51:16', '118.136.225.170', 'Chrome'),
(536, '2017-04-11 18:51:48', '202.67.46.40', 'Chrome'),
(537, '2017-04-11 18:52:04', '182.253.33.51', 'Firefox'),
(538, '2017-04-11 18:52:06', '180.254.26.52', 'Chrome'),
(539, '2017-04-11 18:52:07', '36.66.168.63', 'Chrome'),
(540, '2017-04-11 18:52:24', '112.215.45.116', 'Firefox'),
(541, '2017-04-11 18:52:52', '112.215.172.67', 'Chrome'),
(542, '2017-04-11 18:54:21', '180.245.67.128', 'Chrome'),
(543, '2017-04-11 18:55:01', '36.83.178.178', 'Chrome'),
(544, '2017-04-11 18:55:10', '118.96.213.178', 'Firefox'),
(545, '2017-04-11 18:56:30', '114.125.170.252', 'Chrome'),
(546, '2017-04-11 18:56:43', '124.153.32.100', 'Chrome'),
(547, '2017-04-11 18:57:11', '120.188.74.139', 'Mozilla'),
(548, '2017-04-11 18:57:47', '124.153.33.42', 'Mozilla'),
(549, '2017-04-11 18:58:44', '36.78.128.112', 'Firefox'),
(550, '2017-04-11 18:59:10', '103.228.26.4', 'Chrome'),
(551, '2017-04-11 19:00:17', '36.82.101.17', 'Chrome'),
(552, '2017-04-11 19:01:21', '139.0.54.49', 'Chrome'),
(553, '2017-04-11 19:01:23', '180.252.103.36', 'Mozilla'),
(554, '2017-04-11 19:01:33', '117.102.64.82', 'Firefox'),
(555, '2017-04-11 19:03:59', '202.67.44.8', 'Chrome'),
(556, '2017-04-11 19:04:16', '114.125.26.15', 'Chrome'),
(557, '2017-04-11 19:04:23', '180.246.224.105', 'Chrome'),
(558, '2017-04-11 19:05:05', '112.215.170.35', 'Mozilla'),
(559, '2017-04-11 19:05:33', '180.251.217.107', 'Chrome'),
(560, '2017-04-11 19:06:35', '36.84.39.119', 'Chrome'),
(561, '2017-04-11 19:07:10', '103.241.206.74', 'Chrome'),
(562, '2017-04-11 19:08:18', '203.160.128.8', 'Chrome'),
(563, '2017-04-11 19:09:24', '36.71.230.230', 'Chrome'),
(564, '2017-04-11 19:09:33', '118.136.40.213', 'Chrome'),
(565, '2017-04-11 19:10:26', '8.37.225.146', 'Firefox'),
(566, '2017-04-11 19:10:27', '180.251.6.162', 'Chrome'),
(567, '2017-04-11 19:10:34', '112.215.201.35', 'Chrome'),
(568, '2017-04-11 19:10:40', '120.188.64.132', 'Chrome'),
(569, '2017-04-11 19:11:13', '112.215.151.179', 'Chrome'),
(570, '2017-04-11 19:11:34', '107.167.99.205', 'Opera'),
(571, '2017-04-11 19:11:48', '210.211.18.82', 'Chrome'),
(572, '2017-04-11 19:11:51', '112.215.174.151', 'Chrome'),
(573, '2017-04-11 19:12:02', '120.188.73.159', 'Chrome'),
(574, '2017-04-11 19:13:39', '36.81.46.228', 'Chrome'),
(575, '2017-04-11 19:15:31', '36.77.89.224', 'Chrome'),
(576, '2017-04-11 19:16:10', '107.167.112.144', 'Chrome'),
(577, '2017-04-11 19:16:23', '125.165.178.198', 'Firefox'),
(578, '2017-04-11 19:16:50', '139.192.58.131', 'Chrome'),
(579, '2017-04-11 19:16:54', '36.69.12.48', 'Chrome'),
(580, '2017-04-11 19:17:14', '202.179.190.162', 'Chrome'),
(581, '2017-04-11 19:17:26', '36.78.33.42', 'Chrome'),
(582, '2017-04-11 19:17:48', '103.213.131.160', 'Chrome'),
(583, '2017-04-11 19:17:55', '36.85.24.1', 'Mozilla'),
(584, '2017-04-11 19:18:13', '202.158.89.154', 'Chrome'),
(585, '2017-04-11 19:19:02', '36.70.91.134', 'Firefox'),
(586, '2017-04-11 19:19:15', '114.125.30.235', 'Chrome'),
(587, '2017-04-11 19:19:52', '125.163.174.117', 'Chrome'),
(588, '2017-04-11 19:20:01', '103.17.246.48', 'Firefox'),
(589, '2017-04-11 19:21:22', '36.88.134.156', 'Chrome'),
(590, '2017-04-11 19:22:53', '120.188.5.152', 'Mozilla'),
(591, '2017-04-11 19:23:28', '114.124.33.225', 'Chrome'),
(592, '2017-04-11 19:23:44', '112.215.200.147', 'Chrome'),
(593, '2017-04-11 19:24:23', '180.253.125.143', 'Chrome'),
(594, '2017-04-11 19:24:30', '36.69.83.3', 'Chrome'),
(595, '2017-04-11 19:25:24', '36.68.118.78', 'Firefox'),
(596, '2017-04-11 19:25:36', '180.245.99.108', 'Chrome'),
(597, '2017-04-11 19:26:15', '8.37.225.106', 'Firefox'),
(598, '2017-04-11 19:26:16', '58.10.55.252', 'Chrome'),
(599, '2017-04-11 19:27:07', '36.73.65.61', 'Firefox'),
(600, '2017-04-11 19:27:18', '202.62.18.53', 'Chrome'),
(601, '2017-04-11 19:27:39', '180.243.101.157', 'Chrome'),
(602, '2017-04-11 19:29:40', '180.249.209.233', 'Chrome'),
(603, '2017-04-11 19:31:13', '120.188.7.226', 'Chrome'),
(604, '2017-04-11 19:31:29', '36.85.139.235', 'Firefox'),
(605, '2017-04-11 19:32:43', '203.142.64.87', 'Chrome'),
(606, '2017-04-11 19:33:19', '107.167.112.181', 'Opera'),
(607, '2017-04-11 19:34:05', '182.253.73.4', 'Firefox'),
(608, '2017-04-11 19:34:16', '110.136.57.170', 'Chrome'),
(609, '2017-04-11 19:38:24', '112.215.200.152', 'Mozilla'),
(610, '2017-04-11 19:38:37', '168.235.205.184', 'Safari'),
(611, '2017-04-11 19:39:48', '125.164.109.171', 'Chrome'),
(612, '2017-04-11 19:39:50', '36.73.58.152', 'Chrome'),
(613, '2017-04-11 19:40:16', '202.62.16.15', 'Chrome'),
(614, '2017-04-11 19:41:57', '36.73.54.54', 'Chrome'),
(615, '2017-04-11 19:42:26', '36.80.151.109', 'Firefox'),
(616, '2017-04-11 19:43:14', '202.67.40.199', 'Chrome'),
(617, '2017-04-11 19:43:29', '114.4.83.133', 'Chrome'),
(618, '2017-04-11 19:43:31', '173.193.202.116', 'Firefox'),
(619, '2017-04-11 19:44:18', '202.62.16.181', 'Chrome'),
(620, '2017-04-11 19:45:13', '167.114.233.118', 'Firefox'),
(621, '2017-04-11 19:45:30', '180.241.24.74', 'Chrome'),
(622, '2017-04-11 19:47:01', '125.166.212.190', 'Chrome'),
(623, '2017-04-11 19:47:21', '180.241.179.220', 'Chrome'),
(624, '2017-04-11 19:47:27', '125.167.75.246', 'Chrome'),
(625, '2017-04-11 19:47:48', '168.235.194.226', 'Safari'),
(626, '2017-04-11 19:52:01', '118.97.137.170', 'Chrome'),
(627, '2017-04-11 19:52:53', '180.247.208.196', 'Chrome'),
(628, '2017-04-11 19:54:25', '103.9.124.211', 'Chrome'),
(629, '2017-04-11 19:56:29', '120.188.94.118', 'Chrome'),
(630, '2017-04-11 19:56:33', '36.73.12.186', 'Firefox'),
(631, '2017-04-11 19:56:44', '36.66.254.39', 'Firefox'),
(632, '2017-04-11 19:57:28', '120.188.81.56', 'Chrome'),
(633, '2017-04-11 19:59:02', '36.82.7.245', 'Chrome'),
(634, '2017-04-11 19:59:36', '103.212.43.138', 'Chrome'),
(635, '2017-04-11 20:00:38', '139.193.114.21', 'Chrome'),
(636, '2017-04-11 20:00:50', '112.215.175.249', 'Firefox'),
(637, '2017-04-11 20:01:24', '120.188.33.237', 'Chrome'),
(638, '2017-04-11 20:01:53', '36.80.106.53', 'Chrome'),
(639, '2017-04-11 20:02:10', '36.84.0.88', 'Firefox'),
(640, '2017-04-11 20:03:00', '103.57.192.122', 'Chrome'),
(641, '2017-04-11 20:04:55', '36.72.190.47', 'Firefox'),
(642, '2017-04-11 20:06:41', '125.163.105.25', 'Chrome'),
(643, '2017-04-11 20:07:06', '115.178.234.139', 'Mozilla'),
(644, '2017-04-11 20:07:31', '114.120.234.114', 'Mozilla'),
(645, '2017-04-11 20:08:50', '202.67.46.227', 'Chrome'),
(646, '2017-04-11 20:09:22', '36.77.160.216', 'Chrome'),
(647, '2017-04-11 20:10:14', '139.193.15.145', 'Chrome'),
(648, '2017-04-11 20:10:47', '112.215.172.245', 'Chrome'),
(649, '2017-04-11 20:10:50', '207.241.226.232', 'Mozilla'),
(650, '2017-04-11 20:11:07', '120.188.0.239', 'Chrome'),
(651, '2017-04-11 20:11:09', '180.251.99.141', 'Chrome'),
(652, '2017-04-11 20:11:13', '125.162.56.58', 'Chrome'),
(653, '2017-04-11 20:11:39', '36.72.50.199', 'Chrome'),
(654, '2017-04-11 20:12:20', '139.194.66.128', 'Chrome'),
(655, '2017-04-11 20:12:55', '36.78.127.45', 'Firefox'),
(656, '2017-04-11 20:13:00', '36.74.170.244', 'Chrome'),
(657, '2017-04-11 20:13:59', '36.83.123.80', 'Chrome'),
(658, '2017-04-11 20:14:36', '36.84.13.207', 'Chrome'),
(659, '2017-04-11 20:14:50', '112.198.68.78', 'Chrome'),
(660, '2017-04-11 20:15:20', '180.251.88.168', 'Firefox'),
(661, '2017-04-11 20:15:32', '119.110.69.226', 'Chrome'),
(662, '2017-04-11 20:16:00', '36.85.65.250', 'Chrome'),
(663, '2017-04-11 20:16:43', '112.78.141.82', 'Firefox'),
(664, '2017-04-11 20:16:57', '125.163.59.51', 'Chrome'),
(665, '2017-04-11 20:17:19', '116.197.132.78', 'Firefox'),
(666, '2017-04-11 20:17:39', '120.188.67.180', 'Chrome'),
(667, '2017-04-11 20:18:27', '114.4.83.35', 'Chrome'),
(668, '2017-04-11 20:18:28', '125.162.19.20', 'Firefox'),
(669, '2017-04-11 20:18:29', '182.253.3.140', 'Chrome'),
(670, '2017-04-11 20:21:45', '36.78.130.219', 'Firefox'),
(671, '2017-04-11 20:24:05', '180.246.25.27', 'Firefox'),
(672, '2017-04-11 20:25:03', '202.150.146.82', 'Chrome'),
(673, '2017-04-11 20:25:05', '125.162.222.87', 'Mozilla'),
(674, '2017-04-11 20:25:34', '120.188.86.20', 'Chrome'),
(675, '2017-04-11 20:25:43', '125.163.109.106', 'Chrome'),
(676, '2017-04-11 20:26:12', '120.188.81.160', 'Chrome'),
(677, '2017-04-11 20:29:23', '175.111.89.10', 'Chrome'),
(678, '2017-04-11 20:30:27', '114.121.245.17', 'Mozilla'),
(679, '2017-04-11 20:32:54', '110.139.200.11', 'Chrome'),
(680, '2017-04-11 20:33:00', '114.125.52.89', 'Chrome'),
(681, '2017-04-11 20:33:25', '36.74.177.233', 'Chrome'),
(682, '2017-04-11 20:33:44', '180.254.162.29', 'Firefox'),
(683, '2017-04-11 20:33:53', '125.160.100.4', 'Chrome'),
(684, '2017-04-11 20:34:59', '202.77.111.104', 'Chrome'),
(685, '2017-04-11 20:35:16', '36.69.153.83', 'Chrome'),
(686, '2017-04-11 20:35:19', '180.254.13.225', 'Chrome'),
(687, '2017-04-11 20:35:24', '180.251.214.117', 'Chrome'),
(688, '2017-04-11 20:35:27', '36.74.134.188', 'Chrome'),
(689, '2017-04-11 20:35:41', '107.167.103.167', 'Opera'),
(690, '2017-04-11 20:36:56', '139.193.222.23', 'Chrome'),
(691, '2017-04-11 20:36:59', '182.253.72.87', 'Chrome'),
(692, '2017-04-11 20:37:10', '101.255.64.210', 'Chrome'),
(693, '2017-04-11 20:38:20', '36.69.60.79', 'Chrome'),
(694, '2017-04-11 20:38:34', '36.84.229.27', 'Firefox'),
(695, '2017-04-11 20:41:28', '202.62.16.239', 'Firefox'),
(696, '2017-04-11 20:41:42', '36.81.58.185', 'Chrome'),
(697, '2017-04-11 20:41:44', '112.215.152.52', 'Chrome'),
(698, '2017-04-11 20:42:08', '36.74.224.172', 'Chrome'),
(699, '2017-04-11 20:42:11', '112.215.200.247', 'Mozilla'),
(700, '2017-04-11 20:42:34', '112.215.153.115', 'Chrome'),
(701, '2017-04-11 20:42:58', '223.164.0.178', 'Chrome'),
(702, '2017-04-11 20:42:58', '36.72.62.17', 'Chrome'),
(703, '2017-04-11 20:43:38', '103.209.131.44', 'Firefox'),
(704, '2017-04-11 20:43:43', '139.195.33.29', 'Chrome'),
(705, '2017-04-11 20:44:51', '103.61.248.82', 'Chrome'),
(706, '2017-04-11 20:46:50', '175.103.43.86', 'Chrome'),
(707, '2017-04-11 20:47:49', '120.188.94.79', 'Chrome'),
(708, '2017-04-11 20:47:53', '202.169.46.130', 'Chrome'),
(709, '2017-04-11 20:48:37', '158.140.170.38', 'Chrome'),
(710, '2017-04-11 20:49:55', '180.245.193.140', 'Chrome'),
(711, '2017-04-11 20:50:24', '180.246.157.179', 'Chrome'),
(712, '2017-04-11 20:51:51', '36.76.23.139', 'Chrome'),
(713, '2017-04-11 20:52:06', '202.67.41.213', 'Chrome'),
(714, '2017-04-11 20:52:34', '36.78.163.149', 'Chrome'),
(715, '2017-04-11 20:53:12', '158.140.166.0', 'Chrome'),
(716, '2017-04-11 20:55:36', '207.244.86.209', 'Chrome'),
(717, '2017-04-11 20:56:35', '120.188.79.122', 'Chrome'),
(718, '2017-04-11 20:58:11', '36.73.104.74', 'Chrome'),
(719, '2017-04-11 20:58:21', '222.124.22.251', 'Firefox'),
(720, '2017-04-11 20:58:32', '120.188.93.249', 'Chrome'),
(721, '2017-04-11 21:02:03', '120.188.33.199', 'Chrome'),
(722, '2017-04-11 21:02:06', '125.161.64.96', 'Chrome'),
(723, '2017-04-11 21:03:41', '182.253.122.125', 'Chrome'),
(724, '2017-04-11 21:04:06', '36.68.234.47', 'Chrome'),
(725, '2017-04-11 21:04:33', '36.72.94.211', 'Chrome'),
(726, '2017-04-11 21:04:48', '125.163.125.211', 'Chrome'),
(727, '2017-04-11 21:04:52', '180.248.243.155', 'Chrome'),
(728, '2017-04-11 21:04:58', '182.253.34.175', 'Mozilla'),
(729, '2017-04-11 21:05:28', '103.24.49.225', 'Chrome'),
(730, '2017-04-11 21:06:42', '180.248.250.226', 'Chrome'),
(731, '2017-04-11 21:09:06', '36.84.157.255', 'Chrome'),
(732, '2017-04-11 21:09:09', '202.152.156.210', 'Firefox'),
(733, '2017-04-11 21:09:41', '114.125.53.87', 'Chrome'),
(734, '2017-04-11 21:09:43', '120.188.7.170', 'Chrome'),
(735, '2017-04-11 21:11:29', '152.118.148.226', 'Internet Explorer'),
(736, '2017-04-11 21:11:43', '182.253.188.125', 'Chrome'),
(737, '2017-04-11 21:12:47', '5.254.97.108', 'Chrome'),
(738, '2017-04-11 21:13:23', '120.188.3.109', 'Chrome'),
(739, '2017-04-11 21:14:38', '180.246.199.52', 'Chrome'),
(740, '2017-04-11 21:15:05', '210.211.17.14', 'Chrome'),
(741, '2017-04-11 21:15:59', '36.82.201.211', 'Chrome'),
(742, '2017-04-11 21:16:14', '103.23.102.111', 'Chrome'),
(743, '2017-04-11 21:17:19', '36.81.75.68', 'Chrome'),
(744, '2017-04-11 21:18:59', '114.125.39.153', 'Chrome'),
(745, '2017-04-11 21:20:34', '222.124.52.127', 'Chrome'),
(746, '2017-04-11 21:21:13', '180.248.199.49', 'Chrome'),
(747, '2017-04-11 21:22:00', '125.163.114.139', 'Chrome'),
(748, '2017-04-11 21:25:37', '107.167.99.151', 'Opera'),
(749, '2017-04-11 21:26:05', '114.125.116.95', 'Chrome'),
(750, '2017-04-11 21:26:49', '202.62.18.115', 'Chrome'),
(751, '2017-04-11 21:26:50', '61.8.69.82', 'Chrome'),
(752, '2017-04-11 21:28:31', '113.161.224.83', 'Chrome'),
(753, '2017-04-11 21:28:45', '103.47.132.24', 'Chrome'),
(754, '2017-04-11 21:29:03', '120.188.64.12', 'Chrome'),
(755, '2017-04-11 21:30:03', '103.47.134.26', 'Chrome'),
(756, '2017-04-11 21:30:29', '202.9.85.34', 'Chrome'),
(757, '2017-04-11 21:31:59', '182.253.62.142', 'Chrome'),
(758, '2017-04-11 21:32:07', '36.88.45.251', 'Chrome'),
(759, '2017-04-11 21:32:24', '114.121.133.17', 'Mozilla'),
(760, '2017-04-11 21:33:18', '190.233.193.231', 'Chrome'),
(761, '2017-04-11 21:33:41', '202.80.215.57', 'Chrome'),
(762, '2017-04-11 21:34:18', '115.178.216.124', 'Chrome'),
(763, '2017-04-11 21:37:01', '222.165.226.122', 'Firefox'),
(764, '2017-04-11 21:38:07', '36.82.13.155', 'Chrome'),
(765, '2017-04-11 21:38:30', '202.182.59.185', 'Firefox'),
(766, '2017-04-11 21:38:42', '103.21.206.66', 'Chrome'),
(767, '2017-04-11 21:39:14', '36.69.87.71', 'Chrome'),
(768, '2017-04-11 21:39:42', '43.247.13.202', 'Chrome'),
(769, '2017-04-11 21:40:08', '66.102.7.143', 'Chrome'),
(770, '2017-04-11 21:43:21', '168.235.195.74', 'Safari'),
(771, '2017-04-11 21:44:11', '103.8.12.99', 'Chrome'),
(772, '2017-04-11 21:44:14', '180.252.137.203', 'Chrome'),
(773, '2017-04-11 21:44:27', '36.87.53.20', 'Safari'),
(774, '2017-04-11 21:45:06', '114.125.87.178', 'Chrome'),
(775, '2017-04-11 21:46:04', '158.140.172.34', 'Chrome'),
(776, '2017-04-11 21:46:12', '61.94.132.66', 'Chrome'),
(777, '2017-04-11 21:47:36', '101.255.60.254', 'Chrome'),
(778, '2017-04-11 21:49:09', '36.74.102.19', 'Chrome'),
(779, '2017-04-11 21:49:42', '180.246.244.93', 'Chrome'),
(780, '2017-04-11 21:49:52', '118.97.151.193', 'Firefox'),
(781, '2017-04-11 21:50:01', '117.102.122.242', 'Chrome'),
(782, '2017-04-11 21:50:51', '36.71.249.134', 'Chrome'),
(783, '2017-04-11 21:51:54', '112.215.171.45', 'Chrome'),
(784, '2017-04-11 21:52:18', '103.241.5.116', 'Chrome'),
(785, '2017-04-11 21:52:31', '36.78.103.212', 'Chrome'),
(786, '2017-04-11 21:53:09', '36.72.80.127', 'Chrome'),
(787, '2017-04-11 21:54:12', '36.78.123.228', 'Chrome'),
(788, '2017-04-11 21:54:16', '36.68.235.225', 'Chrome'),
(789, '2017-04-11 21:54:37', '125.161.181.154', 'Firefox'),
(790, '2017-04-11 21:55:13', '36.80.164.131', 'Chrome'),
(791, '2017-04-11 21:56:15', '180.245.211.69', 'Chrome'),
(792, '2017-04-11 21:56:16', '125.167.186.204', 'Chrome'),
(793, '2017-04-11 21:57:34', '114.125.119.153', 'Chrome'),
(794, '2017-04-11 21:59:59', '114.121.234.35', 'Chrome'),
(795, '2017-04-11 22:02:26', '107.167.103.67', 'Opera'),
(796, '2017-04-11 22:02:47', '36.80.9.250', 'Chrome'),
(797, '2017-04-11 22:02:50', '36.88.62.43', 'Chrome'),
(798, '2017-04-11 22:02:57', '114.125.184.105', 'Chrome'),
(799, '2017-04-11 22:03:07', '185.182.81.53', 'Chrome'),
(800, '2017-04-11 22:04:44', '66.102.7.141', 'Chrome'),
(801, '2017-04-11 22:04:57', '36.88.158.219', 'Chrome'),
(802, '2017-04-11 22:06:25', '36.73.34.208', 'Chrome'),
(803, '2017-04-11 22:07:58', '36.74.20.46', 'Chrome'),
(804, '2017-04-11 22:08:28', '36.82.100.128', 'Chrome'),
(805, '2017-04-11 22:09:30', '112.215.65.245', 'Chrome'),
(806, '2017-04-11 22:09:42', '114.4.78.119', 'Chrome'),
(807, '2017-04-11 22:09:46', '110.137.171.177', 'Chrome'),
(808, '2017-04-11 22:09:47', '140.0.198.87', 'Mozilla'),
(809, '2017-04-11 22:10:20', '103.47.134.18', 'Chrome'),
(810, '2017-04-11 22:10:43', '36.66.46.34', 'Chrome'),
(811, '2017-04-11 22:11:32', '180.246.96.230', 'Chrome'),
(812, '2017-04-11 22:13:26', '146.185.31.213', 'Firefox'),
(813, '2017-04-11 22:18:49', '163.53.186.186', 'Firefox'),
(814, '2017-04-11 22:19:24', '202.62.16.98', 'Chrome'),
(815, '2017-04-11 22:21:09', '36.70.200.11', 'Chrome'),
(816, '2017-04-11 22:24:10', '112.215.45.58', 'Chrome'),
(817, '2017-04-11 22:25:14', '66.96.234.91', 'Chrome'),
(818, '2017-04-11 22:25:55', '103.66.199.34', 'Chrome'),
(819, '2017-04-11 22:26:53', '182.253.163.82', 'Chrome'),
(820, '2017-04-11 22:28:37', '103.3.44.1', 'Chrome'),
(821, '2017-04-11 22:29:22', '36.88.90.200', 'Chrome'),
(822, '2017-04-11 22:30:19', '180.254.255.166', 'Chrome'),
(823, '2017-04-11 22:30:24', '115.178.200.226', 'Chrome'),
(824, '2017-04-11 22:30:45', '120.188.1.120', 'Chrome'),
(825, '2017-04-11 22:32:14', '103.195.142.26', 'Chrome'),
(826, '2017-04-11 22:33:33', '120.188.0.9', 'Firefox'),
(827, '2017-04-11 22:35:18', '120.188.81.213', 'Chrome'),
(828, '2017-04-11 22:36:20', '182.253.131.41', 'Mozilla'),
(829, '2017-04-11 22:36:24', '8.37.234.123', 'Chrome'),
(830, '2017-04-11 22:36:27', '36.72.34.63', 'Chrome'),
(831, '2017-04-11 22:36:36', '115.178.239.80', 'Chrome'),
(832, '2017-04-11 22:36:54', '103.58.111.34', 'Chrome'),
(833, '2017-04-11 22:38:16', '8.37.225.224', 'Firefox'),
(834, '2017-04-11 22:38:19', '112.215.200.93', 'Chrome'),
(835, '2017-04-11 22:39:20', '120.188.92.156', 'Chrome'),
(836, '2017-04-11 22:39:27', '114.125.103.119', 'Chrome'),
(837, '2017-04-11 22:40:08', '107.167.112.73', 'Chrome'),
(838, '2017-04-11 22:42:02', '120.188.66.2', 'Chrome'),
(839, '2017-04-11 22:42:44', '36.72.134.144', 'Chrome'),
(840, '2017-04-11 22:43:13', '36.66.215.5', 'Firefox'),
(841, '2017-04-11 22:44:26', '114.125.101.241', 'Chrome'),
(842, '2017-04-11 22:45:36', '182.253.37.186', 'Firefox'),
(843, '2017-04-11 22:46:05', '114.125.117.183', 'Chrome'),
(844, '2017-04-11 22:46:05', '114.125.101.71', 'Chrome'),
(845, '2017-04-11 22:46:05', '114.125.101.255', 'Chrome'),
(846, '2017-04-11 22:47:28', '114.124.34.31', 'Mozilla'),
(847, '2017-04-11 22:48:28', '202.62.17.122', 'Chrome'),
(848, '2017-04-11 22:48:41', '139.192.131.90', 'Chrome'),
(849, '2017-04-11 22:52:52', '120.188.3.158', 'Chrome'),
(850, '2017-04-11 22:53:10', '200.77.128.224', 'Mozilla'),
(851, '2017-04-11 22:54:26', '112.215.151.215', 'Chrome'),
(852, '2017-04-11 22:55:40', '114.4.82.59', 'Chrome'),
(853, '2017-04-11 22:55:50', '36.79.229.121', 'Chrome'),
(854, '2017-04-11 22:57:41', '118.136.224.179', 'Chrome'),
(855, '2017-04-11 23:00:38', '202.67.41.242', 'Chrome'),
(856, '2017-04-11 23:01:11', '36.77.191.150', 'Mozilla'),
(857, '2017-04-11 23:01:26', '125.166.214.129', 'Chrome'),
(858, '2017-04-11 23:03:25', '202.93.231.81', 'Chrome'),
(859, '2017-04-11 23:03:40', '36.68.69.52', 'Chrome'),
(860, '2017-04-11 23:03:59', '112.215.152.222', 'Chrome'),
(861, '2017-04-11 23:04:55', '36.79.42.167', 'Chrome'),
(862, '2017-04-11 23:05:30', '103.47.134.3', 'Chrome'),
(863, '2017-04-11 23:10:29', '139.59.96.104', 'Chrome'),
(864, '2017-04-11 23:11:56', '36.73.101.192', 'Firefox'),
(865, '2017-04-11 23:12:39', '180.252.110.204', 'Chrome'),
(866, '2017-04-11 23:14:25', '36.84.224.105', 'Firefox'),
(867, '2017-04-11 23:15:20', '112.215.172.91', 'Chrome'),
(868, '2017-04-11 23:15:29', '43.252.159.29', 'Chrome'),
(869, '2017-04-11 23:16:19', '114.124.2.201', 'Chrome'),
(870, '2017-04-11 23:16:52', '103.77.50.21', 'Chrome'),
(871, '2017-04-11 23:18:18', '114.125.215.48', 'Mozilla'),
(872, '2017-04-11 23:19:02', '202.62.17.10', 'Chrome'),
(873, '2017-04-11 23:20:03', '202.93.231.70', 'Firefox'),
(874, '2017-04-11 23:20:33', '103.47.134.15', 'Firefox'),
(875, '2017-04-11 23:22:24', '120.188.77.49', 'Firefox'),
(876, '2017-04-11 23:22:51', '120.188.3.239', 'Chrome'),
(877, '2017-04-11 23:24:00', '180.189.162.131', 'Chrome'),
(878, '2017-04-11 23:24:20', '36.83.36.137', 'Chrome'),
(879, '2017-04-11 23:26:02', '175.111.89.42', 'Chrome'),
(880, '2017-04-11 23:26:56', '213.171.207.70', 'Chrome'),
(881, '2017-04-11 23:27:42', '180.252.173.112', 'Chrome'),
(882, '2017-04-11 23:28:22', '115.178.234.185', 'Chrome'),
(883, '2017-04-11 23:28:28', '36.77.83.38', 'Chrome'),
(884, '2017-04-11 23:29:16', '103.248.248.86', 'Chrome'),
(885, '2017-04-11 23:29:32', '180.254.74.221', 'Chrome'),
(886, '2017-04-11 23:29:39', '36.78.55.37', 'Firefox'),
(887, '2017-04-11 23:29:48', '112.78.191.34', 'Chrome'),
(888, '2017-04-11 23:30:04', '120.188.81.161', 'Chrome'),
(889, '2017-04-11 23:30:08', '115.178.201.60', 'Chrome'),
(890, '2017-04-11 23:31:14', '36.72.202.102', 'Chrome'),
(891, '2017-04-11 23:31:58', '120.188.79.93', 'Chrome'),
(892, '2017-04-11 23:33:26', '36.80.202.16', 'Firefox'),
(893, '2017-04-11 23:35:32', '139.194.22.183', 'Chrome'),
(894, '2017-04-11 23:38:11', '120.188.87.248', 'Chrome'),
(895, '2017-04-11 23:38:30', '182.253.163.75', 'Chrome'),
(896, '2017-04-11 23:39:26', '103.213.128.19', 'Chrome'),
(897, '2017-04-11 23:40:11', '202.169.53.3', 'Firefox'),
(898, '2017-04-11 23:41:53', '202.67.40.1', 'Chrome'),
(899, '2017-04-11 23:43:22', '120.188.66.119', 'Chrome'),
(900, '2017-04-11 23:43:42', '36.74.115.169', 'Chrome'),
(901, '2017-04-11 23:46:07', '103.47.132.27', 'Chrome'),
(902, '2017-04-11 23:46:19', '180.241.75.46', 'Mozilla'),
(903, '2017-04-11 23:46:19', '36.84.228.213', 'Chrome'),
(904, '2017-04-11 23:46:44', '118.136.88.249', 'Chrome'),
(905, '2017-04-11 23:49:50', '120.188.83.242', 'Chrome'),
(906, '2017-04-11 23:49:52', '36.77.137.120', 'Chrome');
INSERT INTO `tbl_pengunjung` (`pengunjung_id`, `pengunjung_tanggal`, `pengunjung_ip`, `pengunjung_perangkat`) VALUES
(907, '2017-05-01 12:24:03', '::1', NULL),
(908, '2017-05-01 12:24:53', '::1', NULL),
(909, '2017-05-01 12:25:57', '::1', NULL),
(910, '2017-05-01 17:13:50', '::1', NULL),
(911, '2017-05-01 18:26:09', '::1', NULL),
(912, '2017-05-06 14:43:17', '::1', 'Firefox'),
(913, '2017-05-07 02:18:38', '::1', 'Firefox'),
(914, '2017-05-13 12:19:10', '::1', 'Firefox'),
(915, '2017-05-13 17:08:02', '::1', 'Firefox'),
(916, '2017-05-16 12:30:09', '::1', 'Firefox'),
(917, '2017-05-17 07:46:05', '::1', 'Firefox'),
(918, '2017-05-23 05:01:55', '::1', 'Firefox'),
(919, '2017-06-01 15:37:00', '::1', 'Firefox'),
(920, '2017-06-21 00:48:57', '::1', 'Firefox'),
(921, '2017-06-21 22:58:34', '::1', 'Firefox'),
(922, '2017-06-23 23:00:36', '::1', 'Firefox'),
(923, '2017-06-26 22:25:17', '::1', 'Firefox'),
(924, '2017-07-01 01:10:04', '::1', 'Firefox'),
(925, '2020-06-25 11:40:23', '::1', 'Chrome'),
(926, '2020-06-25 23:24:23', '::1', 'Chrome'),
(927, '2020-07-06 10:00:20', '::1', 'Chrome'),
(928, '2020-07-21 09:37:22', '::1', 'Chrome'),
(929, '2020-07-22 06:38:12', '::1', 'Chrome'),
(930, '2020-07-30 02:55:07', '::1', 'Chrome'),
(931, '2020-09-25 01:21:29', '::1', 'Chrome'),
(932, '2020-09-28 03:10:44', '::1', 'Chrome'),
(933, '2020-11-13 23:15:38', '::1', 'Chrome'),
(934, '2021-02-08 02:48:50', '::1', 'Chrome'),
(935, '2021-03-01 14:16:03', '::1', 'Chrome');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `siswa_id` int(11) NOT NULL,
  `siswa_nis` varchar(20) DEFAULT NULL,
  `siswa_nama` varchar(70) DEFAULT NULL,
  `siswa_jenkel` varchar(2) DEFAULT NULL,
  `siswa_kelas_id` int(11) DEFAULT NULL,
  `siswa_photo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`siswa_id`, `siswa_nis`, `siswa_nama`, `siswa_jenkel`, `siswa_kelas_id`, `siswa_photo`) VALUES
(1, '9287482', 'Alvaro Sanchez', 'L', 8, '083d547659a2d4bb15c0322d15955da5.png'),
(2, '9287483', 'Ririn Cantika', 'P', 8, '74eec6ad37550cc12fe8fa83d46878af.jpg'),
(4, '123083', 'Ari Hidayat', 'L', 1, 'e371e67618ad53c99de380782c373023.png'),
(5, '123084', 'Irma Chaiyo', 'P', 1, '1e148b42c71562841ba3018fc97b748a.png'),
(6, '123085', 'Nadila Ginting', 'P', 1, '8125da21f903803b6992214967239ab3.png'),
(7, '123086', 'Anna Marina', 'P', 1, '33eaf3e3faf28a0fe31670c022f641f1.png'),
(8, '123086', 'Dhea Lubis', 'P', 1, '03e651410e969c3c26e8e0d35380470d.png'),
(9, '123087', 'Nadia Ginting', 'P', 1, 'd7823f8d98d376c085aa284a54d63264.png'),
(10, '123088', 'Mita Febrina', 'P', 1, 'eca0280a4a57c911ee68b8318d1e517f.png'),
(11, '123089', 'Elizabeth ', 'P', 1, 'ec1232a08d650bc8c3197c9db95a7fc8.png'),
(12, '123090', 'Della Guswono', 'P', 1, '6c82fce13bb3eff1fd2e897b2c3cfeeb.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_testimoni`
--

CREATE TABLE `tbl_testimoni` (
  `testimoni_id` int(11) NOT NULL,
  `testimoni_nama` varchar(30) DEFAULT NULL,
  `testimoni_isi` varchar(120) DEFAULT NULL,
  `testimoni_email` varchar(35) DEFAULT NULL,
  `testimoni_tanggal` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_tulisan`
--

CREATE TABLE `tbl_tulisan` (
  `tulisan_id` int(11) NOT NULL,
  `tulisan_judul` varchar(100) DEFAULT NULL,
  `tulisan_isi` text DEFAULT NULL,
  `tulisan_tanggal` timestamp NULL DEFAULT current_timestamp(),
  `tulisan_kategori_id` int(11) DEFAULT NULL,
  `tulisan_kategori_nama` varchar(30) DEFAULT NULL,
  `tulisan_views` int(11) DEFAULT 0,
  `tulisan_gambar` varchar(40) DEFAULT NULL,
  `tulisan_pengguna_id` int(11) DEFAULT NULL,
  `tulisan_author` varchar(40) DEFAULT NULL,
  `tulisan_img_slider` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_tulisan`
--

INSERT INTO `tbl_tulisan` (`tulisan_id`, `tulisan_judul`, `tulisan_isi`, `tulisan_tanggal`, `tulisan_kategori_id`, `tulisan_kategori_nama`, `tulisan_views`, `tulisan_gambar`, `tulisan_pengguna_id`, `tulisan_author`, `tulisan_img_slider`) VALUES
(19, 'Cantik, multi talenta. itulah sebuat untuk siswa yang satu ini', '<p>Talenta luar biasa bukan hanya dimiliki oleh kaum pria saja. Nyatanya siswa cantik yang satu ini sangat berakat memainkan alat musik tradisional yaitu seruling. Ini adalah sampel artikel&nbsp; Ini adalah sampel artikel&nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel &nbsp; Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel v Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel vv Ini adalah sampel artikel Ini adalah sampel artikel vvv Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel .</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n', '2017-05-17 09:21:24', 6, 'Prestasi', 2, '2c4b0960f1ca907c24af163b29ae1cec.jpg', 1, 'M Fikri Setiadi', 0),
(20, 'Persiapan siswa menjelang ujian nasional', '<p>Banyak metode bejalar yang dilakukan oleh siswa untuk persiapan menghadapi ujian nasional (UN). Biantaranya mengingat dengan metode Mind Map, ataupun bejalar diluar kelas (outdoor).&nbsp; Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n', '2017-05-17 09:24:42', 1, 'Pendidikan', 0, 'df0d8ccac0ba567fe01079b0477c5c12.jpg', 1, 'M Fikri Setiadi', 1),
(21, 'Siswi alai M-Sekolah', '<p>Remaja beumur 15-22 tahun, biasa beperilaku alai dan cenderung lebai. Di M-Sekolah sendiri ada begitu banyak siswa yang berperilaku alai dan lebai. Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n', '2017-05-17 09:34:28', 1, 'Pendidikan', 4, '20b326d88bc3454a82624a671021e1da.jpg', 1, 'M Fikri Setiadi', 0),
(22, 'Prestasi membangga dari siswa m-sekolah', '<p>Prestasi dan penghargaan merupakan trigger (pemicu) semangat belajar siswa. Ada banyak prestasi yang telah diraih oleh siswa m-sekolah. Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n', '2017-05-17 09:38:21', 6, 'Prestasi', 1, '2b594ea1f1b782e89f10f572ce193122.jpg', 1, 'M Fikri Setiadi', 1),
(23, 'Pelaksanaan Ujian Nasional M-Sekolah', '<p>Pelaksanaan UN (Ujian Nasional) di sekolah M-Sekolah berlangsung tentram dan damai. Terlihat ketenangan terpancar diwajah siswa berprestasi.&nbsp; Ini adalah sampel artikel Ini adalah sampel artikel&nbsp; Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n', '2017-05-17 09:41:30', 1, 'Pendidikan', 1, '6866d36b2085f40dd4d5b18b664af6bc.jpg', 1, 'M Fikri Setiadi', 0),
(24, 'Proses belajar mengajar m-sekolah', '<p>Proses belajar mengajar di sekolah m-sekolah berlangsung menyenangkan. Didukung oleh instruktur yang fun dengan metode mengajar yang tidak biasa. Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel a Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel .</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n\r\n<p>Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel Ini adalah sampel artikel.</p>\r\n', '2017-05-17 09:46:29', 1, 'Pendidikan', 1, '67bac7f1c3891034cf9d55e66c44aa10.jpg', 1, 'M Fikri Setiadi', 1),
(25, 'Ega ganteng', '<p>jkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjkjk</p>\r\n', '2020-06-25 23:40:04', 6, 'Prestasi', 1, '7b115b04de72f8a5d3787ed951c61875.jpg', 1, 'M Fikri Setiadi', 1),
(26, 'ega nugraha juara 1', '<p>saya ega nugraha</p>\r\n\r\n<p>1. saya ega</p>\r\n\r\n<p>.2 saya ganteng</p>\r\n', '2020-06-26 03:07:50', 6, 'Prestasi', 2, 'a614dcdde46c05fa82b00706dc2e6275.png', 1, 'M Fikri Setiadi', 0),
(27, 'Ega dan Monika saling mencintai', '<p>pernikahan akan dilaksanakan pada tanggal 10 Oktober 2025</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2020-09-25 01:25:07', 6, 'Prestasi', 1, '832fe7c1bed0f271bf27019aa6e83094.jpg', 1, 'M Fikri Setiadi', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_agenda`
--
ALTER TABLE `tbl_agenda`
  ADD PRIMARY KEY (`agenda_id`);

--
-- Indeks untuk tabel `tbl_album`
--
ALTER TABLE `tbl_album`
  ADD PRIMARY KEY (`album_id`),
  ADD KEY `album_pengguna_id` (`album_pengguna_id`);

--
-- Indeks untuk tabel `tbl_files`
--
ALTER TABLE `tbl_files`
  ADD PRIMARY KEY (`file_id`);

--
-- Indeks untuk tabel `tbl_galeri`
--
ALTER TABLE `tbl_galeri`
  ADD PRIMARY KEY (`galeri_id`),
  ADD KEY `galeri_album_id` (`galeri_album_id`),
  ADD KEY `galeri_pengguna_id` (`galeri_pengguna_id`);

--
-- Indeks untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  ADD PRIMARY KEY (`guru_id`);

--
-- Indeks untuk tabel `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  ADD PRIMARY KEY (`inbox_id`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`kelas_id`);

--
-- Indeks untuk tabel `tbl_komentar`
--
ALTER TABLE `tbl_komentar`
  ADD PRIMARY KEY (`komentar_id`),
  ADD KEY `komentar_tulisan_id` (`komentar_tulisan_id`);

--
-- Indeks untuk tabel `tbl_log_aktivitas`
--
ALTER TABLE `tbl_log_aktivitas`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `log_pengguna_id` (`log_pengguna_id`);

--
-- Indeks untuk tabel `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  ADD PRIMARY KEY (`pengguna_id`);

--
-- Indeks untuk tabel `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  ADD PRIMARY KEY (`pengumuman_id`);

--
-- Indeks untuk tabel `tbl_pengunjung`
--
ALTER TABLE `tbl_pengunjung`
  ADD PRIMARY KEY (`pengunjung_id`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`siswa_id`);

--
-- Indeks untuk tabel `tbl_testimoni`
--
ALTER TABLE `tbl_testimoni`
  ADD PRIMARY KEY (`testimoni_id`);

--
-- Indeks untuk tabel `tbl_tulisan`
--
ALTER TABLE `tbl_tulisan`
  ADD PRIMARY KEY (`tulisan_id`),
  ADD KEY `tulisan_kategori_id` (`tulisan_kategori_id`),
  ADD KEY `tulisan_pengguna_id` (`tulisan_pengguna_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_agenda`
--
ALTER TABLE `tbl_agenda`
  MODIFY `agenda_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tbl_album`
--
ALTER TABLE `tbl_album`
  MODIFY `album_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_files`
--
ALTER TABLE `tbl_files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_galeri`
--
ALTER TABLE `tbl_galeri`
  MODIFY `galeri_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `tbl_guru`
--
ALTER TABLE `tbl_guru`
  MODIFY `guru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_inbox`
--
ALTER TABLE `tbl_inbox`
  MODIFY `inbox_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `kelas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `tbl_komentar`
--
ALTER TABLE `tbl_komentar`
  MODIFY `komentar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_log_aktivitas`
--
ALTER TABLE `tbl_log_aktivitas`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengguna`
--
ALTER TABLE `tbl_pengguna`
  MODIFY `pengguna_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengumuman`
--
ALTER TABLE `tbl_pengumuman`
  MODIFY `pengumuman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `tbl_pengunjung`
--
ALTER TABLE `tbl_pengunjung`
  MODIFY `pengunjung_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=936;

--
-- AUTO_INCREMENT untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  MODIFY `siswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `tbl_testimoni`
--
ALTER TABLE `tbl_testimoni`
  MODIFY `testimoni_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_tulisan`
--
ALTER TABLE `tbl_tulisan`
  MODIFY `tulisan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- Database: `dreamercollection`
--
CREATE DATABASE IF NOT EXISTS `dreamercollection` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `dreamercollection`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_access`
--

CREATE TABLE `admin_access` (
  `id_access` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_access`
--

INSERT INTO `admin_access` (`id_access`, `id_role`, `id_menu`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_menu`
--

INSERT INTO `admin_menu` (`id_menu`, `nama_menu`, `url`, `icon`, `status`) VALUES
(1, 'Dashboard', 'admin', 'fas fa-tachometer-alt', 0),
(2, 'Config Access', '', 'fa fa-cogs', 1),
(3, 'Costumer Interface', '', 'fab fa-sketch', 1),
(5, 'user', 'user/daftar_dosen', 'fas fa-glass-cheers', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_submenu`
--

CREATE TABLE `admin_submenu` (
  `id_submenu` int(11) NOT NULL,
  `nama_submenu` varchar(128) NOT NULL,
  `url_submenu` varchar(128) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin_submenu`
--

INSERT INTO `admin_submenu` (`id_submenu`, `nama_submenu`, `url_submenu`, `id_menu`) VALUES
(1, 'Menu', 'admin/menu', 2),
(2, 'Admin Akses', 'admin/akses', 2),
(3, 'Admin Akses', 'Admin/menu', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Super Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_role`) VALUES
(1, 'admin', '1234', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_access`
--
ALTER TABLE `admin_access`
  ADD PRIMARY KEY (`id_access`);

--
-- Indeks untuk tabel `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `admin_submenu`
--
ALTER TABLE `admin_submenu`
  ADD PRIMARY KEY (`id_submenu`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_access`
--
ALTER TABLE `admin_access`
  MODIFY `id_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `admin_submenu`
--
ALTER TABLE `admin_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `esptes`
--
CREATE DATABASE IF NOT EXISTS `esptes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `esptes`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `led`
--

CREATE TABLE `led` (
  `id` int(11) NOT NULL,
  `nilai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `led`
--

INSERT INTO `led` (`id`, `nilai`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rfid`
--

CREATE TABLE `rfid` (
  `id` int(11) NOT NULL,
  `id_card` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rfid`
--

INSERT INTO `rfid` (`id`, `id_card`) VALUES
(1, ''),
(2, ''),
(3, ''),
(4, ''),
(5, '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `led`
--
ALTER TABLE `led`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rfid`
--
ALTER TABLE `rfid`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `led`
--
ALTER TABLE `led`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rfid`
--
ALTER TABLE `rfid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `gluse_demo_jike`
--
CREATE DATABASE IF NOT EXISTS `gluse_demo_jike` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `gluse_demo_jike`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `config`
--

CREATE TABLE `config` (
  `conf_id` int(11) NOT NULL,
  `conf_name` varchar(200) DEFAULT NULL,
  `conf_value` varchar(100) DEFAULT NULL,
  `conf_tipe` varchar(3) DEFAULT '1' COMMENT '1:text, 2:cbox'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `config`
--

INSERT INTO `config` (`conf_id`, `conf_name`, `conf_value`, `conf_tipe`) VALUES
(1, 'periode_tahun_prediksi', '6', NULL),
(2, 'item_per_page', '100', NULL),
(3, 'semester_aktif', 'ganjil', NULL),
(4, 'min_persen_kelas', '75', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `dsn_id` int(11) NOT NULL,
  `dsn_nip` varchar(20) DEFAULT NULL,
  `dsn_nama` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`dsn_id`, `dsn_nip`, `dsn_nama`) VALUES
(1, NULL, 'ABDUL RAHMAN SIREGAR, S.Si., M.Biotech\r'),
(2, NULL, 'ABDUL ROUF, Drs., M.I.Kom.\r'),
(3, NULL, 'ABDURAKHMAN, S.Si., M.Si., Dr.\r'),
(4, NULL, 'ADE ANGGRAINI, S.Si., M.Si.\r'),
(5, NULL, 'ADHITASARI SURATMAN, S.Si., M.Si., Dr.rer.nat.\r'),
(6, NULL, 'ADHITYA RONNIE EFFENDIE, M.Si., M.Sc., Dr.\r'),
(7, NULL, 'AFIF RAKHMAN, S.Si., M.Si.\r'),
(8, NULL, 'AGFIANTO EKO PUTRA, M.Si., Dr.\r'),
(9, NULL, 'AGUNG BAMBANG SETIO UTOMO, Dr., Prof.\r'),
(10, NULL, 'AGUNG DWI SAPUTRO, A.Md.\r'),
(11, NULL, 'AGUS HARJOKO, Drs., M.Sc., Ph.D.\r'),
(12, NULL, 'AGUS KUNCAKA, Dr., DEA.\r'),
(13, NULL, 'AGUS SIHABUDDIN, ., M.Kom.\r'),
(14, NULL, 'AHMAD ASHARI, Drs., M.I.Kom., Dr.tech.\r'),
(15, NULL, 'AHMAD KUSUMA ATMAJA, S.Si.\r'),
(16, NULL, 'AHMAD TAWFIEQURAHMAN YULIANSYAH, ST., MT.,\r'),
(17, NULL, 'AINA MUSDHOLIFAH, M.Sc., Dr.\r'),
(18, NULL, 'AKHMAD SYOUFIAN, S.Si., Ph.D.,\r'),
(19, NULL, 'ALROSYID, S.Si.\r'),
(20, NULL, 'ANDI DHARMAWAN, S.Si., M.Cs.\r'),
(21, NULL, 'ANIFUDDIN AZIS, ., M.Kom.\r'),
(22, NULL, 'ANINDITA SURYARASMI, S.Kom., M.Cs.\r'),
(23, NULL, 'ANNY KARTIKA SARI, M.Sc.,Dr\r'),
(24, NULL, 'APRI MULYANI, S.S,\r'),
(25, NULL, 'ARI DWI NUGRAHENI, S.Si.\r'),
(26, NULL, 'ARI SETIAWAN, Drs., M.Si., Dr.Ing.\r'),
(27, NULL, 'ARI SUPARWANTO, M.Si., Dr.rer.nat.\r'),
(28, NULL, 'ARIEF HERMANTO, S.U., M.Sc., Dr.\r'),
(29, NULL, 'ARIES BAGUS SASONGKO, S.Si., M.Biotech,\r'),
(30, NULL, 'ARIESTA MARTININGTYAS H, S.Si.,\r'),
(31, NULL, 'ARIF NURWIDYANTORO, S.Kom, M.Cs.\r'),
(32, NULL, 'ATOK ZULIJANTO, S.Si., M.Si., Ph.D.\r'),
(33, NULL, 'AZHARI, M.T., Dr.\r'),
(34, NULL, 'BAKHTIAR ALLDINO ARDI SUMBODO, S.Si.\r'),
(35, NULL, 'BAMBANG NURCAHYO PRASTOWO, Drs., M.Sc.\r'),
(36, NULL, 'BAMBANG PURWONO, Drs., M.Sc., Ph.D.\r'),
(37, NULL, 'BAMBANG RUSDIARSO, Dr., DEA., Prof.\r'),
(38, NULL, 'BAMBANG SETIAJI, Dr., Prof.\r'),
(39, NULL, 'BAMBANG SOEDIJONO, Dr., Prof.\r'),
(40, NULL, 'BILAL MA\'RUF, S.T., M.T.\r'),
(41, NULL, 'BUDI EKA NURCAHYA, Drs., M.Si.\r'),
(42, NULL, 'BUDI SUMANTO, S.Si.\r'),
(43, NULL, 'BUDI SURODJO, M.Si., Dr.\r'),
(44, NULL, 'CATUR ATMAJI, S.Si.\r'),
(45, NULL, 'CHAIRIL ANWAR, Dr.\r'),
(46, NULL, 'CHRISTIANA RINI INDRATI, M.Si., Dr.\r'),
(47, NULL, 'CISYA DEWANTARA NUGRAHA, M.A.\r'),
(48, NULL, 'DANANG LELONO, S.Si., M.T.\r'),
(49, NULL, 'DANARDONO, Drs., MPH., Ph.D.\r'),
(50, NULL, 'DEDI ROSADI, M.Sc., Dr.rer.nat., Prof.\r'),
(51, NULL, 'DIAN BUDI SANTOSO, SKM\r'),
(52, NULL, 'DWI SISWANTA, M.Hum.,\r'),
(53, NULL, 'DWI SISWANTO, Drs., M.Eng., Ph.D.\r'),
(54, NULL, 'DWI UMI SISWANTI, S.Si., M.Sc.,\r'),
(55, NULL, 'EDDY KRISTIYONO, A.Md.PK, SKM\r'),
(56, NULL, 'EDI SUHARYADI, S.Si., M.Eng., Dr.Eng.\r'),
(57, NULL, 'EDI WINARKO, Drs., M.Sc., Ph.D.\r'),
(58, NULL, 'Eko Agus Suyono, S.Si., M.App.Sc.,\r'),
(59, NULL, 'EKO SRI KUNARTI, Dra., M.Si., Ph.D.\r'),
(60, NULL, 'EKO SUGIHARTO, Dr., DEA.\r'),
(61, NULL, 'EKO TRI SULISTYANI, Dra., M.Sc.\r'),
(62, NULL, 'ELIDA LAILIA ISTIQOMAH, S.Si., M.Sc.\r'),
(63, NULL, 'ENDANG TRI WAHYUNI, M.S., Dr., Prof.\r'),
(64, NULL, 'FAHRUDIN NUGROHO, S.Si., M.Si.\r'),
(65, NULL, 'FAIZAH, S.Kom., M.Sc.\r'),
(66, NULL, 'FAJAR ADI KUSUMO, S.Si., M.Si., Dr.\r'),
(67, NULL, 'FARID ISHARTOMO, S.Si.\r'),
(68, NULL, 'FITRI DAMAYANTI BERUTU, M.M.\r'),
(69, NULL, 'GEDE BAYU SUPARTA, Drs., M.S., Ph.D.\r'),
(70, NULL, 'GP. DALIJO, Drs., Dipl.Comp.\r'),
(71, NULL, 'GUNARDI, M.Si., Dr.\r'),
(72, NULL, 'GUNTUR MARUTO, Drs., S.U., Dr.\r'),
(73, NULL, 'HAMDANI MURDA, S.Si.,M.SE\r'),
(74, NULL, 'HARDJONO SASTROHAMIDJOJO, Dr., Prof.\r'),
(75, NULL, 'HARNO DWI PRANOWO, M.S., Dr.rer.nat., Prof.\r'),
(76, NULL, 'HARSOJO, S.U., M.Sc., Dr.\r'),
(77, NULL, 'HELIDA NURCAHAYANI, SST., M.Si.\r'),
(78, NULL, 'HERNI UTAMI, S.Si., M.Si.\r'),
(79, NULL, 'HERNI UTAMI, S.Si., M.Si.,\r'),
(80, NULL, 'I GEDE MUJIYATNA, ., M.Kom.\r'),
(81, NULL, 'IBNU MARDIYOKO, M.M.\r'),
(82, NULL, 'IIP IZUL FALAH, Dr., Prof.\r'),
(83, NULL, 'IKA CANDRADEWI, S.Si.\r'),
(84, NULL, 'IKHSAN SETIAWAN, S.Si., M.Si.,\r'),
(85, NULL, 'IMAM SOLEKHUDIN, S.Si., M.Si., Ph.D.\r'),
(86, NULL, 'IMAM SUYANTO, Drs., M.Si.\r'),
(87, NULL, 'IMAM SUYANTO, Drs., M.Si.,\r'),
(88, NULL, 'IMAN SANTOSO, S.Si., M.Sc., Ph.D\r'),
(89, NULL, 'INDAH EMILIA WIJAYANTI, M.Si., Dr.rer.nat.\r'),
(90, NULL, 'INDARSIH, S.Si., M.Si.\r'),
(91, NULL, 'INDRIANA KARTINI, S.Si., M.Si., Ph.D.\r'),
(92, NULL, 'IQMAL TAHIR, Drs., M.Si.\r'),
(93, NULL, 'IRWAN ENDRAYANTO A., S.Si., M.Sc., Dr.\r'),
(94, NULL, 'ISNAN NUR RIFAI, S.Si.\r'),
(95, NULL, 'IVA ARIANI, DR\r'),
(96, NULL, 'JANOE HENDARTO, Drs., M.I.Kom.\r'),
(97, NULL, 'JUMINA, Drs., Ph.D., Prof.\r'),
(98, NULL, 'KARLINA DENISTIA, S.S., M.A.\r'),
(99, NULL, 'KARNA WIJAYA, Drs., M.Eng., Dr.rer.nat., Prof.\r'),
(100, NULL, 'KARTINI, Dra., M.Hum.\r'),
(101, NULL, 'KARYONO, S.U., Dr., Prof.\r'),
(102, NULL, 'KHABIB MUSTOFA, M.Kom., Dr.tech.\r'),
(103, NULL, 'KIRBANI SRI BROTOPUSPITO, Dr., Prof.\r'),
(104, NULL, 'KUSMINARTO, Dr., Prof.\r'),
(105, NULL, 'KUWAT TRIYANA, M.Si., Dr. Eng.\r'),
(106, NULL, 'LINA ARYATI, Dra., M.S., Dr.rer.nat.\r'),
(107, NULL, 'Lisna Hidayati, S.Si., M.Biotech.\r'),
(108, NULL, 'LUKMAN HERYAWAN, S.T., M.T.\r'),
(109, NULL, 'M. FARCHANI ROSYID, Drs., M.Si., Dr.rer.nat.\r'),
(110, NULL, 'MARDANI, S.E., M.T.\r'),
(111, NULL, 'MARDHANI RIASETIAWAN, M.T.\r'),
(112, NULL, 'MARDOTO, KOL. SUS.\r'),
(113, NULL, 'MASIRAN, M.Si.\r'),
(114, NULL, 'MEDI, Drs., M.Kom.\r'),
(115, NULL, 'MHD. REZA M.I. PULUNGAN, S.Si., M.Sc., Dr.Ing.\r'),
(116, NULL, 'MIRZA SATRIAWAN, S.Si., M.Si., Ph.D.\r'),
(117, NULL, 'MITRAYANA, S.Si., M.Si., Dr.\r'),
(118, NULL, 'MOCHAMMAD NUKMAN, S.T., M.Sc.\r'),
(119, NULL, 'MOCHAMMAD TARI, Drs., M.Si.\r'),
(120, NULL, 'MOCHAMMAD UTORO YAHYA, Dr., Prof.\r'),
(121, NULL, 'MOH. ALI JOKO WASONO, M.S., Dr.\r'),
(122, NULL, 'MUDASIR, Drs., M.Eng., Ph.D., Prof.\r'),
(123, NULL, 'MUH. FAKHURRIFQI, S.Kom., M.Cs.\r'),
(124, NULL, 'MUHAMMAD DARWIS UMAR, S.SI.M.SI\r'),
(125, NULL, 'NARSITO, Dr., Prof.\r'),
(126, NULL, 'NIA GELLA AUGOESTIEN, S.Si.\r'),
(127, NULL, 'NIKEN ANGRAENI, S.S.\r'),
(128, NULL, 'NUR ENDAH NUGRAHENI, S.S.,M.S\r'),
(129, NULL, 'NUR ROKHMAN, S.Si., M.Kom.\r'),
(130, NULL, 'NURUL HIDAYAT A., S.Si., M.Si., Dr.rer.nat.\r'),
(131, NULL, 'NURYATI, MPH\r'),
(132, NULL, 'NURYONO, Drs., M.S., Dr.rer.nat., Prof.\r'),
(133, NULL, 'PANGGIH BASUKI, Drs., M.Si.\r'),
(134, NULL, 'PEKIK NURWANTORO, Drs., M.S., Ph.D.\r'),
(135, NULL, 'PRIATMOKO, Drs., M.S.\r'),
(136, NULL, 'PRIJONO NUGROHO, MSP., Ph.D.\r'),
(137, NULL, 'PRODI\r'),
(138, NULL, 'PUJIHARTO, Dr., S.S., M.Hum.\r'),
(139, NULL, 'RADEN SANJOYO, A.Md., S.Kom.\r'),
(140, NULL, 'RADEN SUMIHARTO, S.Si., M.Kom.\r'),
(141, NULL, 'RAKHMAT SOLEH, S.S, M.Hum.\r'),
(142, NULL, 'RATNA UDAYA WIDODO, Dra., MLS.\r'),
(143, NULL, 'RAWI MIHARTI, Dra., MPH.\r'),
(144, NULL, 'RESPATI TRI SWASONO, S.Si., M.Phil., Ph.D.\r'),
(145, NULL, 'RETANTYO WARDOYO, Drs., M.Sc., Ph.D.\r'),
(146, NULL, 'RIA ARMUNANTO, S.Si., M.Si., Dr.rer.nat.\r'),
(147, NULL, 'RIANTI SISWI UTAMI, S.Si.\r'),
(148, NULL, 'RINTO ANUGRAHA NQZ, S.Si., M.Si., Ph.D.\r'),
(149, NULL, 'ROBBY NOOR CAHYONO, S.Si., M.Sc.\r'),
(150, NULL, 'ROCHIM BAKTI CAHYONO, ST., M.Sc.\r'),
(151, NULL, 'ROTO, Drs., M.Eng., Ph.D.\r'),
(152, NULL, 'SABIRIN MATSJEH, Dr., Prof.\r'),
(153, NULL, 'SALMAH, M.Si., Dr.\r'),
(154, NULL, 'SARDJONO, Drs., S.U.\r'),
(155, NULL, 'SARI DARMASIWI, S.Si., M. Biotech.,\r'),
(156, NULL, 'SARI LESTARI, Dra., M.A.\r'),
(157, NULL, 'SAVITRI CITRA BUDI, MPH\r'),
(158, NULL, 'SETIADJI, Prof.\r'),
(159, NULL, 'SIDIK BUDI W., LETKOL SUS., S.Si., M.Si.\r'),
(160, NULL, 'SIGIT PRIYANTA, S.Si., M.Kom.\r'),
(161, NULL, 'SISMANTO, M.Si., Dr., Prof.\r'),
(162, NULL, 'SITI SUSANTI, Dra., S.U.\r'),
(163, NULL, 'SLAMET SUTRISNO, Drs.,M.Si\r'),
(164, NULL, 'SRI HARTATI, Dra., M.Sc., Ph.D.\r'),
(165, NULL, 'SRI HARYATMI, M.Sc., Dr., Prof.\r'),
(166, NULL, 'SRI JUARI SANTOSA, Drs., M.Eng., Ph.D., Prof.\r'),
(167, NULL, 'SRI MULYANA, Drs., M.Kom.\r'),
(168, NULL, 'SRI WAHYUNI, S.U., Dr., Prof.\r'),
(169, NULL, 'SRI WIDAYANTI, Dra., M.S.\r'),
(170, NULL, 'SUBANAR, Drs., Ph.D., Prof.\r'),
(171, NULL, 'SUDARYANTO, Drs., M.Hum.\r'),
(172, NULL, 'SUDIARTONO, Drs., M.S.\r'),
(173, NULL, 'SUGENG TRIONO, S.Si., M.Si.\r'),
(174, NULL, 'SUGENG, A.Md.\r'),
(175, NULL, 'SUHARTO, Dr.\r'),
(176, NULL, 'SUMARDI, M.Si., Dr.\r'),
(177, NULL, 'SUMARNI DWI W., Dr., M.Kes.\r'),
(178, NULL, 'SUMARYO, Ir., M.Si\r'),
(179, NULL, 'SUNARTA, Drs., M.S.\r'),
(180, NULL, 'SUPAMA, M.Si., Dr., Prof.\r'),
(181, NULL, 'SUPRAPTO, Drs., M.Ikom.\r'),
(182, NULL, 'SURYO NUGROHO MARKUS, S.E., MPH.\r'),
(183, NULL, 'SUTARNO, M.Si., Dr.\r'),
(184, NULL, 'SUTOPO, S.Si., M.Si.\r'),
(185, NULL, 'SUWONO, dr.\r'),
(186, NULL, 'SUYANTA, M.Si., Dr.\r'),
(187, NULL, 'SUYOKO, KOL., ADM.\r'),
(188, NULL, 'SYAMSUL BARRY, S.Sn., M.Hum.\r'),
(189, NULL, 'TARSISIUS ARIS SUNANTYO, Ir., Dr.\r'),
(190, NULL, 'TAUFIK ABDILLAH NATSIR, S.Si., M.Sc.\r'),
(191, NULL, 'TERIA ANARGHATI, S.S.,MA\r'),
(192, NULL, 'TOTO SUDARGO, Dr.,\r'),
(193, NULL, 'TRI JOKO RAHARJO, S.Si., M.Si., Ph.D.\r'),
(194, NULL, 'TRI KUNTORO PRIYAMBODO, Dr., M.Sc.\r'),
(195, NULL, 'TRI WAHYU SUPARDI, S.Si.\r'),
(196, NULL, 'TRIYOGATAMA WAHYU WIDODO, S.Kom., M.Kom.\r'),
(197, NULL, 'TRIYONO, S.U., Dr., Prof.\r'),
(198, NULL, 'TUTIK DWI WAHYUNINGSIH, Dra., M.Si., Ph.D.\r'),
(199, NULL, 'VEMMIE NASTITI LESTARI, M.Sc.\r'),
(200, NULL, 'WAGINI R., Drs., M.S.\r'),
(201, NULL, 'WAHYUDI ISTIONO, dr., M.Kes.,\r'),
(202, NULL, 'WAHYUDI, M.S., Dr.\r'),
(203, NULL, 'WALUYO, Drs., M.Sc., Ph.D.\r'),
(204, NULL, 'WEGA TRISUNARYANTI, M.S., Ph.D., Prof.\r'),
(205, NULL, 'WIDHI SULISTYO, S.Kom.\r'),
(206, NULL, 'WIDODO PRIJODIPRODJO, M.Sc.\r'),
(207, NULL, 'WINARTO HARYADI, M.Si., Dr.\r'),
(208, NULL, 'WIWIT SURYANTO, S.Si., M.Si., Dr.rer.nat.\r'),
(209, NULL, 'WORO ANINDITO SRI TUNJUNG, M.Sc., Ph.D.\r'),
(210, NULL, 'YATEMAN ARRYANTO, Dr.\r'),
(211, NULL, 'YENI SUSANTI, S.Si., M.Si.\r'),
(212, NULL, 'YOHANES SUYANTO, Drs., M.I.Kom.\r'),
(213, NULL, 'YULIANINGSIH RISWAN, M.A.\r'),
(214, NULL, 'YUNITA WULAN SARI, S.Si., M.Sc.\r'),
(215, NULL, 'YUSRIL YUSUF, S.Si., M.Eng., Dr.Eng.\r'),
(216, NULL, 'YUSRON FUADI, M.Sn.\r'),
(217, NULL, 'YUSUF, Drs., M.A. Math.\r'),
(218, NULL, 'ZULAELA, Drs., Dipl.Med.Stats., M.Si.\r'),
(219, NULL, 'NUR KHUSNUSSA\'ADAH, S.Si., M.Sc.'),
(220, NULL, 'DIAH JUNIA EKSI PALUPI, Dra., S.U.'),
(221, NULL, 'Moh. Edi Wibowo, S.Kom., M.Kom., Ph.D'),
(222, NULL, 'Susi Daryanti, Dra., M.Sc');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_kelas`
--

CREATE TABLE `dosen_kelas` (
  `dsnkls_id` int(11) NOT NULL,
  `dsnkls_dsn_id` int(11) DEFAULT NULL,
  `dsnkls_kls_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen_waktu`
--

CREATE TABLE `dosen_waktu` (
  `dsnwkt_id` int(11) NOT NULL,
  `dsnwkt_dsn_id` int(11) DEFAULT NULL,
  `dsnwkt_wkt_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kuliah`
--

CREATE TABLE `jadwal_kuliah` (
  `jk_id` int(11) NOT NULL,
  `jk_kls_id` int(11) DEFAULT NULL,
  `jk_wkt_id` int(11) DEFAULT NULL,
  `jk_ru_id` int(11) DEFAULT NULL,
  `jk_period` int(6) DEFAULT NULL,
  `jk_jam_selesai` time DEFAULT NULL,
  `jk_label` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `kls_id` int(11) NOT NULL,
  `kls_mkkur_id` int(11) DEFAULT NULL,
  `kls_nama` varchar(20) DEFAULT NULL,
  `kls_kode_paralel` varchar(6) DEFAULT NULL,
  `kls_jml_peserta_prediksi` int(6) DEFAULT NULL,
  `kls_jadwal_merata` int(1) DEFAULT 0,
  `kls_id_grup_jadwal` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`kls_id`, `kls_mkkur_id`, `kls_nama`, `kls_kode_paralel`, `kls_jml_peserta_prediksi`, `kls_jadwal_merata`, `kls_id_grup_jadwal`) VALUES
(168, 1, 'MIE1003-A', 'A', 27, 0, NULL),
(169, 1, 'MIE1003-B', 'B', 24, 0, NULL),
(170, 1, 'MIE1003-C', 'C', 24, 0, NULL),
(171, 1, 'MIE1003-D', 'D', 24, 0, NULL),
(172, 2, 'MIE1802-A', 'A', 27, 0, NULL),
(173, 2, 'MIE1802-B', 'B', 26, 0, NULL),
(174, 2, 'MIE1802-C', 'C', 26, 0, NULL),
(175, 2, 'MIE1802-D', 'D', 26, 0, NULL),
(176, 3, 'MIE1805-A', 'A', 27, 0, NULL),
(177, 3, 'MIE1805-B', 'B', 27, 0, NULL),
(178, 3, 'MIE1805-C', 'C', 27, 0, NULL),
(179, 4, 'MIE2602-A', 'A', 21, 0, NULL),
(180, 4, 'MIE2602-B', 'B', 20, 0, NULL),
(181, 5, 'MIE2810-A', 'A', 27, 0, NULL),
(182, 5, 'MIE2810-B', 'B', 24, 0, NULL),
(183, 5, 'MIE2810-C', 'C', 24, 0, NULL),
(184, 5, 'MIE2810-D', 'D', 24, 0, NULL),
(185, 6, 'MIE2812-A', 'A', 30, 0, NULL),
(186, 6, 'MIE2812-B', 'B', 29, 0, NULL),
(187, 6, 'MIE2812-C', 'C', 29, 0, NULL),
(188, 7, 'MIE2813-A', 'A', 71, 0, NULL),
(189, 7, 'MIE2813-B', 'B', 70, 0, NULL),
(190, 8, 'MIE2814-A', 'A', 69, 0, NULL),
(191, 8, 'MIE2814-B', 'B', 68, 0, NULL),
(192, 9, 'MIE3008', NULL, 98, 1, NULL),
(193, 10, 'MIE3205-A', 'A', 22, 0, NULL),
(194, 10, 'MIE3205-B', 'B', 22, 0, NULL),
(195, 10, 'MIE3205-C', 'C', 22, 0, NULL),
(196, 11, 'MIE3404-A', 'A', 19, 0, NULL),
(197, 11, 'MIE3404-B', 'B', 18, 0, NULL),
(198, 12, 'MIE3605', NULL, 16, 1, NULL),
(199, 13, 'MIE3606-A', 'A', 56, 0, NULL),
(200, 13, 'MIE3606-B', 'B', 55, 0, NULL),
(201, 14, 'MIE3820-A', 'A', 24, 0, NULL),
(202, 14, 'MIE3820-B', 'B', 22, 0, NULL),
(203, 14, 'MIE3820-C', 'C', 22, 0, NULL),
(204, 15, 'MIE3821-A', 'A', 28, 0, NULL),
(205, 15, 'MIE3821-B', 'B', 27, 0, NULL),
(206, 15, 'MIE3821-C', 'C', 27, 0, NULL),
(207, 16, 'MIEK1805-A', 'A', 26, 0, NULL),
(208, 16, 'MIEK1805-B', 'B', 26, 0, NULL),
(209, 16, 'MIEK1805-C', 'C', 26, 0, NULL),
(210, 16, 'MIEK1805-D', 'D', 26, 0, NULL),
(211, 16, 'MIEK1805-E', 'E', 26, 0, NULL),
(212, 17, 'MIK1251-A', 'A', 30, 0, NULL),
(213, 17, 'MIK1251-B', 'B', 29, 0, NULL),
(214, 17, 'MIK1251-C', 'C', 29, 0, NULL),
(215, 18, 'MIK1253-A', 'A', 72, 0, NULL),
(216, 18, 'MIK1253-B', 'B', 71, 0, NULL),
(217, 19, 'MIK1651-A', 'A', 25, 0, NULL),
(218, 19, 'MIK1651-B', 'B', 24, 0, NULL),
(219, 19, 'MIK1651-C', 'C', 24, 0, NULL),
(220, 19, 'MIK1651-D', 'D', 24, 0, NULL),
(221, 19, 'MIK1651-E', 'E', 24, 0, NULL),
(222, 20, 'MIK2251-A', 'A', 24, 0, NULL),
(223, 20, 'MIK2251-B', 'B', 23, 0, NULL),
(224, 20, 'MIK2251-C', 'C', 23, 0, NULL),
(225, 21, 'MIK2253-A', 'A', 28, 0, NULL),
(226, 21, 'MIK2253-B', 'B', 27, 0, NULL),
(227, 22, 'MIKE2451', NULL, 16, 1, NULL),
(228, 24, 'MIK2551-A', 'A', 26, 0, NULL),
(229, 24, 'MIK2551-B', 'B', 25, 0, NULL),
(230, 24, 'MIK2551-C', 'C', 25, 0, NULL),
(231, 24, 'MIK2551-D', 'D', 25, 0, NULL),
(232, 25, 'MIK2651-A', 'A', 25, 0, NULL),
(233, 25, 'MIK2651-B', 'B', 23, 0, NULL),
(234, 25, 'MIK2651-C', 'C', 23, 0, NULL),
(235, 26, 'MIK3051-A', 'A', 78, 0, NULL),
(236, 26, 'MIK3051-B', 'B', 77, 0, NULL),
(237, 27, 'MIK3053-A', 'A', 30, 0, NULL),
(238, 27, 'MIK3053-B', 'B', 30, 0, NULL),
(239, 28, 'MIK3551-A', 'A', 28, 0, NULL),
(240, 28, 'MIK3551-B', 'B', 26, 0, NULL),
(241, 28, 'MIK3551-C', 'C', 26, 0, NULL),
(242, 28, 'MIK3551-D', 'D', 26, 0, NULL),
(243, 29, 'MIK4251-A', 'A', 28, 0, NULL),
(244, 29, 'MIK4251-B', 'B', 28, 0, NULL),
(245, 30, 'MIK4253', NULL, 20, 1, NULL),
(246, 31, 'MIK4255-A', 'A', 31, 0, NULL),
(247, 31, 'MIK4255-B', 'B', 29, 0, NULL),
(248, 31, 'MIK4255-C', 'C', 29, 0, NULL),
(249, 32, 'MIK4451-A', 'A', 20, 0, NULL),
(250, 32, 'MIK4451-B', 'B', 19, 0, NULL),
(251, 34, 'MIK4453', NULL, 19, 1, NULL),
(252, 35, 'MIK4553-A', 'A', 22, 0, NULL),
(253, 35, 'MIK4553-B', 'B', 21, 0, NULL),
(254, 36, 'MIK4555-A', 'A', 29, 0, NULL),
(255, 36, 'MIK4555-B', 'B', 28, 0, NULL),
(256, 36, 'MIK4555-C', 'C', 28, 0, NULL),
(257, 37, 'MIK4559-A', 'A', 21, 0, NULL),
(258, 37, 'MIK4559-B', 'B', 21, 0, NULL),
(259, 38, 'MIK4561-A', 'A', 23, 0, NULL),
(260, 38, 'MIK4561-B', 'B', 22, 0, NULL),
(261, 39, 'MIK4651-A', 'A', 54, 0, NULL),
(262, 39, 'MIK4651-B', 'B', 53, 0, NULL),
(263, 40, 'MIK4653-A', 'A', 29, 0, NULL),
(264, 40, 'MIK4653-B', 'B', 29, 0, NULL),
(265, 41, 'MIKE1251-A', 'A', 29, 0, NULL),
(266, 41, 'MIKE1251-B', 'B', 29, 0, NULL),
(267, 41, 'MIKE1251-C', 'C', 29, 0, NULL),
(268, 41, 'MIKE1251-D', 'D', 29, 0, NULL),
(269, 42, 'MIKE1651-A', 'A', 21, 0, NULL),
(270, 42, 'MIKE1651-B', 'B', 20, 0, NULL),
(271, 43, 'MIKE2651-A', 'A', 23, 0, NULL),
(272, 43, 'MIKE2651-B', 'B', 23, 0, NULL),
(273, 43, 'MIKE2651-C', 'C', 23, 0, NULL),
(274, 43, 'MIKE2651-D', 'D', 23, 0, NULL),
(275, 44, 'MIKE3051-A', 'A', 58, 0, NULL),
(276, 44, 'MIKE3051-B', 'B', 58, 0, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_proses`
--

CREATE TABLE `log_proses` (
  `logproses_id` int(5) NOT NULL,
  `logproses_kode` varchar(80) DEFAULT NULL,
  `logproses_data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log_proses`
--

INSERT INTO `log_proses` (`logproses_id`, `logproses_kode`, `logproses_data`) VALUES
(1, 'jst_prediksi', 'YTo0NTp7aTowO2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czozOiIxODUiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czozOiIxODUiO2k6MztzOjM6IjEwOCI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjM6IjE4NSI7aToyO3M6MzoiMTA4IjtpOjM7czozOiIxMDAiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC45O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuOTtpOjM7ZDowLjU2NzAyNzAyNzAyNzAyNzE7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjk7aToyO2Q6MC41NjcwMjcwMjcwMjcwMjcxO2k6MztkOjAuNTMyNDMyNDMyNDMyNDMyNDt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjM6IjE4NSI7aToxO3M6MzoiMTA4IjtpOjI7czozOiIxMDAiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MTg0O2k6MTtkOjEwODtpOjI7ZDoxMDA7fXM6MzoibXNlIjtkOjkuOTc3MTcyMzExMjQzMzQ2RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czozOiIxODUiO2k6MTtzOjM6IjEwOCI7aToyO3M6MzoiMTAwIjtpOjQ7ZDo5Ny43ODYxMDQ0NTEyOTM4MTt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6OTg7fWk6MTthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MzoiMTQ4Ijt9aToxO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MzoiMTQ4IjtpOjM7czozOiIxMTciO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czozOiIxNDgiO2k6MjtzOjM6IjExNyI7aTozO3M6MzoiMTA3Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuOTt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjk7aTozO2Q6MC43MzI0MzI0MzI0MzI0MzI1O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC45O2k6MjtkOjAuNzMyNDMyNDMyNDMyNDMyNTtpOjM7ZDowLjY3ODM3ODM3ODM3ODM3ODQ7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czozOiIxNDgiO2k6MTtzOjM6IjExNyI7aToyO3M6MzoiMTA3Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjE0NjtpOjE7ZDoxMTg7aToyO2Q6MTA3O31zOjM6Im1zZSI7ZDo5LjgyNTEwMTU0MzA4MTUwNUUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MzoiMTQ4IjtpOjE7czozOiIxMTciO2k6MjtzOjM6IjEwNyI7aTo0O2Q6MTA1Ljg3NzA5NzkzMzk4MTIyO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxMDY7fWk6MjthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MzoiMjU3Ijt9aToxO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MzoiMjU3IjtpOjM7czoyOiI5NiI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjM6IjI1NyI7aToyO3M6MjoiOTYiO2k6MztzOjI6Ijg0Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuOTt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjk7aTozO2Q6MC4zOTg4MzI2ODQ4MjQ5MDI3NTt9aToyO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuOTtpOjI7ZDowLjM5ODgzMjY4NDgyNDkwMjc1O2k6MztkOjAuMzYxNDc4NTk5MjIxNzg5OTM7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czozOiIyNTciO2k6MTtzOjI6Ijk2IjtpOjI7czoyOiI4NCI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDoyNTY7aToxO2Q6OTY7aToyO2Q6ODQ7fXM6MzoibXNlIjtkOjkuOTg2Nzc3NjAwNDQzOUUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MzoiMjU3IjtpOjE7czoyOiI5NiI7aToyO3M6MjoiODQiO2k6NDtkOjgyLjU3NjA0OTE0Nzg0Mjk4O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo4Mzt9aTozO2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czozOiIxMTUiO2k6MTtzOjM6IjExNSI7aToyO3M6MjoiOTkiO2k6MztzOjI6IjEzIjt9aToxO2E6NDp7aTowO3M6MzoiMTE1IjtpOjE7czoyOiI5OSI7aToyO3M6MjoiMTMiO2k6MztzOjI6IjIzIjt9aToyO2E6NDp7aTowO3M6MjoiOTkiO2k6MTtzOjI6IjEzIjtpOjI7czoyOiIyMyI7aTozO3M6MjoiNDQiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC45O2k6MTtkOjAuOTtpOjI7ZDowLjc3NDUwOTgwMzkyMTU2ODc7aTozO2Q6MC4xO31pOjE7YTo0OntpOjA7ZDowLjk7aToxO2Q6MC43NzQ1MDk4MDM5MjE1Njg3O2k6MjtkOjAuMTtpOjM7ZDowLjE3ODQzMTM3MjU0OTAxOTY7fWk6MjthOjQ6e2k6MDtkOjAuNzc0NTA5ODAzOTIxNTY4NztpOjE7ZDowLjE7aToyO2Q6MC4xNzg0MzEzNzI1NDkwMTk2O2k6MztkOjAuMzQzMTM3MjU0OTAxOTYwODt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjEzIjtpOjE7czoyOiIyMyI7aToyO3M6MjoiNDQiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MTM7aToxO2Q6MjM7aToyO2Q6NDQ7fXM6MzoibXNlIjtkOjkuOTI1NzI0MTQ1NDk5OTQzRS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiIxMyI7aToxO3M6MjoiMjMiO2k6MjtzOjI6IjQ0IjtpOjQ7ZDo0Mi41NTU0NDIzMjE2ODU3Mzt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6NDM7fWk6NDthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MzoiMTE5IjtpOjE7czozOiIxMzMiO2k6MjtzOjM6IjEyMSI7aTozO3M6MjoiNzgiO31pOjE7YTo0OntpOjA7czozOiIxMzMiO2k6MTtzOjM6IjEyMSI7aToyO3M6MjoiNzgiO2k6MztzOjM6IjEyMyI7fWk6MjthOjQ6e2k6MDtzOjM6IjEyMSI7aToxO3M6MjoiNzgiO2k6MjtzOjM6IjEyMyI7aTozO3M6MzoiMTAwIjt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuNjk2MzYzNjM2MzYzNjM2NDtpOjE7ZDowLjk7aToyO2Q6MC43MjU0NTQ1NDU0NTQ1NDU1O2k6MztkOjAuMTt9aToxO2E6NDp7aTowO2Q6MC45O2k6MTtkOjAuNzI1NDU0NTQ1NDU0NTQ1NTtpOjI7ZDowLjE7aTozO2Q6MC43NTQ1NDU0NTQ1NDU0NTQ2O31pOjI7YTo0OntpOjA7ZDowLjcyNTQ1NDU0NTQ1NDU0NTU7aToxO2Q6MC4xO2k6MjtkOjAuNzU0NTQ1NDU0NTQ1NDU0NjtpOjM7ZDowLjQyMDAwMDAwMDAwMDAwMDA0O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiNzgiO2k6MTtzOjM6IjEyMyI7aToyO3M6MzoiMTAwIjt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjc4O2k6MTtkOjEyMztpOjI7ZDoxMDA7fXM6MzoibXNlIjtkOjkuOTQyOTAxNjA5MTg5MTc3RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI3OCI7aToxO3M6MzoiMTIzIjtpOjI7czozOiIxMDAiO2k6NDtkOjgwLjA5MTkxODMyNDU5MTAzO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo4MDt9aTo1O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoyOiI3NyI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6Ijc3IjtpOjM7czozOiIxMTQiO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI3NyI7aToyO3M6MzoiMTE0IjtpOjM7czoyOiI5OSI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjY0MDM1MDg3NzE5Mjk4MjQ7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC42NDAzNTA4NzcxOTI5ODI0O2k6MztkOjAuOTt9aToyO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuNjQwMzUwODc3MTkyOTgyNDtpOjI7ZDowLjk7aTozO2Q6MC43OTQ3MzY4NDIxMDUyNjMyO319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiNzciO2k6MTtzOjM6IjExNCI7aToyO3M6MjoiOTkiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6ODY7aToxO2Q6OTI7aToyO2Q6OTk7fXM6MzoibXNlIjtkOjUuNTc1ODIyMTc3MzYxMzUxRS05O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI3NyI7aToxO3M6MzoiMTE0IjtpOjI7czoyOiI5OSI7aTo0O2Q6OTguNDkxNDU3NjA5MzE1MjU7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjk4O31pOjY7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjM6IjE3MyI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjM6IjE3MyI7aTozO3M6MzoiMTMzIjt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MzoiMTczIjtpOjI7czozOiIxMzMiO2k6MztzOjI6Ijk5Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuOTt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjk7aTozO2Q6MC43MTUwMjg5MDE3MzQxMDQ7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjk7aToyO2Q6MC43MTUwMjg5MDE3MzQxMDQ7aTozO2Q6MC41NTc4MDM0NjgyMDgwOTI1O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MzoiMTczIjtpOjE7czozOiIxMzMiO2k6MjtzOjI6Ijk5Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjE2OTtpOjE7ZDoxMzU7aToyO2Q6OTk7fXM6MzoibXNlIjtkOjkuNzg2MzgwODIxNzM5MDA5RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czozOiIxNzMiO2k6MTtzOjM6IjEzMyI7aToyO3M6MjoiOTkiO2k6NDtkOjk3Ljc3NDk5MTgzNTk0MDY3O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo5ODt9aTo3O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoyOiI4OCI7aToxO3M6MjoiOTgiO2k6MjtzOjM6IjEwNSI7aTozO3M6MzoiMTU4Ijt9aToxO2E6NDp7aTowO3M6MjoiOTgiO2k6MTtzOjM6IjEwNSI7aToyO3M6MzoiMTU4IjtpOjM7czozOiIxNDkiO31pOjI7YTo0OntpOjA7czozOiIxMDUiO2k6MTtzOjM6IjE1OCI7aToyO3M6MzoiMTQ5IjtpOjM7czozOiIxMzUiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMjE0Mjg1NzE0Mjg1NzE0MztpOjI7ZDowLjI5NDI4NTcxNDI4NTcxNDI2O2k6MztkOjAuOTt9aToxO2E6NDp7aTowO2Q6MC4yMTQyODU3MTQyODU3MTQzO2k6MTtkOjAuMjk0Mjg1NzE0Mjg1NzE0MjY7aToyO2Q6MC45O2k6MztkOjAuNzk3MTQyODU3MTQyODU3Mjt9aToyO2E6NDp7aTowO2Q6MC4yOTQyODU3MTQyODU3MTQyNjtpOjE7ZDowLjk7aToyO2Q6MC43OTcxNDI4NTcxNDI4NTcyO2k6MztkOjAuNjM3MTQyODU3MTQyODU3MTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjM6IjE1OCI7aToxO3M6MzoiMTQ5IjtpOjI7czozOiIxMzUiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MTU2O2k6MTtkOjE0OTtpOjI7ZDoxMzY7fXM6MzoibXNlIjtkOjguODU1MjgzMjcxNDMxNzAyRS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czozOiIxNTgiO2k6MTtzOjM6IjE0OSI7aToyO3M6MzoiMTM1IjtpOjQ7ZDoxMzYuMzUzNjM0NzQxNTY5ODY7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjEzNjt9aTo4O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoyOiI4OCI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6Ijg4IjtpOjM7czoyOiI5NiI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjI6Ijg4IjtpOjI7czoyOiI5NiI7aTozO3M6MzoiMTEwIjt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuNzQwMDAwMDAwMDAwMDAwMTt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjc0MDAwMDAwMDAwMDAwMDE7aTozO2Q6MC43OTgxODE4MTgxODE4MTgyO31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC43NDAwMDAwMDAwMDAwMDAxO2k6MjtkOjAuNzk4MTgxODE4MTgxODE4MjtpOjM7ZDowLjk7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoyOiI4OCI7aToxO3M6MjoiOTYiO2k6MjtzOjM6IjExMCI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDo4ODtpOjE7ZDo5OTtpOjI7ZDoxMDc7fXM6MzoibXNlIjtkOjkuNjA1NTg5MTc4NTU4NDQ4RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI4OCI7aToxO3M6MjoiOTYiO2k6MjtzOjM6IjExMCI7aTo0O2Q6MTA1LjkzODcyNzM1NTkzNTEzO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxMDY7fWk6OTthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MToiMCI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjI6IjU4Ijt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MjoiNTgiO2k6MztzOjI6IjY3Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuMTt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC43OTI1MzczMTM0MzI4MzU4O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuNzkyNTM3MzEzNDMyODM1ODtpOjM7ZDowLjk7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoxOiIwIjtpOjE7czoyOiI1OCI7aToyO3M6MjoiNjciO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MzA7aToxO2Q6MzA7aToyO2Q6Njc7fXM6MzoibXNlIjtkOjkuOTk5NzcxOTAwODYzMDI0RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI1OCI7aToyO3M6MjoiNjciO2k6NDtkOjY2LjU2MzUxODAxMDQxMDUyO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo2Nzt9aToxMDthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiMTciO2k6MTtzOjI6IjE0IjtpOjI7czoyOiI0MyI7aTozO3M6MToiMCI7fWk6MTthOjQ6e2k6MDtzOjI6IjE0IjtpOjE7czoyOiI0MyI7aToyO3M6MToiMCI7aTozO3M6MjoiMzkiO31pOjI7YTo0OntpOjA7czoyOiI0MyI7aToxO3M6MToiMCI7aToyO3M6MjoiMzkiO2k6MztzOjI6Ijg2Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMjU4MTM5NTM0ODgzNzIwOTM7aToxO2Q6MC4yMzAyMzI1NTgxMzk1MzQ5MjtpOjI7ZDowLjU7aTozO2Q6MC4xO31pOjE7YTo0OntpOjA7ZDowLjIzMDIzMjU1ODEzOTUzNDkyO2k6MTtkOjAuNTtpOjI7ZDowLjE7aTozO2Q6MC40NjI3OTA2OTc2NzQ0MTg2O31pOjI7YTo0OntpOjA7ZDowLjU7aToxO2Q6MC4xO2k6MjtkOjAuNDYyNzkwNjk3Njc0NDE4NjtpOjM7ZDowLjk7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoxOiIwIjtpOjE7czoyOiIzOSI7aToyO3M6MjoiODYiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6Mzk7aToxO2Q6Mzk7aToyO2Q6NDA7fXM6MzoibXNlIjtkOjUuOTk4NzQyNTU5NTU5NTkxRS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiIzOSI7aToyO3M6MjoiODYiO2k6NDtkOjM2LjE5ODAzNDA4NTgzMjI5O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDozNjt9aToxMTthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiOTEiO2k6MTtzOjM6IjEwMiI7aToyO3M6MzoiMTA5IjtpOjM7czoxOiIwIjt9aToxO2E6NDp7aTowO3M6MzoiMTAyIjtpOjE7czozOiIxMDkiO2k6MjtzOjE6IjAiO2k6MztzOjI6IjcwIjt9aToyO2E6NDp7aTowO3M6MzoiMTA5IjtpOjE7czoxOiIwIjtpOjI7czoyOiI3MCI7aTozO3M6MjoiNjUiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC43Njc4ODk5MDgyNTY4ODA3O2k6MTtkOjAuODQ4NjIzODUzMjExMDA5MjtpOjI7ZDowLjk7aTozO2Q6MC4xO31pOjE7YTo0OntpOjA7ZDowLjg0ODYyMzg1MzIxMTAwOTI7aToxO2Q6MC45O2k6MjtkOjAuMTtpOjM7ZDowLjYxMzc2MTQ2Nzg4OTkwODM7fWk6MjthOjQ6e2k6MDtkOjAuOTtpOjE7ZDowLjE7aToyO2Q6MC42MTM3NjE0Njc4ODk5MDgzO2k6MztkOjAuNTc3MDY0MjIwMTgzNDg2Mjt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjE6IjAiO2k6MTtzOjI6IjcwIjtpOjI7czoyOiI2NSI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDowO2k6MTtkOjcwO2k6MjtkOjY1O31zOjM6Im1zZSI7ZDo5Ljk3ODE5MzA0OTM3MDE5M0UtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MjoiNzAiO2k6MjtzOjI6IjY1IjtpOjQ7ZDozLjA3Nzc5Mjg4MjYxNDYxMzU7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjM7fWk6MTI7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjI6IjIyIjt9aToxO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MjoiMjIiO2k6MztzOjI6Ijg5Ijt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MjoiMjIiO2k6MjtzOjI6Ijg5IjtpOjM7czozOiIxMTIiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC4yNTcxNDI4NTcxNDI4NTcxO31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMjU3MTQyODU3MTQyODU3MTtpOjM7ZDowLjczNTcxNDI4NTcxNDI4NTc7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjI1NzE0Mjg1NzE0Mjg1NzE7aToyO2Q6MC43MzU3MTQyODU3MTQyODU3O2k6MztkOjAuOTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjIyIjtpOjE7czoyOiI4OSI7aToyO3M6MzoiMTEyIjt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjQ4O2k6MTtkOjY4O2k6MjtkOjExMjt9czozOiJtc2UiO2Q6OS43Njk3NjIxNzA2Mjk4MTFFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjI6IjIyIjtpOjE7czoyOiI4OSI7aToyO3M6MzoiMTEyIjtpOjQ7ZDoxMTEuMDE2OTYwNDU4MTIxOTM7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjExMTt9aToxMzthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MzoiMTE1Ijt9aToxO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MzoiMTE1IjtpOjM7czoyOiI2MSI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjM6IjExNSI7aToyO3M6MjoiNjEiO2k6MztzOjI6IjY5Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuOTt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjk7aTozO2Q6MC41MjQzNDc4MjYwODY5NTY2O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC45O2k6MjtkOjAuNTI0MzQ3ODI2MDg2OTU2NjtpOjM7ZDowLjU4O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MzoiMTE1IjtpOjE7czoyOiI2MSI7aToyO3M6MjoiNjkiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MTE1O2k6MTtkOjYxO2k6MjtkOjY5O31zOjM6Im1zZSI7ZDo5Ljk2NzY3NDgwNDk1MTY0MUUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MzoiMTE1IjtpOjE7czoyOiI2MSI7aToyO3M6MjoiNjkiO2k6NDtkOjY2Ljc0MzI3MzY3NjQyMTk2O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo2Nzt9aToxNDthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiNjMiO2k6MTtzOjI6Ijg1IjtpOjI7czoyOiI0NCI7aTozO3M6MjoiNTUiO31pOjE7YTo0OntpOjA7czoyOiI4NSI7aToxO3M6MjoiNDQiO2k6MjtzOjI6IjU1IjtpOjM7czoyOiI5MSI7fWk6MjthOjQ6e2k6MDtzOjI6IjQ0IjtpOjE7czoyOiI1NSI7aToyO3M6MjoiOTEiO2k6MztzOjI6Ijg0Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuNDIzNDA0MjU1MzE5MTQ4OTQ7aToxO2Q6MC43OTc4NzIzNDA0MjU1MzI7aToyO2Q6MC4xO2k6MztkOjAuMjg3MjM0MDQyNTUzMTkxNTt9aToxO2E6NDp7aTowO2Q6MC43OTc4NzIzNDA0MjU1MzI7aToxO2Q6MC4xO2k6MjtkOjAuMjg3MjM0MDQyNTUzMTkxNTtpOjM7ZDowLjk7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjI4NzIzNDA0MjU1MzE5MTU7aToyO2Q6MC45O2k6MztkOjAuNzgwODUxMDYzODI5Nzg3Mzt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjU1IjtpOjE7czoyOiI5MSI7aToyO3M6MjoiODQiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6NjA7aToxO2Q6ODY7aToyO2Q6ODQ7fXM6MzoibXNlIjtkOjguODEwMjAwMjY4NjcwNzgyRS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI1NSI7aToxO3M6MjoiOTEiO2k6MjtzOjI6Ijg0IjtpOjQ7ZDo4Mi4zNjc1MzMzNjMzNDk1Nzt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6ODI7fWk6MTU7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjI6IjU3IjtpOjE7czozOiIxMDMiO2k6MjtzOjI6IjgwIjtpOjM7czozOiIyNTciO31pOjE7YTo0OntpOjA7czozOiIxMDMiO2k6MTtzOjI6IjgwIjtpOjI7czozOiIyNTciO2k6MztzOjM6IjE3NiI7fWk6MjthOjQ6e2k6MDtzOjI6IjgwIjtpOjE7czozOiIyNTciO2k6MjtzOjM6IjE3NiI7aTozO3M6MjoiODkiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMjg0MDAwMDAwMDAwMDAwMDM7aToyO2Q6MC4xOTI7aTozO2Q6MC45O31pOjE7YTo0OntpOjA7ZDowLjI4NDAwMDAwMDAwMDAwMDAzO2k6MTtkOjAuMTkyO2k6MjtkOjAuOTtpOjM7ZDowLjU3Njt9aToyO2E6NDp7aTowO2Q6MC4xOTI7aToxO2Q6MC45O2k6MjtkOjAuNTc2O2k6MztkOjAuMjI4O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MzoiMjU3IjtpOjE7czozOiIxNzYiO2k6MjtzOjI6Ijg5Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjE2ODtpOjE7ZDoxNzY7aToyO2Q6MTc3O31zOjM6Im1zZSI7ZDoyLjgxMTA5ODIxMzE2ODM4NjhFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjM6IjI1NyI7aToxO3M6MzoiMTc2IjtpOjI7czoyOiI4OSI7aTo0O2Q6MTcyLjgxMTAwMTAyMzQ0NTk7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjE3Mzt9aToxNjthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiNzAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6IjY2IjtpOjM7czozOiIxMjAiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI2NiI7aToyO3M6MzoiMTIwIjtpOjM7czozOiIxMTgiO31pOjI7YTo0OntpOjA7czoyOiI2NiI7aToxO3M6MzoiMTIwIjtpOjI7czozOiIxMTgiO2k6MztzOjI6Ijc0Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuNTY2NjY2NjY2NjY2NjY2ODtpOjE7ZDowLjE7aToyO2Q6MC41NDtpOjM7ZDowLjk7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjU0O2k6MjtkOjAuOTtpOjM7ZDowLjg4NjY2NjY2NjY2NjY2NjY7fWk6MjthOjQ6e2k6MDtkOjAuNTQ7aToxO2Q6MC45O2k6MjtkOjAuODg2NjY2NjY2NjY2NjY2NjtpOjM7ZDowLjU5MzMzMzMzMzMzMzMzMzQ7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czozOiIxMjAiO2k6MTtzOjM6IjExOCI7aToyO3M6MjoiNzQiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MTIwO2k6MTtkOjExMztpOjI7ZDo3Nzt9czozOiJtc2UiO2Q6OS4wNTI1NjgzMTI3MTA1NTFFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjM6IjEyMCI7aToxO3M6MzoiMTE4IjtpOjI7czoyOiI3NCI7aTo0O2Q6OTEuMDMxNTkyNjg2NTQzNjU7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjkxO31pOjE3O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czozOiIyMjEiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czozOiIyMjEiO2k6MztzOjM6IjEzOSI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjM6IjIyMSI7aToyO3M6MzoiMTM5IjtpOjM7czoyOiI5MyI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjk7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC45O2k6MztkOjAuNjAzMTY3NDIwODE0NDc5Njt9aToyO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuOTtpOjI7ZDowLjYwMzE2NzQyMDgxNDQ3OTY7aTozO2Q6MC40MzY2NTE1ODM3MTA0MDcyNDt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjM6IjIyMSI7aToxO3M6MzoiMTM5IjtpOjI7czoyOiI5MyI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDoxMjU7aToxO2Q6MTM5O2k6MjtkOjE0Njt9czozOiJtc2UiO2Q6My45Mzk3ODY1MTE3Mzk2ODc0RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czozOiIyMjEiO2k6MTtzOjM6IjEzOSI7aToyO3M6MjoiOTMiO2k6NDtkOjE0NC4zMTk3MDY4NTk0OTE2NTt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6MTQ0O31pOjE4O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoyOiI5MyI7aToxO3M6MjoiNTMiO2k6MjtzOjI6IjgwIjtpOjM7czozOiIxNjgiO31pOjE7YTo0OntpOjA7czoyOiI1MyI7aToxO3M6MjoiODAiO2k6MjtzOjM6IjE2OCI7aTozO3M6MzoiMTIxIjt9aToyO2E6NDp7aTowO3M6MjoiODAiO2k6MTtzOjM6IjE2OCI7aToyO3M6MzoiMTIxIjtpOjM7czoyOiI5NSI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjM3ODI2MDg2OTU2NTIxNzQzO2k6MTtkOjAuMTtpOjI7ZDowLjI4NzgyNjA4Njk1NjUyMTg7aTozO2Q6MC45O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4yODc4MjYwODY5NTY1MjE4O2k6MjtkOjAuOTtpOjM7ZDowLjU3MzA0MzQ3ODI2MDg2OTc7fWk6MjthOjQ6e2k6MDtkOjAuMjg3ODI2MDg2OTU2NTIxODtpOjE7ZDowLjk7aToyO2Q6MC41NzMwNDM0NzgyNjA4Njk3O2k6MztkOjAuMzkyMTczOTEzMDQzNDc4MjY7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czozOiIxNjgiO2k6MTtzOjM6IjEyMSI7aToyO3M6MjoiOTUiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6OTE7aToxO2Q6OTM7aToyO2Q6OTU7fXM6MzoibXNlIjtkOjMuNjI0MDYzODk1Njg1ODU3M0UtOTtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MzoiMTY4IjtpOjE7czozOiIxMjEiO2k6MjtzOjI6Ijk1IjtpOjQ7ZDo5NC40MTI3NDk3NTU2NjQxO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo5NDt9aToxOTthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiNTMiO2k6MTtzOjM6IjExMSI7aToyO3M6MjoiMzAiO2k6MztzOjI6Ijg4Ijt9aToxO2E6NDp7aTowO3M6MzoiMTExIjtpOjE7czoyOiIzMCI7aToyO3M6MjoiODgiO2k6MztzOjI6Ijc2Ijt9aToyO2E6NDp7aTowO3M6MjoiMzAiO2k6MTtzOjI6Ijg4IjtpOjI7czoyOiI3NiI7aTozO3M6MzoiMTA3Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMzI3MTYwNDkzODI3MTYwNTtpOjE7ZDowLjk7aToyO2Q6MC4xO2k6MztkOjAuNjcyODM5NTA2MTcyODM5NTt9aToxO2E6NDp7aTowO2Q6MC45O2k6MTtkOjAuMTtpOjI7ZDowLjY3MjgzOTUwNjE3MjgzOTU7aTozO2Q6MC41NTQzMjA5ODc2NTQzMjE7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjY3MjgzOTUwNjE3MjgzOTU7aToyO2Q6MC41NTQzMjA5ODc2NTQzMjE7aTozO2Q6MC44NjA0OTM4MjcxNjA0OTM4O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiODgiO2k6MTtzOjI6Ijc2IjtpOjI7czozOiIxMDciO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6ODg7aToxO2Q6NzY7aToyO2Q6MTA2O31zOjM6Im1zZSI7ZDo5Ljk3MTM4NjA2NjA3NzAzMkUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiODgiO2k6MTtzOjI6Ijc2IjtpOjI7czozOiIxMDciO2k6NDtkOjEwOC4yODgxNDQ0MTMxMjI1Nzt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6MTA4O31pOjIwO2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoyOiI0NSI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6IjQ1IjtpOjM7czozOiIxMTIiO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI0NSI7aToyO3M6MzoiMTEyIjtpOjM7czozOiIxMDEiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC40MjE0Mjg1NzE0Mjg1NzE1O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuNDIxNDI4NTcxNDI4NTcxNTtpOjM7ZDowLjk7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjQyMTQyODU3MTQyODU3MTU7aToyO2Q6MC45O2k6MztkOjAuODIxNDI4NTcxNDI4NTcxNTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjQ1IjtpOjE7czozOiIxMTIiO2k6MjtzOjM6IjEwMSI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDo3NDtpOjE7ZDo4NTtpOjI7ZDoxMDE7fXM6MzoibXNlIjtkOjcuNjc5MjMxMjg3MDUxMjk2RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI0NSI7aToxO3M6MzoiMTEyIjtpOjI7czozOiIxMDEiO2k6NDtkOjk5Ljk0OTMxODAwODQ4ODg2O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxMDA7fWk6MjE7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjE6IjAiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoxOiIwIjt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MjoiMTYiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC4xO31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjE7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuMTc5NTAzMTA1NTkwMDYyMTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6IjE2Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjU7aToxO2Q6NTtpOjI7ZDo1O31zOjM6Im1zZSI7ZDowLjAwMDM1NzAzNzM1NTIwMTg0NDk7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6IjE2IjtpOjQ7ZDo1LjI1Mjk3NTE0NDczMTA2NTt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6NTt9aToyMjthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiNjkiO2k6MTtzOjI6Ijc1IjtpOjI7czoyOiI4MyI7aTozO3M6MjoiOTgiO31pOjE7YTo0OntpOjA7czoyOiI3NSI7aToxO3M6MjoiODMiO2k6MjtzOjI6Ijk4IjtpOjM7czozOiIxNDciO31pOjI7YTo0OntpOjA7czoyOiI4MyI7aToxO3M6MjoiOTgiO2k6MjtzOjM6IjE0NyI7aTozO3M6MjoiODYiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTYxNTM4NDYxNTM4NDYxNTU7aToyO2Q6MC4yNDM1ODk3NDM1ODk3NDM2O2k6MztkOjAuMzk3NDM1ODk3NDM1ODk3NDc7fWk6MTthOjQ6e2k6MDtkOjAuMTYxNTM4NDYxNTM4NDYxNTU7aToxO2Q6MC4yNDM1ODk3NDM1ODk3NDM2O2k6MjtkOjAuMzk3NDM1ODk3NDM1ODk3NDc7aTozO2Q6MC45O31pOjI7YTo0OntpOjA7ZDowLjI0MzU4OTc0MzU4OTc0MzY7aToxO2Q6MC4zOTc0MzU4OTc0MzU4OTc0NztpOjI7ZDowLjk7aTozO2Q6MC4yNzQzNTg5NzQzNTg5NzQ0O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiOTgiO2k6MTtzOjM6IjE0NyI7aToyO3M6MjoiODYiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6OTg7aToxO2Q6MTQ3O2k6MjtkOjg2O31zOjM6Im1zZSI7ZDo5Ljk4NzE0MzYyOTQ0ODcyNkUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiOTgiO2k6MTtzOjM6IjE0NyI7aToyO3M6MjoiODYiO2k6NDtkOjgyLjc3NDAxNjcxMzAzNTI4O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo4Mzt9aToyMzthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MjoiNjQiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoyOiI2NCI7aTozO3M6MzoiMTM0Ijt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MjoiNjQiO2k6MjtzOjM6IjEzNCI7aTozO3M6MjoiOTQiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC40ODIwODk1NTIyMzg4MDY7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC40ODIwODk1NTIyMzg4MDY7aTozO2Q6MC45O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC40ODIwODk1NTIyMzg4MDY7aToyO2Q6MC45O2k6MztkOjAuNjYxMTk0MDI5ODUwNzQ2Mzt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjY0IjtpOjE7czozOiIxMzQiO2k6MjtzOjI6Ijk0Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjgzO2k6MTtkOjg2O2k6MjtkOjk0O31zOjM6Im1zZSI7ZDoxLjM5MTM3MDQ1NTc0NTY4NkUtMTA7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjI6IjY0IjtpOjE7czozOiIxMzQiO2k6MjtzOjI6Ijk0IjtpOjQ7ZDo5Mi43NjcwNTM4MDYyNDcyO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo5Mzt9aToyNDthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiOTAiO2k6MTtzOjI6IjQzIjtpOjI7czoyOiI1MSI7aTozO3M6MjoiNzIiO31pOjE7YTo0OntpOjA7czoyOiI0MyI7aToxO3M6MjoiNTEiO2k6MjtzOjI6IjcyIjtpOjM7czoyOiI2MiI7fWk6MjthOjQ6e2k6MDtzOjI6IjUxIjtpOjE7czoyOiI3MiI7aToyO3M6MjoiNjIiO2k6MztzOjM6IjE4NSI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjM2NDc4ODczMjM5NDM2NjI3O2k6MTtkOjAuMTtpOjI7ZDowLjE0NTA3MDQyMjUzNTIxMTI3O2k6MztkOjAuMjYzMzgwMjgxNjkwMTQwODt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTQ1MDcwNDIyNTM1MjExMjc7aToyO2Q6MC4yNjMzODAyODE2OTAxNDA4O2k6MztkOjAuMjA3MDQyMjUzNTIxMTI2NzY7fWk6MjthOjQ6e2k6MDtkOjAuMTQ1MDcwNDIyNTM1MjExMjc7aToxO2Q6MC4yNjMzODAyODE2OTAxNDA4O2k6MjtkOjAuMjA3MDQyMjUzNTIxMTI2NzY7aTozO2Q6MC45O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiNzIiO2k6MTtzOjI6IjYyIjtpOjI7czozOiIxODUiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6NzI7aToxO2Q6OTU7aToyO2Q6MTU1O31zOjM6Im1zZSI7ZDo2LjY2MzEyNTczNzMzNzQyNkUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiNzIiO2k6MTtzOjI6IjYyIjtpOjI7czozOiIxODUiO2k6NDtkOjE1OS45NDAzMjEwNzkwMjkyNzt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6MTYwO31pOjI1O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoyOiI5NCI7aToxO3M6MjoiMzciO2k6MjtzOjI6IjYyIjtpOjM7czoyOiI1OSI7fWk6MTthOjQ6e2k6MDtzOjI6IjM3IjtpOjE7czoyOiI2MiI7aToyO3M6MjoiNTkiO2k6MztzOjI6IjYxIjt9aToyO2E6NDp7aTowO3M6MjoiNjIiO2k6MTtzOjI6IjU5IjtpOjI7czoyOiI2MSI7aTozO3M6MzoiMTA2Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuNzYwODY5NTY1MjE3MzkxNDtpOjE7ZDowLjE7aToyO2Q6MC4zODk4NTUwNzI0NjM3NjgxNjtpOjM7ZDowLjM1NTA3MjQ2Mzc2ODExNTk2O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4zODk4NTUwNzI0NjM3NjgxNjtpOjI7ZDowLjM1NTA3MjQ2Mzc2ODExNTk2O2k6MztkOjAuMzc4MjYwODY5NTY1MjE3NDM7fWk6MjthOjQ6e2k6MDtkOjAuMzg5ODU1MDcyNDYzNzY4MTY7aToxO2Q6MC4zNTUwNzI0NjM3NjgxMTU5NjtpOjI7ZDowLjM3ODI2MDg2OTU2NTIxNzQzO2k6MztkOjAuOTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjU5IjtpOjE7czoyOiI2MSI7aToyO3M6MzoiMTA2Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjU5O2k6MTtkOjYxO2k6MjtkOjEwNjt9czozOiJtc2UiO2Q6OS45OTUwOTA4MjA1MDA5NDlFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjI6IjU5IjtpOjE7czoyOiI2MSI7aToyO3M6MzoiMTA2IjtpOjQ7ZDozNS4zMzgwMDE4NzM0MDA1O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDozNTt9aToyNjthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MjoiMzQiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoyOiIzNCI7aTozO3M6MjoiNzMiO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiIzNCI7aToyO3M6MjoiNzMiO2k6MztzOjM6IjEwNyI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjM1NDIwNTYwNzQ3NjYzNTU0O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMzU0MjA1NjA3NDc2NjM1NTQ7aTozO2Q6MC42NDU3OTQzOTI1MjMzNjQ1O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4zNTQyMDU2MDc0NzY2MzU1NDtpOjI7ZDowLjY0NTc5NDM5MjUyMzM2NDU7aTozO2Q6MC45O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiMzQiO2k6MTtzOjI6IjczIjtpOjI7czozOiIxMDciO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6Mzc7aToxO2Q6NzE7aToyO2Q6MTA3O31zOjM6Im1zZSI7ZDo4LjE4ODI4Mzc2NDQzMzkwMkUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiMzQiO2k6MTtzOjI6IjczIjtpOjI7czozOiIxMDciO2k6NDtkOjEwNi40ODU0OTM5ODk1MzM1MTt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6MTA2O31pOjI3O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoyOiI3MCI7aToxO3M6MjoiODciO2k6MjtzOjM6IjE0MiI7aTozO3M6MjoiNjUiO31pOjE7YTo0OntpOjA7czoyOiI4NyI7aToxO3M6MzoiMTQyIjtpOjI7czoyOiI2NSI7aTozO3M6MzoiMTc1Ijt9aToyO2E6NDp7aTowO3M6MzoiMTQyIjtpOjE7czoyOiI2NSI7aToyO3M6MzoiMTc1IjtpOjM7czozOiIxNjAiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xMzYzNjM2MzYzNjM2MzYzODtpOjE7ZDowLjI2O2k6MjtkOjAuNjU5OTk5OTk5OTk5OTk5OTtpOjM7ZDowLjE7fWk6MTthOjQ6e2k6MDtkOjAuMjY7aToxO2Q6MC42NTk5OTk5OTk5OTk5OTk5O2k6MjtkOjAuMTtpOjM7ZDowLjk7fWk6MjthOjQ6e2k6MDtkOjAuNjU5OTk5OTk5OTk5OTk5OTtpOjE7ZDowLjE7aToyO2Q6MC45O2k6MztkOjAuNzkwOTA5MDkwOTA5MDkwOTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjY1IjtpOjE7czozOiIxNzUiO2k6MjtzOjM6IjE2MCI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDo2NTtpOjE7ZDoxNzU7aToyO2Q6MTYwO31zOjM6Im1zZSI7ZDo5Ljk3NDIxMjY1OTE4MDk0M0UtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiNjUiO2k6MTtzOjM6IjE3NSI7aToyO3M6MzoiMTYwIjtpOjQ7ZDo1NS43MzA2Mzg3MTc3MDA1NDt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6NTY7fWk6Mjg7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjI6IjE1IjtpOjE7czoyOiIxOCI7aToyO3M6MjoiMTUiO2k6MztzOjE6IjUiO31pOjE7YTo0OntpOjA7czoyOiIxOCI7aToxO3M6MjoiMTUiO2k6MjtzOjE6IjUiO2k6MztzOjI6IjE3Ijt9aToyO2E6NDp7aTowO3M6MjoiMTUiO2k6MTtzOjE6IjUiO2k6MjtzOjI6IjE3IjtpOjM7czoyOiIyOCI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjQ0NzgyNjA4Njk1NjUyMTc7aToxO2Q6MC41NTIxNzM5MTMwNDM0NzgzO2k6MjtkOjAuNDQ3ODI2MDg2OTU2NTIxNztpOjM7ZDowLjE7fWk6MTthOjQ6e2k6MDtkOjAuNTUyMTczOTEzMDQzNDc4MztpOjE7ZDowLjQ0NzgyNjA4Njk1NjUyMTc7aToyO2Q6MC4xO2k6MztkOjAuNTE3MzkxMzA0MzQ3ODI2MTt9aToyO2E6NDp7aTowO2Q6MC40NDc4MjYwODY5NTY1MjE3O2k6MTtkOjAuMTtpOjI7ZDowLjUxNzM5MTMwNDM0NzgyNjE7aTozO2Q6MC45O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MToiNSI7aToxO3M6MjoiMTciO2k6MjtzOjI6IjI4Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjU7aToxO2Q6MTc7aToyO2Q6Mjg7fXM6MzoibXNlIjtkOjkuOTk1NjgyNDczMTkwODE0RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoxOiI1IjtpOjE7czoyOiIxNyI7aToyO3M6MjoiMjgiO2k6NDtkOjE5Ljk0ODMyNjU2NzU1MTYzO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoyMDt9aToyOTthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MjoiMjUiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoyOiIyNSI7aTozO3M6MjoiMjgiO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiIyNSI7aToyO3M6MjoiMjgiO2k6MztzOjM6IjExMyI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjI3Njk5MTE1MDQ0MjQ3Nzk7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4yNzY5OTExNTA0NDI0Nzc5O2k6MztkOjAuMjk4MjMwMDg4NDk1NTc1Mjt9aToyO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMjc2OTkxMTUwNDQyNDc3OTtpOjI7ZDowLjI5ODIzMDA4ODQ5NTU3NTI7aTozO2Q6MC45O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiMjUiO2k6MTtzOjI6IjI4IjtpOjI7czozOiIxMTMiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MjU7aToxO2Q6NDg7aToyO2Q6OTI7fXM6MzoibXNlIjtkOjkuMDE5NjUzMDgyNTIxMzAzRS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiIyNSI7aToxO3M6MjoiMjgiO2k6MjtzOjM6IjExMyI7aTo0O2Q6ODcuODI3MzAzMTQwMjIxMTt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6ODg7fWk6MzA7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjI6IjM0IjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoyOiIzOCI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6IjM4IjtpOjM7czoxOiIwIjt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MjoiMzgiO2k6MjtzOjE6IjAiO2k6MztzOjI6IjExIjt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMzQwNzA3OTY0NjAxNzY5OTQ7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjM2OTAyNjU0ODY3MjU2NjQ2O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMzY5MDI2NTQ4NjcyNTY2NDY7aTozO2Q6MC4xO31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4zNjkwMjY1NDg2NzI1NjY0NjtpOjI7ZDowLjE7aTozO2Q6MC4xNzc4NzYxMDYxOTQ2OTAyNzt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6IjM4IjtpOjE7czoxOiIwIjtpOjI7czoyOiIxMSI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDozNjtpOjE7ZDo0O2k6MjtkOjExO31zOjM6Im1zZSI7ZDo5LjM0OTc3NjY5NzY0MzlFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjI6IjM4IjtpOjE7czoxOiIwIjtpOjI7czoyOiIxMSI7aTo0O2Q6NC44NTAxODExMTcwOTI4MjM7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjU7fWk6MzE7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjI6IjE0IjtpOjE7czoyOiI0MiI7aToyO3M6MjoiMTYiO2k6MztzOjE6IjkiO31pOjE7YTo0OntpOjA7czoyOiI0MiI7aToxO3M6MjoiMTYiO2k6MjtzOjE6IjkiO2k6MztzOjI6IjE4Ijt9aToyO2E6NDp7aTowO3M6MjoiMTYiO2k6MTtzOjE6IjkiO2k6MjtzOjI6IjE4IjtpOjM7czoyOiIxOSI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjIyMTIxMjEyMTIxMjEyMTIyO2k6MTtkOjAuOTtpOjI7ZDowLjI2OTY5Njk2OTY5Njk2OTc7aTozO2Q6MC4xO31pOjE7YTo0OntpOjA7ZDowLjk7aToxO2Q6MC4yNjk2OTY5Njk2OTY5Njk3O2k6MjtkOjAuMTtpOjM7ZDowLjMxODE4MTgxODE4MTgxODI7fWk6MjthOjQ6e2k6MDtkOjAuMjY5Njk2OTY5Njk2OTY5NztpOjE7ZDowLjE7aToyO2Q6MC4zMTgxODE4MTgxODE4MTgyO2k6MztkOjAuMzQyNDI0MjQyNDI0MjQyNDt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjE6IjkiO2k6MTtzOjI6IjE4IjtpOjI7czoyOiIxOSI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDoxMztpOjE7ZDoxODtpOjI7ZDoxNjt9czozOiJtc2UiO2Q6Ni40ODk3NjUxNDg1NDQwMjNFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjE6IjkiO2k6MTtzOjI6IjE4IjtpOjI7czoyOiIxOSI7aTo0O2Q6MTQuNzY2NjM0MzgwNTkzNjg0O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxNTt9aTozMjthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MjoiNDAiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoyOiI0MCI7aTozO3M6MjoiNTMiO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI0MCI7aToyO3M6MjoiNTMiO2k6MztzOjM6IjEwMSI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjQxNjgzMTY4MzE2ODMxNjg3O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuNDE2ODMxNjgzMTY4MzE2ODc7aTozO2Q6MC41MTk4MDE5ODAxOTgwMTk4O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC40MTY4MzE2ODMxNjgzMTY4NztpOjI7ZDowLjUxOTgwMTk4MDE5ODAxOTg7aTozO2Q6MC45O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiNDAiO2k6MTtzOjI6IjUzIjtpOjI7czozOiIxMDEiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6NDA7aToxO2Q6NjE7aToyO2Q6OTA7fXM6MzoibXNlIjtkOjguMDAxNjAwMjEzMTE1MzQ0RS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI0MCI7aToxO3M6MjoiNTMiO2k6MjtzOjM6IjEwMSI7aTo0O2Q6ODkuNDQ4MTQ4MDMyMjk5Nzg7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjg5O31pOjMzO2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoyOiI2MyI7aTozO3M6MjoiOTIiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI2MyI7aToyO3M6MjoiOTIiO2k6MztzOjI6Ijg1Ijt9aToyO2E6NDp7aTowO3M6MjoiNjMiO2k6MTtzOjI6IjkyIjtpOjI7czoyOiI4NSI7aTozO3M6MzoiMTM3Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC40Njc4ODMyMTE2Nzg4MzIyO2k6MztkOjAuNjM3MjI2Mjc3MzcyMjYyODt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuNDY3ODgzMjExNjc4ODMyMjtpOjI7ZDowLjYzNzIyNjI3NzM3MjI2Mjg7aTozO2Q6MC41OTYzNTAzNjQ5NjM1MDM3O31pOjI7YTo0OntpOjA7ZDowLjQ2Nzg4MzIxMTY3ODgzMjI7aToxO2Q6MC42MzcyMjYyNzczNzIyNjI4O2k6MjtkOjAuNTk2MzUwMzY0OTYzNTAzNztpOjM7ZDowLjk7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoyOiI5MiI7aToxO3M6MjoiODUiO2k6MjtzOjM6IjEzNyI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDo5MjtpOjE7ZDoxMDM7aToyO2Q6MTE4O31zOjM6Im1zZSI7ZDo2LjMwMzQ4NDAxODc5ODYwM0UtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiOTIiO2k6MTtzOjI6Ijg1IjtpOjI7czozOiIxMzciO2k6NDtkOjEwMy4yMjMwMjMyODgyMzc2MTt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6MTAzO31pOjM0O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoyOiI5OCI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjI6Ijk4IjtpOjM7czoyOiI0MyI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjI6Ijk4IjtpOjI7czoyOiI0MyI7aTozO3M6MToiMCI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjk7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC45O2k6MztkOjAuNDUxMDIwNDA4MTYzMjY1Mzt9aToyO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuOTtpOjI7ZDowLjQ1MTAyMDQwODE2MzI2NTM7aTozO2Q6MC4xO319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiOTgiO2k6MTtzOjI6IjQzIjtpOjI7czoxOiIwIjt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjM3O2k6MTtkOjQzO2k6MjtkOjQ0O31zOjM6Im1zZSI7ZDo2Ljg5MTk1MTQ5MTA1MTExMUUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiOTgiO2k6MTtzOjI6IjQzIjtpOjI7czoxOiIwIjtpOjQ7ZDo0NC4xODgzMDY0MjcwMTYxO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo0NDt9aTozNTthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MToiOSI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjkiO2k6MztzOjI6IjI4Ijt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiOSI7aToyO3M6MjoiMjgiO2k6MztzOjI6IjQ2Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuMjU2NTIxNzM5MTMwNDM0ODt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjI1NjUyMTczOTEzMDQzNDg7aTozO2Q6MC41ODY5NTY1MjE3MzkxMzA1O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4yNTY1MjE3MzkxMzA0MzQ4O2k6MjtkOjAuNTg2OTU2NTIxNzM5MTMwNTtpOjM7ZDowLjk7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoxOiI5IjtpOjE7czoyOiIyOCI7aToyO3M6MjoiNDYiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6MTQ7aToxO2Q6MjU7aToyO2Q6NDY7fXM6MzoibXNlIjtkOjguMzAyMzg3MjQ3MTM4MzFFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjE6IjkiO2k6MTtzOjI6IjI4IjtpOjI7czoyOiI0NiI7aTo0O2Q6NDUuNTA0MjgwNjc2MDE2MDU7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjQ2O31pOjM2O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czozOiIxMDkiO2k6MTtzOjI6IjUzIjtpOjI7czoyOiI2MyI7aTozO3M6MjoiNTAiO31pOjE7YTo0OntpOjA7czoyOiI1MyI7aToxO3M6MjoiNjMiO2k6MjtzOjI6IjUwIjtpOjM7czoyOiIyNiI7fWk6MjthOjQ6e2k6MDtzOjI6IjYzIjtpOjE7czoyOiI1MCI7aToyO3M6MjoiMjYiO2k6MztzOjM6IjE0MyI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjY2NzUyMTM2NzUyMTM2NzY7aToxO2Q6MC4yODQ2MTUzODQ2MTUzODQ2O2k6MjtkOjAuMzUyOTkxNDUyOTkxNDUyOTY7aTozO2Q6MC4yNjQxMDI1NjQxMDI1NjQxO31pOjE7YTo0OntpOjA7ZDowLjI4NDYxNTM4NDYxNTM4NDY7aToxO2Q6MC4zNTI5OTE0NTI5OTE0NTI5NjtpOjI7ZDowLjI2NDEwMjU2NDEwMjU2NDE7aTozO2Q6MC4xO31pOjI7YTo0OntpOjA7ZDowLjM1Mjk5MTQ1Mjk5MTQ1Mjk2O2k6MTtkOjAuMjY0MTAyNTY0MTAyNTY0MTtpOjI7ZDowLjE7aTozO2Q6MC45O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiNTAiO2k6MTtzOjI6IjI2IjtpOjI7czozOiIxNDMiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6NTA7aToxO2Q6NjM7aToyO2Q6MTEwO31zOjM6Im1zZSI7ZDoyLjcyMzIyMDc4MzQ1NTU0MTNFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjI6IjUwIjtpOjE7czoyOiIyNiI7aToyO3M6MzoiMTQzIjtpOjQ7ZDoxMTEuMDU5NjQ3ODYwMjU0ODg7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjExMTt9aTozNzthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MjoiNTMiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoyOiI1MyI7aTozO3M6MjoiNTciO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoyOiI1MyI7aToyO3M6MjoiNTciO2k6MztzOjI6IjU5Ijt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC4xO2k6MztkOjAuODE4NjQ0MDY3Nzk2NjEwMzt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjgxODY0NDA2Nzc5NjYxMDM7aTozO2Q6MC44NzI4ODEzNTU5MzIyMDM0O31pOjI7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC44MTg2NDQwNjc3OTY2MTAzO2k6MjtkOjAuODcyODgxMzU1OTMyMjAzNDtpOjM7ZDowLjk7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoyOiI1MyI7aToxO3M6MjoiNTciO2k6MjtzOjI6IjU5Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjUzO2k6MTtkOjU1O2k6MjtkOjU5O31zOjM6Im1zZSI7ZDo1LjgwMjMxOTUzOTQ3Nzg5NkUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiNTMiO2k6MTtzOjI6IjU3IjtpOjI7czoyOiI1OSI7aTo0O2Q6NTguNzc1NDAzMDI3Mzg5NTc7fXM6MTQ6Imhhc2lsX3ByZWRpa3NpIjtkOjU5O31pOjM4O2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czozOiIyMDYiO31pOjE7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czozOiIyMDYiO2k6MztzOjM6IjEzNCI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjM6IjIwNiI7aToyO3M6MzoiMTM0IjtpOjM7czozOiIxMTciO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuMTtpOjI7ZDowLjE7aTozO2Q6MC45O31pOjE7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuOTtpOjM7ZDowLjYyMDM4ODM0OTUxNDU2MzE7fWk6MjthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjk7aToyO2Q6MC42MjAzODgzNDk1MTQ1NjMxO2k6MztkOjAuNTU0MzY4OTMyMDM4ODM1O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MzoiMjA2IjtpOjE7czozOiIxMzQiO2k6MjtzOjM6IjExNyI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDoyMDU7aToxO2Q6MTM0O2k6MjtkOjExNzt9czozOiJtc2UiO2Q6OS45NzQ0ODgwNDk1MjU5MDhFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjM6IjIwNiI7aToxO3M6MzoiMTM0IjtpOjI7czozOiIxMTciO2k6NDtkOjExNC4xNTE3ODk5MjI2NDU2O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxMTQ7fWk6Mzk7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjM6IjExNSI7aToxO3M6MzoiMTE1IjtpOjI7czoyOiI5OSI7aTozO3M6MjoiMTMiO31pOjE7YTo0OntpOjA7czozOiIxMTUiO2k6MTtzOjI6Ijk5IjtpOjI7czoyOiIxMyI7aTozO3M6MjoiMjMiO31pOjI7YTo0OntpOjA7czoyOiI5OSI7aToxO3M6MjoiMTMiO2k6MjtzOjI6IjIzIjtpOjM7czoyOiI0NCI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjk7aToxO2Q6MC45O2k6MjtkOjAuNzc0NTA5ODAzOTIxNTY4NztpOjM7ZDowLjE7fWk6MTthOjQ6e2k6MDtkOjAuOTtpOjE7ZDowLjc3NDUwOTgwMzkyMTU2ODc7aToyO2Q6MC4xO2k6MztkOjAuMTc4NDMxMzcyNTQ5MDE5Njt9aToyO2E6NDp7aTowO2Q6MC43NzQ1MDk4MDM5MjE1Njg3O2k6MTtkOjAuMTtpOjI7ZDowLjE3ODQzMTM3MjU0OTAxOTY7aTozO2Q6MC4zNDMxMzcyNTQ5MDE5NjA4O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MjoiMTMiO2k6MTtzOjI6IjIzIjtpOjI7czoyOiI0NCI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDoxMztpOjE7ZDoyMztpOjI7ZDo0NDt9czozOiJtc2UiO2Q6OS45MTUzNDk5MjE2NjIyMUUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MjoiMTMiO2k6MTtzOjI6IjIzIjtpOjI7czoyOiI0NCI7aTo0O2Q6NDguODI0MDE4NjU1NjE1ODQ1O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo0OTt9aTo0MDthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MjoiNzQiO2k6MTtzOjI6IjE4IjtpOjI7czoyOiI2OCI7aTozO3M6MjoiODkiO31pOjE7YTo0OntpOjA7czoyOiIxOCI7aToxO3M6MjoiNjgiO2k6MjtzOjI6Ijg5IjtpOjM7czozOiIxMzEiO31pOjI7YTo0OntpOjA7czoyOiI2OCI7aToxO3M6MjoiODkiO2k6MjtzOjM6IjEzMSI7aTozO3M6MjoiOTYiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6MC40OTY0NjAxNzY5OTExNTA0O2k6MTtkOjAuMTtpOjI7ZDowLjQ1Mzk4MjMwMDg4NDk1NTg0O2k6MztkOjAuNjAyNjU0ODY3MjU2NjM3Mjt9aToxO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuNDUzOTgyMzAwODg0OTU1ODQ7aToyO2Q6MC42MDI2NTQ4NjcyNTY2MzcyO2k6MztkOjAuOTt9aToyO2E6NDp7aTowO2Q6MC40NTM5ODIzMDA4ODQ5NTU4NDtpOjE7ZDowLjYwMjY1NDg2NzI1NjYzNzI7aToyO2Q6MC45O2k6MztkOjAuNjUyMjEyMzg5MzgwNTMwOTt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjI6Ijg5IjtpOjE7czozOiIxMzEiO2k6MjtzOjI6Ijk2Ijt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjg5O2k6MTtkOjEyMDtpOjI7ZDoxMDM7fXM6MzoibXNlIjtkOjkuMjc2NTE2MTk1MjI4MzkyRS04O3M6MTI6InVqaV9kYXRhX3VqaSI7YTo0OntpOjA7czoyOiI4OSI7aToxO3M6MzoiMTMxIjtpOjI7czoyOiI5NiI7aTo0O2Q6MTI3LjAxMzc4MTgzNjIxOTI0O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxMjc7fWk6NDE7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjM6IjE4NSI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjM6IjE4NSI7aTozO3M6MzoiMTA4Ijt9aToyO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MzoiMTg1IjtpOjI7czozOiIxMDgiO2k6MztzOjM6IjEwMCI7fX1zOjE3OiJkYXRhX3RyYWluX3NjYWxlZCI7YTozOntpOjA7YTo0OntpOjA7ZDowLjE7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjk7fWk6MTthOjQ6e2k6MDtkOjAuMTtpOjE7ZDowLjE7aToyO2Q6MC45O2k6MztkOjAuNTY3MDI3MDI3MDI3MDI3MTt9aToyO2E6NDp7aTowO2Q6MC4xO2k6MTtkOjAuOTtpOjI7ZDowLjU2NzAyNzAyNzAyNzAyNzE7aTozO2Q6MC41MzI0MzI0MzI0MzI0MzI0O319czoxNDoiZGF0YV90cmFpbl9vdXQiO2E6Mzp7aTowO3M6MzoiMTg1IjtpOjE7czozOiIxMDgiO2k6MjtzOjM6IjEwMCI7fXM6MjQ6InVqaV9kYXRhX3RyYWluX3ByZWRpY3RlZCI7YTozOntpOjA7ZDoxODQ7aToxO2Q6MTA4O2k6MjtkOjEwMDt9czozOiJtc2UiO2Q6OS45NTI5NzIyNzExNzc1OTlFLTg7czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjM6IjE4NSI7aToxO3M6MzoiMTA4IjtpOjI7czozOiIxMDAiO2k6NDtkOjk3LjUzNDg2NjM5MTI1Mjk4O31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDo5ODt9aTo0MjthOjc6e3M6MTA6ImRhdGFfdHJhaW4iO2E6Mzp7aTowO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MToiMCI7fWk6MTthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjE6IjAiO31pOjI7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoxOiIwIjt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOk5BTjtpOjE7ZDpOQU47aToyO2Q6TkFOO2k6MztkOk5BTjt9aToxO2E6NDp7aTowO2Q6TkFOO2k6MTtkOk5BTjtpOjI7ZDpOQU47aTozO2Q6TkFOO31pOjI7YTo0OntpOjA7ZDpOQU47aToxO2Q6TkFOO2k6MjtkOk5BTjtpOjM7ZDpOQU47fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOk5BTjtpOjE7ZDpOQU47aToyO2Q6TkFOO31zOjM6Im1zZSI7ZDpOQU47czoxMjoidWppX2RhdGFfdWppIjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6NDtkOk5BTjt9czoxNDoiaGFzaWxfcHJlZGlrc2kiO2Q6TkFOO31pOjQzO2E6Nzp7czoxMDoiZGF0YV90cmFpbiI7YTozOntpOjA7YTo0OntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoxOiIwIjt9aToxO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTozO3M6MToiMCI7fWk6MjthOjQ6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO2k6MztzOjE6IjAiO319czoxNzoiZGF0YV90cmFpbl9zY2FsZWQiO2E6Mzp7aTowO2E6NDp7aTowO2Q6TkFOO2k6MTtkOk5BTjtpOjI7ZDpOQU47aTozO2Q6TkFOO31pOjE7YTo0OntpOjA7ZDpOQU47aToxO2Q6TkFOO2k6MjtkOk5BTjtpOjM7ZDpOQU47fWk6MjthOjQ6e2k6MDtkOk5BTjtpOjE7ZDpOQU47aToyO2Q6TkFOO2k6MztkOk5BTjt9fXM6MTQ6ImRhdGFfdHJhaW5fb3V0IjthOjM6e2k6MDtzOjE6IjAiO2k6MTtzOjE6IjAiO2k6MjtzOjE6IjAiO31zOjI0OiJ1amlfZGF0YV90cmFpbl9wcmVkaWN0ZWQiO2E6Mzp7aTowO2Q6TkFOO2k6MTtkOk5BTjtpOjI7ZDpOQU47fXM6MzoibXNlIjtkOk5BTjtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTo0O2Q6TkFOO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDpOQU47fWk6NDQ7YTo3OntzOjEwOiJkYXRhX3RyYWluIjthOjM6e2k6MDthOjQ6e2k6MDtzOjI6IjkxIjtpOjE7czozOiIxMDIiO2k6MjtzOjM6IjEwOSI7aTozO3M6MToiMCI7fWk6MTthOjQ6e2k6MDtzOjM6IjEwMiI7aToxO3M6MzoiMTA5IjtpOjI7czoxOiIwIjtpOjM7czoxOiIwIjt9aToyO2E6NDp7aTowO3M6MzoiMTA5IjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjtpOjM7czoxOiIwIjt9fXM6MTc6ImRhdGFfdHJhaW5fc2NhbGVkIjthOjM6e2k6MDthOjQ6e2k6MDtkOjAuNzY3ODg5OTA4MjU2ODgwNztpOjE7ZDowLjg0ODYyMzg1MzIxMTAwOTI7aToyO2Q6MC45O2k6MztkOjAuMTt9aToxO2E6NDp7aTowO2Q6MC44NDg2MjM4NTMyMTEwMDkyO2k6MTtkOjAuOTtpOjI7ZDowLjE7aTozO2Q6MC4xO31pOjI7YTo0OntpOjA7ZDowLjk7aToxO2Q6MC4xO2k6MjtkOjAuMTtpOjM7ZDowLjE7fX1zOjE0OiJkYXRhX3RyYWluX291dCI7YTozOntpOjA7czoxOiIwIjtpOjE7czoxOiIwIjtpOjI7czoxOiIwIjt9czoyNDoidWppX2RhdGFfdHJhaW5fcHJlZGljdGVkIjthOjM6e2k6MDtkOjA7aToxO2Q6MDtpOjI7ZDoxO31zOjM6Im1zZSI7ZDo5LjA4NTAyOTM3Mjg0NTI5NUUtODtzOjEyOiJ1amlfZGF0YV91amkiO2E6NDp7aTowO3M6MToiMCI7aToxO3M6MToiMCI7aToyO3M6MToiMCI7aTo0O2Q6MC45OTIzNDM5ODM1NDE1MzQzO31zOjE0OiJoYXNpbF9wcmVkaWtzaSI7ZDoxO319'),
(2, 'klasifikasi', NULL),
(3, 'algen_penjadwalan', 'YTowOnt9');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah_kurikulum`
--

CREATE TABLE `mata_kuliah_kurikulum` (
  `mkkur_id` int(11) NOT NULL,
  `mkkur_kode` varchar(20) DEFAULT NULL,
  `mkkur_nama` varchar(200) DEFAULT NULL,
  `mkkur_sks` int(5) DEFAULT NULL,
  `mkkur_semester` varchar(10) DEFAULT NULL COMMENT 'Genjil, Genap',
  `mkkur_sifat` varchar(3) DEFAULT NULL COMMENT 'W:Wajib,P:Pilihan',
  `mkkur_paket_semester` varchar(5) DEFAULT NULL,
  `mkkur_pred_jml_peminat` int(11) DEFAULT NULL,
  `mkkur_pred_tahun` year(4) DEFAULT NULL,
  `mkkur_jumlah_pert` int(1) DEFAULT 1,
  `mkkur_is_universal` tinyint(1) DEFAULT 0 COMMENT '1:is universal (1 class only)',
  `mkkur_format_jadwal` varchar(11) DEFAULT NULL COMMENT '[1-2],[2-1]',
  `mkkur_maks_kelas` int(11) DEFAULT NULL COMMENT 'maks peserta kelas'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mata_kuliah_kurikulum`
--

INSERT INTO `mata_kuliah_kurikulum` (`mkkur_id`, `mkkur_kode`, `mkkur_nama`, `mkkur_sks`, `mkkur_semester`, `mkkur_sifat`, `mkkur_paket_semester`, `mkkur_pred_jml_peminat`, `mkkur_pred_tahun`, `mkkur_jumlah_pert`, `mkkur_is_universal`, `mkkur_format_jadwal`, `mkkur_maks_kelas`) VALUES
(1, 'MIE1003', 'ETIKA PROFESI DAN BISNIS', 2, 'genap', 'w', '2', 98, 2021, 1, 0, '(NULL)\r', NULL),
(2, 'MIE1802', 'PENGANTAR ELEKTRONIKA DAN INSTRUMENTASI', 2, 'genap', 'w', '2', 106, 2021, 1, 0, '(NULL)\r', NULL),
(3, 'MIE1805', 'ELEKTRONIKA DIGITAL', 3, 'genap', 'w', '2', 83, 2021, 1, 0, '(NULL)\r', NULL),
(4, 'MIE2602', 'ORGANISASI DAN ARSITEKTUR KOMPUTER', 3, 'genap', 'p', '4', 43, 2021, 1, 0, '(NULL)\r', NULL),
(5, 'MIE2810', 'METODE PENGUKURAN', 2, 'genap', 'w', '4', 80, 2021, 1, 0, '(NULL)\r', NULL),
(6, 'MIE2812', 'MATEMATIKA ELEKTRONIKA', 3, 'genap', 'w', '4', 98, 2021, 1, 0, '(NULL)\r', NULL),
(7, 'MIE2813', 'ELEKTRONIKA LANJUT I', 3, 'genap', 'w', '4', 98, 2021, 1, 0, '(NULL)\r', 100),
(8, 'MIE2814', 'SISTEM KONTROL', 3, 'genap', 'w', '4', 136, 2021, 1, 0, '(NULL)\r', 100),
(9, 'MIE3008', 'MET. PENEL. ELEKTRONIKA DAN INSTRUMENTASI', 2, 'genap', 'w', '6', 106, 2021, 1, 0, '(NULL)\r', 100),
(10, 'MIE3205', 'PENGOLAHAN CITRA DIGITAL', 3, 'genap', 'p', '6', 67, 2021, 1, 0, '(NULL)\r', NULL),
(11, 'MIE3404', 'PENGANTAR BIOSISTEM', 3, 'genap', 'p', '6', 36, 2021, 1, 0, '(NULL)\r', NULL),
(12, 'MIE3605', 'EMBEDDED SYSTEM', 3, 'genap', 'p', '6', 3, 2021, 1, 0, '(NULL)\r', NULL),
(13, 'MIE3606', 'PEMROSESAN SINYAL DIGITAL I', 3, 'genap', 'p', '6', 111, 2021, 1, 0, '(NULL)\r', 100),
(14, 'MIE3820', 'OTOMASI INDUSTRI', 3, 'genap', 'p', '6', 67, 2021, 1, 0, '(NULL)\r', NULL),
(15, 'MIE3821', 'INSTRUMENTASI INDUSTRI', 3, 'genap', 'p', '6', 82, 2021, 1, 0, '(NULL)\r', NULL),
(16, 'MIEK1805', 'Elektronika Digital', 3, 'genap', 'w', '2', 173, 2021, 1, 0, '(NULL)\r', NULL),
(17, 'MIK1251', 'Algoritma Dan Struktur Data I', 3, 'genap', 'w', '4', 91, 2021, 1, 0, '(NULL)\r', NULL),
(18, 'MIK1253', 'Matematika Diskrit II', 3, 'genap', 'w', '2', 144, 2021, 1, 0, '(NULL)\r', 100),
(19, 'MIK1651', 'Organisasi Dan Arsitektur Komputer', 3, 'genap', 'w', '2', 94, 2021, 1, 0, '(NULL)\r', NULL),
(20, 'MIK2251', 'Konsep Bahasa Pemrograman', 3, 'genap', 'w', '4', 108, 2021, 1, 0, '(NULL)\r', NULL),
(21, 'MIK2253', 'Analisis Dan Desain Algoritma II', 3, 'genap', 'w', '4', 100, 2021, 1, 0, '(NULL)\r', NULL),
(22, 'MIKE2451', 'INTELIGENSIA BUATAN', 3, 'genap', 'p', '4', 5, 2021, 1, 0, '(NULL)\r', NULL),
(23, 'MIK2451', 'Inteligensia Buatan', 3, 'genap', 'w', '4', 0, 2014, 1, 0, '(NULL)\r', NULL),
(24, 'MIK2551', 'Basis Data', 3, 'genap', 'w', '4', 83, 2021, 1, 0, '(NULL)\r', NULL),
(25, 'MIK2651', 'Jaringan Komputer', 3, 'genap', 'w', '4', 93, 2021, 1, 0, '(NULL)\r', NULL),
(26, 'MIK3051', 'Etika Profesi Dan Bisnis', 2, 'genap', 'w', '6', 160, 2021, 1, 0, '(NULL)\r', 100),
(27, 'MIK3053', 'Metodologi Penelitian Ilmu Komputer', 3, 'genap', 'w', '6', 35, 2021, 1, 0, '(NULL)\r', NULL),
(28, 'MIK3551', 'Sistem Informasi', 2, 'genap', 'w', '6', 106, 2021, 1, 0, '(NULL)\r', NULL),
(29, 'MIK4251', 'Sains Manajemen', 3, 'genap', 'p', '6', 56, 2021, 1, 0, '(NULL)\r', NULL),
(30, 'MIK4253', 'Teknik Komputasi', 3, 'genap', 'p', '6', 20, 2021, 1, 0, '(NULL)\r', NULL),
(31, 'MIK4255', 'Kriptografi', 3, 'genap', 'p', '6', 88, 2021, 1, 0, '(NULL)\r', NULL),
(32, 'MIK4451', 'Sistem Pendukung Keputusan', 3, 'genap', 'p', '6', 5, 2021, 1, 0, '(NULL)\r', NULL),
(33, 'MIK4451', 'Sistem Temu Balik Informasi', 3, 'genap', 'p', '6', 0, 2014, 1, 0, '(NULL)\r', NULL),
(34, 'MIK4453', 'Sistem Pakar', 3, 'genap', 'p', '6', 15, 2021, 1, 0, '(NULL)\r', NULL),
(35, 'MIK4553', 'Manajemen Proyek Teknologi Informasi', 3, 'genap', 'p', '6', 89, 2021, 1, 0, '(NULL)\r', NULL),
(36, 'MIK4555', 'Information Technology Audit And Control', 3, 'genap', 'p', '6', 103, 2021, 1, 0, '(NULL)\r', NULL),
(37, 'MIK4559', 'Informatika Sosial', 3, 'genap', 'p', '4', 44, 2021, 1, 0, '(NULL)\r', NULL),
(38, 'MIK4561', 'Pengembangan Perangkat Lunak Berorientasi Obyek', 3, 'genap', 'p', '4', 46, 2021, 1, 0, '(NULL)\r', NULL),
(39, 'MIK4651', 'Analisis Dan Desain Protokol', 3, 'genap', 'p', '6', 111, 2021, 1, 0, '(NULL)\r', 100),
(40, 'MIK4653', 'Embedded System Operating System', 3, 'genap', 'p', '6', 59, 2021, 1, 0, '(NULL)\r', NULL),
(41, 'MIKE1251', 'ALGORITMA DAN STRUKTUR DATA I', 3, 'genap', 'w', '2', 114, 2021, 1, 0, '(NULL)\r', NULL),
(42, 'MIKE1651', 'ORGANISASI DAN ARSITEKTUR KOMPUTER', 3, 'genap', 'p', '2', 49, 2021, 1, 0, '(NULL)\r', NULL),
(43, 'MIKE2651', 'JARINGAN KOMPUTER', 3, 'genap', 'p', '4', 127, 2021, 1, 0, '(NULL)\r', NULL),
(44, 'MIKE3051', 'ETIKA PROFESI DAN BISNIS', 2, 'genap', 'w', '6', 98, 2021, 1, 0, '(NULL)\r', 100),
(45, 'MIKE4509', 'SISTEM INFORMASI GEOGRAFIS', 3, 'genap', 'p', '5', 0, 2021, 1, 0, '(NULL)\r', NULL),
(46, 'MIKE4605', 'SISTEM TERDISTRIBUSI', 3, 'genap', 'p', '5', 0, 2021, 1, 0, '(NULL)\r', NULL),
(47, 'MIKE4653', 'EMBEDDED SYSTEM OPERATING SYSTEM', 3, 'genap', 'p', '6', 1, 2021, 1, 0, '(NULL)\r', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah_kurikulum_rekap`
--

CREATE TABLE `mata_kuliah_kurikulum_rekap` (
  `mkkurrkp_id` int(11) NOT NULL,
  `mkkurrkp_mkkur_id` int(11) DEFAULT NULL,
  `mkkurrkp_jml_peminat` int(6) DEFAULT NULL,
  `mkkurrkp_tahun` year(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mata_kuliah_kurikulum_rekap`
--

INSERT INTO `mata_kuliah_kurikulum_rekap` (`mkkurrkp_id`, `mkkurrkp_mkkur_id`, `mkkurrkp_jml_peminat`, `mkkurrkp_tahun`) VALUES
(1, 1, 0, 2008),
(2, 1, 0, 2009),
(3, 1, 0, 2010),
(4, 1, 185, 2011),
(5, 1, 108, 2012),
(6, 1, 100, 2013),
(7, 2, 0, 2008),
(8, 2, 0, 2009),
(9, 2, 0, 2010),
(10, 2, 148, 2011),
(11, 2, 117, 2012),
(12, 2, 107, 2013),
(13, 3, 0, 2008),
(14, 3, 0, 2009),
(15, 3, 0, 2010),
(16, 3, 257, 2011),
(17, 3, 96, 2012),
(18, 3, 84, 2013),
(19, 4, 115, 2008),
(20, 4, 115, 2009),
(21, 4, 99, 2010),
(22, 4, 13, 2011),
(23, 4, 23, 2012),
(24, 4, 44, 2013),
(25, 5, 119, 2008),
(26, 5, 133, 2009),
(27, 5, 121, 2010),
(28, 5, 78, 2011),
(29, 5, 123, 2012),
(30, 5, 100, 2013),
(31, 6, 0, 2008),
(32, 6, 0, 2009),
(33, 6, 0, 2010),
(34, 6, 77, 2011),
(35, 6, 114, 2012),
(36, 6, 99, 2013),
(37, 7, 0, 2008),
(38, 7, 0, 2009),
(39, 7, 0, 2010),
(40, 7, 173, 2011),
(41, 7, 133, 2012),
(42, 7, 99, 2013),
(43, 8, 88, 2008),
(44, 8, 98, 2009),
(45, 8, 105, 2010),
(46, 8, 158, 2011),
(47, 8, 149, 2012),
(48, 8, 135, 2013),
(49, 9, 0, 2008),
(50, 9, 0, 2009),
(51, 9, 0, 2010),
(52, 9, 88, 2011),
(53, 9, 96, 2012),
(54, 9, 110, 2013),
(55, 10, 0, 2008),
(56, 10, 0, 2009),
(57, 10, 0, 2010),
(58, 10, 0, 2011),
(59, 10, 58, 2012),
(60, 10, 67, 2013),
(61, 11, 17, 2008),
(62, 11, 14, 2009),
(63, 11, 43, 2010),
(64, 11, 0, 2011),
(65, 11, 39, 2012),
(66, 11, 86, 2013),
(67, 12, 91, 2008),
(68, 12, 102, 2009),
(69, 12, 109, 2010),
(70, 12, 0, 2011),
(71, 12, 70, 2012),
(72, 12, 65, 2013),
(73, 13, 0, 2008),
(74, 13, 0, 2009),
(75, 13, 0, 2010),
(76, 13, 22, 2011),
(77, 13, 89, 2012),
(78, 13, 112, 2013),
(79, 14, 0, 2008),
(80, 14, 0, 2009),
(81, 14, 0, 2010),
(82, 14, 115, 2011),
(83, 14, 61, 2012),
(84, 14, 69, 2013),
(85, 15, 63, 2008),
(86, 15, 85, 2009),
(87, 15, 44, 2010),
(88, 15, 55, 2011),
(89, 15, 91, 2012),
(90, 15, 84, 2013),
(91, 16, 57, 2008),
(92, 16, 103, 2009),
(93, 16, 80, 2010),
(94, 16, 257, 2011),
(95, 16, 176, 2012),
(96, 16, 89, 2013),
(97, 17, 70, 2008),
(98, 17, 0, 2009),
(99, 17, 66, 2010),
(100, 17, 120, 2011),
(101, 17, 118, 2012),
(102, 17, 74, 2013),
(103, 18, 0, 2008),
(104, 18, 0, 2009),
(105, 18, 0, 2010),
(106, 18, 221, 2011),
(107, 18, 139, 2012),
(108, 18, 93, 2013),
(109, 19, 93, 2008),
(110, 19, 53, 2009),
(111, 19, 80, 2010),
(112, 19, 168, 2011),
(113, 19, 121, 2012),
(114, 19, 95, 2013),
(115, 20, 53, 2008),
(116, 20, 111, 2009),
(117, 20, 30, 2010),
(118, 20, 88, 2011),
(119, 20, 76, 2012),
(120, 20, 107, 2013),
(121, 21, 0, 2008),
(122, 21, 0, 2009),
(123, 21, 0, 2010),
(124, 21, 45, 2011),
(125, 21, 112, 2012),
(126, 21, 101, 2013),
(127, 22, 0, 2008),
(128, 22, 0, 2009),
(129, 22, 16, 2010),
(130, 22, 0, 2011),
(131, 22, 0, 2012),
(132, 22, 0, 2013),
(133, 22, 0, 2008),
(134, 22, 0, 2009),
(135, 22, 0, 2010),
(136, 22, 90, 2011),
(137, 22, 136, 2012),
(138, 22, 161, 2013),
(139, 24, 69, 2008),
(140, 24, 75, 2009),
(141, 24, 83, 2010),
(142, 24, 98, 2011),
(143, 24, 147, 2012),
(144, 24, 86, 2013),
(145, 25, 0, 2008),
(146, 25, 0, 2009),
(147, 25, 0, 2010),
(148, 25, 64, 2011),
(149, 25, 134, 2012),
(150, 25, 94, 2013),
(151, 26, 90, 2008),
(152, 26, 43, 2009),
(153, 26, 51, 2010),
(154, 26, 72, 2011),
(155, 26, 62, 2012),
(156, 26, 185, 2013),
(157, 27, 94, 2008),
(158, 27, 37, 2009),
(159, 27, 62, 2010),
(160, 27, 59, 2011),
(161, 27, 61, 2012),
(162, 27, 106, 2013),
(163, 28, 0, 2008),
(164, 28, 0, 2009),
(165, 28, 0, 2010),
(166, 28, 34, 2011),
(167, 28, 73, 2012),
(168, 28, 107, 2013),
(169, 29, 70, 2008),
(170, 29, 87, 2009),
(171, 29, 142, 2010),
(172, 29, 65, 2011),
(173, 29, 175, 2012),
(174, 29, 160, 2013),
(175, 30, 15, 2008),
(176, 30, 18, 2009),
(177, 30, 15, 2010),
(178, 30, 5, 2011),
(179, 30, 17, 2012),
(180, 30, 28, 2013),
(181, 31, 0, 2008),
(182, 31, 0, 2009),
(183, 31, 0, 2010),
(184, 31, 25, 2011),
(185, 31, 28, 2012),
(186, 31, 113, 2013),
(187, 32, 34, 2008),
(188, 32, 38, 2009),
(189, 32, 11, 2010),
(190, 32, 60, 2011),
(191, 32, 50, 2012),
(192, 32, 65, 2013),
(193, 32, 0, 2008),
(194, 32, 0, 2009),
(195, 32, 0, 2010),
(196, 32, 0, 2011),
(197, 32, 54, 2012),
(198, 32, 113, 2013),
(199, 34, 14, 2008),
(200, 34, 42, 2009),
(201, 34, 16, 2010),
(202, 34, 9, 2011),
(203, 34, 18, 2012),
(204, 34, 19, 2013),
(205, 35, 0, 2008),
(206, 35, 0, 2009),
(207, 35, 0, 2010),
(208, 35, 40, 2011),
(209, 35, 53, 2012),
(210, 35, 101, 2013),
(211, 36, 0, 2008),
(212, 36, 0, 2009),
(213, 36, 63, 2010),
(214, 36, 92, 2011),
(215, 36, 85, 2012),
(216, 36, 137, 2013),
(217, 37, 0, 2008),
(218, 37, 0, 2009),
(219, 37, 0, 2010),
(220, 37, 98, 2011),
(221, 37, 43, 2012),
(222, 37, 0, 2013),
(223, 38, 0, 2008),
(224, 38, 0, 2009),
(225, 38, 0, 2010),
(226, 38, 9, 2011),
(227, 38, 28, 2012),
(228, 38, 46, 2013),
(229, 39, 109, 2008),
(230, 39, 53, 2009),
(231, 39, 63, 2010),
(232, 39, 50, 2011),
(233, 39, 26, 2012),
(234, 39, 143, 2013),
(235, 40, 0, 2008),
(236, 40, 0, 2009),
(237, 40, 0, 2010),
(238, 40, 53, 2011),
(239, 40, 57, 2012),
(240, 40, 59, 2013),
(241, 41, 0, 2008),
(242, 41, 0, 2009),
(243, 41, 0, 2010),
(244, 41, 206, 2011),
(245, 41, 134, 2012),
(246, 41, 117, 2013),
(247, 42, 115, 2008),
(248, 42, 115, 2009),
(249, 42, 99, 2010),
(250, 42, 13, 2011),
(251, 42, 23, 2012),
(252, 42, 44, 2013),
(253, 43, 74, 2008),
(254, 43, 18, 2009),
(255, 43, 68, 2010),
(256, 43, 89, 2011),
(257, 43, 131, 2012),
(258, 43, 96, 2013),
(259, 44, 0, 2008),
(260, 44, 0, 2009),
(261, 44, 0, 2010),
(262, 44, 185, 2011),
(263, 44, 108, 2012),
(264, 44, 100, 2013),
(265, 45, 0, 2008),
(266, 45, 0, 2009),
(267, 45, 0, 2010),
(268, 45, 0, 2011),
(269, 45, 0, 2012),
(270, 45, 0, 2013),
(271, 46, 0, 2008),
(272, 46, 0, 2009),
(273, 46, 0, 2010),
(274, 46, 0, 2011),
(275, 46, 0, 2012),
(276, 46, 0, 2013),
(277, 47, 91, 2008),
(278, 47, 102, 2009),
(279, 47, 109, 2010),
(280, 47, 0, 2011),
(281, 47, 0, 2012),
(282, 47, 0, 2013);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mkkur_prodi`
--

CREATE TABLE `mkkur_prodi` (
  `mkkprod_id` int(11) NOT NULL,
  `mkkprod_mkkur_id` int(11) DEFAULT NULL,
  `mkkprod_prodi_id` int(11) DEFAULT NULL,
  `mkkprod_related_id` int(11) DEFAULT 0 COMMENT 'if kelas gabung, isi dgn mkkprod_id yg udah ada before',
  `mkkprod_porsi_kelas` int(11) DEFAULT 1 COMMENT 'porsi kelas dari jumlah total peserta makul'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mkkur_prodi`
--

INSERT INTO `mkkur_prodi` (`mkkprod_id`, `mkkprod_mkkur_id`, `mkkprod_prodi_id`, `mkkprod_related_id`, `mkkprod_porsi_kelas`) VALUES
(1, 1, 2, 0, 1),
(2, 2, 2, 0, 1),
(3, 3, 2, 0, 1),
(4, 4, 2, 0, 1),
(5, 5, 2, 0, 1),
(6, 6, 2, 0, 1),
(7, 7, 2, 0, 1),
(8, 8, 2, 0, 1),
(9, 9, 2, 0, 1),
(10, 10, 2, 0, 1),
(11, 11, 2, 0, 1),
(12, 12, 2, 0, 1),
(13, 13, 2, 0, 1),
(14, 14, 2, 0, 1),
(15, 15, 2, 0, 1),
(16, 16, 1, 0, 1),
(17, 17, 1, 0, 1),
(18, 18, 1, 0, 1),
(19, 19, 1, 0, 1),
(20, 20, 1, 0, 1),
(21, 21, 1, 0, 1),
(22, 22, 2, 0, 1),
(23, 23, 1, 0, 1),
(24, 24, 1, 0, 1),
(25, 25, 1, 0, 1),
(26, 26, 1, 0, 1),
(27, 27, 1, 0, 1),
(28, 28, 1, 0, 1),
(29, 29, 1, 0, 1),
(30, 30, 1, 0, 1),
(31, 31, 1, 0, 1),
(32, 32, 1, 0, 1),
(33, 33, 1, 0, 1),
(34, 34, 1, 0, 1),
(35, 35, 1, 0, 1),
(36, 36, 1, 0, 1),
(37, 37, 1, 0, 1),
(38, 38, 1, 0, 1),
(39, 39, 1, 0, 1),
(40, 40, 1, 0, 1),
(41, 41, 2, 0, 1),
(42, 42, 2, 0, 1),
(43, 43, 2, 0, 1),
(44, 44, 2, 0, 1),
(45, 45, 2, 0, 1),
(46, 46, 2, 0, 1),
(47, 47, 2, 0, 1),
(64, 13, 1, 13, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `program_studi`
--

CREATE TABLE `program_studi` (
  `prodi_id` int(11) NOT NULL,
  `prodi_kode` varchar(20) DEFAULT NULL,
  `prodi_nama` varchar(200) DEFAULT NULL,
  `prodi_prefix_mk` varchar(4) DEFAULT NULL COMMENT 'prefix makul'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `program_studi`
--

INSERT INTO `program_studi` (`prodi_id`, `prodi_kode`, `prodi_nama`, `prodi_prefix_mk`) VALUES
(1, 'ILKOM', 'Ilmu Komputer', 'MIK'),
(2, 'ELINS', 'Elektronika dan Instrumentasi', 'MIE'),
(3, 'MAT', 'Matematika', 'MMM'),
(4, 'STAT', 'Statistika', 'MMS'),
(5, 'KIM', 'Kimia', 'MKK'),
(6, 'FIS', 'Fisika', 'MFF'),
(7, 'GEOFIS', 'Geofisika', 'MFG');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `ru_id` int(11) NOT NULL,
  `ru_kode` varchar(6) DEFAULT NULL,
  `ru_nama` varchar(20) DEFAULT NULL,
  `ru_kapasitas` int(6) DEFAULT NULL,
  `ru_is_cadangan` tinyint(1) DEFAULT 0 COMMENT '1=is_cadangan'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`ru_id`, `ru_kode`, `ru_nama`, `ru_kapasitas`, `ru_is_cadangan`) VALUES
(1, 'S2.01', 'S2.01', 100, 0),
(2, 'S2.02', 'S2.02', 100, 0),
(3, 'M2.13', 'M2.13', 50, 0),
(4, 'S2.03', 'S2.03', 100, 0),
(5, 'K1', 'K1', 90, 0),
(6, 'S2.505', 'S2.505', 100, 0),
(7, 'S2.506', 'S2.506', 100, 0),
(8, 'M2.10', 'M2.10', 60, 0),
(9, 'M2.14', 'M2.14', 50, 0),
(10, 'K6', 'K6', 50, 0),
(11, 'M2.09', 'M2.09', 100, 0),
(12, 'G3', 'G3', 60, 0),
(13, 'S2.05', 'S2.05', 50, 0),
(14, 'M2.12', 'M2.12', 100, 0),
(15, 'U2.02', 'U2.02', 100, 0),
(16, 'T2.01', 'T2.01', 90, 0),
(17, 'U2.01', 'U2.01', 100, 0),
(18, 'U2.06', 'U2.06', 60, 0),
(19, 'S2.04', 'S2.04', 50, 0),
(20, 'U2.03', 'U2.03', 100, 0),
(21, 'U2.04', 'U2.04', 100, 0),
(22, 'U2.05', 'U2.05', 30, 1),
(23, 'S2.06', 'S2.06', 30, 1),
(24, 'S2.07', 'S2.07', 30, 1),
(25, 'S2.08', 'S2.08', 60, 1),
(26, 'Lab.Da', 'Lab.Das.', 90, 1),
(27, 'S2.507', 'S2.507', 100, 1),
(28, 'Lab.AI', 'Lab.AI', 30, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang_prodi`
--

CREATE TABLE `ruang_prodi` (
  `ruprd_id` int(11) NOT NULL,
  `ruprd_ru_id` int(11) DEFAULT NULL,
  `ruprd_prodi_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang_prodi`
--

INSERT INTO `ruang_prodi` (`ruprd_id`, `ruprd_ru_id`, `ruprd_prodi_id`) VALUES
(36, 1, 4),
(15, 2, 4),
(10, 3, 3),
(16, 3, 4),
(11, 4, 3),
(12, 5, 3),
(18, 6, 5),
(19, 7, 5),
(20, 8, 5),
(21, 9, 5),
(22, 10, 5),
(28, 11, 7),
(29, 12, 7),
(24, 13, 6),
(30, 13, 7),
(25, 14, 6),
(26, 15, 6),
(1, 16, 1),
(2, 17, 1),
(3, 18, 1),
(4, 19, 1),
(6, 19, 2),
(7, 20, 2),
(8, 21, 2),
(13, 22, 3),
(27, 23, 6),
(17, 24, 4),
(5, 25, 1),
(9, 25, 2),
(23, 26, 5),
(31, 26, 7);

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktu`
--

CREATE TABLE `waktu` (
  `waktu_id` int(11) NOT NULL,
  `waktu_hari` varchar(20) DEFAULT NULL,
  `waktu_jam_mulai` time DEFAULT NULL,
  `waktu_jam_selesai` time DEFAULT NULL,
  `waktu_is_kuliah` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `waktu`
--

INSERT INTO `waktu` (`waktu_id`, `waktu_hari`, `waktu_jam_mulai`, `waktu_jam_selesai`, `waktu_is_kuliah`) VALUES
(1, 'senin', '07:30:00', '08:20:00', 1),
(2, 'senin', '08:30:00', '09:20:00', 1),
(3, 'senin', '09:30:00', '10:20:00', 1),
(4, 'senin', '10:30:00', '11:20:00', 1),
(5, 'senin', '11:30:00', '12:20:00', 1),
(6, 'senin', '12:30:00', '13:20:00', 1),
(7, 'senin', '13:30:00', '14:20:00', 1),
(8, 'senin', '14:30:00', '15:20:00', 1),
(9, 'senin', '15:30:00', '16:20:00', 1),
(10, 'senin', '16:30:00', '17:20:00', 1),
(12, 'selasa', '07:30:00', '08:20:00', 1),
(13, 'selasa', '08:30:00', '09:20:00', 1),
(14, 'selasa', '09:30:00', '10:20:00', 1),
(15, 'selasa', '10:30:00', '11:20:00', 1),
(16, 'selasa', '11:30:00', '12:20:00', 1),
(17, 'selasa', '12:30:00', '13:20:00', 1),
(18, 'selasa', '13:30:00', '14:20:00', 1),
(19, 'selasa', '14:30:00', '15:20:00', 1),
(20, 'selasa', '15:30:00', '16:20:00', 1),
(21, 'selasa', '16:30:00', '17:20:00', 1),
(22, 'rabu', '07:30:00', '08:20:00', 1),
(23, 'rabu', '08:30:00', '09:20:00', 1),
(24, 'rabu', '09:30:00', '10:20:00', 1),
(25, 'rabu', '10:30:00', '11:20:00', 1),
(26, 'rabu', '11:30:00', '12:20:00', 1),
(27, 'rabu', '12:30:00', '13:20:00', 1),
(28, 'rabu', '13:30:00', '14:20:00', 1),
(29, 'rabu', '14:30:00', '15:20:00', 1),
(30, 'rabu', '15:30:00', '16:20:00', 1),
(31, 'rabu', '16:30:00', '17:20:00', 1),
(32, 'kamis', '07:30:00', '08:20:00', 1),
(33, 'kamis', '08:30:00', '09:20:00', 1),
(34, 'kamis', '09:30:00', '10:20:00', 1),
(35, 'kamis', '10:30:00', '11:20:00', 1),
(36, 'kamis', '11:30:00', '12:20:00', 1),
(37, 'kamis', '12:30:00', '13:20:00', 1),
(38, 'kamis', '13:30:00', '14:20:00', 1),
(39, 'kamis', '14:30:00', '15:20:00', 1),
(40, 'kamis', '15:30:00', '16:20:00', 1),
(41, 'kamis', '16:30:00', '17:20:00', 1),
(42, 'jumat', '07:30:00', '08:20:00', 1),
(43, 'jumat', '08:30:00', '09:20:00', 1),
(44, 'jumat', '09:30:00', '10:20:00', 1),
(45, 'jumat', '10:30:00', '11:20:00', 1),
(48, 'jumat', '13:30:00', '14:20:00', 1),
(49, 'jumat', '14:30:00', '15:20:00', 1),
(50, 'jumat', '15:30:00', '16:20:00', 1),
(51, 'jumat', '16:30:00', '17:20:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`conf_id`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`dsn_id`),
  ADD UNIQUE KEY `dsn_nama_key` (`dsn_nama`);

--
-- Indeks untuk tabel `dosen_kelas`
--
ALTER TABLE `dosen_kelas`
  ADD PRIMARY KEY (`dsnkls_id`),
  ADD KEY `dsnkls_key` (`dsnkls_dsn_id`,`dsnkls_kls_id`),
  ADD KEY `FK_dosen_kelas_2` (`dsnkls_kls_id`);

--
-- Indeks untuk tabel `dosen_waktu`
--
ALTER TABLE `dosen_waktu`
  ADD PRIMARY KEY (`dsnwkt_id`),
  ADD KEY `dsnwkt_key` (`dsnwkt_dsn_id`,`dsnwkt_wkt_id`),
  ADD KEY `FK_dosen_waktu_2` (`dsnwkt_wkt_id`);

--
-- Indeks untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  ADD PRIMARY KEY (`jk_id`),
  ADD KEY `FK_jadwal_kuliah_` (`jk_wkt_id`),
  ADD KEY `FK_jadwal_kuliah_2` (`jk_ru_id`),
  ADD KEY `FK_jadwal_kuliah` (`jk_kls_id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`kls_id`),
  ADD KEY `kls_mkkur_id_key` (`kls_mkkur_id`);

--
-- Indeks untuk tabel `log_proses`
--
ALTER TABLE `log_proses`
  ADD PRIMARY KEY (`logproses_id`);

--
-- Indeks untuk tabel `mata_kuliah_kurikulum`
--
ALTER TABLE `mata_kuliah_kurikulum`
  ADD PRIMARY KEY (`mkkur_id`);

--
-- Indeks untuk tabel `mata_kuliah_kurikulum_rekap`
--
ALTER TABLE `mata_kuliah_kurikulum_rekap`
  ADD PRIMARY KEY (`mkkurrkp_id`),
  ADD KEY `mkkurrkp_mkkur_id_key` (`mkkurrkp_mkkur_id`);

--
-- Indeks untuk tabel `mkkur_prodi`
--
ALTER TABLE `mkkur_prodi`
  ADD PRIMARY KEY (`mkkprod_id`),
  ADD UNIQUE KEY `mkprodi_key` (`mkkprod_mkkur_id`,`mkkprod_prodi_id`),
  ADD KEY `FK_mkkur_prodi_FK2` (`mkkprod_prodi_id`);

--
-- Indeks untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  ADD PRIMARY KEY (`prodi_id`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`ru_id`);

--
-- Indeks untuk tabel `ruang_prodi`
--
ALTER TABLE `ruang_prodi`
  ADD PRIMARY KEY (`ruprd_id`),
  ADD KEY `ru_prodi_key` (`ruprd_ru_id`,`ruprd_prodi_id`),
  ADD KEY `FK_ruang_prodi_prodi_fk` (`ruprd_prodi_id`);

--
-- Indeks untuk tabel `waktu`
--
ALTER TABLE `waktu`
  ADD PRIMARY KEY (`waktu_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `config`
--
ALTER TABLE `config`
  MODIFY `conf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `dsn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT untuk tabel `dosen_kelas`
--
ALTER TABLE `dosen_kelas`
  MODIFY `dsnkls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT untuk tabel `dosen_waktu`
--
ALTER TABLE `dosen_waktu`
  MODIFY `dsnwkt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  MODIFY `jk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `kls_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT untuk tabel `log_proses`
--
ALTER TABLE `log_proses`
  MODIFY `logproses_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah_kurikulum`
--
ALTER TABLE `mata_kuliah_kurikulum`
  MODIFY `mkkur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah_kurikulum_rekap`
--
ALTER TABLE `mata_kuliah_kurikulum_rekap`
  MODIFY `mkkurrkp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=283;

--
-- AUTO_INCREMENT untuk tabel `mkkur_prodi`
--
ALTER TABLE `mkkur_prodi`
  MODIFY `mkkprod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `program_studi`
--
ALTER TABLE `program_studi`
  MODIFY `prodi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `ru_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `ruang_prodi`
--
ALTER TABLE `ruang_prodi`
  MODIFY `ruprd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT untuk tabel `waktu`
--
ALTER TABLE `waktu`
  MODIFY `waktu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen_kelas`
--
ALTER TABLE `dosen_kelas`
  ADD CONSTRAINT `FK_dosen_kelas` FOREIGN KEY (`dsnkls_dsn_id`) REFERENCES `dosen` (`dsn_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_dosen_kelas_kls` FOREIGN KEY (`dsnkls_kls_id`) REFERENCES `kelas` (`kls_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `dosen_waktu`
--
ALTER TABLE `dosen_waktu`
  ADD CONSTRAINT `FK_dosen_waktu` FOREIGN KEY (`dsnwkt_dsn_id`) REFERENCES `dosen` (`dsn_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_dosen_waktu_2` FOREIGN KEY (`dsnwkt_wkt_id`) REFERENCES `waktu` (`waktu_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  ADD CONSTRAINT `FK_jadwal_kuliah_` FOREIGN KEY (`jk_wkt_id`) REFERENCES `waktu` (`waktu_id`),
  ADD CONSTRAINT `FK_jadwal_kuliah_2` FOREIGN KEY (`jk_ru_id`) REFERENCES `ruang` (`ru_id`),
  ADD CONSTRAINT `FK_jadwal_kuliah_kls` FOREIGN KEY (`jk_kls_id`) REFERENCES `kelas` (`kls_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `FK_kelas_mk` FOREIGN KEY (`kls_mkkur_id`) REFERENCES `mata_kuliah_kurikulum` (`mkkur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `mata_kuliah_kurikulum_rekap`
--
ALTER TABLE `mata_kuliah_kurikulum_rekap`
  ADD CONSTRAINT `FK_mata_kuliah_kurikulum_rekap_mk` FOREIGN KEY (`mkkurrkp_mkkur_id`) REFERENCES `mata_kuliah_kurikulum` (`mkkur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `mkkur_prodi`
--
ALTER TABLE `mkkur_prodi`
  ADD CONSTRAINT `FK_mkkur_prodi_FK2` FOREIGN KEY (`mkkprod_prodi_id`) REFERENCES `program_studi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_mkkur_prodi_mk` FOREIGN KEY (`mkkprod_mkkur_id`) REFERENCES `mata_kuliah_kurikulum` (`mkkur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ketidakleluasaan untuk tabel `ruang_prodi`
--
ALTER TABLE `ruang_prodi`
  ADD CONSTRAINT `FK_ruang_prodi` FOREIGN KEY (`ruprd_ru_id`) REFERENCES `ruang` (`ru_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_ruang_prodi_prodi_fk` FOREIGN KEY (`ruprd_prodi_id`) REFERENCES `program_studi` (`prodi_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `kesalahan`
--
CREATE DATABASE IF NOT EXISTS `kesalahan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kesalahan`;
--
-- Database: `latihanjava`
--
CREATE DATABASE IF NOT EXISTS `latihanjava` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `latihanjava`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `username` varchar(20) NOT NULL,
  `password` varchar(123) NOT NULL,
  `name` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`username`, `password`, `name`) VALUES
('ega', '123', 'eganugraha');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);
--
-- Database: `onlineshop`
--
CREATE DATABASE IF NOT EXISTS `onlineshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `onlineshop`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `appearance_admin`
--

CREATE TABLE `appearance_admin` (
  `id_ap_admin` int(11) NOT NULL,
  `logo_admin` varchar(128) NOT NULL,
  `nama_ap_admin` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `appearance_admin`
--

INSERT INTO `appearance_admin` (`id_ap_admin`, `logo_admin`, `nama_ap_admin`) VALUES
(1, 'serut.png', 'Daster Manja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `id_biodata` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `no_hp` varchar(128) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`id_biodata`, `nama`, `no_hp`, `alamat`, `foto`, `id_user`) VALUES
(13, 'Ega Nuigraha', '08975568102', 'Pagerageung tengah rt02/rw05 desa pagerageung kecamatan pagerageung', 'af1eeb53-5285-4e36-a3ef-b59206d23c29.jpg', 1),
(14, 'Rizal Farid', '08975568102', 'Pagerageung tengah rt02/rw05 desa pagerageung kecamatan pagerageung', 'dsasa.jpg', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori_produk`
--

CREATE TABLE `kategori_produk` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori_produk`
--

INSERT INTO `kategori_produk` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Kaos'),
(2, 'Pakaian Tidur'),
(3, 'Perlengkapan Shalat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(128) NOT NULL,
  `deskripsi_produk` varchar(128) NOT NULL,
  `thumbnail_produk` varchar(128) NOT NULL,
  `stok_produk` int(11) NOT NULL,
  `harga_produk` int(128) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi_produk`, `thumbnail_produk`, `stok_produk`, `harga_produk`, `berat_produk`, `id_kategori`) VALUES
(3, 'Daster Polos Ruffle', 'LD 110Cm\r\nPB 105Cm\r\nRuffle dibagian bawah', 'CV_amar_fawaz_2022_page-0001.jpg', 1000, 31000, 250, 2),
(5, 'Daster Serut Maxi', 'LD 110Cm\r\nPB 120Cm\r\nSerut dibagian tengah', 'flash_sale_8-9_okt.png', 100, 50000, 300, 2),
(6, 'Mukena A', 'hasdhfhasdjhasdasdajasd', 'download-removebg-preview.png', 967, 300000, 123, 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Super Admin'),
(2, 'Admin'),
(4, 'Reseller'),
(5, 'Dropshipper');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_role` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_created` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `id_role`, `is_active`, `date_created`) VALUES
(1, 'eganugrahaid@gmail.com', '$2y$10$qiu0//Vcpqakbgc6EWZFNOqOX9BHZQFX6hpzFHjZbseLtNkpIVPxa', 1, 1, 0),
(3, 'nugrahaega261@gmail.com', '$2y$10$CFTdaCYZOqUgEIlpcGnZV.ioPWmcYhqOx6GQFwWiW2y1ueuA.SbY2', 1, 1, 1637635211);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id_access_menu` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id_access_menu`, `id_role`, `id_menu`) VALUES
(2, 1, 2),
(4, 1, 1),
(5, 1, 4),
(7, 2, 1),
(9, 2, 4),
(10, 4, 1),
(11, 5, 1),
(12, 4, 4),
(13, 5, 4),
(14, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id_menu`, `nama_menu`, `url`, `icon`, `status`) VALUES
(1, 'Dashboard', 'admin/index', 'fas fa-fw fa-tachometer-alt', 0),
(2, 'Configuration', '', 'fa fa-fw fa-cogs', 1),
(4, 'Account Setting', '', 'fas fa-glass-cheers', 1),
(5, 'Manajemen', '', 'fas fa-fw fa-user-graduate', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id_submenu` int(11) NOT NULL,
  `nama_submenu` varchar(128) NOT NULL,
  `url_submenu` varchar(128) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_submenu`
--

INSERT INTO `user_submenu` (`id_submenu`, `nama_submenu`, `url_submenu`, `id_menu`) VALUES
(1, 'Menu', 'admin/menu', 2),
(2, 'Submenu', 'admin/submenu', 2),
(4, 'User Access', 'admin/user_access', 2),
(5, 'Profile', 'account/index', 4),
(6, 'User', 'manajemen/index', 5),
(7, 'Appearance Admin', 'Admin/appearance', 2),
(8, 'Produk', 'manajemen/produk', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id_token` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_token`
--

INSERT INTO `user_token` (`id_token`, `email`, `token`, `date_created`) VALUES
(3, 'eganugrahaid@gmail.com', 22, 1637637381);

-- --------------------------------------------------------

--
-- Struktur dari tabel `varian`
--

CREATE TABLE `varian` (
  `id_varian` int(11) NOT NULL,
  `nama_varian` varchar(128) NOT NULL,
  `foto_varian` varchar(128) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `appearance_admin`
--
ALTER TABLE `appearance_admin`
  ADD PRIMARY KEY (`id_ap_admin`);

--
-- Indeks untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id_biodata`);

--
-- Indeks untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id_access_menu`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id_submenu`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id_token`);

--
-- Indeks untuk tabel `varian`
--
ALTER TABLE `varian`
  ADD PRIMARY KEY (`id_varian`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `appearance_admin`
--
ALTER TABLE `appearance_admin`
  MODIFY `id_ap_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `kategori_produk`
--
ALTER TABLE `kategori_produk`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id_access_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `varian`
--
ALTER TABLE `varian`
  MODIFY `id_varian` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `pembayaran_spp`
--
CREATE DATABASE IF NOT EXISTS `pembayaran_spp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pembayaran_spp`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bulan`
--

CREATE TABLE `bulan` (
  `id` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `bulan`
--

INSERT INTO `bulan` (`id`, `bulan`) VALUES
(1, 'Januari'),
(2, 'Februari'),
(3, 'Maret'),
(4, 'April'),
(6, 'Mei'),
(7, 'Juni'),
(8, 'Juli'),
(9, 'Agustus'),
(10, 'September'),
(11, 'Oktober'),
(12, 'November'),
(13, 'Desember');

-- --------------------------------------------------------

--
-- Struktur dari tabel `daftar_kelas`
--

CREATE TABLE `daftar_kelas` (
  `id` int(11) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `nama_kelas` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `daftar_kelas`
--

INSERT INTO `daftar_kelas` (`id`, `kelas`, `nama_kelas`) VALUES
(1, 'X', 'IPA-1'),
(2, 'X', 'IPA-2'),
(3, 'X', 'IPA-3'),
(4, 'X', 'IPA-4'),
(5, 'X', 'IPA-5'),
(6, 'X', 'IPA-6'),
(7, 'X', 'IPS-1'),
(8, 'X', 'IPS-2'),
(9, 'X', 'IPS-3'),
(10, 'X', 'IPS-4'),
(11, 'X', 'IPS-5'),
(12, 'X', 'IPS-6'),
(13, 'XI', 'IPA-1'),
(14, 'XI', 'IPA-2'),
(15, 'XI', 'IPA-3'),
(16, 'XI', 'IPA-4'),
(17, 'XI', 'IPA-5'),
(18, 'XI', 'IPA-6'),
(19, 'XI', 'IPS-1'),
(20, 'XI', 'IPS-2'),
(23, 'XI', 'IPS-3'),
(24, 'XI', 'IPS-4'),
(25, 'XI', 'IPS-5'),
(26, 'XI', 'IPS-6'),
(27, 'XII', 'IPA-1'),
(28, 'XII', 'IPA-2'),
(29, 'XII', 'IPA-3'),
(30, 'XII', 'IPA-4'),
(31, 'XII', 'IPA-5'),
(32, 'XII', 'IPA-6'),
(33, 'XII', 'IPS-1'),
(34, 'XII', 'IPS-2'),
(35, 'XII', 'IPS-3'),
(36, 'XII', 'IPS-4'),
(38, 'XII', 'IPS-5'),
(39, 'XII', 'IPS-6'),
(40, 'XII', 'IPS-7');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran_spp`
--

CREATE TABLE `pembayaran_spp` (
  `id` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun_ajaran` varchar(20) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `nis` varchar(128) NOT NULL,
  `tanggal` varchar(128) NOT NULL,
  `tarif` varchar(128) NOT NULL,
  `status` int(11) NOT NULL,
  `id_tagihan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembayaran_spp`
--

INSERT INTO `pembayaran_spp` (`id`, `bulan`, `tahun_ajaran`, `id_semester`, `nis`, `tanggal`, `tarif`, `status`, `id_tagihan`) VALUES
(1, 'Januari', '2020-2021', 1, '1703010004', '15-04-2020', '60000', 1, 14),
(3, 'Januari', '2020-2021', 1, '1703010211', '15-04-2020', '60000', 1, 14),
(4, 'Februari', '2020-2021', 1, '1703010211', '15-04-2020', '65000', 1, 15),
(6, 'Januari', '2020-2021', 2, '1703010004', '15-04-2020', '60000', 1, 16),
(8, 'Februari', '2020-2021', 1, '1703010004', '16-04-2020', '65000', 1, 15),
(9, 'Januari', '2019-2020', 1, '1703010020', '19-04-2020', '60000', 1, 17),
(11, 'Maret', '2020-2021', 1, '1703010004', '20-04-2020', '60000', 1, 19),
(12, 'Januari', '2020-2021', 1, '1703010002', '25-04-2020', '60000', 1, 14),
(13, 'Januari', '2019-2020', 1, '1703010002', '25-04-2020', '60000', 1, 17),
(14, 'Januari', '2019-2020', 2, '1703010002', '25-04-2020', '65000', 1, 18),
(16, 'Maret', '2020-2021', 1, '1703010211', '27-04-2020', '60000', 1, 19),
(17, 'Februari', '2020-2021', 2, '1703010004', '27-04-2020', '60000', 1, 20),
(18, 'April', '2020-2021', 1, '1703010004', '28-04-2020', '60000', 1, 25),
(19, 'Februari', '2019-2020', 1, '1703010020', '03-05-2020', '60000', 1, 24),
(20, 'Januari', '2021-2022', 1, '1703010040', '03-05-2020', '65000', 1, 21),
(21, 'Januari', '2020-2021', 2, '1703010211', '17-05-2020', '60000', 1, 16),
(22, 'April', '2020-2021', 1, '1703010211', '20-05-2020', '60000', 1, 25),
(23, 'Januari', '2019-2020', 2, '1703010020', '05-07-2020', '65000', 1, 18),
(24, 'Maret', '2019-2020', 1, '1703010020', '13-07-2020', '60000', 1, 30),
(25, 'April', '2019-2020', 1, '1703010020', '16-09-2020', '60000', 1, 31),
(26, 'Januari', '2020-2021', 1, '1703010020', '16-09-2020', '60000', 1, 14),
(27, 'Februari', '2020-2021', 1, '1703010020', '16-09-2020', '65000', 1, 15),
(28, 'Januari', '2021-2022', 1, '1703010004', '22-12-2020', '65000', 1, 21);

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `id` int(11) NOT NULL,
  `nama_semester` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`id`, `nama_semester`) VALUES
(1, 'Ganjil'),
(2, 'Genap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tagihan_spp`
--

CREATE TABLE `tagihan_spp` (
  `id` int(11) NOT NULL,
  `tahun_ajaran` varchar(10) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tarif` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tagihan_spp`
--

INSERT INTO `tagihan_spp` (`id`, `tahun_ajaran`, `id_semester`, `bulan`, `tarif`) VALUES
(14, '2020-2021', 1, 'Januari', 60000),
(15, '2020-2021', 1, 'Februari', 65000),
(16, '2020-2021', 2, 'Januari', 60000),
(17, '2019-2020', 1, 'Januari', 60000),
(18, '2019-2020', 2, 'Januari', 65000),
(19, '2020-2021', 1, 'Maret', 60000),
(20, '2020-2021', 2, 'Februari', 60000),
(21, '2021-2022', 1, 'Januari', 65000),
(22, '2021-2022', 1, 'Februari', 60000),
(23, '2021-2022', 2, 'Januari', 60000),
(24, '2019-2020', 1, 'Februari', 60000),
(25, '2020-2021', 1, 'April', 60000),
(26, '2020-2021', 1, 'Mei', 60000),
(30, '2019-2020', 1, 'Maret', 60000),
(31, '2019-2020', 1, 'April', 60000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tahun_masuk`
--

CREATE TABLE `tahun_masuk` (
  `id` int(11) NOT NULL,
  `tahun_ajaran` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tahun_masuk`
--

INSERT INTO `tahun_masuk` (`id`, `tahun_ajaran`) VALUES
(5, '2019-2020'),
(6, '2020-2021'),
(7, '2021-2022');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `email` varchar(128) NOT NULL,
  `no_telepon` varchar(20) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `tahun_ajaran` varchar(10) NOT NULL,
  `id_kelas` varchar(20) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `nis`, `email`, `no_telepon`, `alamat`, `tahun_ajaran`, `id_kelas`, `image`, `password`, `role_id`, `is_active`, `date_created`) VALUES
(3, 'Ega Nugraha', '0', 'nugrahaega261@gmail.com', '08975568102', 'Desa Pagerageung tengah, Kecamatan Pagerageung Kabupaten Tasikmalaya', '', '', 'ega.jpg', '$2y$10$oUK4FTSwdHRBjnbZpXldhutE1V5Yw7l8bp845ZH0cvlOlll9MPMmu', 1, 1, 1584887332),
(4, 'Muhammad Faiz', '1703010021', 'muhammadfaiz@gmail.com', '089755681001', 'Ciawi', '2021-2022', '7', '41R-VkcmjcL__SL500_AC_SS350_.jpg', '$2y$10$jTgO71ffciiAF0Pj2StfWeSapzAvQRTSW1GCGOImwX7I.xbh1RUJ6', 2, 1, 1584888340),
(10, 'Trisna Wahana', '1703010004', 'eganugrahaid@gmail.com', '089755681022', 'Desa Pagerageung tengah, Kecamatan Pagerageung Kabupaten Tasikmalaya', '2020-2021', '24', 'pjimage-111.jpg', '$2y$10$pgR.u5wkVSJ.cA9WWtk/TekFJnho9LsSMYT4iTIqwdYJmrHuMG4f.', 2, 1, 1585723559),
(11, 'Fikri Abdul Rafi', '1703010211', 'fikri@gmail.com', '08975568101', 'Sukaraja', '2020-2021', '15', 'default.jpg', '$2y$10$yCbnEB2WqBreoG7.jGowf.8kCFjl1MoMDKWmNQVGtImr/flzX8Kvu', 2, 1, 1585781956),
(13, 'Petugas', '', 'petugas@smanic.com', '082212081021', 'jalan', '', '', 'smanic.png', '$2y$10$2n5sEQJBWo7sz6SM2K6EkOyQ7g0Kx.Xs0DjoW2AFeGR/pEYD4vRpq', 9, 1, 1585819523),
(14, 'Iqbal Raphido', '1703010020', 'ido@gmail.com', '082212081022', 'Tasikmalaya', '2019-2020', '27', 'default.jpg', '$2y$10$KQGfT/gPciDKNiVJ7GwCfO2u/xLuuNwxSiTqo.hbQXfvFAXtsLeuC', 2, 1, 1585826604),
(15, 'Naufal', '1703010002', 'naufal@gmail.com', '08921292827', 'Pagerageung', '2019-2020', '27', 'default.jpg', '$2y$10$YzCQHqR5hTt5xaWorZjSHO4aaWTwFgVxg77PGwQRGFB3HEEiz.HT2', 2, 1, 1585883814),
(17, 'Rizky Maulana', '1703010090', 'rizky@gmail.com', '082210291821', 'Tasikmalaya', '2021-2022', '1', 'default.jpg', '$2y$10$YzCQHqR5hTt5xaWorZjSHO4aaWTwFgVxg77PGwQRGFB3HEEiz.HT2', 2, 1, 1585883814),
(18, 'Romario', '1703010040', 'romariorobby@gmail.com', '089755681020', 'Sukaraja', '2021-2022', '1', 'default.jpg', '$2y$10$MCXaIC6A9DaDT7zwW57H3OXMHHjGIWluoQdgoNmq4my7aSexAUkSO', 2, 1, 1586940976),
(26, 'Ega Nugraha', '1703010043', '1703010040@unper.ac.id', '089755681023', 'pagerageung', '2021-2022', '9', 'default.jpg', '$2y$10$EHnw8.a.mw8Kqp0W48RQu.2DMvicso6d1VX8gYi19TeFOFLVY7nLu', 2, 1, 1591970029),
(27, 'Amar Fawaz', '1703010044', 'amarfawaz05@gmail.com', '089755681025', 'pagerageung', '2021-2022', '9', 'default.jpg', '$2y$10$dRu7J7oVyMvRh9IQeLFA6OdboxSHVHVwuhnQ6M7wV7Zh8jcW0U1Oq', 2, 0, 1591970133),
(31, 'Eka Hasbullah', '1703010080', 'ekahasbullah007@gmail.com', '08921292820989', 'Pagerageung', '2021-2022', '1', 'default.jpg', '$2y$10$7ppWAf4t.jiNGIaFVOWqKee2pe5fZHwyaAiz8x5IC3tR5UphpVnNi', 2, 0, 1595324998);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(2, 1, 2),
(3, 2, 2),
(4, 1, 3),
(7, 1, 10),
(8, 1, 11),
(9, 9, 2),
(10, 9, 11),
(11, 1, 12),
(12, 9, 12),
(17, 2, 1),
(18, 9, 1),
(19, 1, 13),
(24, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Home'),
(2, 'User'),
(3, 'Menu'),
(11, 'Manajemen'),
(12, 'Pembayaran');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member'),
(9, 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'home', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1),
(3, 2, 'Edit Profile', 'user/editprofile', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Manajemen', 'menu', 'fas fa-fw fa-sliders-h', 1),
(5, 3, 'Submenu Manajemen', 'menu/submenu', 'fas fa-fw fa-bars', 1),
(11, 3, 'User Access', 'menu/role', 'fas fa-fw fa-user-cog', 1),
(12, 11, 'Daftar Siswa', 'manajemen/index', 'fas fa-fw fa-user-graduate', 1),
(13, 2, 'Ubah Password', 'user/ubahpassword', 'fas fa-fw fa-key', 1),
(14, 11, 'Daftar Kelas', 'manajemen/daftarkelas', 'fas fa-fw fa-door-open', 1),
(15, 12, 'Pembayaran Spp', 'pembayaran/index', 'fas fa-fw fa-money-check', 1),
(16, 12, 'Tagihan Spp', 'pembayaran/tagihanspp', 'fas fa-fw fa-wallet', 1),
(17, 11, 'Tahun Ajaran', 'manajemen/tahunajaran', 'fas fa-fw fa-hourglass-start', 1),
(19, 12, 'Info Kelas', 'pembayaran/infokelas', 'fas fa-fw fa-door-open', 1),
(20, 2, 'Informasi', 'user/infosiswa', 'fas fa-fw fa-file-invoice', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bulan`
--
ALTER TABLE `bulan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `daftar_kelas`
--
ALTER TABLE `daftar_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran_spp`
--
ALTER TABLE `pembayaran_spp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tagihan_spp`
--
ALTER TABLE `tagihan_spp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tahun_masuk`
--
ALTER TABLE `tahun_masuk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `bulan`
--
ALTER TABLE `bulan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `daftar_kelas`
--
ALTER TABLE `daftar_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `pembayaran_spp`
--
ALTER TABLE `pembayaran_spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `semester`
--
ALTER TABLE `semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tagihan_spp`
--
ALTER TABLE `tagihan_spp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT untuk tabel `tahun_masuk`
--
ALTER TABLE `tahun_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- Database: `penjadwalan`
--
CREATE DATABASE IF NOT EXISTS `penjadwalan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `penjadwalan`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `angkatan`
--

CREATE TABLE `angkatan` (
  `id_angkatan` int(11) NOT NULL,
  `nama_angkatan` varchar(10) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `angkatan`
--

INSERT INTO `angkatan` (`id_angkatan`, `nama_angkatan`, `status`) VALUES
(1, '2017/2018', 0),
(2, '2018/2019', 0),
(3, '2019/2020', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(128) NOT NULL,
  `nidn` int(50) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rfid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`, `nidn`, `jurusan_id`, `user_id`, `rfid_id`) VALUES
(1, 'Missi Hikmatyar, M.Kom.', 431108904, 1, 2, 8),
(5, 'Gea Aristi, S.T. M.Kom', 419048903, 1, 6, 4),
(6, 'Yusuf Sumaryana, S.T. M.Kom', 407108205, 1, 7, 5),
(7, 'Randi Rizal, S.T. M.Kom', 427108704, 1, 11, 6),
(8, 'Apt, Srie Rizki', 4665267, 4, 14, 7),
(9, 'Aso Sudiarjo, M.Kom', 416018902, 1, 16, 3),
(10, 'Ruuhwan, S.T, M.Kom', 425029001, 1, 17, 10),
(11, 'Ade Maftuh, S.T. M.Kom', 427108711, 1, 18, 11),
(12, 'Sihabudin, M.Kom', 983726617, 3, 41, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL,
  `nama_hari` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id_hari`, `nama_hari`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat'),
(6, 'Sabtu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal_kuliah`
--

CREATE TABLE `jadwal_kuliah` (
  `id_jadwal_kuliah` int(11) NOT NULL,
  `pengampu_id` int(11) NOT NULL,
  `jam_belajar_id` int(11) NOT NULL,
  `hari_id` int(11) NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal_kuliah`
--

INSERT INTO `jadwal_kuliah` (`id_jadwal_kuliah`, `pengampu_id`, `jam_belajar_id`, `hari_id`, `ruangan_id`, `status`) VALUES
(1, 1, 9, 2, 14, 0),
(2, 2, 9, 1, 22, 0),
(3, 3, 6, 6, 24, 0),
(4, 4, 3, 1, 5, 0),
(5, 5, 10, 1, 5, 0),
(6, 6, 8, 4, 28, 0),
(7, 7, 7, 2, 8, 0),
(8, 8, 8, 4, 8, 0),
(9, 9, 7, 2, 7, 0),
(10, 10, 8, 1, 4, 0),
(11, 11, 2, 6, 14, 0),
(12, 12, 8, 5, 2, 0),
(13, 13, 2, 2, 25, 0),
(14, 14, 5, 3, 2, 0),
(15, 15, 9, 1, 27, 0),
(16, 16, 4, 4, 11, 0),
(17, 17, 7, 1, 9, 0),
(18, 18, 3, 6, 27, 0),
(19, 19, 9, 4, 20, 0),
(20, 20, 4, 3, 18, 0),
(21, 21, 10, 1, 2, 0),
(22, 22, 2, 5, 22, 0),
(23, 23, 8, 5, 25, 0),
(24, 24, 1, 3, 22, 0),
(25, 25, 6, 2, 19, 0),
(26, 26, 9, 4, 13, 0),
(27, 27, 1, 5, 29, 0),
(28, 28, 5, 2, 17, 0),
(29, 29, 2, 2, 28, 0),
(30, 30, 5, 4, 15, 0),
(31, 31, 9, 6, 28, 0),
(32, 32, 6, 1, 14, 0),
(33, 33, 2, 3, 11, 0),
(34, 34, 8, 3, 7, 0),
(35, 35, 3, 1, 20, 0),
(36, 36, 4, 3, 23, 0),
(37, 37, 3, 6, 17, 0),
(38, 38, 9, 5, 19, 0),
(39, 39, 2, 6, 18, 0),
(40, 40, 8, 3, 4, 0),
(41, 41, 2, 1, 18, 0),
(42, 42, 1, 2, 20, 0),
(43, 43, 9, 2, 19, 0),
(44, 44, 4, 1, 19, 0),
(45, 45, 9, 5, 9, 0),
(46, 46, 1, 3, 19, 0),
(47, 47, 9, 4, 14, 0),
(48, 48, 6, 3, 8, 0),
(49, 49, 7, 1, 8, 0),
(50, 50, 4, 3, 8, 0),
(51, 51, 8, 5, 26, 0),
(52, 52, 2, 3, 21, 0),
(53, 53, 7, 6, 25, 0),
(54, 54, 9, 3, 12, 0),
(55, 55, 1, 6, 12, 0),
(56, 56, 4, 6, 8, 0),
(57, 57, 1, 6, 4, 0),
(58, 58, 8, 5, 23, 0),
(59, 59, 5, 6, 13, 0),
(60, 60, 1, 2, 22, 0),
(61, 61, 1, 1, 27, 0),
(62, 62, 8, 5, 15, 0),
(63, 63, 3, 1, 2, 0),
(64, 64, 1, 4, 14, 0),
(65, 65, 1, 2, 7, 0),
(66, 66, 11, 3, 8, 0),
(67, 67, 9, 3, 8, 0),
(68, 68, 10, 5, 12, 0),
(69, 69, 6, 6, 21, 0),
(70, 70, 3, 6, 2, 0),
(71, 71, 6, 1, 22, 0),
(72, 72, 4, 4, 8, 0),
(73, 73, 1, 3, 8, 0),
(74, 74, 8, 2, 12, 0),
(75, 75, 3, 2, 5, 0),
(76, 76, 8, 3, 25, 0),
(77, 77, 1, 1, 26, 0),
(78, 78, 6, 1, 23, 0),
(79, 79, 10, 4, 1, 0),
(80, 80, 3, 3, 14, 0),
(81, 87, 1, 2, 10, 0),
(82, 88, 1, 6, 5, 0),
(83, 89, 5, 6, 22, 0),
(84, 90, 9, 4, 4, 0),
(85, 91, 1, 6, 16, 0),
(86, 92, 9, 6, 6, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_belajar`
--

CREATE TABLE `jam_belajar` (
  `id_jam_belajar` int(11) NOT NULL,
  `jam_belajar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jam_belajar`
--

INSERT INTO `jam_belajar` (`id_jam_belajar`, `jam_belajar`) VALUES
(1, '08.00-08.50'),
(2, '08.50-09.30'),
(3, '09.40-10.30'),
(4, '10.30-11.20'),
(5, '11.20-12.10'),
(6, '12.10-13.00'),
(7, '13.00-13.50'),
(8, '13.50-14.40'),
(9, '14.40-15.30'),
(10, '15.30-16.20'),
(11, '16.20-17.10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `nama_jurusan` varchar(128) NOT NULL,
  `prodi_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `prodi_id`) VALUES
(1, 'Teknik Informatika', 1),
(2, 'Teknik Sipil', 1),
(3, 'Manajemen', 2),
(4, 'Farmasi', 3),
(6, 'Bahasa Inggris', 4),
(7, 'Akuntansi', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(128) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`, `jurusan_id`, `semester_id`) VALUES
(1, 'TI-A17', 1, 6),
(2, 'TI-B17', 1, 6),
(3, 'TI-C17', 1, 6),
(5, 'MNJ-A17', 3, 6),
(6, 'MNJ-B17', 3, 6),
(8, 'MNJ-C17', 3, 6),
(9, 'FA-A17', 4, 6),
(10, 'FA-B17', 4, 6),
(12, 'TI-A18', 1, 4),
(13, 'TI-B18', 1, 4),
(14, 'TI-C18', 1, 4),
(15, 'TI-A19', 1, 2),
(16, 'TI-B19', 1, 2),
(17, 'TI-C19', 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nama_mahasiswa` varchar(128) NOT NULL,
  `nim` int(50) NOT NULL,
  `angkatan_id` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL,
  `tanggal_lahir` varchar(128) NOT NULL,
  `tempat_tinggal` varchar(128) NOT NULL,
  `no_hp` varchar(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama_mahasiswa`, `nim`, `angkatan_id`, `jurusan_id`, `kelas_id`, `tanggal_lahir`, `tempat_tinggal`, `no_hp`, `user_id`) VALUES
(1, 'Ega Nugraha', 1703010040, 1, 1, 1, '16 Agustus 1999', 'Pagerageung, Tasikmalaya', '08975568102', 3),
(3, 'Trisna Wahana', 1703010004, 1, 1, 1, '09 Mei 1999', 'Sukaraja, Tasikmalaya', '082251627189', 10),
(4, 'Radenda Dewabrata', 1703010044, 1, 1, 1, '20 Mei 1998', 'Ciawi, Tasikmalaya', '0872838278', 12),
(5, 'Risma Shafitri', 1703010090, 1, 3, 6, '20 Mei 1998', 'Jamanis, Tasikmalaya', '08281726352', 13),
(6, 'Aulia Nur Halimah', 1703010310, 1, 3, 8, '08 Agustus 1998', 'Cipacing, Tasikmalaya', '08287165267', 15),
(7, 'Iqbal Rapido', 1703010020, 1, 1, 1, '20 Mei 2020', 'Singaparna, Tasikmalaya', '08225162718', 19),
(8, 'Muhammad Faiz', 1703010002, 1, 1, 1, '09 Mei 1999', 'Sukaraja, Tasikmalaya', '082251627181', 20),
(9, 'Irfan Fauzi', 1703010021, 1, 1, 1, '12 Agustus 1999', 'Singaparna, Tasikmalaya', '082251627182', 21),
(10, 'Muhammad Gungun', 1703010009, 1, 1, 1, '09  Maret 1999', 'Sindangkasih, Tasikmalaya', '08975568111', 22),
(11, 'Panji Diyan', 1703010024, 1, 1, 1, '01 Februari 1999', 'Cipacing, Tasikmalaya', '08232718922', 23),
(12, 'Abdul Azis', 1703010033, 1, 1, 1, '08 Agustus 1998', 'Singaparna, Tasikmalaya', '082251627221', 24),
(13, 'Agung Nugraha', 1703010001, 1, 1, 1, '09 Januari 1998', 'Tasikmalaya', '081323748592', 25),
(14, 'Moch Raditya', 1703010028, 1, 1, 1, '17 September 1998', 'Tasikmalaya', '08766452678', 26),
(15, 'Arki Rahman', 1703010027, 1, 1, 1, '08 Agustus 1998', 'Rajapolah, Tasikmalaya', '085221836722', 27),
(16, 'Asep Nopiana', 1703010003, 1, 1, 1, '20 Mei 2020', 'Tasikmalaya', '08287165261', 28),
(17, 'Wildan Fadilah', 1703010011, 1, 1, 1, '12 Agustus 1999', 'Jamanis, Tasikmalaya', '08225162711', 29),
(18, 'Muhammad Farid', 1703010029, 1, 1, 1, '07 Desember 1999', 'Tasikmalaya', '08212212311', 30),
(19, 'Rizky Maulana Hidayat', 1703010038, 1, 1, 1, '19 November 1998', 'Tasikmalaya', '08234211232', 31),
(20, 'Reza Mahendra', 1703010026, 1, 1, 1, '06 April 1999', 'Tasikmalaya', '081323748522', 32),
(21, 'Naufal Ali', 1703010022, 1, 1, 1, '22 April 1999', 'Singaparna, Tasikmalaya', '0829382716', 33),
(22, 'Abdul Rizal Sidiq', 1703010042, 1, 1, 1, '20 Februari 1998', 'Sindangkasih, Tasikmalaya', '08324152871', 34),
(23, 'Julia Refoliani', 1703010012, 1, 1, 1, '07 Februari 1999', 'Tasikmalaya', '08132864627', 35),
(24, 'Rosna Miftahul', 1703010013, 1, 1, 1, '28 Mei 1999', 'Tasikmalaya', '08225162721', 36),
(25, 'Garnis Tri Lasmi', 1703010014, 1, 1, 1, '17 Juni 1999', 'Tasikmalaya', '082122123112', 37),
(26, 'Elsa Septira', 1703010015, 1, 1, 1, '18 September 1999', 'Tasikmalaya', '082817263511', 38),
(27, 'Bella Pertiwi', 1703010016, 1, 1, 1, '12 September 1998', 'Tasikmalaya', '081323748593', 39),
(28, 'Rizal Farid', 1703010099, 1, 1, 2, '18 April 1999', 'Tasikmalaya', '0892826715', 40);

-- --------------------------------------------------------

--
-- Struktur dari tabel `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(128) NOT NULL,
  `jumlah_sks` int(11) NOT NULL,
  `jurusan_id` int(11) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`id_matkul`, `nama_matkul`, `jumlah_sks`, `jurusan_id`, `semester_id`, `jenis`) VALUES
(1, 'Metodologi Penelitian', 3, 1, 6, 'Teori'),
(2, 'Tata Kelola Audit', 3, 1, 7, 'Teori'),
(3, 'Pasar Modal', 2, 3, 6, 'Teori'),
(5, 'Sistem Terdistribusi', 2, 1, 5, 'Teori'),
(6, 'Struktur Bangunan', 3, 2, 7, 'Teori'),
(8, 'Belah Tikus', 3, 4, 6, 'Praktikum'),
(9, 'Multimedia', 3, 1, 6, 'Teori'),
(10, 'Manajemen Jaringan Komputer', 3, 1, 7, 'Teori'),
(11, 'Sistem Pendukung Keputusan', 3, 1, 6, 'Teori'),
(12, 'Ekonomi Syariah', 3, 3, 7, 'Teori'),
(13, 'Obat Terlarang', 2, 4, 5, 'Teori'),
(14, 'Kewirausahaan', 2, 1, 6, 'Teori'),
(15, 'Rekayasa Sistem', 3, 1, 6, 'Teori'),
(16, 'Komunikasi Antar Personal', 2, 1, 6, 'Teori'),
(17, 'Interaksi Manusia dan Komputer', 3, 1, 6, 'Teori'),
(18, 'Layanan Web', 3, 1, 6, 'Teori'),
(19, 'Data Mining', 3, 1, 6, 'Teori'),
(20, 'Metode Numerik', 3, 1, 4, 'Teori'),
(21, 'Teori Bahasa dan Otomata', 3, 1, 4, 'Teori'),
(22, 'Riset Operasi', 3, 1, 4, 'Teori'),
(23, 'Sistem Informasi', 3, 1, 4, 'Teori'),
(24, 'Sistem Operasi', 3, 1, 4, 'Teori'),
(25, 'Praktikum Sistem Operasi', 1, 1, 4, 'Praktikum'),
(26, 'Jaringan Komputer', 3, 1, 4, 'Teori'),
(27, 'Praktikum Jaringan Komputer', 1, 1, 4, 'Praktikum'),
(28, 'Kalkulus II', 3, 1, 2, 'Teori'),
(29, 'Logika Informatika', 3, 1, 2, 'Teori'),
(30, 'Basis Data', 3, 1, 2, 'Teori'),
(31, 'Praktikum Basis Data', 1, 1, 2, 'Praktikum'),
(32, 'Algoritma dan Struktur Data', 3, 1, 2, 'Teori'),
(33, 'Praktikum Algorithma & Struktur Data', 1, 1, 2, 'Praktikum'),
(34, 'Pendidikan Pancasila dan Kewarganegaraan', 2, 1, 2, 'Teori'),
(35, 'Bahasa Inggris', 2, 1, 2, 'Teori'),
(36, 'Seni Budaya dan Kearifan Lokal', 2, 1, 2, 'Teori'),
(38, 'Strategi Marketing', 3, 3, 6, 'Teori');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id_menu`, `nama_menu`, `url`, `icon`) VALUES
(1, 'Dashboard', 'dashboard', 'fas fa-fw fa-tachometer-alt'),
(2, 'Menu', 'menu', 'fas fa-fw fa-folder-minus'),
(6, 'User Akses', 'user_access', 'fas fa-fw fa-wheelchair'),
(8, 'Data Dosen', 'daftar_dosen', 'fas fa-fw fa-user-secret'),
(9, 'Data Mahasiswa', 'data_mahasiswa', 'fas fa-fw fa-user-graduate'),
(10, 'Manajemen Data', 'manajemen_data', 'fas fa-fw fa-box'),
(11, 'Manajemen Mata Kuliah', 'manajemen_matkul', 'fas fa-fw fa-pencil-ruler'),
(13, 'Manajemen Jadwal', 'manajemen_jadwal', 'fas fa-fw fa-calendar-check'),
(14, 'Jadwal Kuliah', 'jadwal_kelas', 'fas fa-fw fa-calendar-check'),
(15, 'Jadwal Mengajar', 'jadwal_mengajar', 'fas fa-fw fa-calendar-check'),
(16, 'Waktu Tidak Bersedia', 'Waktu_tidak_bersedia', 'fas fa-user-times');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengampu`
--

CREATE TABLE `pengampu` (
  `id_pengampu` int(11) NOT NULL,
  `matkul_id` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `kelas` varchar(120) NOT NULL,
  `tahun_akademik` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pengampu`
--

INSERT INTO `pengampu` (`id_pengampu`, `matkul_id`, `dosen_id`, `kelas`, `tahun_akademik`) VALUES
(1, 1, 1, 'TI-A17', '2017/2018'),
(2, 1, 1, 'TI-B17', '2017/2018'),
(3, 1, 1, 'TI-C17', '2017/2018'),
(4, 3, 12, 'MNJ-A17', '2017/2018'),
(5, 3, 12, 'MNJ-B17', '2017/2018'),
(6, 3, 12, 'MNJ-C17', '2017/2018'),
(7, 8, 8, 'FA-A17', '2017/2018'),
(8, 8, 8, 'FA-B17', '2017/2018'),
(9, 9, 6, 'TI-A17', '2017/2018'),
(10, 9, 6, 'TI-B17', '2017/2018'),
(11, 9, 6, 'TI-C17', '2017/2018'),
(12, 11, 9, 'TI-A17', '2017/2018'),
(13, 11, 9, 'TI-B17', '2017/2018'),
(14, 11, 9, 'TI-C17', '2017/2018'),
(15, 14, 7, 'TI-A17', '2017/2018'),
(16, 14, 7, 'TI-B17', '2017/2018'),
(17, 14, 7, 'TI-C17', '2017/2018'),
(18, 15, 5, 'TI-A17', '2017/2018'),
(19, 15, 5, 'TI-B17', '2017/2018'),
(20, 15, 5, 'TI-C17', '2017/2018'),
(21, 16, 5, 'TI-A17', '2017/2018'),
(22, 16, 5, 'TI-B17', '2017/2018'),
(23, 16, 5, 'TI-C17', '2017/2018'),
(24, 17, 1, 'TI-A17', '2017/2018'),
(25, 17, 1, 'TI-B17', '2017/2018'),
(26, 17, 1, 'TI-C17', '2017/2018'),
(27, 18, 10, 'TI-A17', '2017/2018'),
(28, 18, 10, 'TI-B17', '2017/2018'),
(29, 18, 10, 'TI-C17', '2017/2018'),
(30, 19, 5, 'TI-A17', '2017/2018'),
(31, 19, 5, 'TI-B17', '2017/2018'),
(32, 19, 5, 'TI-C17', '2017/2018'),
(33, 20, 9, 'TI-A18', '2017/2018'),
(34, 20, 9, 'TI-B18', '2017/2018'),
(35, 20, 9, 'TI-C18', '2017/2018'),
(36, 21, 1, 'TI-A18', '2017/2018'),
(37, 21, 1, 'TI-B18', '2017/2018'),
(38, 21, 1, 'TI-C18', '2017/2018'),
(39, 22, 10, 'TI-A18', '2017/2018'),
(40, 22, 10, 'TI-B18', '2017/2018'),
(41, 22, 10, 'TI-C18', '2017/2018'),
(42, 23, 7, 'TI-A18', '2017/2018'),
(43, 23, 7, 'TI-B18', '2017/2018'),
(44, 23, 7, 'TI-C18', '2017/2018'),
(45, 24, 10, 'TI-A18', '2017/2018'),
(46, 24, 10, 'TI-B18', '2017/2018'),
(47, 24, 10, 'TI-C18', '2017/2018'),
(48, 25, 10, 'TI-A18', '2017/2018'),
(49, 25, 10, 'TI-B18', '2017/2018'),
(50, 25, 10, 'TI-C18', '2017/2018'),
(51, 26, 7, 'TI-A18', '2017/2018'),
(52, 26, 7, 'TI-B18', '2017/2018'),
(53, 26, 7, 'TI-C18', '2017/2018'),
(54, 27, 7, 'TI-A18', '2017/2018'),
(55, 27, 7, 'TI-B18', '2017/2018'),
(56, 27, 7, 'TI-C18', '2017/2018'),
(57, 28, 11, 'TI-A19', '2017/2018'),
(58, 28, 11, 'TI-B19', '2017/2018'),
(59, 28, 11, 'TI-C19', '2017/2018'),
(60, 29, 6, 'TI-A19', '2017/2018'),
(61, 29, 6, 'TI-B19', '2017/2018'),
(62, 29, 6, 'TI-C19', '2017/2018'),
(63, 30, 5, 'TI-A19', '2017/2018'),
(64, 30, 5, 'TI-B19', '2017/2018'),
(65, 30, 5, 'TI-C19', '2017/2018'),
(66, 31, 5, 'TI-A19', '2017/2018'),
(67, 31, 5, 'TI-B19', '2017/2018'),
(68, 31, 5, 'TI-C19', '2017/2018'),
(69, 32, 9, 'TI-A19', '2017/2018'),
(70, 32, 9, 'TI-B19', '2017/2018'),
(71, 32, 9, 'TI-C19', '2017/2018'),
(72, 33, 9, 'TI-A19', '2017/2018'),
(73, 33, 9, 'TI-B19', '2017/2018'),
(74, 33, 9, 'TI-C19', '2017/2018'),
(75, 34, 11, 'TI-A19', '2017/2018'),
(76, 34, 11, 'TI-B19', '2017/2018'),
(77, 34, 11, 'TI-C19', '2017/2018'),
(78, 35, 6, 'TI-A19', '2017/2018'),
(79, 35, 6, 'TI-B19', '2017/2018'),
(80, 35, 6, 'TI-C19', '2017/2018'),
(87, 38, 12, 'MNJ-A17', '2017/2018'),
(88, 38, 12, 'MNJ-B17', '2017/2018'),
(89, 38, 12, 'MNJ-C17', '2017/2018'),
(90, 36, 9, 'TI-A19', '2017/2018'),
(91, 36, 9, 'TI-B19', '2017/2018'),
(92, 36, 9, 'TI-C19', '2017/2018');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` int(11) NOT NULL,
  `nama_prodi` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `nama_prodi`) VALUES
(1, 'Teknik'),
(2, 'Ekonomi'),
(3, 'Kesehatan'),
(4, 'Bahasa'),
(6, 'Pendidikan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rfid`
--

CREATE TABLE `rfid` (
  `id_rfid` int(11) NOT NULL,
  `uid_rfid` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rfid`
--

INSERT INTO `rfid` (`id_rfid`, `uid_rfid`) VALUES
(1, '1a:51:42:6b:62'),
(2, 'aa:91:a4:1a:85'),
(3, '79:e4:67:40:ba'),
(4, 'b3:52:39:5:dd'),
(5, 'c3:95:85:5:d6'),
(6, '43:1a:b4:5:e8'),
(7, '73:9b:4e:5:a3'),
(8, '3:83:f0:3:73'),
(9, 'a3:d1:c6:5:b1'),
(10, 'c3:a5:76:5:15'),
(11, '93:b2:3a:5:1e');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rfid_master`
--

CREATE TABLE `rfid_master` (
  `id_rfid_master` int(11) NOT NULL,
  `nama_master` varchar(128) NOT NULL,
  `jabatan` varchar(128) NOT NULL,
  `rfid_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rfid_master`
--

INSERT INTO `rfid_master` (`id_rfid_master`, `nama_master`, `jabatan`, `rfid_id`) VALUES
(4, 'Andri', 'Petugas Kebersihan', 1),
(5, 'Saepul', 'Satpam', 9),
(6, 'Dadang', 'Petugas Kebersihan', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Admin'),
(2, 'Dosen'),
(3, 'Mahasiswa'),
(4, 'Staff');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruangan`
--

CREATE TABLE `ruangan` (
  `id_ruangan` int(11) NOT NULL,
  `nama_ruangan` varchar(128) NOT NULL,
  `kapasitas` int(11) NOT NULL,
  `jenis` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ruangan`
--

INSERT INTO `ruangan` (`id_ruangan`, `nama_ruangan`, `kapasitas`, `jenis`) VALUES
(1, 'A1 Gedung Solihin', 40, 'Teori'),
(2, 'A2 Gedung Solihin', 40, 'Teori'),
(4, 'A3 Gedung Solihin', 40, 'Teori'),
(5, 'A4 Gedung Solihin', 40, 'Teori'),
(6, 'A5 Gedung Solihin', 40, 'Teori'),
(7, 'B1 Gedung Solihin', 40, 'Teori'),
(8, 'L01 Point 1', 30, 'Praktikum'),
(9, 'B2 Gedung Solihin', 40, 'Teori'),
(10, 'B3 Gedung Solihin', 40, 'Teori'),
(11, 'B4 Gedung Solihin', 40, 'Teori'),
(12, 'L02 Point 1', 30, 'Praktikum'),
(13, 'A10 Gedung B', 40, 'Teori'),
(14, 'A11 Gedung B', 40, 'Teori'),
(15, 'A12 Gedung B', 40, 'Teori'),
(16, 'A13 Gedung B', 40, 'Teori'),
(17, 'A14 Gedung B', 40, 'Teori'),
(18, 'A15 Gedung B', 40, 'Teori'),
(19, 'B10 Gedung B', 40, 'Teori'),
(20, 'B11 Gedung B', 40, 'Teori'),
(21, 'B12 Gedung B', 40, 'Teori'),
(22, 'B13 Gedung B', 40, 'Teori'),
(23, 'B14 Gedung B', 40, 'Teori'),
(24, 'B15 Gedung B', 40, 'Teori'),
(25, 'C1 Gedung B', 40, 'Teori'),
(26, 'C2 Gedung B', 40, 'Teori'),
(27, 'C3 Gedung B', 40, 'Teori'),
(28, 'C4 Gedung B', 40, 'Teori'),
(29, 'C5 Gedung B', 40, 'Teori');

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester`
--

CREATE TABLE `semester` (
  `id_semester` int(11) NOT NULL,
  `nama_semester` int(2) NOT NULL,
  `angkatan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `semester`
--

INSERT INTO `semester` (`id_semester`, `nama_semester`, `angkatan_id`) VALUES
(1, 1, 3),
(2, 2, 3),
(3, 3, 2),
(4, 4, 2),
(5, 5, 1),
(6, 6, 1),
(7, 7, 0),
(8, 8, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `semester_aktif`
--

CREATE TABLE `semester_aktif` (
  `id_semester_aktif` int(11) NOT NULL,
  `nama_semester` varchar(128) NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `semester_aktif`
--

INSERT INTO `semester_aktif` (`id_semester_aktif`, `nama_semester`, `is_active`) VALUES
(0, 'Genap', 1),
(1, 'Ganjil', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `role_id`) VALUES
(1, 'admin@xuniversity.ac.id', '$2y$10$Jfq0fEv7TVOjudC8MVbLOuuOKM4tTF/C77ZpVC.IFe7jFJUrN4gFa', 1),
(2, 'missihikmatyar@gmail.com', '$2y$10$Jfq0fEv7TVOjudC8MVbLOuuOKM4tTF/C77ZpVC.IFe7jFJUrN4gFa', 2),
(3, 'nugrahaega261@gmail.com', '$2y$10$/Lg/xPpF2AzEkHYGuHhIMeXyS7oEqi3.antMaGEuHMg/Q4ByAXrn2', 3),
(6, 'geaaristi@gmail.com', '$2y$10$et1.vFlPyVGq1Ke1/rSCl.v60okyTQEj7VOoUujUZtlQxj6IBaHHe', 2),
(7, 'yusufsumaryana@gmail.com', '$2y$10$Y/63iFg3rvkIAUjy3qtrQu7bfoF7RspHnSzFTByyfeLSQ6hi9zcnW', 2),
(10, 'trisnawahanaid@gmail.com', '$2y$10$TrPkmmLV23XqdMZzI3FD1eF6.zSOV0S1stt.29onffxQ8bD2FxQg2', 3),
(11, 'randirizal@gmail.com', '$2y$10$7lDg4M8eYr/kuXprYykM5.7wxBa6INOyDu8WEumu.kI6BmHjwzVVm', 2),
(12, 'dewangga@unper.ac.id', '$2y$10$InicB6/mPe9LbD/rhuq0u.Yvi2egIdV9pdORlX3Jb7jwH55V5rhre', 3),
(13, 'rismashafitri@gmail.com', '$2y$10$WR96PG8RMUWfx9ysC1b6Ne1DKMBWcre2/JARg47BnS/phEnOy6CQO', 3),
(14, 'srierizki@gmail.com', '$2y$10$PcHhIGwSy4ZXJK9o4/WfBu3qZUkdYzfqvQJh.2/LQJAbQoo2YeEjS', 2),
(15, 'aulianurhalimah@gmail.com', '$2y$10$.tez9gqW8AwAVNfNIWTlkerWG2TwIZqzSWKXJQ3NHtqKVJ3cCkmVm', 3),
(16, 'asosudiarjo@gmail.com', '$2y$10$2GCVlIoYI1qtF7BfKODuyefWF.DVhaOrnj0N2xlarZWxP8M5z4nta', 2),
(17, 'Ruhwan@gmail.com', '$2y$10$SfNyIP/jsOpnFaYKwFekJe816Y6Xj9mmORiK6rBFFE4IB9k8jQsU.', 2),
(18, 'ademaftuh@gmail.com', '$2y$10$gt5nqhabRbLamySJAEl.W.7hxqrq9AB6nzYjRnZxYEMwOqTN0tFv2', 2),
(19, 'iqbalrapido@gmail.com', '$2y$10$lOA0mXAY2kYdKYrWtBkhHOQil5JS1EJlVo8qEP9dOOyUELK4E/iUa', 3),
(20, 'muhammadfaiz@gmail.com', '$2y$10$gtFDPIjYQaUVNx3cphXqWubgaHi.hGaT12WeNIYrwQdhBTpPj70OG', 3),
(21, 'Irfan@gmail.com', '$2y$10$SPGxivnF39OJi9ZZe7rZ6ehu8ARidq.p5U6Xar74qzRCpdHckDZ7S', 3),
(22, 'Gungun@gmail.com', '$2y$10$RLs88pygMZT9Qehe2l19/OQa9Wehh1DanePF6UxAoSEmvhb5D0cPi', 3),
(23, 'Panji@gmail.com', '$2y$10$xDi3QmefTQiDZVOTea0NW.D0L75Kj.KFNXMBfCSbKtzGwaKxEhl/G', 3),
(24, 'Azis@gmail.com', '$2y$10$PipPy114vxGQ9EdMeGXSru1wzuda103Wf4rJ1AtsZ7KCGJ2OR3qfq', 3),
(25, 'Agung@gmail.com', '$2y$10$P4C/G0tTStChz1IcCkXgj.3QmP6N3wnw/ryvgyGgfijY5EyTvbrhS', 3),
(26, 'Radit@gmail.com', '$2y$10$U0enmHwIFLFw8gc5ZgznNOK0ekHYEEUTlbEfhhSJqhYwZN8Cuh.6q', 3),
(27, 'arki@gmail.com', '$2y$10$qoyXqte7XzZb/HYCMuHG7OtZpUlLtB5SWrbyV7yfHU.ITqW7XH1U6', 3),
(28, 'Asep@gmail.com', '$2y$10$uXiNnnTfkMX8ykHOzmauZuSwikezywGMtz/3ADl6JMcImPFyYZqle', 3),
(29, 'wildan@gmail.com', '$2y$10$XEWDlE/nEzwIcXvvqIov2OhPaacmdyvMOJli3YZ1LfL6hvbc5hU82', 3),
(30, 'farid@gmail.com', '$2y$10$0AhpBp//rLRN/iT091A7xufCsqpM1fGVoA9omlWfp.GgHpDG4jRW2', 3),
(31, 'rizky@gmail.com', '$2y$10$QsroF8vPQ7Q8s/0Qj0HUyOUFYiloOQV1n0HM.bdbjCagE7nv5ye/2', 3),
(32, 'reza@gmail.com', '$2y$10$EA1XmO.3InyY.K2FN6NY2uAj7RoohHoec10opC1MtgRZt1PmRvuly', 3),
(33, 'naufal@gmail.com', '$2y$10$pTtqt0k15yn7qbQ5pE7K6ulXLLIOx0vZ.ZTF9M8zF8p1sLtgFZxzq', 3),
(34, 'abdul@gmail.com', '$2y$10$iiN8E7e2ZVN8dEvtLAbX7exIGDeQtcXXjf3ifHe6NM6V1NkLsJcsa', 3),
(35, 'julia@gmail.com', '$2y$10$6LgyOlTbwQG5Jdc5eg.RauN.OQ1UchdpYNbiBICfFCkwpmfSwSFFS', 3),
(36, 'Rosna@gmail.com', '$2y$10$lSYXWPdXaM471nP2IfUJH.zkEefWeYeCKMLraqdGsiHClAeFu/p6e', 3),
(37, 'garnis@gmail.com', '$2y$10$0rkGEvmHYlTfJBcaDoJvU.N8qMj.bf4ebZoBZs/XgRtqA.m.xozmi', 3),
(38, 'elsa@gmail.com', '$2y$10$DOneYqEETu49VvPNgCDwze4gYJyiaACpCUwrMrAPVz6xSgWQ57NDW', 3),
(39, 'bella@gmail.com', '$2y$10$et1ED0jGDAnuSgCr01dBBOxKTsxJ8ipHdOViqIIiOgNyqu4yNvDeu', 3),
(40, 'rizal@gmail.com', '$2y$10$RrsOQ2QiQxQ64dgRjVhGY.VzznZOF.PgApusgbg/C08gh.IAMO8vy', 3),
(41, 'sihabudin@gmail.com', '$2y$10$hQEf46QD3JNbEALKD7uQbeaN1g5SDcdPWV.uuQ66YCdh0Yvjf/nsa', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id_user_access` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id_user_access`, `menu_id`, `role_id`) VALUES
(5, 1, 3),
(10, 1, 4),
(11, 6, 1),
(13, 2, 1),
(17, 8, 1),
(18, 9, 1),
(19, 10, 1),
(20, 1, 1),
(22, 11, 1),
(23, 1, 2),
(24, 12, 1),
(25, 13, 1),
(26, 15, 2),
(27, 14, 3),
(28, 1, 6),
(29, 16, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktu_tidak_bersedia`
--

CREATE TABLE `waktu_tidak_bersedia` (
  `id_waktu_tidak_bersedia` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `hari_id` int(11) NOT NULL,
  `jam_belajar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `waktu_tidak_bersedia`
--

INSERT INTO `waktu_tidak_bersedia` (`id_waktu_tidak_bersedia`, `dosen_id`, `hari_id`, `jam_belajar_id`) VALUES
(6, 1, 1, 1),
(7, 5, 2, 2),
(8, 6, 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `angkatan`
--
ALTER TABLE `angkatan`
  ADD PRIMARY KEY (`id_angkatan`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indeks untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  ADD PRIMARY KEY (`id_jadwal_kuliah`);

--
-- Indeks untuk tabel `jam_belajar`
--
ALTER TABLE `jam_belajar`
  ADD PRIMARY KEY (`id_jam_belajar`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);

--
-- Indeks untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  ADD PRIMARY KEY (`id_pengampu`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indeks untuk tabel `rfid`
--
ALTER TABLE `rfid`
  ADD PRIMARY KEY (`id_rfid`);

--
-- Indeks untuk tabel `rfid_master`
--
ALTER TABLE `rfid_master`
  ADD PRIMARY KEY (`id_rfid_master`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id_ruangan`);

--
-- Indeks untuk tabel `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indeks untuk tabel `semester_aktif`
--
ALTER TABLE `semester_aktif`
  ADD PRIMARY KEY (`id_semester_aktif`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id_user_access`);

--
-- Indeks untuk tabel `waktu_tidak_bersedia`
--
ALTER TABLE `waktu_tidak_bersedia`
  ADD PRIMARY KEY (`id_waktu_tidak_bersedia`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `angkatan`
--
ALTER TABLE `angkatan`
  MODIFY `id_angkatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jadwal_kuliah`
--
ALTER TABLE `jadwal_kuliah`
  MODIFY `id_jadwal_kuliah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT untuk tabel `jam_belajar`
--
ALTER TABLE `jam_belajar`
  MODIFY `id_jam_belajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  MODIFY `id_pengampu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `rfid`
--
ALTER TABLE `rfid`
  MODIFY `id_rfid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `rfid_master`
--
ALTER TABLE `rfid_master`
  MODIFY `id_rfid_master` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id_ruangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `semester`
--
ALTER TABLE `semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id_user_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `waktu_tidak_bersedia`
--
ALTER TABLE `waktu_tidak_bersedia`
  MODIFY `id_waktu_tidak_bersedia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Database: `penjadwalan_genetik_web`
--
CREATE DATABASE IF NOT EXISTS `penjadwalan_genetik_web` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `penjadwalan_genetik_web`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `kode` int(2) NOT NULL,
  `nidn` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `telp` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`kode`, `nidn`, `nama`, `alamat`, `telp`) VALUES
(1, '', 'Erlin, Dr. M.Kom ', '', ''),
(2, '', 'Triyani Arita Fitri, M.Kom \r\n', '', ''),
(3, '', 'Karpen, M.Kom ', '', ''),
(4, '', 'Helda Yenni, M.Kom ', '', ''),
(37, NULL, 'Rini Yanti, S.Si', NULL, NULL),
(38, NULL, 'Tat Marlina, MH', NULL, NULL),
(39, NULL, 'Susi Erlinda, M.Kom ', NULL, NULL),
(40, NULL, 'Yoso frenaguna, S.Kom ', NULL, NULL),
(41, NULL, 'Elgamar, S.Kom ', NULL, NULL),
(42, NULL, 'Fransiskus Z, S.Kom ', NULL, NULL),
(43, NULL, 'Hamdani, M.Kom ', NULL, NULL),
(44, NULL, 'Herwin, M.Kom ', NULL, NULL),
(45, NULL, 'Irawati Sastra, S.Kom ', NULL, NULL),
(46, NULL, 'Tashid, M.Kom ', NULL, NULL),
(47, '12345', 'Agung Setiawan, S.Kom, MM', '', ''),
(48, NULL, 'Suprasman,Drs. MM', NULL, NULL),
(49, NULL, 'Dewi Sari Wahyuni, M.Pd', NULL, NULL),
(50, NULL, 'Jusniwati, S.Pd', NULL, NULL),
(51, NULL, 'Masduki, S.Pd', NULL, NULL),
(52, NULL, 'Hidayati Azizah, S.Si', NULL, NULL),
(53, NULL, 'Firman Edigan, M.Pd ', NULL, NULL),
(54, NULL, 'Rahmiati, M.Kom ', NULL, NULL),
(55, NULL, 'Dwi Haryono, M.Kom ', NULL, NULL),
(56, NULL, 'Riati, M.Si', NULL, NULL),
(57, NULL, 'Rahmaddeni, S.Kom ', NULL, NULL),
(58, NULL, 'Robinson, M.Sc', NULL, NULL),
(59, NULL, 'Sabam Parjuangan, M.Kom ', NULL, NULL),
(60, NULL, 'Corina Tri Handayani, MM', NULL, NULL),
(61, NULL, 'Herispon, M.Si ', NULL, NULL),
(62, NULL, 'Kastanti, SE ', NULL, NULL),
(63, NULL, 'Torkis Nasution, M.Kom ', NULL, NULL),
(64, NULL, 'T. Sy. Eiva Fatdha, M.Kom ', NULL, NULL),
(65, NULL, 'Syahrul Imardi, M.T', NULL, NULL),
(66, NULL, 'Nova Rahmi, S.Kom ', NULL, NULL),
(67, NULL, 'Iwan Iskandar, MT', NULL, NULL),
(68, NULL, 'Nurjayadi, S.Kom ', NULL, NULL),
(69, NULL, 'Mar\'aini, MM', NULL, NULL),
(70, NULL, 'Lusiana, M.Kom ', NULL, NULL),
(71, NULL, 'Surya Syahrani, S.Kom ', NULL, NULL),
(72, NULL, 'Misbah Hayati, S.Pd', NULL, NULL),
(73, NULL, 'Koko Harianto, S.Kom ', NULL, NULL),
(74, NULL, 'Khusaeri Andesa, S.Kom ', NULL, NULL),
(75, NULL, 'Susanti, M.IT', NULL, NULL),
(76, NULL, 'Sujiwo, S.Kom ', NULL, NULL),
(77, NULL, 'Imelda Yance, M.Pd', NULL, NULL),
(78, NULL, 'Wirta Agustin, S.Kom ', NULL, NULL),
(79, NULL, 'Unang Rio, M.Kom ', NULL, NULL),
(80, NULL, 'Susandri, M.Kom ', NULL, NULL),
(81, NULL, 'Edwar Ali, M.Kom ', NULL, NULL),
(82, NULL, 'Dadang Iskandar,Prof. M.Sc', NULL, NULL),
(83, NULL, 'Alber, M.Pd', NULL, NULL),
(84, NULL, 'Selamet Wahyudi,Dr', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `kode` int(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`kode`, `nama`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat'),
(6, 'Sabtu');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwalkuliah`
--

CREATE TABLE `jadwalkuliah` (
  `kode` int(10) NOT NULL,
  `kode_pengampu` int(10) DEFAULT NULL,
  `kode_jam` int(10) DEFAULT NULL,
  `kode_hari` int(10) DEFAULT NULL,
  `kode_ruang` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='hasil proses';

--
-- Dumping data untuk tabel `jadwalkuliah`
--

INSERT INTO `jadwalkuliah` (`kode`, `kode_pengampu`, `kode_jam`, `kode_hari`, `kode_ruang`) VALUES
(1, 1, 7, 3, 15),
(2, 2, 7, 4, 11),
(3, 3, 8, 1, 14),
(4, 4, 1, 5, 5),
(5, 5, 6, 4, 1),
(6, 6, 8, 2, 11),
(7, 7, 6, 4, 10),
(8, 8, 10, 6, 11),
(9, 9, 10, 5, 8),
(10, 10, 10, 1, 12),
(11, 11, 1, 1, 15),
(12, 12, 7, 6, 1),
(13, 13, 5, 4, 14),
(14, 14, 9, 3, 1),
(15, 15, 3, 4, 14),
(16, 16, 3, 1, 3),
(17, 17, 9, 2, 6),
(18, 18, 2, 3, 14),
(19, 19, 7, 1, 8),
(20, 20, 10, 2, 15),
(21, 21, 2, 4, 10),
(22, 22, 4, 4, 8),
(23, 23, 5, 2, 11),
(24, 24, 8, 4, 8),
(25, 25, 9, 5, 15),
(26, 26, 9, 6, 6),
(27, 27, 5, 6, 4),
(28, 32, 7, 1, 15),
(29, 33, 1, 4, 8),
(30, 34, 7, 5, 3),
(31, 36, 6, 6, 19),
(32, 37, 5, 2, 22),
(33, 38, 9, 3, 12),
(34, 39, 2, 5, 3),
(35, 40, 9, 2, 4),
(36, 41, 4, 4, 6),
(37, 42, 7, 3, 6),
(38, 43, 1, 2, 8),
(39, 44, 6, 6, 2),
(40, 45, 3, 4, 11),
(41, 47, 10, 5, 4),
(42, 48, 1, 2, 5),
(43, 49, 3, 2, 7),
(44, 50, 6, 2, 5),
(45, 51, 2, 6, 3),
(46, 52, 8, 5, 11),
(47, 53, 4, 3, 13),
(48, 54, 1, 6, 7),
(49, 55, 4, 6, 5),
(50, 56, 9, 4, 14),
(51, 57, 10, 1, 15),
(52, 58, 10, 6, 13),
(53, 59, 1, 5, 12),
(54, 60, 8, 5, 8),
(55, 61, 1, 2, 11),
(56, 62, 5, 2, 8),
(57, 63, 8, 2, 8),
(58, 64, 2, 6, 15),
(59, 65, 6, 6, 8),
(60, 66, 8, 4, 2),
(61, 67, 5, 1, 10),
(62, 68, 10, 2, 13),
(63, 69, 1, 1, 4),
(64, 70, 9, 4, 6),
(65, 71, 6, 3, 7),
(66, 72, 8, 3, 10),
(67, 73, 6, 2, 4),
(68, 74, 7, 4, 9),
(69, 75, 8, 3, 4),
(70, 76, 9, 5, 9),
(71, 77, 6, 4, 2),
(72, 78, 4, 2, 14),
(73, 79, 1, 3, 2),
(74, 80, 4, 6, 14),
(75, 82, 8, 2, 5),
(76, 83, 1, 3, 1),
(77, 84, 9, 2, 10),
(78, 85, 7, 1, 13),
(79, 86, 5, 4, 18),
(80, 87, 9, 3, 19),
(81, 88, 7, 1, 12),
(82, 89, 3, 6, 6),
(83, 92, 4, 1, 7),
(84, 93, 10, 6, 8),
(85, 94, 4, 2, 15),
(86, 95, 10, 1, 10),
(87, 96, 5, 6, 1),
(88, 97, 1, 6, 6),
(89, 98, 8, 5, 7),
(90, 99, 10, 3, 8),
(91, 100, 10, 1, 5),
(92, 101, 2, 6, 14),
(93, 102, 8, 1, 16),
(94, 103, 5, 1, 11),
(95, 104, 3, 3, 15),
(96, 105, 6, 3, 8),
(97, 106, 1, 2, 10),
(98, 107, 8, 2, 14),
(99, 108, 1, 3, 3),
(100, 109, 5, 4, 4),
(101, 110, 10, 6, 2),
(102, 111, 1, 6, 10),
(103, 112, 6, 2, 12),
(104, 113, 3, 2, 16),
(105, 114, 1, 4, 13),
(106, 115, 8, 3, 13),
(107, 116, 3, 2, 1),
(108, 117, 3, 3, 6),
(109, 118, 4, 3, 9),
(110, 119, 1, 2, 2),
(111, 120, 6, 6, 13),
(112, 121, 1, 5, 7),
(113, 122, 1, 3, 16),
(114, 123, 8, 2, 2),
(115, 124, 8, 1, 9),
(116, 125, 10, 4, 12),
(117, 126, 10, 5, 16),
(118, 127, 9, 4, 3),
(119, 128, 7, 5, 2),
(120, 129, 4, 4, 15),
(121, 130, 3, 2, 5),
(122, 131, 8, 1, 11),
(123, 132, 6, 2, 1),
(124, 133, 5, 6, 12),
(125, 134, 7, 6, 5),
(126, 144, 4, 1, 16),
(127, 145, 5, 3, 2),
(128, 146, 8, 1, 3),
(129, 147, 8, 4, 10),
(130, 148, 2, 2, 4),
(131, 149, 1, 2, 3),
(132, 150, 8, 2, 15),
(133, 151, 4, 4, 1),
(134, 152, 9, 3, 2),
(135, 153, 3, 6, 16),
(136, 154, 10, 1, 8),
(137, 155, 2, 6, 11),
(138, 156, 4, 1, 1),
(139, 157, 1, 3, 8),
(140, 158, 5, 1, 6),
(141, 159, 6, 6, 7),
(142, 160, 10, 1, 13),
(143, 161, 5, 2, 10),
(144, 162, 3, 4, 12),
(145, 163, 1, 2, 14),
(146, 164, 8, 6, 15),
(147, 165, 3, 1, 10),
(148, 166, 5, 6, 10),
(149, 167, 7, 5, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam`
--

CREATE TABLE `jam` (
  `kode` int(10) NOT NULL,
  `range_jam` varchar(50) DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jam`
--

INSERT INTO `jam` (`kode`, `range_jam`, `aktif`) VALUES
(1, '08.00-08.50', NULL),
(2, '08.50-09.30', NULL),
(3, '09.40-10.30', NULL),
(4, '10.30-11.20', NULL),
(5, '11.20-12.10', NULL),
(6, '12.10-13.00', NULL),
(7, '13.00-13.50', NULL),
(8, '13.50-14.40', NULL),
(9, '14.40-15.30', NULL),
(10, '15.30-16.20', NULL),
(11, '16.20-17.10', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode` int(10) NOT NULL,
  `kode_mk` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `sks` int(6) DEFAULT NULL,
  `semester` int(6) DEFAULT NULL,
  `aktif` enum('True','False') DEFAULT 'True',
  `jenis` enum('TEORI','PRAKTIKUM') DEFAULT 'TEORI'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='example kode_mk = 0765109 ';

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kode`, `kode_mk`, `nama`, `sks`, `semester`, `aktif`, `jenis`) VALUES
(1, NULL, 'Basis Data I ', 3, 2, 'True', 'TEORI'),
(2, NULL, 'Sistem Operasi ', 2, 2, 'True', 'TEORI'),
(3, NULL, 'Kalkulus  II', 2, 2, 'True', 'TEORI'),
(4, NULL, 'Pemrograman Desktop I (VB) (T)', 2, 2, 'True', 'TEORI'),
(5, NULL, 'Pemrograman Desktop I (VB) (P)', 2, 2, 'True', 'PRAKTIKUM'),
(6, NULL, 'Kewarganegaraan ', 2, 2, 'True', 'TEORI'),
(7, NULL, 'Bahasa Inggris II', 2, 2, 'True', 'TEORI'),
(8, NULL, 'Analisa & Perancangan SI', 3, 4, 'True', 'TEORI'),
(9, NULL, 'Statistik Probabilitas', 2, 4, 'True', 'TEORI'),
(10, NULL, 'Teknik Digital ', 3, 4, 'True', 'TEORI'),
(11, NULL, 'Bahasa Indonesia ', 2, 4, 'True', 'TEORI'),
(12, NULL, 'Troubleshooting', 2, 8, 'True', 'TEORI'),
(13, NULL, 'Kewirausahaan', 2, 8, 'True', 'TEORI'),
(14, NULL, 'Perbankan & Lembaga Keuangan', 2, 8, 'True', 'TEORI'),
(15, NULL, 'Microprocessor', 3, 6, 'True', 'TEORI'),
(16, NULL, 'Manajemen Proyek TI', 3, 6, 'True', 'TEORI'),
(17, NULL, 'Teknik Simulasi ', 3, 6, 'True', 'TEORI'),
(18, NULL, 'Struktur Data  (C++/Java)  (T)', 3, 2, 'True', 'TEORI'),
(19, NULL, 'Struktur Data  (C++/Java)  (P)', 3, 2, 'True', 'PRAKTIKUM'),
(20, NULL, 'Teknologi Komputer Utilitas (T) ', 2, 2, 'True', 'TEORI'),
(21, NULL, 'Teknologi Komputer Utilitas (P) ', 2, 2, 'True', 'PRAKTIKUM'),
(22, NULL, 'Lingkungan Kerja Jaringan (T) ', 3, 4, 'True', 'TEORI'),
(23, NULL, 'Lingkungan Kerja Jaringan (P) ', 3, 4, 'True', 'PRAKTIKUM'),
(24, NULL, 'Matematika Diskrit (T) ', 2, 4, 'True', 'TEORI'),
(25, NULL, 'Matematika Diskrit (P) ', 2, 4, 'True', 'PRAKTIKUM'),
(26, NULL, 'Pemrograman Science II (T)', 3, 4, 'True', 'TEORI'),
(27, NULL, 'Pemrograman Science II (P)', 3, 4, 'True', 'PRAKTIKUM'),
(28, NULL, 'Pemrograman Desktop II (VB) (T) ', 3, 4, 'True', 'TEORI'),
(29, NULL, 'Pemrograman Desktop II (VB) (P) ', 3, 4, 'True', 'PRAKTIKUM'),
(30, NULL, 'Teknologi Open Source II  (T)', 3, 6, 'True', 'TEORI'),
(31, NULL, 'Teknologi Open Source II  (P)', 3, 6, 'True', 'PRAKTIKUM'),
(32, NULL, 'Pemrograman Mobile II (T)', 3, 6, 'True', 'TEORI'),
(33, NULL, 'Pemrograman Mobile II (P)', 3, 6, 'True', 'PRAKTIKUM'),
(34, NULL, 'Web Desain (T)', 2, 6, 'True', 'TEORI'),
(35, NULL, 'Web Desain (P)', 2, 6, 'True', 'PRAKTIKUM'),
(36, NULL, 'Project I  (T)', 2, 6, 'True', 'TEORI'),
(37, NULL, 'Project I  (P)', 2, 6, 'True', 'PRAKTIKUM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengampu`
--

CREATE TABLE `pengampu` (
  `kode` int(10) NOT NULL,
  `kode_mk` int(10) DEFAULT NULL,
  `kode_dosen` int(10) DEFAULT NULL,
  `kelas` varchar(10) DEFAULT NULL,
  `tahun_akademik` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengampu`
--

INSERT INTO `pengampu` (`kode`, `kode_mk`, `kode_dosen`, `kelas`, `tahun_akademik`) VALUES
(1, 1, 1, 'F', '2011-2012'),
(2, 1, 1, 'G', '2011-2012'),
(3, 1, 1, 'H', '2011-2012'),
(4, 1, 2, 'A', '2011-2012'),
(5, 1, 2, 'D', '2011-2012'),
(6, 2, 3, 'A', '2011-2012'),
(7, 2, 3, 'C', '2011-2012'),
(8, 2, 3, 'D', '2011-2012'),
(9, 2, 3, 'B', '2011-2012'),
(10, 2, 4, 'E', '2011-2012'),
(11, 2, 4, 'G', '2011-2012'),
(12, 2, 4, 'H', '2011-2012'),
(13, 2, 4, 'F', '2011-2012'),
(14, 4, 43, 'C', '2011-2012'),
(15, 4, 43, 'A', '2011-2012'),
(16, 4, 43, 'B', '2011-2012'),
(17, 4, 43, 'D', '2011-2012'),
(18, 3, 37, 'A', '2011-2012'),
(19, 3, 37, 'B', '2011-2012'),
(20, 24, 37, 'G', '2011-2012'),
(21, 24, 37, 'E', '2011-2012'),
(22, 24, 37, 'F', '2011-2012'),
(23, 6, 38, 'F', '2011-2012'),
(24, 6, 38, 'C', '2011-2012'),
(25, 6, 38, 'G', '2011-2012'),
(26, 6, 38, 'H', '2011-2012'),
(27, 18, 39, 'D', '2011-2012'),
(32, 18, 39, 'B', '2011-2012'),
(33, 18, 39, 'C', '2011-2012'),
(34, 18, 39, 'A', '2011-2012'),
(36, 19, 40, 'G', '2011-2012'),
(37, 19, 40, 'H', '2011-2012'),
(38, 20, 41, 'E', '2011-2012'),
(39, 20, 41, 'C', '2011-2012'),
(40, 20, 41, 'D', '2011-2012'),
(41, 20, 41, 'F', '2011-2012'),
(42, 12, 41, 'A', '2011-2012'),
(43, 12, 41, 'B', '2011-2012'),
(44, 18, 42, 'H', '2011-2012'),
(45, 18, 42, 'G', '2011-2012'),
(47, 34, 42, 'D', '2011-2012'),
(48, 7, 49, 'F', '2011-2012'),
(49, 7, 49, 'D', '2011-2012'),
(50, 7, 49, 'C', '2011-2012'),
(51, 7, 50, 'A', '2011-2012'),
(52, 7, 50, 'B', '2011-2012'),
(53, 22, 55, 'B', '2011-2012'),
(54, 22, 55, 'A', '2011-2012'),
(55, 22, 55, 'C', '2011-2012'),
(56, 22, 55, 'D', '2011-2012'),
(57, 9, 56, 'F', '2011-2012'),
(58, 9, 56, 'E', '2011-2012'),
(59, 9, 56, 'G', '2011-2012'),
(60, 20, 44, 'B', '2011-2012'),
(61, 22, 44, 'G', '2011-2012'),
(62, 22, 44, 'E', '2011-2012'),
(63, 22, 44, 'F', '2011-2012'),
(64, 20, 45, 'A', '2011-2012'),
(65, 20, 45, 'G', '2011-2012'),
(66, 20, 45, 'H', '2011-2012'),
(67, 12, 45, 'C', '2011-2012'),
(68, 4, 46, 'E', '2011-2012'),
(69, 4, 46, 'F', '2011-2012'),
(70, 28, 46, 'D', '2011-2012'),
(71, 28, 46, 'E', '2011-2012'),
(72, 18, 47, 'F', '2011-2012'),
(73, 18, 47, 'E', '2011-2012'),
(74, 6, 48, 'A', '2011-2012'),
(75, 6, 48, 'E', '2011-2012'),
(76, 6, 48, 'D', '2011-2012'),
(77, 11, 77, 'E', '2011-2012'),
(78, 11, 77, 'D', '2011-2012'),
(79, 11, 77, 'F', '2011-2012'),
(80, 8, 70, 'A', '2011-2012'),
(82, 8, 70, 'C', '2011-2012'),
(83, 8, 70, 'B', '2011-2012'),
(84, 17, 64, 'C', '2011-2012'),
(85, 17, 64, 'D', '2011-2012'),
(86, 31, 66, 'D', '2011-2012'),
(87, 31, 66, 'C', '2011-2012'),
(88, 30, 67, 'B', '2011-2012'),
(89, 30, 67, 'A', '2011-2012'),
(92, 9, 84, 'A', '2011-2012'),
(93, 9, 84, 'B', '2011-2012'),
(94, 9, 84, 'C', '2011-2012'),
(95, 9, 84, 'D', '2011-2012'),
(96, 24, 82, 'B', '2011-2012'),
(97, 24, 82, 'C', '2011-2012'),
(98, 24, 82, 'D', '2011-2012'),
(99, 24, 82, 'A', '2011-2012'),
(100, 11, 83, 'B', '2011-2012'),
(101, 11, 83, 'A', '2011-2012'),
(102, 11, 83, 'C', '2011-2012'),
(103, 10, 57, 'C', '2011-2012'),
(104, 10, 57, 'E', '2011-2012'),
(105, 10, 57, 'F', '2011-2012'),
(106, 10, 57, 'D', '2011-2012'),
(107, 10, 75, 'B', '2011-2012'),
(108, 10, 75, 'A', '2011-2012'),
(109, 36, 63, 'C', '2011-2012'),
(110, 36, 63, 'D', '2011-2012'),
(111, 36, 63, 'A', '2011-2012'),
(112, 8, 81, 'D', '2011-2012'),
(113, 8, 81, 'F', '2011-2012'),
(114, 8, 81, 'E', '2011-2012'),
(115, 26, 79, 'B', '2011-2012'),
(116, 26, 79, 'A', '2011-2012'),
(117, 26, 79, 'C', '2011-2012'),
(118, 28, 80, 'C', '2011-2012'),
(119, 28, 80, 'A', '2011-2012'),
(120, 28, 80, 'B', '2011-2012'),
(121, 26, 76, 'D', '2011-2012'),
(122, 26, 76, 'E', '2011-2012'),
(123, 26, 76, 'F', '2011-2012'),
(124, 3, 52, 'C', '2011-2012'),
(125, 3, 52, 'E', '2011-2012'),
(126, 3, 52, 'D', '2011-2012'),
(127, 3, 53, 'H', '2011-2012'),
(128, 3, 53, 'G', '2011-2012'),
(129, 3, 53, 'F', '2011-2012'),
(130, 17, 75, 'A', '2011-2012'),
(131, 17, 75, 'B', '2011-2012'),
(132, 7, 51, 'H', '2011-2012'),
(133, 7, 51, 'E', '2011-2012'),
(134, 7, 51, 'G', '2011-2012'),
(144, 15, 65, 'B', '2011-2012'),
(145, 15, 65, 'A', '2011-2012'),
(146, 10, 71, 'G', '2011-2012'),
(147, 11, 72, 'G', '2011-2012'),
(148, 32, 63, 'B', '2011-2012'),
(149, 13, 60, 'A', '2011-2012'),
(150, 13, 60, 'B', '2011-2012'),
(151, 13, 69, 'C', '2011-2012'),
(152, 8, 54, 'C', '2011-2012'),
(153, 8, 54, 'B', '2011-2012'),
(154, 36, 54, 'A', '2011-2012'),
(155, 36, 81, 'B', '2011-2012'),
(156, 8, 78, 'G', '2011-2012'),
(157, 28, 74, 'F', '2011-2012'),
(158, 28, 74, 'G', '2011-2012'),
(159, 26, 73, 'G', '2011-2012'),
(160, 34, 68, 'A', '2011-2012'),
(161, 34, 68, 'B', '2011-2012'),
(162, 32, 58, 'C', '2011-2012'),
(163, 32, 58, 'D', '2011-2012'),
(164, 15, 59, 'C', '2011-2012'),
(165, 14, 61, 'A', '2011-2012'),
(166, 14, 61, 'B', '2011-2012'),
(167, 14, 62, 'C', '2011-2012');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `kode` int(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kapasitas` int(10) DEFAULT NULL,
  `jenis` enum('TEORI','LABORATORIUM') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`kode`, `nama`, `kapasitas`, `jenis`) VALUES
(1, 'Ruang 1', NULL, 'TEORI'),
(2, 'Ruang 2', NULL, 'TEORI'),
(3, 'Ruang 3', NULL, 'TEORI'),
(4, 'Ruang 4', NULL, 'TEORI'),
(5, 'Ruang 5', NULL, 'TEORI'),
(6, 'Ruang 6', NULL, 'TEORI'),
(7, 'Ruang 7', NULL, 'TEORI'),
(8, 'Ruang 8', NULL, 'TEORI'),
(9, 'Ruang 9', NULL, 'TEORI'),
(10, 'Ruang 10', NULL, 'TEORI'),
(11, 'Ruang 11', NULL, 'TEORI'),
(12, 'Ruang 12', NULL, 'TEORI'),
(13, 'Ruang 13', NULL, 'TEORI'),
(14, 'Ruang 14', NULL, 'TEORI'),
(15, 'Ruang 15', NULL, 'TEORI'),
(16, 'Ruang 16', NULL, 'TEORI'),
(17, 'Lab. Sisfo 1', NULL, 'LABORATORIUM'),
(18, 'Lab. Sisfo 2', NULL, 'LABORATORIUM'),
(19, 'Lab Inherent', NULL, 'LABORATORIUM'),
(20, 'Lab Aplikasi ', NULL, 'LABORATORIUM'),
(21, 'Lab Jar ', NULL, 'LABORATORIUM'),
(22, 'Lab Micro', NULL, 'LABORATORIUM'),
(23, 'Lab Maintenence', NULL, 'LABORATORIUM');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `level` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `waktu_tidak_bersedia`
--

CREATE TABLE `waktu_tidak_bersedia` (
  `kode` int(10) NOT NULL,
  `kode_dosen` int(10) DEFAULT NULL,
  `kode_hari` int(10) DEFAULT NULL,
  `kode_jam` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `waktu_tidak_bersedia`
--

INSERT INTO `waktu_tidak_bersedia` (`kode`, `kode_dosen`, `kode_hari`, `kode_jam`) VALUES
(12, 47, 1, 1),
(13, 77, 1, 1),
(14, 77, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `jam`
--
ALTER TABLE `jam`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kode`);

--
-- Indeks untuk tabel `waktu_tidak_bersedia`
--
ALTER TABLE `waktu_tidak_bersedia`
  ADD PRIMARY KEY (`kode`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `kode` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `jadwalkuliah`
--
ALTER TABLE `jadwalkuliah`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT untuk tabel `jam`
--
ALTER TABLE `jam`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT untuk tabel `pengampu`
--
ALTER TABLE `pengampu`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `waktu_tidak_bersedia`
--
ALTER TABLE `waktu_tidak_bersedia`
  MODIFY `kode` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data untuk tabel `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data untuk tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"onlineshop\",\"table\":\"varian\"},{\"db\":\"onlineshop\",\"table\":\"produk\"},{\"db\":\"onlineshop\",\"table\":\"foto_produk\"},{\"db\":\"onlineshop\",\"table\":\"appearance_admin\"},{\"db\":\"onlineshop\",\"table\":\"biodata\"},{\"db\":\"onlineshop\",\"table\":\"kategori_produk\"},{\"db\":\"onlineshop\",\"table\":\"user\"},{\"db\":\"onlineshop\",\"table\":\"jenis_varian\"},{\"db\":\"onlineshop\",\"table\":\"foto_varian\"},{\"db\":\"onlineshop\",\"table\":\"role\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data untuk tabel `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'penjadwalan', 'ruangan', '{\"sorted_col\":\"`id_ruangan`  ASC\"}', '2021-07-01 03:43:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-06-05 13:34:43', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"id\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks untuk tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks untuk tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks untuk tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks untuk tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks untuk tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks untuk tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks untuk tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks untuk tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `rest`
--
CREATE DATABASE IF NOT EXISTS `rest` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rest`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keys`
--

CREATE TABLE `keys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(2) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `is_private_key` tinyint(1) NOT NULL DEFAULT 0,
  `ip_addresses` text DEFAULT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `keys`
--

INSERT INTO `keys` (`id`, `user_id`, `key`, `level`, `ignore_limits`, `is_private_key`, `ip_addresses`, `date_created`) VALUES
(1, 1, 'ega123', 1, 0, 0, NULL, 1),
(2, 2, 'rahasia', 1, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `limits`
--

CREATE TABLE `limits` (
  `id` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `count` int(10) NOT NULL,
  `hour_started` int(11) NOT NULL,
  `api_key` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `limits`
--

INSERT INTO `limits` (`id`, `uri`, `count`, `hour_started`, `api_key`) VALUES
(1, 'uri:api/mahasiswa/index:get', 2, 1589641693, 'ega123'),
(2, 'uri:api/mahasiswa/index:get', 5, 1589641708, 'rahasia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nrp` char(9) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `jurusan` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nrp`, `nama`, `email`, `jurusan`) VALUES
(1, '043040001', 'Doddy Ferdiansyah', 'doy@gmail.com', 'Teknik Mesin'),
(2, '023040123', 'Erik', 'erik@gmail.com', 'Teknik Industri');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `limits`
--
ALTER TABLE `limits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `limits`
--
ALTER TABLE `limits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- Database: `rfid_tes`
--
CREATE DATABASE IF NOT EXISTS `rfid_tes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rfid_tes`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbllogs`
--

CREATE TABLE `tbllogs` (
  `logid` int(11) NOT NULL,
  `cardid` int(11) NOT NULL,
  `logdate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbllogs`
--

INSERT INTO `tbllogs` (`logid`, `cardid`, `logdate`) VALUES
(1, 1861660, 1613959440),
(2, 348670, 1613959466),
(3, 1861660, 1613959488),
(4, 348670, 1613959505),
(5, 661430, 1613959592),
(6, 661430, 1613959709),
(7, 348670, 1613959721),
(8, 1861660, 1613959734);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tesku`
--

CREATE TABLE `tesku` (
  `id` int(11) NOT NULL,
  `ruangan_id` int(11) NOT NULL,
  `kelas` varchar(128) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tesku`
--

INSERT INTO `tesku` (`id`, `ruangan_id`, `kelas`, `uid`, `status`) VALUES
(1, 2, 'TI A 17', '1a:51:42:6b:62', 1),
(2, 2, 'TI B 17', '2c:ca:c0:17:31', 0),
(3, 2, 'TI C 17', 'Dewa', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbllogs`
--
ALTER TABLE `tbllogs`
  ADD PRIMARY KEY (`logid`);

--
-- Indeks untuk tabel `tesku`
--
ALTER TABLE `tesku`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbllogs`
--
ALTER TABLE `tbllogs`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tesku`
--
ALTER TABLE `tesku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `shutterbox`
--
CREATE DATABASE IF NOT EXISTS `shutterbox` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shutterbox`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_user`
--

CREATE TABLE `db_user` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `role_id` int(2) NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `db_user`
--

INSERT INTO `db_user` (`id`, `name`, `email`, `password`, `role_id`, `is_active`) VALUES
(1, 'Ega Nugraha', 'nugrahaega261@gmail.com', '$2y$10$oUK4FTSwdHRBjnbZpXldhutE1V5Yw7l8bp845ZH0cvlOlll9MPMmu', 1, 1),
(7, 'Eka Hasbullah', 'ekahasbullah007@gmail.com', '$2y$10$qPC9MkuCd2Hj0/jM.zR5H.0Qlbv60zlGyemfz9O7iP1jyPVcm70YW', 1, 1),
(10, 'Aksal Romario', 'romariorobby@gmail.com', '$2y$10$97D7pElXM56UC9AakTKHX.iHWvFwPs.5eDYIAiBT5JqB/FLF8.QGK', 2, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_user_access_menu`
--

CREATE TABLE `db_user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `db_user_access_menu`
--

INSERT INTO `db_user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(2, 1, 1),
(3, 2, 1),
(11, 1, 7),
(12, 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_user_menu`
--

CREATE TABLE `db_user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `icon` varchar(123) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `db_user_menu`
--

INSERT INTO `db_user_menu` (`id`, `menu`, `icon`) VALUES
(1, 'Configuration', 'fas fa-fw fa-cog');

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_user_role`
--

CREATE TABLE `db_user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `db_user_role`
--

INSERT INTO `db_user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_user_submenu`
--

CREATE TABLE `db_user_submenu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `name_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `is_active` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `db_user_submenu`
--

INSERT INTO `db_user_submenu` (`id`, `menu_id`, `name_menu`, `url`, `is_active`) VALUES
(1, 1, 'Data User', 'admin/c_user', 1),
(2, 1, 'Data Menu', 'admin/c_menu', 1),
(3, 1, 'Data Submenu', 'admin/c_submenu', 1),
(4, 1, 'User Access', 'admin/c_user_access', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_user_token`
--

CREATE TABLE `db_user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `id_dosen` int(11) NOT NULL,
  `nama_dosen` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`id_dosen`, `nama_dosen`) VALUES
(1, 'Gea Aristi, S.T. M.Kom'),
(2, 'Yusuf Sumaryana, S.T. M.Kom'),
(3, 'Misi Hikmatyar, S.T. M.Kom'),
(4, 'Randi Rizal, S.T. M.Kom');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hari`
--

CREATE TABLE `hari` (
  `id_hari` int(11) NOT NULL,
  `nama_hari` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `hari`
--

INSERT INTO `hari` (`id_hari`, `nama_hari`) VALUES
(1, 'Senin'),
(2, 'Selasa'),
(3, 'Rabu'),
(4, 'Kamis'),
(5, 'Jumat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `hari_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `hari_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `jam_belajar`
--

CREATE TABLE `jam_belajar` (
  `id_jam_belajar` int(11) NOT NULL,
  `jam_belajar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `jam_belajar`
--

INSERT INTO `jam_belajar` (`id_jam_belajar`, `jam_belajar`) VALUES
(12, '07:00'),
(14, '08:50'),
(15, '10:50'),
(16, '13:50'),
(17, '00:40'),
(18, '11:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `nama_kelas` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `nama_kelas`) VALUES
(1, 'TI-A17'),
(2, 'TI-C18'),
(3, 'TI-B18'),
(4, 'TI-B17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(128) NOT NULL,
  `sks` int(11) NOT NULL,
  `dosen_id` int(11) NOT NULL,
  `kelas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `matkul`
--

INSERT INTO `matkul` (`id_matkul`, `nama_matkul`, `sks`, `dosen_id`, `kelas_id`) VALUES
(1, 'Manajemen Jaringan Komputer', 0, 0, 0),
(2, 'Metodologi Penelitian', 0, 0, 0),
(3, 'Tata Kelola Audit', 0, 0, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `id_ruang` int(11) NOT NULL,
  `nama_ruang` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ruang`
--

INSERT INTO `ruang` (`id_ruang`, `nama_ruang`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `db_user_access_menu`
--
ALTER TABLE `db_user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `db_user_menu`
--
ALTER TABLE `db_user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `db_user_role`
--
ALTER TABLE `db_user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `db_user_submenu`
--
ALTER TABLE `db_user_submenu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `db_user_token`
--
ALTER TABLE `db_user_token`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`id_dosen`);

--
-- Indeks untuk tabel `hari`
--
ALTER TABLE `hari`
  ADD PRIMARY KEY (`id_hari`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indeks untuk tabel `jam_belajar`
--
ALTER TABLE `jam_belajar`
  ADD PRIMARY KEY (`id_jam_belajar`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indeks untuk tabel `matkul`
--
ALTER TABLE `matkul`
  ADD PRIMARY KEY (`id_matkul`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`id_ruang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `db_user_access_menu`
--
ALTER TABLE `db_user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `db_user_menu`
--
ALTER TABLE `db_user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `db_user_role`
--
ALTER TABLE `db_user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `db_user_submenu`
--
ALTER TABLE `db_user_submenu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `db_user_token`
--
ALTER TABLE `db_user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `dosen`
--
ALTER TABLE `dosen`
  MODIFY `id_dosen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `hari`
--
ALTER TABLE `hari`
  MODIFY `id_hari` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `jam_belajar`
--
ALTER TABLE `jam_belajar`
  MODIFY `id_jam_belajar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `matkul`
--
ALTER TABLE `matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `ruang`
--
ALTER TABLE `ruang`
  MODIFY `id_ruang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Database: `templateadmin`
--
CREATE DATABASE IF NOT EXISTS `templateadmin` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `templateadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `biodata`
--

CREATE TABLE `biodata` (
  `id_biodata` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `no_hp` varchar(128) NOT NULL,
  `alamat` varchar(128) NOT NULL,
  `foto` varchar(128) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `biodata`
--

INSERT INTO `biodata` (`id_biodata`, `nama`, `no_hp`, `alamat`, `foto`, `id_user`) VALUES
(13, 'Ega Nuigraha', '08975568102', 'Pagerageung tengah rt02/rw05 desa pagerageung kecamatan pagerageung', 'af1eeb53-5285-4e36-a3ef-b59206d23c29.jpg', 1),
(14, 'Rizal Farid', '08975568102', 'Pagerageung tengah rt02/rw05 desa pagerageung kecamatan pagerageung', 'dsasa.jpg', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id_role`, `nama_role`) VALUES
(1, 'Super Admin'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_role` int(11) NOT NULL,
  `is_active` int(11) NOT NULL,
  `date_created` int(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `email`, `password`, `id_role`, `is_active`, `date_created`) VALUES
(1, 'eganugrahaid@gmail.com', '$2y$10$qiu0//Vcpqakbgc6EWZFNOqOX9BHZQFX6hpzFHjZbseLtNkpIVPxa', 1, 1, 0),
(3, 'nugrahaega261@gmail.com', '$2y$10$CFTdaCYZOqUgEIlpcGnZV.ioPWmcYhqOx6GQFwWiW2y1ueuA.SbY2', 1, 1, 1637635211);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id_access_menu` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id_access_menu`, `id_role`, `id_menu`) VALUES
(2, 1, 2),
(4, 1, 1),
(5, 1, 4),
(7, 2, 1),
(9, 2, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int(11) NOT NULL,
  `nama_menu` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`id_menu`, `nama_menu`, `url`, `icon`, `status`) VALUES
(1, 'Dashboard', 'admin/index', 'fas fa-fw fa-tachometer-alt', 0),
(2, 'Configuration', '', 'fa fa-fw fa-cogs', 1),
(4, 'Account Setting', '', 'fas fa-glass-cheers', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id_submenu` int(11) NOT NULL,
  `nama_submenu` varchar(128) NOT NULL,
  `url_submenu` varchar(128) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_submenu`
--

INSERT INTO `user_submenu` (`id_submenu`, `nama_submenu`, `url_submenu`, `id_menu`) VALUES
(1, 'Menu', 'admin/menu', 2),
(2, 'Submenu', 'admin/submenu', 2),
(4, 'User Access', 'admin/user_access', 2),
(5, 'Profile', 'account/index', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_token`
--

CREATE TABLE `user_token` (
  `id_token` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` int(11) NOT NULL,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_token`
--

INSERT INTO `user_token` (`id_token`, `email`, `token`, `date_created`) VALUES
(3, 'eganugrahaid@gmail.com', 22, 1637637381);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `biodata`
--
ALTER TABLE `biodata`
  ADD PRIMARY KEY (`id_biodata`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id_access_menu`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id_submenu`);

--
-- Indeks untuk tabel `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id_token`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `biodata`
--
ALTER TABLE `biodata`
  MODIFY `id_biodata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id_access_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `wedding`
--
CREATE DATABASE IF NOT EXISTS `wedding` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `wedding`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
