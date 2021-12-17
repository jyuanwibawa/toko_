-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Des 2021 pada 13.42
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_sembako`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nama_barang` varchar(200) CHARACTER SET latin1 NOT NULL,
  `id_kategori` varchar(20) CHARACTER SET latin1 NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `deskripsi` varchar(1500) CHARACTER SET latin1 NOT NULL,
  `gambar` varchar(200) CHARACTER SET latin1 NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_kategori`, `stok`, `harga`, `deskripsi`, `gambar`, `deleted`) VALUES
('BU-1', 'Tahu Goreng', 'K-1', 10, 180000, 'Bergizi', 'tau.jpg', 0),
('BU-2', 'Fanta', 'K-3', 8, 12000, 'Minuman bersoda', 'fanta.jpg', 0),
('BU-3', 'Putri Salju', 'K-1', 2, 120000, 'errr', 'salju.jpg', 0),
('BU-4', 'TOPI KOKI', 'K-1', 5, 150000, 'enak', 'topi.jpg', 0),
('BU-5', 'Lays', 'K-2', 100, 5000, 'Rasa Rumput Laut', 'lays.jpg', 0),
('BU-6', 'Chitatos', 'K-2', 50, 6000, 'Rasa BBQ', 'chitatos.jpg', 0),
('BU-7', 'Indomie Goreng', 'K-4', 100, 2500, 'Varian Original', 'indomie 1.jpg', 0),
('BU-8', 'Sprite', 'K-3', 100, 8000, 'Minuman Bersoda', 'sprite.jpg', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nama_kategori` varchar(50) CHARACTER SET latin1 NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `deleted`) VALUES
('K-1', 'Beras', 0),
('K-2', 'Snack', 0),
('K-3', 'Minuman', 0),
('K-4', 'Makanan', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` varchar(20) CHARACTER SET latin1 NOT NULL,
  `nama_pembeli` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email_pembeli` varchar(100) CHARACTER SET latin1 NOT NULL,
  `telp_pembeli` varchar(20) CHARACTER SET latin1 NOT NULL,
  `deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `nama_pembeli`, `email_pembeli`, `telp_pembeli`, `deleted`) VALUES
('CUS-1', 'Yuana', 'yuana@gmail.com', '1234', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `id_pembeli` varchar(20) NOT NULL,
  `id_barang` varchar(50) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_pembeli`, `id_barang`, `tgl_transaksi`, `jumlah`, `total`) VALUES
('TR-1', 'CUS-5', 'BU-1', '2021-12-08 22:59:29', 2, 86000),
('TR-2', 'CUS-5', 'BU-2', '2021-12-08 23:01:36', 1, 50000),
('TR-3', 'CUS-5', 'BU-1', '2021-12-08 23:02:45', 1, 43000),
('TR-4', 'CUS-8', 'BU-1', '2021-12-17 17:18:39', 1, 180000),
('TR-5', 'CUS-1', 'BU-1', '2021-12-17 17:45:52', 1, 180000),
('TR-6', 'CUS-1', 'BU-2', '2021-12-17 17:45:52', 1, 12000),
('TR-7', 'CUS-2', 'BU-1', '2021-12-17 17:56:14', 1, 180000),
('TR-8', 'CUS-2', '', '2021-12-17 20:14:46', 1, 0),
('TR-9', 'CUS-2', '', '2021-12-17 20:17:11', 2, 0),
('TR-10', 'CUS-2', '', '2021-12-17 20:39:59', 1, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(50) CHARACTER SET latin1 NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tipe_user` enum('Pembeli','Admin') CHARACTER SET latin1 NOT NULL,
  `id_pembeli` varchar(20) CHARACTER SET latin1 NOT NULL,
  `deleted` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `password`, `tipe_user`, `id_pembeli`, `deleted`) VALUES
('admin', 'Admin', 'Admin', '', 0),
('tegar', '123', 'Pembeli', 'CUS-5', 1),
('jati', '123', 'Pembeli', 'CUS-6', 1),
('yuan', 'abcd', 'Pembeli', 'CUS-8', 1),
('marta', 'asd', 'Pembeli', 'CUS-1', 1),
('Yuana', 'zxc', 'Pembeli', 'CUS-1', 1),
('jatiwibawa', '3333', 'Pembeli', 'CUS-1', 1),
('jatimarta', 'qet', 'Pembeli', 'CUS-2', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD KEY `id_pembeli` (`id_pembeli`,`id_barang`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD KEY `id_pembeli` (`id_pembeli`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
