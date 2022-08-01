-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jun 2021 pada 02.50
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
-- Database: `pembayaran_spp`
--

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
