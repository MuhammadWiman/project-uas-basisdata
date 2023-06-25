-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 25, 2023 at 04:58 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_22421074_muhammadwiman_tiketpesawat`
--

-- --------------------------------------------------------

--
-- Table structure for table `kota_uas_muhammadwiman`
--

CREATE TABLE `kota_uas_muhammadwiman` (
  `id` int(3) NOT NULL,
  `kode_kota` varchar(20) NOT NULL,
  `nama_kota` varchar(25) NOT NULL,
  `bandara` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kota_uas_muhammadwiman`
--

INSERT INTO `kota_uas_muhammadwiman` (`id`, `kode_kota`, `nama_kota`, `bandara`) VALUES
(1, 'JKT', 'jakarta', 'Sokarno-Hatta'),
(2, 'MJK', 'Majalengka', 'kertajati'),
(3, 'BDG', 'Bandung', 'Husein');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_uas_muhammadwiman`
--

CREATE TABLE `pelanggan_uas_muhammadwiman` (
  `no_ktp` varchar(15) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan_uas_muhammadwiman`
--

INSERT INTO `pelanggan_uas_muhammadwiman` (`no_ktp`, `nama`, `alamat`, `no_telp`, `jenis_kelamin`) VALUES
('123123', 'wiman', 'ciptamas', '08232099327', 'Laki-laki'),
('123124', 'suep', 'cimahi', '08232099530', 'Laki-laki');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan_uas_muhammadwiman`
--

CREATE TABLE `pemesanan_uas_muhammadwiman` (
  `no_penerbangan` varchar(15) NOT NULL,
  `no_ktp` varchar(15) NOT NULL,
  `maskapai` varchar(11) NOT NULL,
  `kelas` enum('Ekonomi','Eksekutif','Premium') NOT NULL,
  `kota_asal` varchar(20) NOT NULL,
  `kota_tujuan` varchar(20) NOT NULL,
  `tanggal_keberangkatan` date NOT NULL,
  `pukul` time NOT NULL,
  `harga_tiket` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pemesanan_uas_muhammadwiman`
--

INSERT INTO `pemesanan_uas_muhammadwiman` (`no_penerbangan`, `no_ktp`, `maskapai`, `kelas`, `kota_asal`, `kota_tujuan`, `tanggal_keberangkatan`, `pukul`, `harga_tiket`) VALUES
('123', '123123', 'GD', 'Premium', 'JKT', 'MJK', '2023-06-10', '16:00:00', '1500000');

-- --------------------------------------------------------

--
-- Table structure for table `pesawat_uas_muhammadwiman`
--

CREATE TABLE `pesawat_uas_muhammadwiman` (
  `id` int(3) NOT NULL,
  `kode_maskapai` varchar(11) NOT NULL,
  `nama_maskapai` varchar(25) NOT NULL,
  `nama_pesawat` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesawat_uas_muhammadwiman`
--

INSERT INTO `pesawat_uas_muhammadwiman` (`id`, `kode_maskapai`, `nama_maskapai`, `nama_pesawat`) VALUES
(1, 'AS', 'Air Asia', 'Boing-999'),
(2, 'GD', 'Garuda', 'SZ001');

-- --------------------------------------------------------

--
-- Table structure for table `tiket_uas_muhammadwiman`
--

CREATE TABLE `tiket_uas_muhammadwiman` (
  `no_tiket` varchar(12) NOT NULL,
  `no_ktp` varchar(15) NOT NULL,
  `no_transaksi` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_uas_muhammadwiman`
--

CREATE TABLE `transaksi_uas_muhammadwiman` (
  `id_transaksi` varchar(15) NOT NULL,
  `nama_nasabah` varchar(25) NOT NULL,
  `no_rekening` varchar(12) NOT NULL,
  `no_penerbangan` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kota_uas_muhammadwiman`
--
ALTER TABLE `kota_uas_muhammadwiman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_kota` (`kode_kota`);

--
-- Indexes for table `pelanggan_uas_muhammadwiman`
--
ALTER TABLE `pelanggan_uas_muhammadwiman`
  ADD PRIMARY KEY (`no_ktp`);

--
-- Indexes for table `pemesanan_uas_muhammadwiman`
--
ALTER TABLE `pemesanan_uas_muhammadwiman`
  ADD PRIMARY KEY (`no_penerbangan`),
  ADD KEY `maskapai` (`maskapai`),
  ADD KEY `kota_asal` (`kota_asal`),
  ADD KEY `kota_tujuan` (`kota_tujuan`),
  ADD KEY `no_ktp` (`no_ktp`);

--
-- Indexes for table `pesawat_uas_muhammadwiman`
--
ALTER TABLE `pesawat_uas_muhammadwiman`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_maskapai` (`kode_maskapai`);

--
-- Indexes for table `tiket_uas_muhammadwiman`
--
ALTER TABLE `tiket_uas_muhammadwiman`
  ADD PRIMARY KEY (`no_tiket`),
  ADD KEY `no_ktp` (`no_ktp`),
  ADD KEY `no_transaksi` (`no_transaksi`);

--
-- Indexes for table `transaksi_uas_muhammadwiman`
--
ALTER TABLE `transaksi_uas_muhammadwiman`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `no_penerbangan` (`no_penerbangan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kota_uas_muhammadwiman`
--
ALTER TABLE `kota_uas_muhammadwiman`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesawat_uas_muhammadwiman`
--
ALTER TABLE `pesawat_uas_muhammadwiman`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemesanan_uas_muhammadwiman`
--
ALTER TABLE `pemesanan_uas_muhammadwiman`
  ADD CONSTRAINT `pemesanan_uas_muhammadwiman_ibfk_2` FOREIGN KEY (`kota_asal`) REFERENCES `kota_uas_muhammadwiman` (`kode_kota`),
  ADD CONSTRAINT `pemesanan_uas_muhammadwiman_ibfk_3` FOREIGN KEY (`kota_tujuan`) REFERENCES `kota_uas_muhammadwiman` (`kode_kota`),
  ADD CONSTRAINT `pemesanan_uas_muhammadwiman_ibfk_4` FOREIGN KEY (`maskapai`) REFERENCES `pesawat_uas_muhammadwiman` (`kode_maskapai`),
  ADD CONSTRAINT `pemesanan_uas_muhammadwiman_ibfk_5` FOREIGN KEY (`no_ktp`) REFERENCES `pelanggan_uas_muhammadwiman` (`no_ktp`);

--
-- Constraints for table `tiket_uas_muhammadwiman`
--
ALTER TABLE `tiket_uas_muhammadwiman`
  ADD CONSTRAINT `tiket_uas_muhammadwiman_ibfk_2` FOREIGN KEY (`no_transaksi`) REFERENCES `transaksi_uas_muhammadwiman` (`id_transaksi`),
  ADD CONSTRAINT `tiket_uas_muhammadwiman_ibfk_3` FOREIGN KEY (`no_ktp`) REFERENCES `pelanggan_uas_muhammadwiman` (`no_ktp`);

--
-- Constraints for table `transaksi_uas_muhammadwiman`
--
ALTER TABLE `transaksi_uas_muhammadwiman`
  ADD CONSTRAINT `transaksi_uas_muhammadwiman_ibfk_1` FOREIGN KEY (`no_penerbangan`) REFERENCES `pemesanan_uas_muhammadwiman` (`no_penerbangan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
