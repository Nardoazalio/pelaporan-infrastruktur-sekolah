-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2022 at 03:23 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `web_uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrasi`
--

CREATE TABLE `administrasi` (
  `id` int(11) NOT NULL,
  `userId` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `data` varchar(100) NOT NULL,
  `tanggal` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `aturan_layanan`
--

CREATE TABLE `aturan_layanan` (
  `id` int(10) NOT NULL,
  `id_layanan` int(11) NOT NULL,
  `aturan` longtext NOT NULL,
  `template_data` varchar(500) CHARACTER SET latin1 NOT NULL,
  `petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aturan_layanan`
--

INSERT INTO `aturan_layanan` (`id`, `id_layanan`, `aturan`, `template_data`, `petugas`) VALUES
(18, 13, 'Berdasarkan aturan pelaporan yang dibuat bahwa laporan yang akan di laporkan, Maksimal setidaknya melaporkan sesuai dengan keadaan yanng seharunya terjadi.', '3d animasi apresiasimu.pdf', 'Nardo Azalio Bangri'),
(19, 14, 'Berdasarkan aturan pelaporan yang dibuat bahwa laporan yang akan di laporkan, Maksimal setidaknya melaporkan sesuai dengan keadaan yanng seharunya terjadi', '3d animasi apresiasimu.pdf', 'Nardo Azalio Bangri'),
(20, 15, 'Berdasarkan aturan pelaporan yang dibuat bahwa laporan yang akan di laporkan, Maksimal setidaknya melaporkan sesuai dengan keadaan yanng seharunya terjadi', '3d animasi apresiasimu.pdf', 'Nardo Azalio Bangri'),
(21, 17, 'Berdasarkan aturan pelaporan yang dibuat bahwa laporan yang akan di laporkan, Maksimal setidaknya melaporkan sesuai dengan keadaan yanng seharunya terjadi', '3d animasi apresiasimu.pdf', 'Nardo Azalio Bangri'),
(22, 18, 'Berdasarkan aturan pelaporan yang dibuat bahwa laporan yang akan di laporkan, Maksimal setidaknya melaporkan sesuai dengan keadaan yanng seharunya terjadi', '3d animasi apresiasimu.pdf', 'Nardo Azalio Bangri');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `tanggapan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `userId`, `tanggapan`) VALUES
(1, 'administrator001', 'ini adalah tanggapan dariku');

-- --------------------------------------------------------

--
-- Table structure for table `hasil_administrasi`
--

CREATE TABLE `hasil_administrasi` (
  `id` int(11) NOT NULL,
  `administrasiId` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `file` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tanggal` date NOT NULL,
  `petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hasil_pengaduan`
--

CREATE TABLE `hasil_pengaduan` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `pengaduanId` int(11) NOT NULL,
  `deskripsi` text NOT NULL,
  `file` varchar(255) CHARACTER SET latin1 NOT NULL,
  `tanggal` date NOT NULL,
  `petugas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kepengurusan`
--

CREATE TABLE `kepengurusan` (
  `id` int(11) NOT NULL,
  `nip` varchar(18) NOT NULL,
  `foto` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kepengurusan`
--

INSERT INTO `kepengurusan` (`id`, `nip`, `foto`, `nama`, `jabatan`) VALUES
(1, '356418279057438920', '694-Lyodra.jpg', 'Vina Windya Sari', 'Pengolah Data Pengaduan'),
(2, '356418279057438928', '530-download (3).jpg', 'Annisa', 'Pengolah Data Administrasi'),
(3, '356418279057438927', '896-20202205082_1641964444.jpg', 'Nardo Azalio Bangri', 'Pengolah Data Pelayanan');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id` int(10) NOT NULL,
  `jenis` enum('Pengaduan','Administrasi') NOT NULL,
  `spesifikasi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id`, `jenis`, `spesifikasi`) VALUES
(13, 'Pengaduan', 'Pengaduan Kursi disekolah'),
(14, 'Administrasi', 'Pengadaan Bantuan dana'),
(15, 'Pengaduan', 'Pengaduan Bangunan Sekolah'),
(16, 'Pengaduan', 'Pengaduan Kursi disekolah'),
(17, 'Pengaduan', 'Pengaduan Kelengkapan Kelas'),
(18, 'Pengaduan', 'Pengaduan Keadaan Lapangan Sekolah'),
(19, 'Pengaduan', 'Pengaduan Perpustakaan'),
(20, 'Pengaduan', 'Pengaduan Koperasi Sekolah');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` int(10) NOT NULL,
  `userId` varchar(16) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `data` varchar(255) NOT NULL DEFAULT '-',
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `userId`, `nama`, `jenis`, `deskripsi`, `data`, `tanggal`) VALUES
(295, 'vina', 'vina', 'Pengaduan Kursi disekolah', 'keadaan kursi disekolah sudah lumayan rusak.', '3d animasi apresiasimu.pdf', '2022-12-19 16:35:39'),
(296, 'lina', 'marlina', 'Pengaduan Perpustakaan', 'Perpustakaan yang ada disekol.ah kami tidak bagus dan belum memadai', '415249a9-3a21-42d4-b304-b6b9689a4dee.pdf', '2022-12-19 16:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `userId` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis` enum('Pengaduan','Administrasi') NOT NULL,
  `request` varchar(100) NOT NULL,
  `alasan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `userId`, `nama`, `jenis`, `request`, `alasan`) VALUES
(2, 'administrator001', 'Administrator1', 'Pengaduan', 'Pengaduan Sembako mahal', 'sembako makin mahal, sedangkan pendapatan saya tetap'),
(3, 'warga1', 'Warga sini', 'Administrasi', 'cek', 'yaya');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(15) NOT NULL,
  `level` enum('admin','petugas','warga') NOT NULL,
  `nip` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `nama`, `email`, `alamat`, `tlp`, `level`, `nip`) VALUES
('3561234567894560', 'c73f227db1b523334ea3aef35bf06af8', 'Faris Yahya', 'faris@gmail.com', 'Perum Citra Land B-2 ', '089765893443', 'warga', ''),
('54321', '0192023a7bbd73250516f069df18b500', 'Administrator1', 'admin1@gmail.com', 'disini', '087675144322', 'admin', ''),
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Nardo Azalio Bangri', 'nardoazalio8@member.maribelajar.org', 'ASAS', '098868823823', 'petugas', '356418279057438921'),
('administrator001', '0192023a7bbd73250516f069df18b500', 'Administrator1', 'admin1@gmail.com', 'disini', '-', 'admin', ''),
('adminn', '9c1ad00a16a7c67e2727b471ac969e96', 'g', 'ari.sumardi@gmail.com', 'jj', '000000', 'admin', ''),
('lina', 'f6f4deb7dad1c2e5e0b4d6569dc3c1c5', 'marlina', 'lina@gmail.com', 'SULUT', '089876765459', 'warga', ''),
('nardoazlio', '21232f297a57a5a743894a0e4a801fc3', 'Nardo Azalio Bangri', 'nardoazalio8@gmail.com', 'asas', '98493', 'warga', ''),
('petugas1', '570c396b3fc856eceb8aa7357f32af1a', 'Siti Aminah', 'sitiaminah@gmail.com', 'Jalan Nuri no. 9', '087678987678', 'petugas', '356418279057438920'),
('petugas2', '6fb35e77d7c816fd0ee7c305e77a1156', 'Yayan', 'yayan@gmail.com', 'Disini', '0123', 'petugas', '123456789098765432'),
('vina', 'e7bb4f7ed097bd6ccefc46018fda32c8', 'vina', 'vina@gmail.com', 'SUMUT', '089876765456', 'warga', ''),
('warga1', '8bee83f98002668cb8f55ba3ba2a6d3b', 'Warga sini', 'warga@gmail.con', 'disini', '0123', 'warga', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `aturan_layanan`
--
ALTER TABLE `aturan_layanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_layanan` (`id_layanan`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `hasil_administrasi`
--
ALTER TABLE `hasil_administrasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `administrasiId` (`administrasiId`);

--
-- Indexes for table `hasil_pengaduan`
--
ALTER TABLE `hasil_pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengaduanId` (`pengaduanId`);

--
-- Indexes for table `kepengurusan`
--
ALTER TABLE `kepengurusan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrasi`
--
ALTER TABLE `administrasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `aturan_layanan`
--
ALTER TABLE `aturan_layanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hasil_administrasi`
--
ALTER TABLE `hasil_administrasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hasil_pengaduan`
--
ALTER TABLE `hasil_pengaduan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrasi`
--
ALTER TABLE `administrasi`
  ADD CONSTRAINT `administrasi_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`username`);

--
-- Constraints for table `aturan_layanan`
--
ALTER TABLE `aturan_layanan`
  ADD CONSTRAINT `aturan_layanan_ibfk_1` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`username`);

--
-- Constraints for table `hasil_administrasi`
--
ALTER TABLE `hasil_administrasi`
  ADD CONSTRAINT `hasil_administrasi_ibfk_1` FOREIGN KEY (`administrasiId`) REFERENCES `administrasi` (`id`);

--
-- Constraints for table `hasil_pengaduan`
--
ALTER TABLE `hasil_pengaduan`
  ADD CONSTRAINT `hasil_pengaduan_ibfk_1` FOREIGN KEY (`pengaduanId`) REFERENCES `pengaduan` (`id`);

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`username`);

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
