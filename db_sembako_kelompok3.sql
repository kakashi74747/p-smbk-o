-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2025 at 08:44 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sembako_kelompok3`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_penjualan`
--

CREATE TABLE `detail_penjualan` (
  `id_detail` int(11) NOT NULL,
  `id_penjualan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_penjualan`
--

INSERT INTO `detail_penjualan` (`id_detail`, `id_penjualan`, `id_produk`, `jumlah`, `subtotal`) VALUES
(1, 1, 2, 6, 24000.00),
(2, 2, 2, 1, 4000.00),
(3, 3, 2, 3, 12000.00),
(4, 4, 2, 2, 8000.00),
(7, 7, 2, 1, 4000.00),
(8, 8, 3, 1, 8500.00),
(9, 8, 5, 1, 3500.00),
(10, 8, 4, 1, 6500.00),
(11, 8, 2, 1, 4000.00),
(12, 9, 4, 1, 6500.00),
(13, 10, 3, 1, 8500.00),
(14, 11, 5, 1, 3500.00),
(15, 12, 3, 1, 8500.00),
(16, 13, 4, 2, 13000.00),
(17, 13, 5, 1, 3500.00),
(18, 13, 2, 1, 4000.00),
(19, 13, 3, 1, 8500.00),
(20, 14, 8, 1, 3700.00),
(21, 14, 9, 1, 7500.00),
(22, 14, 11, 1, 6000.00),
(23, 14, 7, 1, 3500.00);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `total_utang` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `telepon`, `alamat`, `total_utang`) VALUES
(1, 'MaaMaattue', '0758283742932', 'Jalan Surga', 10700.00);

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'kasir', 'kasir123', 'Kasir Sembako');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `tipe_pembayaran` varchar(20) NOT NULL DEFAULT 'Lunas',
  `waktu_transaksi` datetime NOT NULL DEFAULT current_timestamp(),
  `total_harga` decimal(10,2) NOT NULL,
  `uang_bayar` decimal(10,2) NOT NULL,
  `uang_kembali` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_pelanggan`, `tipe_pembayaran`, `waktu_transaksi`, `total_harga`, `uang_bayar`, `uang_kembali`) VALUES
(1, NULL, 'Lunas', '2025-07-30 14:21:13', 24000.00, 30000.00, 6000.00),
(2, NULL, 'Lunas', '2025-07-30 14:22:45', 4000.00, 5000.00, 1000.00),
(3, NULL, 'Lunas', '2025-07-30 14:36:31', 12000.00, 15000.00, 3000.00),
(4, NULL, 'Lunas', '2025-07-16 14:42:00', 8000.00, 9000.00, 0.00),
(7, NULL, 'Lunas', '2025-07-30 10:45:53', 4000.00, 9000.00, 0.00),
(8, NULL, 'Lunas', '2025-07-30 11:56:58', 22500.00, 23000.00, 0.00),
(9, NULL, 'Lunas', '2025-07-30 12:01:40', 6500.00, 7000.00, 0.00),
(10, NULL, 'Lunas', '2025-07-30 12:54:59', 8500.00, 9000.00, 0.00),
(11, NULL, 'Lunas', '2025-07-30 12:55:36', 3500.00, 10000.00, 0.00),
(12, NULL, 'Lunas', '2025-07-30 12:59:33', 8500.00, 100000.00, 0.00),
(13, NULL, 'Lunas', '2025-07-30 12:59:42', 29000.00, 100000.00, 0.00),
(14, 1, 'Utang', '2025-07-31 12:16:00', 20700.00, 0.00, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text DEFAULT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_beli` decimal(10,2) NOT NULL,
  `harga_jual` decimal(10,2) NOT NULL,
  `stok` int(11) NOT NULL,
  `foto_produk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `satuan`, `harga_beli`, `harga_jual`, `stok`, `foto_produk`) VALUES
(2, 'Mie Sarimi', 'Mi instan Indonesia, rasa sedap, harga hemat.', 'Pcs', 3500.00, 4000.00, 33, '6889e355129fd.png'),
(3, 'Bimoli', 'Minyak goreng sawit, jernih, dan renyah.', 'Liter', 7000.00, 8500.00, 53, '688a08cf761e7.png'),
(4, 'Gula', 'Pemanis utama, pemberi rasa manis masakan.', 'Kg', 5000.00, 6500.00, 36, '6889e3a950e80.jpg'),
(5, 'Garam', 'Bumbu dapur esensial, pemberi rasa asin.', 'Pcs', 2000.00, 3500.00, 39, '6889e3e51f380.jpg'),
(7, 'Mie Sedap', 'Mi instan kenyal dengan kriuk renyah.', 'Pcs', 3000.00, 3500.00, 9, '688a0b76cd108.jpg'),
(8, 'Mie Indomie', 'Mi instan favorit Indonesia, seleraku sekali.', 'Pcs', 3200.00, 3700.00, 9, '688a0ba047956.png'),
(9, 'Kopi Kapal Api', 'Kopi bubuk hitam, bangkitkan semangat pagi.', 'Pcs', 7000.00, 7500.00, 9, '688a0c0135ec0.jpg'),
(10, 'Teh Sariwangi', 'Teh celup asli, hangatkan suasana keluarga.', 'Pcs', 4000.00, 4500.00, 10, '688a0c2506370.jpg'),
(11, 'Kecap Bangau', 'Pemanis gurih, bumbu utama masakan Indonesia.', 'Pcs', 5000.00, 6000.00, 9, '688a0c55ad4b8.jpg'),
(12, 'Caos Sedaap', 'Pelengkap makan, cocolan rasa pedas manis.', 'Pcs', 6000.00, 7000.00, 10, '688a0c8576c26.jpg'),
(13, 'Tepung Jempol', 'Bahan utama kue, roti, dan gorengan.', 'Pcs', 2500.00, 3000.00, 10, '688a0cb88368f.jpg'),
(14, 'Beras Opung', 'Makanan pokok bangsa, sumber energi utama.', 'Kg', 17000.00, 19000.00, 10, '688a0ce844666.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_utang`
--

