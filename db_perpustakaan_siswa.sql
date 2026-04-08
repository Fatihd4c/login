-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Apr 2026 pada 04.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpustakaan_siswa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nis`, `nama`, `kelas`, `alamat`) VALUES
(1, '2023001', 'Ahmad Fauzan', 'XI RPL 1', 'Jl. Merpati No.12, Yogyakarta'),
(2, '2023002', 'Budi Santoso', 'XI RPL 2', 'Jl. Kenanga No.5, Sleman'),
(3, '2023003', 'Citra Dewi', 'XI RPL 1', 'Jl. Anggrek No.8, Bantul'),
(4, '2023004', 'Dian Permatasari', 'XII RPL 1', 'Jl. Mawar No.15, Yogyakarta'),
(5, '2023005', 'Eka Prasetya', 'X RPL 2', 'Jl. Melati No.22, Gunungkidul'),
(6, '2023006', 'Fajar Nugroho', 'XI RPL 3', 'Jl. Flamboyan No.7, Sleman'),
(7, '2023007', 'Gita Lestari', 'XII RPL 2', 'Jl. Kamboja No.3, Bantul'),
(8, '2023008', 'Hendra Wijaya', 'X RPL 1', 'Jl. Sakura No.10, Yogyakarta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) NOT NULL,
  `penulis` varchar(100) NOT NULL,
  `penerbit` varchar(100) DEFAULT NULL,
  `tahun` int(4) DEFAULT NULL,
  `stok` int(5) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `penerbit`, `tahun`, `stok`) VALUES
(1, 'Pemrograman Web dengan PHP & MySQL', 'Abdul Kadir', 'Elex Media Komputindo', 2021, 6),
(2, 'Belajar JavaScript untuk Pemula', 'Yuhefizar', 'Informatika', 2020, 3),
(3, 'Basis Data: Konsep dan Implementasi', 'Rosa A.S.', 'Modula', 2019, 4),
(4, 'Algoritma dan Pemrograman', 'Rinaldi Munir', 'Informatika', 2022, 2),
(5, 'Rekayasa Perangkat Lunak', 'Ian Sommerville', 'Pearson', 2018, 3),
(6, 'Pemrograman Python', 'John Doe', 'O Reilly', 2021, 6),
(7, 'Struktur Data menggunakan Java', 'Thomas H. Cormen', 'MIT Press', 2020, 2),
(8, 'Desain Web Responsif', 'Erik Kurniawan', 'Andi Offset', 2022, 4),
(9, 'Pengantar Teknologi Informasi', 'Jogiyanto', 'Andi Offset', 2019, 5),
(10, 'Framework Laravel untuk Pemula', 'Sandhika Galih', 'UNPAS Press', 2023, 2),
(11, 'Hujan', 'Tere Liye', 'Sabak Grip Nusantara', 2016, 10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `status` enum('Dipinjam','Dikembalikan') DEFAULT 'Dipinjam'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `peminjaman`
--

INSERT INTO `peminjaman` (`id_peminjaman`, `id_buku`, `id_anggota`, `tgl_pinjam`, `tgl_kembali`, `status`) VALUES
(1, 1, 1, '2026-04-08', '2026-04-08', 'Dikembalikan'),
(2, 1, 1, '2026-04-08', '2026-04-08', 'Dikembalikan'),
(3, 10, 2, '2026-04-08', '2026-04-15', 'Dipinjam');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`),
  ADD UNIQUE KEY `nis` (`nis`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_buku` (`id_buku`),
  ADD KEY `id_anggota` (`id_anggota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`) ON DELETE CASCADE,
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