CREATE TABLE `riwayat_utang` (
  `id_utang` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_penjualan` int(11) DEFAULT NULL,
  `jumlah` decimal(10,2) NOT NULL,
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `riwayat_utang`
--

INSERT INTO `riwayat_utang` (`id_utang`, `id_pelanggan`, `id_penjualan`, `jumlah`, `tanggal`, `keterangan`) VALUES
(1, 1, 14, 20700.00, '2025-07-31 12:16:19', 'Utang dari transaksi NOTA-14'),
(2, 1, NULL, -10000.00, '2025-07-31 12:21:16', 'Tunai dong');

-- --------------------------------------------------------

--
-- Table structure for table `stok_masuk`
--

CREATE TABLE `stok_masuk` (
  `id_masuk` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_supplier` int(11) DEFAULT NULL,
  `jumlah_masuk` int(11) NOT NULL,
  `tanggal_masuk` datetime NOT NULL,
  `keterangan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stok_masuk`
--

INSERT INTO `stok_masuk` (`id_masuk`, `id_produk`, `id_supplier`, `jumlah_masuk`, `tanggal_masuk`, `keterangan`) VALUES
(1, 5, NULL, 2, '2025-07-11 16:38:00', 'Dari supplaier B'),
(2, 3, NULL, 2, '2025-07-24 19:39:00', 'Supplier A'),
(3, 3, NULL, 30, '2025-07-03 16:45:00', 'S. Pak Jokowi');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(100) NOT NULL,
  `telepon_supplier` varchar(20) DEFAULT NULL,
  `alamat_supplier` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD PRIMARY KEY (`id_detail`),
  ADD KEY `id_penjualan` (`id_penjualan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `riwayat_utang`
--
ALTER TABLE `riwayat_utang`
  ADD PRIMARY KEY (`id_utang`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD PRIMARY KEY (`id_masuk`),
  ADD KEY `id_produk` (`id_produk`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  MODIFY `id_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `riwayat_utang`
--
ALTER TABLE `riwayat_utang`
  MODIFY `id_utang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_penjualan`
--
ALTER TABLE `detail_penjualan`
  ADD CONSTRAINT `detail_penjualan_ibfk_1` FOREIGN KEY (`id_penjualan`) REFERENCES `penjualan` (`id_penjualan`),
  ADD CONSTRAINT `detail_penjualan_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE SET NULL;

--
-- Constraints for table `riwayat_utang`
--
ALTER TABLE `riwayat_utang`
  ADD CONSTRAINT `riwayat_utang_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE;

--
-- Constraints for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD CONSTRAINT `stok_masuk_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stok_masuk_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
