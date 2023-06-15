-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 02:20 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bycafe`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `id` int(11) NOT NULL,
  `id_shift` int(11) NOT NULL,
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jam_masuk` varchar(100) CHARACTER SET latin1 NOT NULL,
  `jam_istirahat_keluar` varchar(100) CHARACTER SET latin1 NOT NULL,
  `jam_istirahat_masuk` varchar(255) CHARACTER SET latin1 NOT NULL,
  `jam_pulang` varchar(100) CHARACTER SET latin1 NOT NULL,
  `tanggal` varchar(100) CHARACTER SET latin1 NOT NULL,
  `bulan` varchar(100) CHARACTER SET latin1 NOT NULL,
  `tahun` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(15) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `bahan`
--

CREATE TABLE `bahan` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `satuan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_jenis_barang` varchar(255) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `harga_jual` decimal(10,0) DEFAULT NULL,
  `harga_awal` varchar(255) DEFAULT NULL,
  `laba` varchar(255) DEFAULT NULL,
  `foto_barang` varchar(255) DEFAULT NULL,
  `status_produksi` int(15) NOT NULL,
  `nama_jenis_barang` varchar(255) DEFAULT NULL,
  `stok` int(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `id_user`, `id_jenis_barang`, `nama_barang`, `tanggal`, `harga_jual`, `harga_awal`, `laba`, `foto_barang`, `status_produksi`, `nama_jenis_barang`, `stok`) VALUES
(11, 2, '12', 'Roti maryam original ', '05-12-2022', '8000', '8000', '0', '', 0, 'ROTI MARYAM', 67),
(12, 2, '12', 'Roti maryam chocolat', '06-12-2022', '11000', '11000', '0', '', 0, 'ROTI MARYAM', 79),
(13, 2, '12', 'Roti maryam keju', '06-12-2022', '12000', '12000', '0', '', 0, 'ROTI MARYAM', 86),
(14, 2, '12', 'Roti maryam chocolat keju', '06-12-2022', '16000', '16000', '0', '', 0, 'ROTI MARYAM', 93),
(15, 2, '13', 'Roti bakar cokelat+keju', '06-12-2022', '13000', '13000', '0', '', 0, 'ROTI BAKAR', 85),
(16, 2, '13', 'Roti bakar cokelat+kacang', '06-12-2022', '15000', '15000', '0', '', 0, 'ROTI BAKAR', 92),
(17, 2, '14', 'Kentang', '06-12-2022', '10000', '10000', '0', '', 0, 'KENTANG GORENG', 24),
(18, 2, '15', 'Jamur crispy', '06-12-2022', '12000', '12000', '0', '', 0, 'JAMUR CRISPY', 100),
(19, 2, '16', 'Tahu crispy', '06-12-2022', '12000', '12000', '0', '', 0, 'ANEKA TAHU DAN TEMPE', 83),
(20, 2, '16', 'Tahu walik', '06-12-2022', '15000', '15000', '0', '', 0, 'ANEKA TAHU DAN TEMPE', 53),
(21, 2, '16', 'Tahu cabe garam', '06-12-2022', '15000', '15000', '0', '', 0, 'ANEKA TAHU DAN TEMPE', 92),
(22, 2, '16', 'Tahu asin', '06-12-2022', '12000', '12000', '0', '', 0, 'ANEKA TAHU DAN TEMPE', 100),
(23, 2, '16', 'Tempe mendoan', '06-12-2022', '12000', '12000', '0', '', 0, 'ANEKA TAHU DAN TEMPE', 0),
(24, 2, '17', 'Seblak komplit', '06-12-2022', '20000', '20000', '0', '', 0, 'ANEKA SEBLAK', 92),
(25, 2, '17', 'Seblak seafood', '06-12-2022', '15000', '15000', '0', '', 0, 'ANEKA SEBLAK', 83),
(26, 2, '17', 'Seblak tulang', '06-12-2022', '12000', '12000', '0', '', 0, 'ANEKA SEBLAK', 97),
(27, 2, '17', 'Seblak mie', '06-12-2022', '12000', '12000', '0', '', 0, 'ANEKA SEBLAK', 91),
(28, 2, '18', 'Sayap judes', '06-12-2022', '18000', '18000', '0', '', 0, 'ANEKA JUDES', 99),
(29, 2, '18', 'Kepala judes', '06-12-2022', '13000', '13000', '0', '', 0, 'ANEKA JUDES', 98),
(30, 2, '18', 'Ceker judes', '06-12-2022', '13000', '13000', '0', '', 0, 'ANEKA JUDES', 96),
(31, 2, '18', 'Pentol kuah judes', '06-12-2022', '13000', '13000', '0', '', 0, 'ANEKA JUDES', 98),
(32, 2, '18', 'Pentol kering judes', '06-12-2022', '13000', '13000', '0', '', 0, 'ANEKA JUDES', 95),
(33, 2, '18', 'Pentol bakar', '06-12-2022', '13000', '13000', '0', '', 0, 'ANEKA JUDES', 97),
(34, 2, '18', 'Bakso aci', '06-12-2022', '15000', '15000', '0', '', 0, 'ANEKA JUDES', 97),
(35, 2, '18', 'Bakso aci frozen', '06-12-2022', '12000', '12000', '0', '', 0, 'ANEKA JUDES', 100),
(36, 2, '19', 'Omlet', '06-12-2022', '12000', '12000', '0', '', 0, 'OMLET', 94),
(38, 2, '22', 'Soto ayam ', '06-12-2022', '5000', '5000', '0', '', 0, 'SOTO AYAM ', 97),
(39, 2, '22', 'Soto ayam ', '06-12-2022', '10000', '10000', '0', '', 0, 'SOTO AYAM ', 75),
(40, 2, '23', 'Usus', '06-12-2022', '2000', '2000', '0', '', 0, 'SUNDUKAN SOTO AYAM', 21),
(41, 2, '23', 'Ceker', '06-12-2022', '2000', '2000', '0', '', 0, 'SUNDUKAN SOTO AYAM', 80),
(42, 2, '23', 'Jeroan', '06-12-2022', '2500', '2500', '0', '', 0, 'SUNDUKAN SOTO AYAM', 67),
(44, 2, '24', 'Usus ', '06-12-2022', '2000', '2000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 195),
(45, 2, '24', 'Ceker', '06-12-2022', '2000', '2000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 98),
(46, 2, '24', 'Kepala', '06-12-2022', '2000', '2000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 91),
(47, 2, '24', 'Sayap', '06-12-2022', '5000', '5000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 75),
(48, 2, '24', 'Telur puyuh', '06-12-2022', '3000', '3000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 114),
(49, 2, '25', 'Nasi ayam suwir', '06-12-2022', '5000', '5000', '0', '', 0, 'NASI BAKAR ANGKRINGAN', 27),
(50, 2, '25', 'Nasi bakar tongkol', '06-12-2022', '5000', '5000', '0', '', 0, 'NASI BAKAR ANGKRINGAN', 26),
(51, 2, '25', 'Nasi bakar teri', '06-12-2022', '5000', '5000', '0', '', 0, 'NASI BAKAR ANGKRINGAN', 72),
(52, 2, '26', 'Mi goreng ori', '06-12-2022', '10000', '10000', '0', '', 0, 'MIE GORENG', 85),
(53, 2, '26', 'Mi goreng telur ', '06-12-2022', '13000', '13000', '0', '', 0, 'MIE GORENG', 89),
(54, 2, '26', 'Mi goreng ayam ', '06-12-2022', '18000', '18000', '0', '', 0, 'MIE GORENG', 101),
(55, 2, '26', 'Mi goreng spesial', '06-12-2022', '23000', '23000', '0', '', 0, 'MIE GORENG', 99),
(56, 2, '26', 'Mi nyemek', '06-12-2022', '15000', '15000', '0', '', 0, 'MIE GORENG', 86),
(57, 2, '26', 'Mi goreng indomie', '06-12-2022', '6000', '6000', '0', '', 0, 'MIE GORENG', 86),
(58, 2, '26', 'Mi goreng soto', '06-12-2022', '6000', '6000', '0', '', 0, 'MIE GORENG', 95),
(59, 2, '26', 'Bakmi', '06-12-2022', '15000', '15000', '0', '', 0, 'MIE GORENG', 95),
(60, 2, '27', 'Nasi goreng ori', '06-12-2022', '10000', '10000', '0', '', 0, 'NASI GORENG', 34),
(61, 2, '27', 'Nasi goreng telur', '06-12-2022', '13000', '13000', '0', '', 0, 'NASI GORENG', 43),
(62, 2, '27', 'Nasi goreng ayam ', '06-12-2022', '17000', '17000', '0', '', 0, 'NASI GORENG', 83),
(63, 2, '27', 'Nasi goreng spesial', '06-12-2022', '23000', '23000', '0', '', 0, 'NASI GORENG', 95),
(64, 2, '28', 'Lalapan 3T', '06-12-2022', '10000', '10000', '0', '', 0, 'LALAPAN', 72),
(65, 2, '28', 'Lalapan lele', '06-12-2022', '15000', '15000', '0', '', 0, 'LALAPAN', 89),
(66, 2, '28', 'Lalapan mujaer', '06-12-2022', '30000', '30000', '0', '', 0, 'LALAPAN', 192),
(67, 2, '28', 'Ayam laos', '06-12-2022', '25000', '25000', '0', '', 0, 'LALAPAN', 107),
(68, 2, '28', 'Lalapan ayam potong', '06-12-2022', '18000', '18000', '0', '', 0, 'LALAPAN', 74),
(69, 2, '29', 'Mega mendung', '06-12-2022', '12000', '12000', '0', '', 0, 'MINUMAN', 74),
(70, 2, '29', 'Soda gembira', '06-12-2022', '12000', '12000', '0', '', 0, 'MINUMAN', 42),
(71, 2, '30', 'Lemon squash', '06-12-2022', '12000', '12000', '0', '', 0, 'SQUASH SERIES', 91),
(72, 2, '30', 'Leci squash', '06-12-2022', '12000', '12000', '0', '', 0, 'SQUASH SERIES', 74),
(73, 2, '30', 'Melon squash', '06-12-2022', '12000', '12000', '0', '', 0, 'SQUASH SERIES', 93),
(74, 2, '30', 'Chochopandan squash', '06-12-2022', '12000', '12000', '0', '', 0, 'SQUASH SERIES', 95),
(75, 2, '31', 'Milk shake chocolate', '06-12-2022', '15000', '15000', '0', '', 0, 'MILK SHAKE SERIES', 63),
(76, 2, '31', 'Milk shake vanila', '06-12-2022', '15000', '15000', '0', '', 0, 'MILK SHAKE SERIES', 95),
(77, 2, '31', 'Milk shake strawberry', '06-12-2022', '15000', '15000', '0', '', 0, 'MILK SHAKE SERIES', 94),
(78, 2, '31', 'Milk shake oreo', '06-12-2022', '15000', '15000', '0', '', 0, 'MILK SHAKE SERIES', 84),
(79, 2, '32', 'Thaitea', '06-12-2022', '10000', '10000', '0', '', 0, 'TEA SERIES', 70),
(80, 2, '32', 'Lemon tea', '06-12-2022', '10000', '10000', '0', '', 0, 'TEA SERIES', 73),
(81, 2, '32', 'Tea tarik', '06-12-2022', '8000', '8000', '0', '', 0, 'TEA SERIES', 86),
(82, 2, '32', 'Es teh', '06-12-2022', '4000', '4000', '0', '', 0, 'TEA SERIES', 65),
(83, 2, '32', 'Es jeruk', '06-12-2022', '6000', '6000', '0', '', 0, 'TEA SERIES', 44),
(84, 2, '33', 'Dark chocholate', '06-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 69),
(85, 2, '33', 'Mangga', '06-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 66),
(86, 2, '33', 'Strawberry', '06-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 88),
(87, 2, '33', 'Taro', '06-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 41),
(88, 2, '33', 'Matcha', '06-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 59),
(89, 2, '33', 'Chocho malt', '06-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 84),
(90, 2, '33', 'Es cokelat roti', '06-12-2022', '12000', '12000', '0', '', 0, 'DRINKS', 93),
(91, 2, '34', 'Teh panas', '06-12-2022', '4000', '4000', '0', '', 0, 'CLASSIC MENU', 64),
(92, 2, '34', 'Jeruk panas', '06-12-2022', '6000', '6000', '0', '', 0, 'CLASSIC MENU', 85),
(93, 2, '35', 'Hot chochalate', '06-12-2022', '13000', '13000', '0', '', 0, 'HOT CHOCOLATE SERIES', 96),
(94, 2, '35', 'Hot capucino', '06-12-2022', '10000', '10000', '0', '', 0, 'HOT CHOCOLATE SERIES', 61),
(95, 2, '35', 'Hot matcha', '06-12-2022', '10000', '10000', '0', '', 0, 'HOT CHOCOLATE SERIES', 100),
(96, 2, '35', 'Hot beng beng', '06-12-2022', '10000', '10000', '0', '', 0, 'HOT CHOCOLATE SERIES', 90),
(97, 2, '35', 'Hot chocholatos', '06-12-2022', '10000', '10000', '0', '', 0, 'HOT CHOCOLATE SERIES', 95),
(98, 2, '36', 'Kopi hitam', '06-12-2022', '5000', '5000', '0', '', 0, 'COFEE SERIES', 59),
(99, 2, '36', 'Kopi robusta', '06-12-2022', '7000', '7000', '0', '', 0, 'COFEE SERIES', 76),
(100, 2, '36', 'Wedang jahe', '06-12-2022', '7000', '7000', '0', '', 0, 'COFEE SERIES', 81),
(101, 2, '36', 'Jahe susu', '06-12-2022', '8000', '8000', '0', '', 0, 'COFEE SERIES', 86),
(102, 2, '29', 'Le mineral', '12-12-2022', '2500', '2500', '0', '', 0, 'MINUMAN', 60),
(103, 2, '29', 'Es susu', '12-12-2022', '8000', '8000', '0', '', 0, 'MINUMAN', 92),
(104, 2, '37', 'Krupuk', '13-12-2022', '2000', '2000', '0', '', 0, 'KRUPUK', 29),
(105, 2, '33', 'Brown sugar', '20-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 192),
(106, 2, '33', 'Gula aren ', '21-12-2022', '10000', '10000', '0', '', 0, 'DRINKS', 49994),
(107, 2, '36', 'Kopi susu', '24-12-2022', '6000', '6000', '0', '', 0, 'COFEE SERIES', 46),
(109, 2, '37', 'Sehati snack', '31-12-2022', '10000', '10000', '10000', '', 0, 'KRUPUK', 7),
(110, 2, '37', 'Basreng snack', '31-12-2022', '5000', '5000', '5000', '', 0, 'KRUPUK', 26),
(111, 2, '37', 'Krupuk seblak', '31-12-2022', '5000', '5000', '5000', '', 0, 'KRUPUK', 32),
(112, 2, '37', 'Makaroni bantet', '31-12-2022', '5000', '5000', '5000', '', 0, 'KRUPUK', 17),
(113, 2, '37', 'Happytos', '31-12-2022', '13000', '13000', '13000', '', 0, 'KRUPUK', 13),
(114, 2, '29', 'Susu panas ', '03-01-2023', '8000', '8000', '8000', '', 0, 'MINUMAN', 97),
(115, 2, '29', 'Es white coffe', '03-01-2023', '10000', '10000', '10000', '', 0, 'MINUMAN', 99),
(116, 2, '29', 'Es milo dino', '03-01-2023', '12000', '12000', '0', '', 0, 'MINUMAN', 192),
(117, 2, '29', 'Es teler', '03-01-2023', '10000', '10000', '10000', '', 0, 'MINUMAN', 190),
(118, 2, '29', 'Alpukat Milo', '04-01-2023', '12000', '12000', '0', '', 0, 'MINUMAN', 179),
(119, 2, '29', 'Milo', '05-01-2023', '10000', '10000', '0', '', 0, 'MINUMAN', 85),
(120, 2, '33', 'Es beng beng', '05-01-2023', '10000', '10000', '0', '', 0, 'DRINKS', 98),
(121, 2, '29', 'Coffe n cream', '05-01-2023', '12000', '12000', '0', '', 0, 'MINUMAN', 195),
(122, 2, '29', 'Bubble gum', '05-01-2023', '10000', '10000', '0', '', 0, 'MINUMAN', 98),
(123, 2, '38', 'Snack mix', '05-01-2023', '25000', '25000', '0', '', 0, 'SNACK MIX', 198),
(124, 2, '16', 'Tahu kucek', '05-01-2023', '10000', '10000', '0', '', 0, 'ANEKA TAHU DAN TEMPE', 198),
(125, 2, '17', 'Seblak krupuk', '05-01-2023', '18000', '18000', '0', '', 0, 'ANEKA SEBLAK', 200),
(126, 2, '18', 'Tempura judes', '05-01-2023', '13000', '13000', '0', '', 0, 'ANEKA JUDES', 198),
(127, 2, '30', 'Jeruk squash', '05-01-2023', '12000', '12000', '0', '', 0, 'SQUASH SERIES', 0),
(128, 2, '30', 'Strawberry squash', '05-01-2023', '12000', '12000', '0', '', 0, 'SQUASH SERIES', 0),
(129, 2, '39', 'Ayam geprek', '07-01-2023', '13000', '13000', '0', '', 0, 'AYAM GEPREK', 66),
(130, 2, '36', 'KSTG', '12-01-2023', '7000', '7000', '0', '', 0, 'COFEE SERIES', 90),
(131, 2, '29', 'Alpukat', '13-01-2023', '10000', '10000', '0', '', 0, 'MINUMAN', 71),
(132, 2, '17', 'Seblak ceker', '16-01-2023', '22000', '22000', '0', '', 0, 'ANEKA SEBLAK', 100),
(133, 2, '17', 'Bakso sayur', '20-01-2023', '12000', '12000', '0', '', 0, 'ANEKA SEBLAK', 97),
(134, 2, '40', 'Jus semangka', '22-01-2023', '8000', '8000', '0', '', 0, 'ANEKA JUZ', 98),
(135, 2, '40', 'Jus jambu', '22-01-2023', '8000', '8000', '0', '', 0, 'ANEKA JUZ', 92),
(136, 2, '24', 'Tahu', '14-02-2023', '2000', '2000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 105),
(137, 2, '24', 'Tempe', '14-02-2023', '2000', '2000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 104),
(138, 2, '21', 'Nasi', '15-02-2023', '5000', '5000', '0', '', 0, 'NASI', 92),
(139, 2, '24', 'Sosis bakar', '15-02-2023', '6000', '6000', '0', '', 0, 'SUNDUKAN NASI BAKAR', 97),
(140, 2, '41', 'Ayam lodo', '28-02-2023', '25000', '25000', '0', '', 0, 'MAKANAN', 8),
(141, 2, '29', 'Ayam rica rica', '28-02-2023', '32000', '32000', '0', '', 0, 'MINUMAN', 11),
(142, 2, '41', 'Iga penyet', '28-02-2023', '28000', '28000', '0', '', 0, 'MAKANAN', 7),
(143, 2, '41', 'Sop iga', '28-02-2023', '30000', '30000', '0', '', 0, 'MAKANAN', 5),
(144, 2, '41', 'Bebek goreng', '28-02-2023', '25000', '25000', '0', '', 0, 'MAKANAN', 9),
(145, 2, '41', 'Bebek rica rica', '28-02-2023', '28000', '28000', '0', '', 0, 'MAKANAN', 7),
(146, 2, '42', 'Bakso udang', '28-02-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 43),
(147, 2, '42', 'Fisrol', '28-02-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 19),
(148, 2, '42', 'Dubling', '28-02-2023', '4000', '4000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 11996),
(149, 2, '42', 'Cikuwa', '28-02-2023', '3000', '3000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 31),
(150, 2, '42', 'Cedea', '28-02-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 25),
(151, 2, '42', 'Sosis ', '28-02-2023', '1000', '1000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 70),
(152, 2, '42', 'Tempura', '28-02-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 29),
(153, 2, '42', 'Odeng', '28-02-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 36),
(154, 2, '42', 'Bakso ikan', '28-02-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 31),
(155, 2, '42', 'Bakso sapi ', '28-02-2023', '3000', '3000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 25),
(156, 2, '42', 'Cumi flower', '02-03-2023', '2000', '2000', '0', '', 0, 'ANGKRINGAN SEAFOOD', 14),
(157, 2, '40', 'Jus melon', '21-03-2023', '8000', '8000', '0', '', 0, 'ANEKA JUZ', 99),
(158, 2, '28', 'Nasi teluyam', '21-03-2023', '12000', '12000', '0', '', 0, 'LALAPAN', 87),
(159, 2, '34', 'Es kopi susu', '21-03-2023', '10000', '10000', '0', '', 0, 'CLASSIC MENU', 99),
(160, 2, '41', 'Sosis tempura', '21-03-2023', '13000', '13000', '0', '', 0, 'MAKANAN', 100),
(161, 2, '40', 'Mineral', '21-03-2023', '3000', '3000', '0', '', 0, 'ANEKA JUZ', 5),
(162, 2, '41', 'Paket teluyam', '25-03-2023', '13000', '13000', '0', '', 0, 'MAKANAN', 11),
(163, 2, '41', 'Paket ayam geprek', '25-03-2023', '14000', '14000', '0', '', 0, 'MAKANAN', 207),
(164, 2, '41', 'Iga bakar', '27-03-2023', '28000', '28000', '0', '', 0, 'MAKANAN', 50),
(165, 2, '29', 'Josua', '04-04-2023', '7000', '7000', '0', '', 0, 'MINUMAN', 87);

-- --------------------------------------------------------

--
-- Table structure for table `bonus_pegawai`
--

CREATE TABLE `bonus_pegawai` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nominal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `bulan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tahun` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `gambar_default`
--

CREATE TABLE `gambar_default` (
  `id` int(15) DEFAULT NULL,
  `nama_file` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `gambar_default`
--

INSERT INTO `gambar_default` (`id`, `nama_file`, `tanggal`) VALUES
(1, 'download.jpg', '22-03-2022');

-- --------------------------------------------------------

--
-- Table structure for table `hutang_pegawai`
--

CREATE TABLE `hutang_pegawai` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nominal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `bulan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tahun` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ijin_pegawai`
--

CREATE TABLE `ijin_pegawai` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `bulan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tahun` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `status_ijin` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `keterangan_ijin` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `id` int(11) NOT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id`, `jabatan`, `tanggal`, `waktu`, `id_user`) VALUES
(2, 'OWNER', '15-06-2023', '11:11:04', 2),
(3, 'KASIR', '15-06-2023', '11:11:12', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `nama_jenis_barang` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id`, `id_user`, `nama_jenis_barang`) VALUES
(12, '2', 'ROTI MARYAM'),
(13, '2', 'ROTI BAKAR'),
(14, '2', 'KENTANG GORENG'),
(15, '2', 'JAMUR CRISPY'),
(16, '2', 'ANEKA TAHU DAN TEMPE'),
(17, '2', 'ANEKA SEBLAK'),
(18, '2', 'ANEKA JUDES'),
(19, '2', 'OMLET'),
(20, '2', 'ONION RING'),
(21, '2', 'NASI'),
(22, '2', 'SOTO AYAM '),
(23, '2', 'SUNDUKAN SOTO AYAM'),
(24, '2', 'SUNDUKAN NASI BAKAR'),
(25, '2', 'NASI BAKAR ANGKRINGAN'),
(26, '2', 'MIE GORENG'),
(27, '2', 'NASI GORENG'),
(28, '2', 'LALAPAN'),
(29, '2', 'MINUMAN'),
(30, '2', 'SQUASH SERIES'),
(31, '2', 'MILK SHAKE SERIES'),
(32, '2', 'TEA SERIES'),
(33, '2', 'DRINKS'),
(34, '2', 'CLASSIC MENU'),
(35, '2', 'HOT CHOCOLATE SERIES'),
(36, '2', 'COFEE SERIES'),
(37, '2', 'KRUPUK'),
(38, '2', 'SNACK MIX'),
(39, '2', 'AYAM GEPREK'),
(40, '2', 'ANEKA JUZ'),
(41, '2', 'MAKANAN'),
(42, '2', 'ANGKRINGAN SEAFOOD');

-- --------------------------------------------------------

--
-- Table structure for table `kelola_bahan`
--

CREATE TABLE `kelola_bahan` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(255) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `id_bahan` varchar(255) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `jumlah` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(15) NOT NULL,
  `nama_level` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `id_user` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `nama_level`, `tanggal`, `waktu`, `id_user`) VALUES
(2, 'Owner', '11-03-2022', '03:18:58', 2),
(3, 'Kasir', '26-03-2022', '15:16:23', 2);

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `nama_meja` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`id`, `id_user`, `nama_meja`) VALUES
(5, 2, '01'),
(6, 2, '02'),
(7, 2, '03'),
(8, 2, '04'),
(9, 2, '05'),
(10, 2, '06'),
(11, 2, '07'),
(12, 2, '08'),
(13, 2, '09'),
(14, 2, '10'),
(15, 2, '11'),
(16, 2, '12'),
(17, 2, '13'),
(18, 2, '14'),
(19, 2, '15'),
(20, 2, '16'),
(21, 2, '17'),
(22, 2, '18'),
(23, 2, '19'),
(24, 2, '20');

-- --------------------------------------------------------

--
-- Table structure for table `menu_1`
--

CREATE TABLE `menu_1` (
  `id` int(15) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu_1`
--

INSERT INTO `menu_1` (`id`, `nama`, `link`, `icon`) VALUES
(1, 'Dashboard', 'home', 'ti-home'),
(2, 'Penjualan', NULL, 'ti-shopping-cart'),
(3, 'Keuangan', NULL, 'ti-money'),
(4, 'Barang', NULL, 'ti-archive'),
(6, 'Riwayat', NULL, 'ti-timer'),
(7, 'Laporan', NULL, 'ti-printer'),
(8, 'Pengaturan', NULL, 'ti-settings'),
(9, 'Kepegawaian', NULL, 'ti-user');

-- --------------------------------------------------------

--
-- Table structure for table `menu_2`
--

CREATE TABLE `menu_2` (
  `id` int(15) NOT NULL,
  `id_menu_1` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu_2`
--

INSERT INTO `menu_2` (`id`, `id_menu_1`, `nama`, `link`) VALUES
(1, '2', 'Pemesanan', 'pemesanan'),
(2, '2', 'Kasir', 'kasir'),
(4, '3', 'Pemasukan', 'pemasukan'),
(5, '3', 'Pengeluaran', 'pengeluaran'),
(6, '4', 'Master Jenis Barang', 'jenis_barang'),
(8, '4', 'Master Barang', 'barang'),
(9, '4', 'Master Meja', 'meja'),
(11, '4', 'Tambah Stok Barang', 'stok_barang'),
(12, '4', 'Stok Opname', 'stok_opname'),
(18, '6', 'Riwayat Penjualan', 'riwayat_penjualan'),
(21, '7', 'Laporan Penjualan', '#'),
(22, '7', 'Laporan Produk', '#'),
(23, '7', 'Laporan Stok', '#'),
(24, '7', 'Laporan Pemasukan', 'laporan_pemasukan'),
(25, '7', 'Laporan Pengeluaran', 'laporan_pengeluaran'),
(26, '8', 'Ubah Struk', 'ubah_struk'),
(27, '8', 'Level', 'level'),
(32, '8', 'Hak Akses', 'hak_akses'),
(34, '8', 'User', 'user'),
(36, '8', 'Gambar Default', 'gambar_default'),
(37, '9', 'Jabatan', 'jabatan'),
(38, '9', 'Pegawai', 'pegawai'),
(39, '9', 'Hutang Pegawai', 'hutang_pegawai'),
(40, '9', 'Bonus Pegawai', 'bonus_pegawai'),
(41, '9', 'Absen', 'absen'),
(42, '9', 'Ijin Keluar', 'ijin_keluar'),
(43, '9', 'Ijin Pegawai', 'ijin_pegawai'),
(44, '9', 'Pelanggaran Pegawai', 'pelanggaran_pegawai'),
(45, '9', 'Ijin Waktu Jam Pulang', 'ijin_waktu_jam_pulang');

-- --------------------------------------------------------

--
-- Table structure for table `menu_3`
--

CREATE TABLE `menu_3` (
  `id` int(15) NOT NULL,
  `id_menu_2` int(15) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `menu_3`
--

INSERT INTO `menu_3` (`id`, `id_menu_2`, `nama`, `link`) VALUES
(1, 21, 'Laporan Penjualan', 'laporan_penjualan'),
(2, 21, 'Laporan Penjualan Detail', 'laporan_penjualan_detail'),
(3, 21, 'Laporan Penjualan Per Jenis', 'laporan_penjualan_jenis'),
(4, 22, 'Penjualan Produk', 'penjualan_produk'),
(5, 22, 'Produk Populer', 'produk_populer'),
(6, 23, 'Stok Saat ini', 'laporan_stok'),
(7, 23, 'Laporan Buku Stok', 'laporan_buku_stok'),
(8, 35, 'Promo Otomatis', 'promo_otomatis'),
(9, 21, 'Laporan Laba Rugi', 'laporan_laba_rugi');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL,
  `kode` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `no_rekening` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `alamat` longtext CHARACTER SET latin1 DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `id_jabatan` int(11) DEFAULT NULL,
  `gaji` float(255,0) UNSIGNED DEFAULT NULL,
  `bpjs` float(255,0) DEFAULT NULL,
  `finger_data` longtext CHARACTER SET latin1 DEFAULT NULL,
  `finger_id` int(11) DEFAULT NULL,
  `status_pegawai` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggaran_pegawai`
--

CREATE TABLE `pelanggaran_pegawai` (
  `id` int(11) NOT NULL,
  `id_pegawai` int(11) DEFAULT NULL,
  `nama_pegawai` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `bulan` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `tahun` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `nama_pemasukan` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pemasukan`
--

INSERT INTO `pemasukan` (`id`, `id_user`, `invoice`, `nama_pemasukan`, `nominal`, `keterangan`, `tanggal`, `waktu`, `bulan`, `tahun`) VALUES
(3, 2, 'PMS0201230001', '31/12/22', '545.000', 'Pemasukan tanggal 31 desember 2022', '02-01-2023', '12:21:22', '01', '2023'),
(4, 2, 'PMS0201230002', '01/01/23', '209', 'Pemasukan tgl 01/01/23', '02-01-2023', '12:22:59', '01', '2023');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `no_transaksi` varchar(15) DEFAULT NULL,
  `nilai_transaksi` double(65,0) NOT NULL,
  `dibayar` double(65,0) NOT NULL,
  `kembali` double(65,0) NOT NULL,
  `jenis_pembayaran` varchar(100) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL,
  `status` int(15) DEFAULT NULL,
  `nama_meja` varchar(255) DEFAULT NULL,
  `atas_nama` varchar(255) DEFAULT NULL,
  `status_dapur` int(15) DEFAULT NULL,
  `status_diskon` int(255) NOT NULL,
  `diskon` double(255,0) NOT NULL,
  `tipe_diskon` varchar(100) DEFAULT NULL,
  `uniqcode` varchar(100) DEFAULT NULL,
  `nilai_total_laba` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id`, `id_user`, `id_kasir`, `no_transaksi`, `nilai_transaksi`, `dibayar`, `kembali`, `jenis_pembayaran`, `tanggal`, `waktu`, `bulan`, `tahun`, `status`, `nama_meja`, `atas_nama`, `status_dapur`, `status_diskon`, `diskon`, `tipe_diskon`, `uniqcode`, `nilai_total_laba`) VALUES
(6, 2, 6, 'TRN0512220002', 50000, 100000, 50000, 'tunai', '05-12-2022', '13:43:43', '12', '2022', 1, '25', 'Amin', 0, 0, 0, 'persen', NULL, ''),
(7, 2, 6, 'TRN0512220003', 40000, 50000, 10000, 'tunai', '05-12-2022', '13:52:43', '12', '2022', 1, '25', 'Riki', 0, 0, 0, 'persen', NULL, '8000'),
(8, 2, 6, 'TRN0512220004', 10000, 20000, 10000, 'tunai', '05-12-2022', '13:54:29', '12', '2022', 1, '25', 'Riki', 0, 0, 0, 'persen', NULL, ''),
(9, 2, 6, 'TRN0512220005', 20000, 100000, 80000, 'tunai', '05-12-2022', '13:57:10', '12', '2022', 1, '-', 'Husen', 0, 0, 0, 'persen', NULL, ''),
(10, 2, 6, 'TRN0512220006', 48000, 50000, 2000, 'tunai', '05-12-2022', '14:20:24', '12', '2022', 1, '01', 'Riki', 0, 0, 0, 'persen', NULL, ''),
(11, 2, 6, 'TRN0512220007', 8000, 10000, 2000, 'tunai', '05-12-2022', '14:23:32', '12', '2022', 1, '25', 'Dika', 0, 0, 0, 'persen', NULL, ''),
(12, 2, 6, 'TRN0512220008', 10000, 20000, 10000, 'tunai', '05-12-2022', '15:23:11', '12', '2022', 1, '25', 'Riki', 0, 0, 0, 'persen', NULL, ''),
(13, 2, 6, 'TRN0512220009', 12000, 20000, 8000, 'tunai', '05-12-2022', '15:50:25', '12', '2022', 1, '01', 'Dika bj', 0, 0, 0, 'persen', NULL, '9000'),
(14, 2, 6, 'TRN0612220001', 8000, 10000, 2000, 'tunai', '06-12-2022', '13:21:46', '12', '2022', 1, '-', 'Riki', 0, 0, 0, 'persen', NULL, '0'),
(15, 2, 6, 'TRN0612220002', 8000, 10000, 2000, 'tunai', '06-12-2022', '13:22:29', '12', '2022', 1, '-', 'Riki', 0, 0, 0, 'persen', NULL, '0'),
(16, 2, 6, 'TRN0612220003', 8000, 10000, 2000, 'tunai', '06-12-2022', '13:25:14', '12', '2022', 1, '01', 'Dika', 0, 0, 0, 'persen', NULL, '0'),
(17, 2, 6, 'TRN0612220004', 8000, 20000, 12000, 'tunai', '06-12-2022', '13:26:31', '12', '2022', 1, '-', 'Dika', 0, 0, 0, 'persen', NULL, '0'),
(18, 2, 6, 'TRN0612220005', 8000, 10000, 2000, 'tunai', '06-12-2022', '13:28:00', '12', '2022', 1, '25', 'Rino', 0, 0, 0, 'persen', NULL, ''),
(19, 2, 6, 'TRN0612220006', 8000, 40000, 32000, 'tunai', '06-12-2022', '13:29:32', '12', '2022', 1, '25', 'Yoji', 0, 0, 0, 'persen', NULL, '0'),
(20, 2, 6, 'TRN0612220007', 12000, 20000, 8000, 'tunai', '06-12-2022', '20:10:53', '12', '2022', 1, '-', 'Udin', 0, 0, 0, 'persen', NULL, '0'),
(21, 2, 6, 'TRN0812220001', 16000, 20000, 4000, 'tunai', '08-12-2022', '15:51:31', '12', '2022', 1, '-', 'Gibran', 0, 0, 0, 'persen', NULL, '0'),
(25, 2, 6, 'TRN1312220001', 42000, 50000, 8000, 'tunai', '13-12-2022', '16:27:00', '12', '2022', 1, '17', 'Pp', 0, 0, 0, 'persen', NULL, ''),
(27, 2, 6, 'TRN1312220002', 6000, 6000, 0, 'tunai', '13-12-2022', '20:03:18', '12', '2022', 1, '01', 'Alvia', 0, 0, 0, 'persen', NULL, '0'),
(28, 2, 6, 'TRN1312220003', 53000, 100000, 47000, 'tunai', '13-12-2022', '21:29:35', '12', '2022', 1, '06', 'Ppp', 0, 0, 0, 'persen', NULL, ''),
(29, 2, 6, 'TRN1312220004', 82000, 100000, 18000, 'tunai', '13-12-2022', '21:35:28', '12', '2022', 1, '10', 'Pp9', 0, 0, 0, 'persen', NULL, ''),
(31, 2, 6, 'TRN1312220005', 46000, 60000, 14000, 'tunai', '13-12-2022', '22:16:02', '12', '2022', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(33, 2, 6, 'TRN1412220001', 106000, 110000, 4000, 'tunai', '14-12-2022', '15:35:33', '12', '2022', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(34, 2, 6, 'TRN1412220002', 21500, 22000, 500, 'tunai', '14-12-2022', '16:17:10', '12', '2022', 1, '09', 'Hima', 0, 0, 0, 'persen', NULL, ''),
(35, 2, 6, 'TRN1412220003', 42000, 42000, 0, 'tunai', '14-12-2022', '18:02:57', '12', '2022', 1, '12', '12', 0, 0, 0, 'persen', NULL, ''),
(36, 2, 6, 'TRN1412220004', 32000, 100000, 68000, 'tunai', '14-12-2022', '17:22:18', '12', '2022', 1, '18', 'Ibi ibu', 0, 0, 0, 'persen', NULL, ''),
(37, 2, 6, 'TRN1412220005', 64000, 100000, 36000, 'tunai', '14-12-2022', '17:11:37', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(38, 2, 6, 'TRN1412220006', 45000, 45000, 0, 'tunai', '14-12-2022', '19:49:42', '12', '2022', 1, '12', '12', 0, 0, 0, 'persen', NULL, '0'),
(39, 2, 6, 'TRN1512220001', 28500, 29000, 500, 'tunai', '15-12-2022', '18:43:55', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(40, 2, 6, 'TRN1512220002', 10000, 10000, 0, 'tunai', '15-12-2022', '18:12:47', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(41, 2, 6, 'TRN1512220003', 7000, 7000, 0, 'tunai', '15-12-2022', '18:14:26', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(42, 2, 6, 'TRN1512220004', 18000, 18000, 0, 'tunai', '15-12-2022', '18:19:31', '12', '2022', 1, '03', 'Virly', 0, 0, 0, 'persen', NULL, '0'),
(43, 2, 6, 'TRN1512220005', 40000, 50000, 10000, 'tunai', '15-12-2022', '20:00:51', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(44, 2, 6, 'TRN1512220006', 5000, 5000, 0, 'tunai', '15-12-2022', '18:52:50', '12', '2022', 1, '01', 'Axel', 0, 0, 0, 'persen', NULL, ''),
(45, 2, 6, 'TRN1512220007', 10000, 10000, 0, 'tunai', '15-12-2022', '19:00:29', '12', '2022', 1, '02', 'Axel', 0, 0, 0, 'persen', NULL, '0'),
(46, 2, 6, 'TRN1512220008', 27000, 50000, 23000, 'tunai', '15-12-2022', '21:01:31', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(47, 2, 6, 'TRN1512220009', 12000, 12000, 0, 'tunai', '15-12-2022', '20:45:03', '12', '2022', 1, '01', 'Axel', 0, 0, 0, 'persen', NULL, '0'),
(48, 2, 6, 'TRN1612220001', 48000, 100000, 52000, 'tunai', '16-12-2022', '19:21:47', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(49, 2, 6, 'TRN1612220002', 5000, 5000, 0, 'tunai', '16-12-2022', '20:16:52', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(50, 2, 6, 'TRN1612220003', 24000, 25000, 1000, 'tunai', '16-12-2022', '19:45:38', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(51, 2, 6, 'TRN1612220004', 11000, 11000, 0, 'tunai', '16-12-2022', '20:56:37', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(52, 2, 6, 'TRN1612220005', 17500, 20000, 2500, 'tunai', '16-12-2022', '21:05:43', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(53, 2, 6, 'TRN1612220006', 39000, 50000, 11000, 'tunai', '16-12-2022', '20:55:43', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(54, 2, 6, 'TRN1612220007', 66000, 66000, 0, 'tunai', '16-12-2022', '21:50:47', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(55, 2, 6, 'TRN1712220001', 10000, 10000, 0, 'tunai', '17-12-2022', '18:18:24', '12', '2022', 1, '01', 'Arin', 0, 0, 0, 'persen', NULL, '0'),
(56, 2, 6, 'TRN1712220002', 10000, 10000, 0, 'tunai', '17-12-2022', '18:19:59', '12', '2022', 1, '02', 'Udin', 0, 0, 0, 'persen', NULL, '0'),
(58, 2, 6, 'TRN1712220003', 15000, 15000, 0, 'tunai', '17-12-2022', '18:54:18', '12', '2022', 1, '01', 'Samsi', 0, 0, 0, 'persen', NULL, ''),
(59, 2, 6, 'TRN1712220004', 97000, 97000, 0, 'tunai', '17-12-2022', '20:49:27', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(60, 2, 6, 'TRN1712220005', 55000, 55000, 0, 'tunai', '17-12-2022', '20:20:40', '12', '2022', 1, '03', 'Bu nora', 0, 0, 0, 'persen', NULL, ''),
(62, 2, 6, 'TRN1712220006', 10000, 10000, 0, 'tunai', '17-12-2022', '19:52:12', '12', '2022', 1, '01', 'Temen vita', 0, 0, 0, 'persen', NULL, '0'),
(63, 2, 6, 'TRN1712220007', 15000, 15000, 0, 'tunai', '17-12-2022', '19:52:39', '12', '2022', 1, '01', 'Samsi', 0, 0, 0, 'persen', NULL, '0'),
(64, 2, 6, 'TRN1712220008', 10000, 10000, 0, 'tunai', '17-12-2022', '19:53:15', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(65, 2, 6, 'TRN1712220009', 45000, 50000, 5000, 'tunai', '17-12-2022', '20:42:22', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(66, 2, 6, 'TRN1712220010', 38000, 50000, 12000, 'tunai', '17-12-2022', '20:08:49', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(67, 2, 6, 'TRN1712220011', 92500, 100000, 7500, 'tunai', '17-12-2022', '22:14:56', '12', '2022', 1, '07', 'Mbak fini', 0, 0, 0, 'persen', NULL, ''),
(68, 2, 6, 'TRN1712220012', 10000, 10000, 0, 'tunai', '17-12-2022', '20:45:19', '12', '2022', 1, '10', 'Vita', 0, 0, 0, 'persen', NULL, '0'),
(69, 2, 6, 'TRN1712220013', 68000, 70000, 2000, 'tunai', '17-12-2022', '21:58:14', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(70, 2, 6, 'TRN1712220014', 67000, 100000, 33000, 'tunai', '17-12-2022', '22:43:29', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(71, 2, 6, 'TRN1712220015', 4000, 5000, 1000, 'tunai', '17-12-2022', '21:34:18', '12', '2022', 1, '13', 'Alvia', 0, 0, 0, 'persen', NULL, '0'),
(73, 2, 6, 'TRN1712220017', 10000, 10000, 0, 'tunai', '17-12-2022', '23:09:49', '12', '2022', 1, '01', 'Udin', 0, 0, 0, 'persen', NULL, '0'),
(74, 2, 6, 'TRN1712220018', 97000, 97000, 0, 'tunai', '17-12-2022', '23:14:08', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(75, 2, 6, 'TRN1712220019', 97000, 97000, 0, 'tunai', '17-12-2022', '23:17:01', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(76, 2, 6, 'TRN1712220020', 38000, 38000, 0, 'tunai', '17-12-2022', '23:18:40', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(77, 2, 6, 'TRN1812220001', 6000, 6000, 0, 'tunai', '18-12-2022', '15:01:14', '12', '2022', 1, '01', 'Dika', 0, 0, 0, 'persen', NULL, '0'),
(78, 2, 6, 'TRN1812220002', 2000, 2000, 0, 'tunai', '18-12-2022', '18:18:20', '12', '2022', 1, '01', 'Firman', 0, 0, 0, 'persen', NULL, '0'),
(79, 2, 6, 'TRN1812220003', 40000, 40000, 0, 'tunai', '18-12-2022', '18:19:19', '12', '2022', 1, '01', 'TW', 0, 0, 0, 'persen', NULL, '0'),
(80, 2, 6, 'TRN1812220004', 10000, 10000, 0, 'tunai', '18-12-2022', '18:37:20', '12', '2022', 1, '01', 'Riki', 0, 0, 0, 'persen', NULL, '0'),
(81, 2, 6, 'TRN1812220005', 51000, 51000, 0, 'tunai', '18-12-2022', '18:38:39', '12', '2022', 1, '03', 'Amalia', 0, 0, 0, 'persen', NULL, '0'),
(82, 2, 6, 'TRN1812220006', 20000, 20000, 0, 'tunai', '18-12-2022', '18:39:16', '12', '2022', 1, '04', 'Arin', 0, 0, 0, 'persen', NULL, '0'),
(83, 2, 6, 'TRN1812220007', 15000, 15000, 0, 'tunai', '18-12-2022', '18:40:42', '12', '2022', 1, '05', 'TW ', 0, 0, 0, 'persen', NULL, '0'),
(84, 2, 6, 'TRN1812220008', 109000, 120000, 11000, 'tunai', '18-12-2022', '20:04:30', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(85, 2, 6, 'TRN1812220009', 16000, 16000, 0, 'tunai', '18-12-2022', '20:12:08', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(86, 2, 6, 'TRN1812220010', 48000, 48000, 0, 'tunai', '18-12-2022', '22:56:43', '12', '2022', 1, '01', 'Gerdu', 0, 0, 0, 'persen', NULL, ''),
(87, 2, 6, 'TRN1812220011', 49000, 50000, 1000, 'tunai', '18-12-2022', '20:49:40', '12', '2022', 1, '01', 'Gerdu', 0, 0, 0, 'persen', NULL, '0'),
(88, 2, 6, 'TRN1812220012', 49000, 100000, 51000, 'tunai', '18-12-2022', '22:51:15', '12', '2022', 1, '06', 'Fandi', 0, 0, 0, 'persen', NULL, ''),
(89, 2, 6, 'TRN1812220013', 19000, 19000, 0, 'tunai', '18-12-2022', '20:57:25', '12', '2022', 1, '09', 'Zainal', 0, 0, 0, 'persen', NULL, '0'),
(90, 2, 6, 'TRN1812220014', 148500, 148500, 0, 'tunai', '18-12-2022', '22:27:07', '12', '2022', 1, '16', '16', 0, 0, 0, 'persen', NULL, ''),
(91, 2, 6, 'TRN1812220015', 10000, 10000, 0, 'tunai', '18-12-2022', '21:56:12', '12', '2022', 1, '10', 'Bawa pulang', 0, 0, 0, 'persen', NULL, ''),
(92, 2, 6, 'TRN1912220001', 24000, 24000, 0, 'tunai', '19-12-2022', '18:00:34', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(93, 2, 6, 'TRN1912220002', 10000, 10000, 0, 'tunai', '19-12-2022', '18:02:08', '12', '2022', 1, '03', 'TW', 0, 0, 0, 'persen', NULL, '0'),
(94, 2, 6, 'TRN1912220003', 58000, 59000, 1000, 'tunai', '19-12-2022', '18:04:05', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(95, 2, 6, 'TRN1912220004', 35000, 35000, 0, 'tunai', '19-12-2022', '22:26:34', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(96, 2, 6, 'TRN1912220005', 37000, 37000, 0, 'tunai', '19-12-2022', '22:26:49', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(97, 2, 6, 'TRN1912220006', 15000, 15000, 0, 'tunai', '19-12-2022', '22:00:16', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(98, 2, 6, 'TRN2012220001', 112000, 112000, 0, 'tunai', '20-12-2022', '18:30:45', '12', '2022', 1, '02', 'TW', 0, 0, 0, 'persen', NULL, ''),
(99, 2, 6, 'TRN2012220002', 40000, 40000, 0, 'tunai', '20-12-2022', '18:37:52', '12', '2022', 1, '01', 'Amalia', 0, 0, 0, 'persen', NULL, ''),
(100, 2, 6, 'TRN2012220003', 12000, 12000, 0, 'tunai', '20-12-2022', '18:01:48', '12', '2022', 1, '03', 'Tw 2', 0, 0, 0, 'persen', NULL, ''),
(102, 2, 6, 'TRN2012220005', 30000, 30000, 0, 'tunai', '20-12-2022', '21:19:54', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(103, 2, 6, 'TRN2012220006', 35000, 50000, 15000, 'tunai', '20-12-2022', '21:21:41', '12', '2022', 1, '03', 'Vita', 0, 0, 0, 'persen', NULL, ''),
(104, 2, 6, 'TRN2012220007', 6000, 6000, 0, 'tunai', '20-12-2022', '21:22:38', '12', '2022', 1, '01', '02', 0, 0, 0, 'persen', NULL, '0'),
(105, 2, 6, 'TRN2112220001', 40000, 40000, 0, 'tunai', '21-12-2022', '13:54:31', '12', '2022', 1, '02', 'Amalia', 0, 0, 0, 'persen', NULL, ''),
(106, 2, 6, 'TRN2112220002', 26500, 26500, 0, 'tunai', '21-12-2022', '13:43:34', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(107, 2, 6, 'TRN2112220003', 40000, 40000, 0, 'tunai', '21-12-2022', '15:44:44', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(108, 2, 6, 'TRN2112220004', 64500, 70000, 5500, 'tunai', '21-12-2022', '17:45:07', '12', '2022', 1, '05', 'Vita', 0, 0, 0, 'persen', NULL, ''),
(109, 2, 6, 'TRN2112220005', 103500, 104000, 500, 'tunai', '21-12-2022', '19:45:24', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(110, 2, 6, 'TRN2112220006', 12000, 12000, 0, 'tunai', '21-12-2022', '19:03:40', '12', '2022', 1, '07', 'TW', 0, 0, 0, 'persen', NULL, '0'),
(112, 2, 6, 'TRN2112220008', 107000, 107000, 0, 'tunai', '21-12-2022', '21:20:05', '12', '2022', 1, '08', 'Dulur e dika', 0, 0, 0, 'persen', NULL, ''),
(114, 2, 6, 'TRN2112220009', 90000, 90000, 0, 'tunai', '21-12-2022', '21:20:28', '12', '2022', 1, '08', 'Baru datang', 0, 0, 0, 'persen', NULL, ''),
(115, 2, 6, 'TRN2112220010', 57000, 100000, 43000, 'tunai', '21-12-2022', '21:25:40', '12', '2022', 1, '02', 'Baru', 0, 0, 0, 'persen', NULL, ''),
(116, 2, 6, 'TRN2112220011', 63500, 100000, 36500, 'tunai', '21-12-2022', '21:24:39', '12', '2022', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(118, 2, 6, 'TRN2112220012', 19000, 19000, 0, 'tunai', '21-12-2022', '21:52:33', '12', '2022', 1, '11', 'Alvia', 0, 0, 0, 'persen', NULL, '0'),
(119, 2, 6, 'TRN2112220013', 11000, 11000, 0, 'tunai', '21-12-2022', '21:53:11', '12', '2022', 1, '11', '11', 0, 0, 0, 'persen', NULL, '0'),
(120, 2, 6, 'TRN2112220014', 17000, 17000, 0, 'tunai', '21-12-2022', '21:54:13', '12', '2022', 1, '13', '13', 0, 0, 0, 'persen', NULL, '0'),
(121, 2, 6, 'TRN2112220015', 24000, 25000, 1000, 'tunai', '21-12-2022', '22:37:18', '12', '2022', 1, '01', 'TW', 0, 0, 0, 'persen', NULL, '0'),
(122, 2, 6, 'TRN2212220001', 67000, 67000, 0, 'tunai', '22-12-2022', '20:16:37', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(123, 2, 6, 'TRN2212220002', 42000, 42000, 0, 'tunai', '22-12-2022', '20:16:57', '12', '2022', 1, '02', 'Ibu2', 0, 0, 0, 'persen', NULL, ''),
(124, 2, 6, 'TRN2212220003', 47500, 47500, 0, 'tunai', '22-12-2022', '20:17:17', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(125, 2, 6, 'TRN2212220004', 41000, 50000, 9000, 'tunai', '22-12-2022', '20:21:04', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(126, 2, 6, 'TRN2212220005', 94000, 94000, 0, 'tunai', '22-12-2022', '20:13:33', '12', '2022', 1, '07', 'Mama', 0, 0, 0, 'persen', NULL, ''),
(128, 2, 6, 'TRN2212220007', 22000, 52000, 30000, 'tunai', '22-12-2022', '20:02:05', '12', '2022', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(129, 2, 6, 'TRN2212220008', 45000, 50000, 5000, 'tunai', '22-12-2022', '20:08:03', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(130, 2, 6, 'TRN2212220009', 17000, 50000, 33000, 'tunai', '22-12-2022', '20:18:05', '12', '2022', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(131, 2, 6, 'TRN2212220010', 25000, 25000, 0, 'tunai', '22-12-2022', '20:41:45', '12', '2022', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(132, 2, 6, 'TRN2212220011', 16000, 16000, 0, 'tunai', '22-12-2022', '20:19:45', '12', '2022', 1, '11', 'Alvia', 0, 0, 0, 'persen', NULL, ''),
(133, 2, 6, 'TRN2212220012', 4000, 4000, 0, 'tunai', '22-12-2022', '22:28:31', '12', '2022', 1, '01', 'Firman', 0, 0, 0, 'persen', NULL, '0'),
(136, 2, 6, 'TRN2312220003', 152000, 152000, 0, 'tunai', '23-12-2022', '15:30:57', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(137, 2, 6, 'TRN2312220004', 20000, 20000, 0, 'tunai', '23-12-2022', '16:11:58', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(140, 2, 6, 'TRN2312220006', 44000, 44000, 0, 'tunai', '23-12-2022', '19:55:46', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(141, 2, 6, 'TRN2312220007', 6000, 6000, 0, 'tunai', '23-12-2022', '19:58:49', '12', '2022', 1, '07', 'Udin', 0, 0, 0, 'persen', NULL, '0'),
(142, 2, 6, 'TRN2312220008', 78000, 100000, 22000, 'tunai', '23-12-2022', '20:58:18', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(144, 2, 6, 'TRN2312220010', 13000, 13000, 0, 'tunai', '23-12-2022', '20:59:53', '12', '2022', 1, '08', 'Firman', 0, 0, 0, 'persen', NULL, ''),
(145, 2, 6, 'TRN2312220011', 30000, 57000, 27000, 'tunai', '23-12-2022', '21:45:25', '12', '2022', 1, '11', '11', 0, 0, 0, 'persen', NULL, '0'),
(146, 2, 6, 'TRN2312220012', 55500, 100000, 44500, 'tunai', '23-12-2022', '22:50:34', '12', '2022', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(147, 2, 6, 'TRN2412220001', 39000, 39000, 0, 'tunai', '24-12-2022', '18:53:06', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(149, 2, 6, 'TRN2412220003', 146000, 200000, 54000, 'tunai', '24-12-2022', '20:23:34', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(150, 2, 6, 'TRN2412220004', 52000, 52000, 0, 'tunai', '24-12-2022', '20:37:50', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(152, 2, 6, 'TRN2412220006', 30000, 30000, 0, 'tunai', '24-12-2022', '23:04:15', '12', '2022', 1, '05', 'Teman vita', 0, 0, 0, 'persen', NULL, ''),
(153, 2, 6, 'TRN2412220007', 46000, 100000, 54000, 'tunai', '24-12-2022', '21:43:08', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(155, 2, 6, 'TRN2412220009', 59000, 59000, 0, 'tunai', '24-12-2022', '21:39:14', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(156, 2, 6, 'TRN2412220010', 22000, 22000, 0, 'tunai', '24-12-2022', '20:15:13', '12', '2022', 1, '05', 'Axel', 0, 0, 0, 'persen', NULL, '0'),
(157, 2, 6, 'TRN2412220011', 25000, 25000, 0, 'tunai', '24-12-2022', '22:49:51', '12', '2022', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(158, 2, 6, 'TRN2412220012', 176000, 200000, 24000, 'tunai', '24-12-2022', '21:56:12', '12', '2022', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(159, 2, 6, 'TRN2412220013', 35000, 50000, 15000, 'tunai', '24-12-2022', '21:39:53', '12', '2022', 1, '11', 'Mbak fini', 0, 0, 0, 'persen', NULL, ''),
(161, 2, 6, 'TRN2512220001', 40000, 40000, 0, 'tunai', '25-12-2022', '17:53:28', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(162, 2, 6, 'TRN2512220002', 26000, 26000, 0, 'tunai', '25-12-2022', '18:18:06', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(164, 2, 6, 'TRN2512220004', 177500, 200000, 22500, 'tunai', '25-12-2022', '19:25:40', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(165, 2, 6, 'TRN2512220005', 58000, 58000, 0, 'tunai', '25-12-2022', '21:06:12', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(166, 2, 6, 'TRN2512220006', 21000, 50000, 29000, 'tunai', '25-12-2022', '20:17:13', '12', '2022', 1, '11', 'TW ', 0, 0, 0, 'persen', NULL, ''),
(167, 2, 6, 'TRN2512220007', 26000, 50000, 24000, 'tunai', '25-12-2022', '20:33:52', '12', '2022', 1, '13', '13', 0, 0, 0, 'persen', NULL, ''),
(168, 2, 6, 'TRN2512220008', 44000, 44000, 0, 'tunai', '25-12-2022', '21:07:45', '12', '2022', 1, '12', '12', 0, 0, 0, 'persen', NULL, ''),
(169, 2, 6, 'TRN2512220009', 35000, 35000, 0, 'tunai', '25-12-2022', '22:45:41', '12', '2022', 1, '14', '14', 0, 0, 0, 'persen', NULL, ''),
(170, 2, 6, 'TRN2512220010', 55000, 55000, 0, 'tunai', '25-12-2022', '22:33:29', '12', '2022', 1, '15', '15', 0, 0, 0, 'persen', NULL, ''),
(171, 2, 6, 'TRN2512220011', 23000, 23000, 0, 'tunai', '25-12-2022', '22:49:35', '12', '2022', 1, '16', '16', 0, 0, 0, 'persen', NULL, ''),
(172, 2, 6, 'TRN2512220012', 61000, 61000, 0, 'tunai', '25-12-2022', '22:48:57', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(174, 2, 6, 'TRN2712220001', 34000, 34000, 0, 'tunai', '27-12-2022', '13:31:11', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(175, 2, 6, 'TRN2712220002', 51000, 51000, 0, 'tunai', '27-12-2022', '19:06:51', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(176, 2, 6, 'TRN2712220003', 35000, 35000, 0, 'tunai', '27-12-2022', '19:07:06', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(177, 2, 6, 'TRN2712220004', 11000, 11000, 0, 'tunai', '27-12-2022', '19:35:33', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(178, 2, 6, 'TRN2712220005', 10000, 10000, 0, 'tunai', '27-12-2022', '20:13:46', '12', '2022', 1, '06', 'Tw', 0, 0, 0, 'persen', NULL, '0'),
(179, 2, 6, 'TRN2712220006', 54000, 54000, 0, 'tunai', '27-12-2022', '21:03:25', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(180, 2, 6, 'TRN2712220007', 34000, 50000, 16000, 'tunai', '27-12-2022', '21:41:03', '12', '2022', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(181, 2, 6, 'TRN2712220008', 31000, 31000, 0, 'tunai', '27-12-2022', '20:45:16', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(182, 2, 6, 'TRN2712220009', 97000, 100000, 3000, 'tunai', '27-12-2022', '21:34:32', '12', '2022', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(183, 2, 6, 'TRN2712220010', 28000, 28000, 0, 'tunai', '27-12-2022', '22:35:52', '12', '2022', 1, '10', 'Alvia', 0, 0, 0, 'persen', NULL, ''),
(184, 2, 6, 'TRN2812220001', 134000, 150000, 16000, 'tunai', '28-12-2022', '20:26:37', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(185, 2, 6, 'TRN2812220002', 23000, 23000, 0, 'tunai', '28-12-2022', '21:08:47', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(186, 2, 6, 'TRN2812220003', 43000, 43000, 0, 'tunai', '28-12-2022', '23:06:21', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(187, 2, 6, 'TRN2812220004', 52000, 52000, 0, 'tunai', '28-12-2022', '23:06:36', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(188, 2, 6, 'TRN2912220001', 20000, 20000, 0, 'tunai', '29-12-2022', '16:39:54', '12', '2022', 1, '01', '02', 0, 0, 0, 'persen', NULL, '0'),
(189, 2, 6, 'TRN2912220002', 54000, 60000, 6000, 'tunai', '29-12-2022', '17:42:05', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(190, 2, 6, 'TRN2912220003', 2500, 2500, 0, 'tunai', '29-12-2022', '17:44:52', '12', '2022', 1, '01', '09', 0, 0, 0, 'persen', NULL, '0'),
(192, 2, 6, 'TRN2912220005', 48000, 50000, 2000, 'tunai', '29-12-2022', '18:37:47', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(193, 2, 6, 'TRN2912220006', 37000, 50000, 13000, 'tunai', '29-12-2022', '19:10:40', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(194, 2, 6, 'TRN2912220007', 46000, 100000, 54000, 'tunai', '29-12-2022', '20:18:39', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(195, 2, 6, 'TRN2912220008', 30000, 30000, 0, 'tunai', '29-12-2022', '19:54:07', '12', '2022', 1, '06', 'Tw', 0, 0, 0, 'persen', NULL, ''),
(196, 2, 6, 'TRN2912220009', 40000, 40000, 0, 'tunai', '29-12-2022', '20:44:22', '12', '2022', 1, '07', 'Vita', 0, 0, 0, 'persen', NULL, ''),
(197, 2, 6, 'TRN2912220010', 45000, 45000, 0, 'tunai', '29-12-2022', '19:51:00', '12', '2022', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(198, 2, 6, 'TRN2912220011', 39000, 50000, 11000, 'tunai', '29-12-2022', '20:40:46', '12', '2022', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(199, 2, 6, 'TRN2912220012', 17000, 20000, 3000, 'tunai', '29-12-2022', '21:57:02', '12', '2022', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(200, 2, 6, 'TRN2912220013', 89000, 89000, 0, 'tunai', '29-12-2022', '22:32:37', '12', '2022', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(201, 2, 6, 'TRN2912220014', 20000, 20000, 0, 'tunai', '29-12-2022', '21:30:16', '12', '2022', 1, '12', '12', 0, 0, 0, 'persen', NULL, ''),
(202, 2, 6, 'TRN3012220001', 64000, 64000, 0, 'tunai', '30-12-2022', '20:24:56', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(203, 2, 6, 'TRN3012220002', 30500, 33500, 3000, 'tunai', '30-12-2022', '20:21:56', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(204, 2, 6, 'TRN3012220003', 22000, 22000, 0, 'tunai', '30-12-2022', '20:23:03', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(205, 2, 6, 'TRN3012220004', 10000, 10000, 0, 'tunai', '30-12-2022', '20:23:35', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(206, 2, 6, 'TRN3012220005', 10000, 10000, 0, 'tunai', '30-12-2022', '20:25:12', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(207, 2, 6, 'TRN3112220001', 10000, 10000, 0, 'tunai', '31-12-2022', '13:06:27', '12', '2022', 1, '01', 'TW', 0, 0, 0, 'persen', NULL, '0'),
(210, 2, 6, 'TRN3112220004', 26000, 26000, 0, 'tunai', '31-12-2022', '19:50:29', '12', '2022', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(211, 2, 6, 'TRN3112220005', 22000, 22000, 0, 'tunai', '31-12-2022', '21:12:58', '12', '2022', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(212, 2, 6, 'TRN3112220006', 108000, 108000, 0, 'tunai', '31-12-2022', '22:05:03', '12', '2022', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(213, 2, 6, 'TRN3112220007', 194000, 200000, 6000, 'tunai', '31-12-2022', '20:56:03', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(214, 2, 6, 'TRN3112220008', 20000, 20000, 0, 'tunai', '31-12-2022', '22:13:03', '12', '2022', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(215, 2, 6, 'TRN3112220009', 38000, 38000, 0, 'tunai', '31-12-2022', '23:31:04', '12', '2022', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(216, 2, 6, 'TRN3112220010', 30000, 50000, 20000, 'tunai', '31-12-2022', '23:25:27', '12', '2022', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(220, 2, 6, 'TRN0101230013', 85000, 100000, 15000, 'tunai', '01-01-2023', '19:44:30', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(221, 2, 6, 'TRN0101230014', 27000, 28000, 1000, 'tunai', '01-01-2023', '19:49:53', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(222, 2, 6, 'TRN0101230015', 97000, 97000, 0, 'tunai', '01-01-2023', '20:24:45', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(223, 2, 6, 'TRN0201230001', 17000, 22000, 5000, 'tunai', '02-01-2023', '18:21:20', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(224, 2, 6, 'TRN0201230002', 33000, 50000, 17000, 'tunai', '02-01-2023', '17:52:42', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(225, 2, 6, 'TRN0201230003', 64000, 100000, 36000, 'tunai', '02-01-2023', '21:26:36', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(226, 2, 6, 'TRN0201230004', 43000, 50000, 7000, 'tunai', '02-01-2023', '19:47:36', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(227, 2, 6, 'TRN0201230005', 67000, 100000, 33000, 'tunai', '02-01-2023', '21:19:25', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(228, 2, 6, 'TRN0201230006', 8000, 8000, 0, 'tunai', '02-01-2023', '20:10:00', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(229, 2, 6, 'TRN0301230001', 566000, 600000, 34000, 'tunai', '03-01-2023', '15:19:23', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(231, 2, 6, 'TRN0301230003', 55000, 55000, 0, 'tunai', '03-01-2023', '20:14:24', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(232, 2, 6, 'TRN0301230004', 342000, 350000, 8000, 'tunai', '03-01-2023', '18:17:14', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(233, 2, 6, 'TRN0301230005', 46000, 50000, 4000, 'tunai', '03-01-2023', '18:02:29', '01', '2023', 1, '02', '02 ', 0, 0, 0, 'persen', NULL, ''),
(234, 2, 6, 'TRN0301230006', 91000, 100000, 9000, 'tunai', '03-01-2023', '17:54:50', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(235, 2, 6, 'TRN0301230007', 22000, 22000, 0, 'tunai', '03-01-2023', '20:04:28', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(236, 2, 6, 'TRN0301230008', 44000, 50000, 6000, 'tunai', '03-01-2023', '21:35:34', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(237, 2, 6, 'TRN0301230009', 33000, 50000, 17000, 'tunai', '03-01-2023', '20:40:06', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(238, 2, 6, 'TRN0301230010', 20000, 20000, 0, 'tunai', '03-01-2023', '20:17:20', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '20000'),
(239, 2, 6, 'TRN0301230011', 20000, 20000, 0, 'tunai', '03-01-2023', '20:19:35', '01', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, '0'),
(240, 2, 6, 'TRN0301230012', 12000, 12000, 0, 'tunai', '03-01-2023', '21:11:34', '01', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, '0'),
(243, 2, 6, 'TRN0401230001', 52000, 52000, 0, 'tunai', '04-01-2023', '19:35:36', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(245, 2, 6, 'TRN0401230002', 78000, 78000, 0, 'tunai', '04-01-2023', '19:35:49', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(246, 2, 6, 'TRN0401230003', 10000, 10000, 0, 'tunai', '04-01-2023', '19:36:00', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(247, 2, 6, 'TRN0401230004', 5000, 5000, 0, 'tunai', '04-01-2023', '19:36:11', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(248, 2, 6, 'TRN0401230005', 26000, 26000, 0, 'tunai', '04-01-2023', '22:29:05', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(249, 2, 6, 'TRN0501230001', 51000, 51000, 0, 'tunai', '05-01-2023', '16:01:45', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(250, 2, 6, 'TRN0501230002', 12000, 12000, 0, 'tunai', '05-01-2023', '20:36:02', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(251, 2, 6, 'TRN0501230003', 10000, 10000, 0, 'tunai', '05-01-2023', '22:03:00', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(252, 2, 6, 'TRN0501230004', 22000, 22000, 0, 'tunai', '05-01-2023', '22:02:36', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(253, 2, 6, 'TRN0601230001', 50000, 50000, 0, 'tunai', '06-01-2023', '12:25:54', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '50000'),
(254, 2, 6, 'TRN0601230002', 10000, 10000, 0, 'tunai', '06-01-2023', '15:04:31', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '10000'),
(255, 2, 6, 'TRN0601230003', 79000, 100000, 21000, 'tunai', '06-01-2023', '15:40:01', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(256, 2, 6, 'TRN0601230004', 75000, 75000, 0, 'tunai', '06-01-2023', '18:02:11', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(257, 2, 6, 'TRN0601230005', 20000, 20000, 0, 'tunai', '06-01-2023', '17:29:15', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(258, 2, 6, 'TRN0601230006', 14000, 14000, 0, 'tunai', '06-01-2023', '22:01:20', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(259, 2, 6, 'TRN0601230007', 31000, 31000, 0, 'tunai', '06-01-2023', '22:02:21', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '13000'),
(260, 2, 6, 'TRN0601230008', 32000, 32000, 0, 'tunai', '06-01-2023', '22:37:58', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(261, 2, 6, 'TRN0701230001', 26000, 26000, 0, 'tunai', '07-01-2023', '18:38:34', '01', '2023', 1, '01', 'Vita', 0, 0, 0, 'persen', NULL, ''),
(264, 2, 6, 'TRN0701230004', 29000, 29000, 0, 'tunai', '07-01-2023', '18:33:48', '01', '2023', 1, '03', 'Axel', 0, 0, 0, 'persen', NULL, '0'),
(265, 2, 6, 'TRN0701230005', 58000, 58000, 0, 'tunai', '07-01-2023', '19:25:38', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(266, 2, 6, 'TRN0701230006', 26000, 26000, 0, 'tunai', '07-01-2023', '21:15:45', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(267, 2, 6, 'TRN0701230007', 18000, 18000, 0, 'tunai', '07-01-2023', '20:57:35', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(268, 2, 6, 'TRN0701230008', 68000, 100000, 32000, 'tunai', '07-01-2023', '22:27:42', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(269, 2, 6, 'TRN0701230009', 42000, 50000, 8000, 'tunai', '07-01-2023', '21:49:04', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(270, 2, 6, 'TRN0701230010', 31500, 31500, 0, 'tunai', '07-01-2023', '21:16:06', '01', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(271, 2, 6, 'TRN0701230011', 71500, 71500, 0, 'tunai', '07-01-2023', '22:55:08', '01', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(272, 2, 6, 'TRN0701230012', 25500, 25500, 0, 'tunai', '07-01-2023', '22:55:30', '01', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(273, 2, 6, 'TRN0701230013', 61000, 61000, 0, 'tunai', '07-01-2023', '22:40:03', '01', '2023', 1, '13', '13', 0, 0, 0, 'persen', NULL, ''),
(274, 2, 6, 'TRN0701230014', 28000, 30000, 2000, 'tunai', '07-01-2023', '23:15:08', '01', '2023', 1, '14', '14', 0, 0, 0, 'persen', NULL, ''),
(275, 2, 6, 'TRN0701230015', 27000, 27000, 0, 'tunai', '07-01-2023', '23:16:16', '01', '2023', 1, '15', '15', 0, 0, 0, 'persen', NULL, ''),
(276, 2, 6, 'TRN0701230016', 19000, 19000, 0, 'tunai', '07-01-2023', '22:44:10', '01', '2023', 1, '16', '16', 0, 0, 0, 'persen', NULL, '0'),
(277, 2, 6, 'TRN0701230017', 64000, 64000, 0, 'tunai', '07-01-2023', '22:48:42', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(278, 2, 6, 'TRN0801230001', 20000, 20000, 0, 'tunai', '08-01-2023', '13:41:03', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(279, 2, 6, 'TRN0801230002', 41000, 41000, 0, 'tunai', '08-01-2023', '13:41:20', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(280, 2, 6, 'TRN0801230003', 15000, 15000, 0, 'tunai', '08-01-2023', '15:41:41', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(281, 2, 6, 'TRN0801230004', 23000, 23000, 0, 'tunai', '08-01-2023', '18:00:51', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(282, 2, 6, 'TRN0801230005', 52000, 52000, 0, 'tunai', '08-01-2023', '17:43:10', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(283, 2, 6, 'TRN0801230006', 51000, 51000, 0, 'tunai', '08-01-2023', '19:27:36', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(284, 2, 6, 'TRN0801230007', 38000, 38000, 0, 'tunai', '08-01-2023', '22:00:16', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '8000'),
(286, 2, 6, 'TRN0801230008', 29000, 29000, 0, 'tunai', '08-01-2023', '22:55:09', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(287, 2, 6, 'TRN1001230001', 67000, 67000, 0, 'tunai', '10-01-2023', '22:14:44', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(288, 2, 6, 'TRN1001230002', 74000, 74000, 0, 'tunai', '10-01-2023', '22:15:59', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(289, 2, 6, 'TRN1001230003', 42000, 42000, 0, 'tunai', '10-01-2023', '22:16:28', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(290, 2, 6, 'TRN1001230004', 10000, 10000, 0, 'tunai', '10-01-2023', '22:16:56', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(291, 2, 6, 'TRN1101230001', 10000, 10000, 0, 'tunai', '11-01-2023', '16:05:00', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(292, 2, 6, 'TRN1101230002', 59000, 59000, 0, 'tunai', '11-01-2023', '17:21:26', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(293, 2, 6, 'TRN1101230003', 81000, 81000, 0, 'tunai', '11-01-2023', '17:21:44', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(294, 2, 6, 'TRN1101230004', 33000, 50000, 17000, 'tunai', '11-01-2023', '16:18:56', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(295, 2, 6, 'TRN1101230005', 25000, 25000, 0, 'tunai', '11-01-2023', '17:22:37', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(296, 2, 6, 'TRN1101230006', 53000, 53000, 0, 'tunai', '11-01-2023', '19:01:12', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(297, 2, 6, 'TRN1101230007', 31000, 50000, 19000, 'tunai', '11-01-2023', '19:20:45', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(298, 2, 6, 'TRN1101230008', 40000, 40000, 0, 'tunai', '11-01-2023', '21:44:50', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(299, 2, 6, 'TRN1101230009', 37000, 100000, 63000, 'tunai', '11-01-2023', '21:09:52', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(301, 2, 6, 'TRN1201230002', 62500, 62500, 0, 'tunai', '12-01-2023', '17:56:45', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '10000'),
(302, 2, 6, 'TRN1201230003', 32000, 32000, 0, 'tunai', '12-01-2023', '17:57:52', '01', '2023', 1, '02', '02 ', 0, 0, 0, 'persen', NULL, '10000'),
(303, 2, 6, 'TRN1201230004', 17000, 102000, 85000, 'tunai', '12-01-2023', '18:27:45', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(304, 2, 6, 'TRN1201230005', 40500, 50000, 9500, 'tunai', '12-01-2023', '22:10:38', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(305, 2, 6, 'TRN1201230006', 33000, 33000, 0, 'tunai', '12-01-2023', '21:48:19', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(306, 2, 6, 'TRN1201230007', 43000, 100000, 57000, 'tunai', '12-01-2023', '22:01:39', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(307, 2, 6, 'TRN1201230008', 42500, 50000, 7500, 'tunai', '12-01-2023', '22:32:27', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(308, 2, 6, 'TRN1301230001', 99000, 100000, 1000, 'tunai', '13-01-2023', '19:23:14', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(309, 2, 6, 'TRN1301230002', 15000, 20000, 5000, 'tunai', '13-01-2023', '18:42:50', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(310, 2, 6, 'TRN1301230003', 10000, 10000, 0, 'tunai', '13-01-2023', '18:44:45', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(312, 2, 6, 'TRN1301230004', 40000, 40000, 0, 'tunai', '13-01-2023', '18:48:49', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(313, 2, 6, 'TRN1301230005', 31000, 31000, 0, 'tunai', '13-01-2023', '19:16:42', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(314, 2, 6, 'TRN1301230006', 20000, 20000, 0, 'tunai', '13-01-2023', '20:25:10', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(315, 2, 6, 'TRN1301230007', 20000, 20000, 0, 'tunai', '13-01-2023', '21:04:55', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(316, 2, 6, 'TRN1301230008', 20000, 20000, 0, 'tunai', '13-01-2023', '20:15:58', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '0'),
(319, 2, 6, 'TRN1301230010', 20000, 20000, 0, 'tunai', '13-01-2023', '21:04:38', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, '0'),
(320, 2, 6, 'TRN1301230011', 39000, 100000, 61000, 'tunai', '13-01-2023', '21:09:50', '01', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(321, 2, 6, 'TRN1301230012', 42500, 100000, 57500, 'tunai', '13-01-2023', '22:07:31', '01', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(322, 2, 6, 'TRN1301230013', 29000, 29000, 0, 'tunai', '13-01-2023', '22:46:11', '01', '2023', 1, '12', '12', 0, 0, 0, 'persen', NULL, ''),
(323, 2, 6, 'TRN1301230014', 20000, 20000, 0, 'tunai', '13-01-2023', '22:02:32', '01', '2023', 1, '13', '13', 0, 0, 0, 'persen', NULL, '0'),
(324, 2, 6, 'TRN1301230015', 14000, 14000, 0, 'tunai', '13-01-2023', '22:46:25', '01', '2023', 1, '14', '14', 0, 0, 0, 'persen', NULL, ''),
(325, 2, 6, 'TRN1301230016', 10000, 10000, 0, 'tunai', '13-01-2023', '22:57:56', '01', '2023', 1, '15', '15', 0, 0, 0, 'persen', NULL, '0'),
(326, 2, 6, 'TRN1401230001', 20000, 50000, 30000, 'tunai', '14-01-2023', '16:00:54', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(327, 2, 6, 'TRN1401230002', 60000, 60000, 0, 'tunai', '14-01-2023', '17:23:14', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, ''),
(331, 2, 6, 'TRN1501230001', 34000, 34000, 0, 'tunai', '15-01-2023', '17:46:12', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(332, 2, 6, 'TRN1501230002', 39000, 39000, 0, 'tunai', '15-01-2023', '17:46:59', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(333, 2, 6, 'TRN1501230003', 62000, 62000, 0, 'tunai', '15-01-2023', '17:48:29', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(334, 2, 6, 'TRN1501230004', 11000, 11000, 0, 'tunai', '15-01-2023', '17:49:41', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(335, 2, 6, 'TRN1501230005', 16000, 16000, 0, 'tunai', '15-01-2023', '17:50:33', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(336, 2, 6, 'TRN1501230006', 33000, 33000, 0, 'tunai', '15-01-2023', '17:52:38', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(337, 2, 6, 'TRN1501230007', 36000, 36000, 0, 'tunai', '15-01-2023', '17:54:15', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(338, 2, 6, 'TRN1501230008', 17500, 17500, 0, 'tunai', '15-01-2023', '17:59:19', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '0'),
(339, 2, 6, 'TRN1601230001', 77000, 77000, 0, 'tunai', '16-01-2023', '17:08:18', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(340, 2, 6, 'TRN1601230002', 15000, 15000, 0, 'tunai', '16-01-2023', '16:30:57', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(341, 2, 6, 'TRN1601230003', 14000, 14000, 0, 'tunai', '16-01-2023', '17:07:57', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(342, 2, 6, 'TRN1601230004', 13000, 13000, 0, 'tunai', '16-01-2023', '19:02:24', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(343, 2, 6, 'TRN1601230005', 37000, 50000, 13000, 'tunai', '16-01-2023', '20:32:46', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(344, 2, 6, 'TRN1601230006', 27500, 27500, 0, 'tunai', '16-01-2023', '22:48:22', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(345, 2, 6, 'TRN1601230007', 28000, 100000, 72000, 'tunai', '16-01-2023', '22:54:50', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(346, 2, 6, 'TRN1601230008', 5000, 5000, 0, 'tunai', '16-01-2023', '23:05:01', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '0'),
(347, 2, 6, 'TRN1701230001', 54000, 54000, 0, 'tunai', '17-01-2023', '11:41:55', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(348, 2, 6, 'TRN1701230002', 56500, 70000, 13500, 'tunai', '17-01-2023', '20:03:36', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(349, 2, 6, 'TRN1701230003', 10000, 10000, 0, 'tunai', '17-01-2023', '20:01:07', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(350, 2, 6, 'TRN1701230004', 50000, 50000, 0, 'tunai', '17-01-2023', '23:19:08', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(351, 2, 6, 'TRN1701230005', 46000, 50000, 4000, 'tunai', '17-01-2023', '21:58:02', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(352, 2, 6, 'TRN1701230006', 23000, 23000, 0, 'tunai', '17-01-2023', '22:50:43', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(353, 2, 6, 'TRN1701230007', 20000, 20000, 0, 'tunai', '17-01-2023', '21:26:48', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(354, 2, 6, 'TRN1701230008', 38000, 38000, 0, 'tunai', '17-01-2023', '21:12:11', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(355, 2, 6, 'TRN1701230009', 25000, 25000, 0, 'tunai', '17-01-2023', '23:18:04', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(356, 2, 6, 'TRN1701230010', 7000, 20000, 13000, 'tunai', '17-01-2023', '21:31:22', '01', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(357, 2, 6, 'TRN1701230011', 26000, 26000, 0, 'tunai', '17-01-2023', '22:43:29', '01', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(358, 2, 6, 'TRN1701230012', 30000, 30000, 0, 'tunai', '17-01-2023', '23:20:49', '01', '2023', 1, '12', '12', 0, 0, 0, 'persen', NULL, ''),
(360, 2, 6, 'TRN1901230002', 56000, 56000, 0, 'tunai', '19-01-2023', '12:48:56', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, ''),
(361, 2, 6, 'TRN1901230003', 10000, 10000, 0, 'tunai', '19-01-2023', '13:35:58', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(362, 2, 6, 'TRN1901230004', 129000, 150000, 21000, 'tunai', '19-01-2023', '15:01:32', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, ''),
(363, 2, 6, 'TRN1901230005', 99000, 100000, 1000, 'tunai', '19-01-2023', '17:35:43', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, ''),
(364, 2, 6, 'TRN1901230006', 10000, 10000, 0, 'tunai', '19-01-2023', '18:38:11', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, ''),
(365, 2, 6, 'TRN1901230007', 10000, 10000, 0, 'tunai', '19-01-2023', '18:38:23', '01', '2023', 1, '01', '03', 0, 0, 0, 'persen', NULL, ''),
(366, 2, 6, 'TRN1901230008', 40000, 40000, 0, 'tunai', '19-01-2023', '20:37:46', '01', '2023', 1, '01', '05', 0, 0, 0, 'persen', NULL, ''),
(367, 2, 6, 'TRN1901230009', 10000, 10000, 0, 'tunai', '19-01-2023', '20:42:25', '01', '2023', 1, '01', '05', 0, 0, 0, 'persen', NULL, ''),
(368, 2, 6, 'TRN1901230010', 25000, 25000, 0, 'tunai', '19-01-2023', '20:47:37', '01', '2023', 1, '01', '06', 0, 0, 0, 'persen', NULL, ''),
(369, 2, 6, 'TRN1901230011', 18000, 20000, 2000, 'tunai', '19-01-2023', '22:31:12', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, ''),
(370, 2, 6, 'TRN1901230012', 8000, 10000, 2000, 'tunai', '19-01-2023', '22:30:10', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, '0'),
(371, 2, 6, 'TRN2001230001', 20000, 20000, 0, 'tunai', '20-01-2023', '14:20:06', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(372, 2, 6, 'TRN2001230002', 14000, 14000, 0, 'tunai', '20-01-2023', '14:20:56', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(373, 2, 6, 'TRN2001230003', 56000, 56000, 0, 'tunai', '20-01-2023', '14:21:50', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(374, 2, 6, 'TRN2001230004', 24000, 24000, 0, 'tunai', '20-01-2023', '14:25:58', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(375, 2, 6, 'TRN2001230005', 39000, 50000, 11000, 'tunai', '20-01-2023', '17:12:23', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(376, 2, 6, 'TRN2001230006', 5000, 5000, 0, 'tunai', '20-01-2023', '16:44:24', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(377, 2, 6, 'TRN2001230007', 20000, 20000, 0, 'tunai', '20-01-2023', '17:28:34', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(378, 2, 6, 'TRN2001230008', 33000, 33000, 0, 'tunai', '20-01-2023', '16:51:49', '01', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '0'),
(379, 2, 6, 'TRN2001230009', 10000, 10000, 0, 'tunai', '20-01-2023', '21:34:07', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, '0'),
(380, 2, 6, 'TRN2001230010', 5000, 5000, 0, 'tunai', '20-01-2023', '21:52:21', '01', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, '0'),
(381, 2, 6, 'TRN2101230001', 12000, 12000, 0, 'tunai', '21-01-2023', '19:53:41', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(382, 2, 6, 'TRN2101230002', 32000, 32000, 0, 'tunai', '21-01-2023', '20:17:48', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(383, 2, 6, 'TRN2101230003', 35000, 35000, 0, 'tunai', '21-01-2023', '21:49:29', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(384, 2, 6, 'TRN2101230004', 52000, 100000, 48000, 'tunai', '21-01-2023', '22:49:56', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(385, 2, 6, 'TRN2101230005', 22000, 22000, 0, 'tunai', '21-01-2023', '22:53:59', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(386, 2, 6, 'TRN2101230006', 15000, 15000, 0, 'tunai', '21-01-2023', '22:40:53', '01', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(387, 2, 6, 'TRN2201230001', 36000, 36000, 0, 'tunai', '22-01-2023', '18:53:46', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(388, 2, 6, 'TRN2201230002', 30000, 30000, 0, 'tunai', '22-01-2023', '18:53:13', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(389, 2, 6, 'TRN2201230003', 15000, 15000, 0, 'tunai', '22-01-2023', '19:24:52', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(390, 2, 6, 'TRN2201230004', 20000, 20000, 0, 'tunai', '22-01-2023', '22:31:05', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(392, 2, 6, 'TRN2201230006', 34000, 34000, 0, 'tunai', '22-01-2023', '20:43:49', '01', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(394, 2, 6, 'TRN2201230008', 37000, 50000, 13000, 'tunai', '22-01-2023', '23:12:52', '01', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(395, 2, 6, 'TRN2401230001', 21000, 21000, 0, 'tunai', '24-01-2023', '20:18:56', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(396, 2, 6, 'TRN2401230002', 110500, 110500, 0, 'tunai', '24-01-2023', '21:45:08', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(397, 2, 6, 'TRN2401230003', 12000, 12000, 0, 'tunai', '24-01-2023', '20:18:38', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(398, 2, 6, 'TRN2501230001', 92500, 100000, 7500, 'tunai', '25-01-2023', '13:57:24', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(399, 2, 6, 'TRN2501230002', 55000, 55000, 0, 'tunai', '25-01-2023', '20:09:13', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(400, 2, 6, 'TRN2501230003', 20000, 20000, 0, 'tunai', '25-01-2023', '20:08:58', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(401, 2, 6, 'TRN2501230004', 20000, 20000, 0, 'tunai', '25-01-2023', '22:10:51', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(402, 2, 6, 'TRN2601230001', 148000, 148000, 0, 'tunai', '26-01-2023', '22:25:15', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(403, 2, 6, 'TRN2601230002', 18000, 100000, 82000, 'tunai', '26-01-2023', '20:59:16', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(404, 2, 6, 'TRN2701230001', 20000, 20000, 0, 'tunai', '27-01-2023', '21:52:44', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(405, 2, 6, 'TRN2701230002', 30000, 30000, 0, 'tunai', '27-01-2023', '22:53:22', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(406, 2, 6, 'TRN2801230001', 89000, 100000, 11000, 'tunai', '28-01-2023', '20:04:49', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(407, 2, 6, 'TRN2801230002', 20000, 20000, 0, 'tunai', '28-01-2023', '20:02:37', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0');
INSERT INTO `pembayaran` (`id`, `id_user`, `id_kasir`, `no_transaksi`, `nilai_transaksi`, `dibayar`, `kembali`, `jenis_pembayaran`, `tanggal`, `waktu`, `bulan`, `tahun`, `status`, `nama_meja`, `atas_nama`, `status_dapur`, `status_diskon`, `diskon`, `tipe_diskon`, `uniqcode`, `nilai_total_laba`) VALUES
(408, 2, 6, 'TRN2801230003', 12000, 12000, 0, 'tunai', '28-01-2023', '20:03:09', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(409, 2, 6, 'TRN2801230004', 12000, 12000, 0, 'tunai', '28-01-2023', '22:50:57', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(410, 2, 6, 'TRN3001230001', 36000, 36000, 0, 'tunai', '30-01-2023', '14:23:26', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(411, 2, 6, 'TRN3001230002', 15000, 15000, 0, 'tunai', '30-01-2023', '14:24:01', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(412, 2, 6, 'TRN3001230003', 10000, 10000, 0, 'tunai', '30-01-2023', '17:05:10', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(413, 2, 6, 'TRN3001230004', 23000, 23000, 0, 'tunai', '30-01-2023', '19:29:36', '01', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(414, 2, 6, 'TRN3101230001', 59500, 59500, 0, 'tunai', '31-01-2023', '21:55:08', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(415, 2, 6, 'TRN3101230002', 36000, 36000, 0, 'tunai', '31-01-2023', '21:56:29', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(418, 2, 6, 'TRN0102230002', 50000, 50000, 0, 'tunai', '01-02-2023', '21:03:08', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '8000'),
(419, 2, 6, 'TRN0102230003', 10000, 10000, 0, 'tunai', '01-02-2023', '21:03:38', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(420, 2, 6, 'TRN0102230004', 12000, 12000, 0, 'tunai', '01-02-2023', '22:38:26', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(421, 2, 6, 'TRN0102230005', 10000, 10000, 0, 'tunai', '01-02-2023', '22:39:36', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(422, 2, 6, 'TRN0202230001', 44000, 44000, 0, 'tunai', '02-02-2023', '20:46:05', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '8000'),
(423, 2, 6, 'TRN0202230002', 10000, 10000, 0, 'tunai', '02-02-2023', '20:47:03', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(425, 2, 6, 'TRN0302230001', 10000, 10000, 0, 'tunai', '03-02-2023', '22:50:22', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(426, 2, 6, 'TRN0302230002', 25000, 25000, 0, 'tunai', '03-02-2023', '22:51:10', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(427, 2, 6, 'TRN0302230003', 18000, 18000, 0, 'tunai', '03-02-2023', '22:51:40', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(428, 2, 6, 'TRN0402230001', 58000, 58000, 0, 'tunai', '04-02-2023', '17:44:41', '02', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(429, 2, 6, 'TRN0402230002', 24000, 24000, 0, 'tunai', '04-02-2023', '17:40:01', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(430, 2, 6, 'TRN0402230003', 45000, 45000, 0, 'tunai', '04-02-2023', '17:40:55', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(431, 2, 6, 'TRN0402230004', 100000, 100000, 0, 'tunai', '04-02-2023', '17:41:41', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(432, 2, 6, 'TRN0402230005', 20000, 20000, 0, 'tunai', '04-02-2023', '21:22:33', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(433, 2, 6, 'TRN0402230006', 10000, 10000, 0, 'tunai', '04-02-2023', '17:42:37', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(434, 2, 6, 'TRN0402230007', 63000, 63000, 0, 'tunai', '04-02-2023', '20:25:10', '02', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(435, 2, 6, 'TRN0402230008', 48000, 48000, 0, 'tunai', '04-02-2023', '21:22:45', '02', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(436, 2, 6, 'TRN0402230009', 10000, 10000, 0, 'tunai', '04-02-2023', '22:05:43', '02', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, '0'),
(437, 2, 6, 'TRN0402230010', 10000, 10000, 0, 'tunai', '04-02-2023', '22:06:08', '02', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, '0'),
(438, 2, 6, 'TRN0402230011', 60000, 60000, 0, 'tunai', '04-02-2023', '22:46:46', '02', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(439, 2, 6, 'TRN0402230012', 14000, 14000, 0, 'tunai', '04-02-2023', '23:34:41', '02', '2023', 1, '12', '12', 0, 0, 0, 'persen', NULL, ''),
(440, 2, 6, 'TRN0502230001', 19000, 19000, 0, 'tunai', '05-02-2023', '19:30:50', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(441, 2, 6, 'TRN0502230002', 5000, 5000, 0, 'tunai', '05-02-2023', '19:31:02', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(442, 2, 6, 'TRN0502230003', 13000, 13000, 0, 'tunai', '05-02-2023', '18:29:36', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(443, 2, 6, 'TRN0502230004', 52000, 55000, 3000, 'tunai', '05-02-2023', '21:32:03', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(444, 2, 6, 'TRN0502230005', 100000, 100000, 0, 'tunai', '05-02-2023', '18:31:22', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(445, 2, 6, 'TRN0502230006', 123000, 150000, 27000, 'tunai', '05-02-2023', '21:17:35', '02', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(446, 2, 6, 'TRN0502230007', 10000, 10000, 0, 'tunai', '05-02-2023', '19:25:33', '02', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(447, 2, 6, 'TRN0502230008', 21500, 21500, 0, 'tunai', '05-02-2023', '22:29:54', '02', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(448, 2, 6, 'TRN0502230009', 12000, 12000, 0, 'tunai', '05-02-2023', '22:30:06', '02', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(449, 2, 6, 'TRN0502230010', 27000, 27000, 0, 'tunai', '05-02-2023', '22:01:59', '02', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, '0'),
(450, 2, 6, 'TRN0502230011', 10000, 10000, 0, 'tunai', '05-02-2023', '22:52:06', '02', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(451, 2, 6, 'TRN0502230012', 16000, 16000, 0, 'tunai', '05-02-2023', '22:04:44', '02', '2023', 1, '12', '12', 0, 0, 0, 'persen', NULL, '0'),
(452, 2, 6, 'TRN0502230013', 26000, 26000, 0, 'tunai', '05-02-2023', '22:17:23', '02', '2023', 1, '13', '13', 0, 0, 0, 'persen', NULL, '0'),
(453, 2, 6, 'TRN0702230001', 10000, 10000, 0, 'tunai', '07-02-2023', '18:55:37', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(454, 2, 6, 'TRN0702230002', 15000, 15000, 0, 'tunai', '07-02-2023', '18:56:17', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(455, 2, 6, 'TRN0702230003', 18500, 18500, 0, 'tunai', '07-02-2023', '18:57:35', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(456, 2, 6, 'TRN0702230004', 66000, 100000, 34000, 'tunai', '07-02-2023', '22:37:14', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(457, 2, 6, 'TRN0702230005', 30000, 30000, 0, 'tunai', '07-02-2023', '18:58:53', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(458, 2, 6, 'TRN0702230006', 10000, 10000, 0, 'tunai', '07-02-2023', '22:30:37', '02', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(459, 2, 6, 'TRN0702230007', 12000, 12000, 0, 'tunai', '07-02-2023', '19:00:18', '02', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(460, 2, 6, 'TRN0702230008', 7500, 7500, 0, 'tunai', '07-02-2023', '22:30:53', '02', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(462, 2, 6, 'TRN0802230002', 15000, 15000, 0, 'tunai', '08-02-2023', '13:05:05', '02', '2023', 1, '01', '02', 0, 0, 0, 'persen', NULL, '0'),
(463, 2, 6, 'TRN0802230003', 41000, 41000, 0, 'tunai', '08-02-2023', '18:42:25', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(464, 2, 6, 'TRN0802230004', 13000, 13000, 0, 'tunai', '08-02-2023', '18:43:26', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(465, 2, 6, 'TRN0802230005', 14000, 14000, 0, 'tunai', '08-02-2023', '22:34:38', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(466, 2, 6, 'TRN0902230001', 26000, 26000, 0, 'tunai', '09-02-2023', '17:11:46', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(467, 2, 6, 'TRN0902230002', 116000, 116000, 0, 'tunai', '09-02-2023', '17:33:37', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(468, 2, 6, 'TRN0902230003', 34000, 34000, 0, 'tunai', '09-02-2023', '20:14:58', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(469, 2, 6, 'TRN0902230004', 60000, 60000, 0, 'tunai', '09-02-2023', '21:01:09', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(470, 2, 6, 'TRN0902230005', 20000, 20000, 0, 'tunai', '09-02-2023', '21:16:06', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(471, 2, 6, 'TRN0902230006', 44000, 50000, 6000, 'tunai', '09-02-2023', '21:15:44', '02', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(472, 2, 6, 'TRN1002230001', 77000, 100000, 23000, 'tunai', '10-02-2023', '19:31:36', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(473, 2, 6, 'TRN1002230002', 10000, 10000, 0, 'tunai', '10-02-2023', '19:10:10', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(474, 2, 6, 'TRN1002230003', 30000, 30000, 0, 'tunai', '10-02-2023', '19:27:07', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(475, 2, 6, 'TRN1002230004', 31000, 31000, 0, 'tunai', '10-02-2023', '19:28:51', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(476, 2, 6, 'TRN1002230005', 36000, 36000, 0, 'tunai', '10-02-2023', '21:47:43', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(478, 2, 6, 'TRN1102230001', 28000, 28000, 0, 'tunai', '11-02-2023', '18:59:07', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(479, 2, 6, 'TRN1102230002', 35000, 35000, 0, 'tunai', '11-02-2023', '19:00:14', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(480, 2, 6, 'TRN1102230003', 10000, 10000, 0, 'tunai', '11-02-2023', '19:01:20', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(481, 2, 6, 'TRN1102230004', 28000, 28000, 0, 'tunai', '11-02-2023', '19:39:21', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(482, 2, 6, 'TRN1102230005', 40000, 40000, 0, 'tunai', '11-02-2023', '22:17:30', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(483, 2, 6, 'TRN1102230006', 15000, 15000, 0, 'tunai', '11-02-2023', '20:14:28', '02', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(484, 2, 6, 'TRN1102230007', 30000, 30000, 0, 'tunai', '11-02-2023', '20:33:33', '02', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(485, 2, 6, 'TRN1102230008', 35000, 35000, 0, 'tunai', '11-02-2023', '22:48:38', '02', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, ''),
(486, 2, 6, 'TRN1102230009', 32000, 32000, 0, 'tunai', '11-02-2023', '22:50:42', '02', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, ''),
(487, 2, 6, 'TRN1102230010', 13000, 13000, 0, 'tunai', '11-02-2023', '22:51:00', '02', '2023', 1, '10', '10', 0, 0, 0, 'persen', NULL, ''),
(488, 2, 6, 'TRN1102230011', 42000, 42000, 0, 'tunai', '11-02-2023', '22:17:45', '02', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, ''),
(489, 2, 6, 'TRN1202230001', 41000, 41000, 0, 'tunai', '12-02-2023', '22:17:00', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(490, 2, 6, 'TRN1302230001', 42000, 42000, 0, 'tunai', '13-02-2023', '20:07:43', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(491, 2, 6, 'TRN1302230002', 35000, 35000, 0, 'tunai', '13-02-2023', '20:20:32', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(492, 2, 6, 'TRN1302230003', 102000, 102000, 0, 'tunai', '13-02-2023', '21:23:36', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(493, 2, 6, 'TRN1302230004', 80000, 80000, 0, 'tunai', '13-02-2023', '22:32:06', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(494, 2, 6, 'TRN1402230001', 57500, 57500, 0, 'tunai', '14-02-2023', '19:55:50', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(495, 2, 6, 'TRN1402230002', 14500, 14500, 0, 'tunai', '14-02-2023', '19:58:41', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(496, 2, 6, 'TRN1402230003', 14000, 14000, 0, 'tunai', '14-02-2023', '19:59:39', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(497, 2, 6, 'TRN1402230004', 39000, 39000, 0, 'tunai', '14-02-2023', '20:00:15', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(498, 2, 6, 'TRN1402230005', 4000, 4000, 0, 'tunai', '14-02-2023', '20:00:54', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(500, 2, 6, 'TRN1402230007', 18000, 18000, 0, 'tunai', '14-02-2023', '20:17:49', '02', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(501, 2, 6, 'TRN1402230008', 4000, 4000, 0, 'tunai', '14-02-2023', '20:19:15', '02', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '0'),
(502, 2, 6, 'TRN1402230009', 14000, 14000, 0, 'tunai', '14-02-2023', '20:20:14', '02', '2023', 1, '09', '09', 0, 0, 0, 'persen', NULL, '0'),
(504, 2, 6, 'TRN1402230011', 31500, 31500, 0, 'tunai', '14-02-2023', '20:48:42', '02', '2023', 1, '11', '11', 0, 0, 0, 'persen', NULL, '0'),
(506, 2, 6, 'TRN1502230001', 89000, 100000, 11000, 'tunai', '15-02-2023', '15:16:24', '02', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(507, 2, 6, 'TRN1502230002', 34000, 34000, 0, 'tunai', '15-02-2023', '20:03:09', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(508, 2, 6, 'TRN1502230003', 20000, 20000, 0, 'tunai', '15-02-2023', '20:01:54', '02', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(509, 2, 6, 'TRN1502230004', 55000, 55000, 0, 'tunai', '15-02-2023', '20:02:47', '02', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(510, 2, 6, 'TRN1602230001', 53000, 53000, 0, 'tunai', '16-02-2023', '21:54:33', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(511, 2, 6, 'TRN1602230002', 10000, 10000, 0, 'tunai', '16-02-2023', '21:55:11', '02', '2023', 1, '02', '02 ', 0, 0, 0, 'persen', NULL, '0'),
(512, 2, 6, 'TRN1602230003', 50000, 50000, 0, 'tunai', '16-02-2023', '21:57:26', '02', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(515, 2, 6, 'TRN1902230001', 31500, 31500, 0, 'tunai', '19-02-2023', '14:10:10', '02', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(516, 2, 6, 'TRN0103230001', 48000, 48000, 0, 'tunai', '01-03-2023', '18:50:01', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(517, 2, 6, 'TRN0103230002', 30000, 30000, 0, 'tunai', '01-03-2023', '18:51:18', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(518, 2, 6, 'TRN0103230003', 23000, 23000, 0, 'tunai', '01-03-2023', '18:52:01', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(519, 2, 6, 'TRN0103230004', 58000, 58000, 0, 'tunai', '01-03-2023', '21:10:21', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(520, 2, 6, 'TRN0103230005', 15000, 15000, 0, 'tunai', '01-03-2023', '21:10:56', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(521, 2, 6, 'TRN0103230006', 10000, 10000, 0, 'tunai', '01-03-2023', '22:29:22', '03', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(522, 2, 6, 'TRN0203230001', 48000, 48000, 0, 'tunai', '02-03-2023', '17:27:23', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(523, 2, 6, 'TRN0203230002', 11000, 11000, 0, 'tunai', '02-03-2023', '21:30:39', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(524, 2, 6, 'TRN0203230003', 30000, 30000, 0, 'tunai', '02-03-2023', '21:25:20', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(525, 2, 6, 'TRN0203230004', 24000, 24000, 0, 'tunai', '02-03-2023', '21:44:03', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(526, 2, 6, 'TRN0203230005', 15000, 15000, 0, 'tunai', '02-03-2023', '21:31:18', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(527, 2, 6, 'TRN0203230006', 13000, 13000, 0, 'tunai', '02-03-2023', '21:46:24', '03', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(528, 2, 6, 'TRN0303230001', 65000, 65000, 0, 'tunai', '03-03-2023', '22:47:17', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(529, 2, 6, 'TRN0403230001', 20000, 20000, 0, 'tunai', '04-03-2023', '17:49:59', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(530, 2, 6, 'TRN0403230002', 24000, 24000, 0, 'tunai', '04-03-2023', '17:50:49', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(531, 2, 6, 'TRN0403230003', 10000, 10000, 0, 'tunai', '04-03-2023', '21:02:06', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(533, 2, 6, 'TRN0503230001', 22500, 22500, 0, 'tunai', '05-03-2023', '21:56:22', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(534, 2, 6, 'TRN0503230002', 35000, 35000, 0, 'tunai', '05-03-2023', '21:57:18', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(536, 2, 6, 'TRN0703230001', 25000, 25000, 0, 'tunai', '07-03-2023', '22:19:24', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(537, 2, 6, 'TRN0703230002', 33000, 33000, 0, 'tunai', '07-03-2023', '22:20:11', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(538, 2, 6, 'TRN0703230003', 20000, 20000, 0, 'tunai', '07-03-2023', '22:25:11', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(539, 2, 6, 'TRN0703230004', 22000, 22000, 0, 'tunai', '07-03-2023', '22:25:43', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(540, 2, 6, 'TRN0803230001', 30000, 30000, 0, 'tunai', '08-03-2023', '22:21:38', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(541, 2, 6, 'TRN0803230002', 24000, 24000, 0, 'tunai', '08-03-2023', '22:23:01', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(542, 2, 6, 'TRN0903230001', 30000, 30000, 0, 'tunai', '09-03-2023', '18:05:48', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(543, 2, 6, 'TRN0903230002', 10000, 10000, 0, 'tunai', '09-03-2023', '18:06:23', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(545, 2, 6, 'TRN0903230004', 12000, 12000, 0, 'tunai', '09-03-2023', '18:07:34', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(546, 2, 6, 'TRN0903230005', 32000, 32000, 0, 'tunai', '09-03-2023', '21:46:20', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(547, 2, 6, 'TRN1103230001', 16000, 16000, 0, 'tunai', '11-03-2023', '22:11:17', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(548, 2, 6, 'TRN1103230002', 20000, 20000, 0, 'tunai', '11-03-2023', '22:11:52', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(549, 2, 6, 'TRN1103230003', 25000, 25000, 0, 'tunai', '11-03-2023', '22:12:23', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(550, 2, 6, 'TRN1103230004', 23000, 23000, 0, 'tunai', '11-03-2023', '23:20:15', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(551, 2, 6, 'TRN1103230005', 57000, 57000, 0, 'tunai', '11-03-2023', '23:50:13', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(552, 2, 6, 'TRN1203230001', 38000, 38000, 0, 'tunai', '12-03-2023', '21:54:55', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(553, 2, 6, 'TRN1203230002', 5000, 5000, 0, 'tunai', '12-03-2023', '20:17:26', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(554, 2, 6, 'TRN1203230003', 12000, 12000, 0, 'tunai', '12-03-2023', '21:55:22', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(555, 2, 6, 'TRN1303230001', 40000, 40000, 0, 'tunai', '13-03-2023', '19:53:35', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(556, 2, 6, 'TRN1303230002', 18000, 18000, 0, 'tunai', '13-03-2023', '19:55:32', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(557, 2, 6, 'TRN1303230003', 30000, 30000, 0, 'tunai', '13-03-2023', '19:56:13', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(558, 2, 6, 'TRN1303230004', 19000, 19000, 0, 'tunai', '13-03-2023', '19:56:52', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(559, 2, 6, 'TRN1303230005', 12000, 12000, 0, 'tunai', '13-03-2023', '23:59:57', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(560, 2, 6, 'TRN1403230001', 29000, 29000, 0, 'tunai', '14-03-2023', '22:06:44', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(561, 2, 6, 'TRN1403230002', 10000, 10000, 0, 'tunai', '14-03-2023', '22:07:06', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(562, 2, 6, 'TRN1503230001', 31000, 31000, 0, 'tunai', '15-03-2023', '22:14:08', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(563, 2, 6, 'TRN1503230002', 22000, 22000, 0, 'tunai', '15-03-2023', '22:14:41', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(564, 2, 6, 'TRN1503230003', 34000, 34000, 0, 'tunai', '15-03-2023', '22:16:39', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(565, 2, 6, 'TRN1503230004', 8000, 8000, 0, 'tunai', '15-03-2023', '22:17:11', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(566, 2, 6, 'TRN1503230005', 40000, 40000, 0, 'tunai', '15-03-2023', '22:18:19', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(567, 2, 6, 'TRN1503230006', 49000, 49000, 0, 'tunai', '15-03-2023', '22:19:03', '03', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(568, 2, 6, 'TRN1603230001', 20000, 20000, 0, 'tunai', '16-03-2023', '21:59:51', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(569, 2, 6, 'TRN1603230002', 14000, 14000, 0, 'tunai', '16-03-2023', '22:00:23', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(571, 2, 6, 'TRN1703230001', 130500, 130500, 0, 'tunai', '17-03-2023', '18:04:02', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(572, 2, 6, 'TRN1703230002', 5000, 5000, 0, 'tunai', '17-03-2023', '18:04:24', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(573, 2, 6, 'TRN1703230003', 6000, 6000, 0, 'tunai', '17-03-2023', '18:11:25', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(574, 2, 6, 'TRN1703230004', 10000, 10000, 0, 'tunai', '17-03-2023', '19:39:39', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(575, 2, 6, 'TRN1703230005', 10000, 10000, 0, 'tunai', '17-03-2023', '19:40:12', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(576, 2, 6, 'TRN1703230006', 30000, 30000, 0, 'tunai', '17-03-2023', '19:40:35', '03', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(577, 2, 6, 'TRN1803230001', 28000, 28000, 0, 'tunai', '18-03-2023', '22:18:57', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(578, 2, 6, 'TRN1803230002', 30000, 30000, 0, 'tunai', '18-03-2023', '22:19:43', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(579, 2, 6, 'TRN1803230003', 28000, 28000, 0, 'tunai', '18-03-2023', '23:23:20', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(580, 2, 6, 'TRN1803230004', 36000, 36000, 0, 'tunai', '18-03-2023', '23:23:35', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(581, 2, 6, 'TRN1903230001', 17000, 17000, 0, 'tunai', '19-03-2023', '21:23:53', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(582, 2, 6, 'TRN1903230002', 10000, 10000, 0, 'tunai', '19-03-2023', '19:01:24', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(583, 2, 6, 'TRN1903230003', 50000, 50000, 0, 'tunai', '19-03-2023', '19:09:49', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(584, 2, 6, 'TRN1903230004', 5000, 5000, 0, 'tunai', '19-03-2023', '21:24:59', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(585, 2, 6, 'TRN1903230005', 12000, 12000, 0, 'tunai', '19-03-2023', '21:26:15', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(586, 2, 6, 'TRN1903230006', 29000, 29000, 0, 'tunai', '19-03-2023', '22:12:36', '03', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, ''),
(587, 2, 6, 'TRN1903230007', 10000, 10000, 0, 'tunai', '19-03-2023', '22:12:47', '03', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, ''),
(588, 2, 6, 'TRN1903230008', 21000, 21000, 0, 'tunai', '19-03-2023', '21:27:41', '03', '2023', 1, '08', '08', 0, 0, 0, 'persen', NULL, '0'),
(589, 2, 6, 'TRN2003230001', 20000, 20000, 0, 'tunai', '20-03-2023', '19:08:34', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(590, 2, 6, 'TRN2003230002', 32000, 32000, 0, 'tunai', '20-03-2023', '19:13:51', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(592, 2, 6, 'TRN2003230004', 13000, 13000, 0, 'tunai', '20-03-2023', '19:17:17', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(593, 2, 6, 'TRN2003230005', 15000, 15000, 0, 'tunai', '20-03-2023', '19:17:59', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(594, 2, 6, 'TRN2003230006', 10000, 10000, 0, 'tunai', '20-03-2023', '19:18:46', '03', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(595, 2, 6, 'TRN2103230001', 12500, 12500, 0, 'tunai', '21-03-2023', '16:53:02', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(596, 2, 6, 'TRN2103230002', 126000, 126000, 0, 'tunai', '21-03-2023', '17:37:30', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(597, 2, 6, 'TRN2103230003', 44000, 44000, 0, 'tunai', '21-03-2023', '23:01:52', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(598, 2, 6, 'TRN2103230004', 128500, 128500, 0, 'tunai', '21-03-2023', '21:52:24', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(599, 2, 6, 'TRN2103230005', 10000, 10000, 0, 'tunai', '21-03-2023', '23:02:05', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, ''),
(600, 2, 6, 'TRN2203230001', 20000, 20000, 0, 'tunai', '22-03-2023', '18:01:11', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(601, 2, 6, 'TRN2203230002', 27000, 27000, 0, 'tunai', '22-03-2023', '18:01:47', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(602, 2, 6, 'TRN2203230003', 91000, 91000, 0, 'tunai', '22-03-2023', '18:02:17', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(603, 2, 6, 'TRN2503230001', 27000, 27000, 0, 'tunai', '25-03-2023', '17:46:13', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(604, 2, 6, 'TRN2503230002', 14000, 14000, 0, 'tunai', '25-03-2023', '22:41:48', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(605, 2, 6, 'TRN2503230003', 14000, 14000, 0, 'tunai', '25-03-2023', '22:29:21', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(606, 2, 6, 'TRN2503230004', 50000, 50000, 0, 'tunai', '25-03-2023', '23:14:20', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(607, 2, 6, 'TRN2603230001', 14000, 14000, 0, 'tunai', '26-03-2023', '18:12:34', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(608, 2, 6, 'TRN2603230002', 13000, 13000, 0, 'tunai', '26-03-2023', '18:12:57', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(609, 2, 6, 'TRN2603230003', 4000, 4000, 0, 'tunai', '26-03-2023', '22:22:29', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(610, 2, 6, 'TRN2603230004', 15000, 15000, 0, 'tunai', '26-03-2023', '22:22:59', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(611, 2, 6, 'TRN2703230001', 71000, 71000, 0, 'tunai', '27-03-2023', '21:42:56', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(612, 2, 6, 'TRN2703230002', 14000, 14000, 0, 'tunai', '27-03-2023', '21:09:15', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(614, 2, 6, 'TRN2703230004', 183500, 200000, 16500, 'tunai', '27-03-2023', '23:20:41', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(615, 2, 6, 'TRN2703230005', 46000, 46000, 0, 'tunai', '27-03-2023', '23:31:43', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(616, 2, 6, 'TRN2703230006', 12000, 12000, 0, 'tunai', '27-03-2023', '23:32:33', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(617, 2, 6, 'TRN2803230001', 14000, 14000, 0, 'tunai', '28-03-2023', '21:20:07', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(618, 2, 6, 'TRN2803230002', 27000, 27000, 0, 'tunai', '28-03-2023', '21:20:43', '03', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(619, 2, 6, 'TRN2803230003', 10000, 10000, 0, 'tunai', '28-03-2023', '21:21:04', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(621, 2, 6, 'TRN2903230002', 41000, 41000, 0, 'tunai', '29-03-2023', '21:26:18', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(622, 2, 6, 'TRN2903230003', 28000, 28000, 0, 'tunai', '29-03-2023', '22:07:24', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(623, 2, 6, 'TRN2903230004', 30000, 30000, 0, 'tunai', '29-03-2023', '22:09:01', '03', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(624, 2, 6, 'TRN2903230005', 10000, 10000, 0, 'tunai', '29-03-2023', '22:14:44', '03', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(625, 2, 6, 'TRN0204230001', 37000, 37000, 0, 'tunai', '02-04-2023', '17:39:53', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(629, 2, 6, 'TRN0404230001', 91000, 91000, 0, 'tunai', '04-04-2023', '21:41:30', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(630, 2, 6, 'TRN0404230002', 53000, 53000, 0, 'tunai', '04-04-2023', '22:20:57', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, ''),
(631, 2, 6, 'TRN0504230001', 47000, 47000, 0, 'tunai', '05-04-2023', '22:30:56', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(632, 2, 6, 'TRN0504230002', 44000, 44000, 0, 'tunai', '05-04-2023', '22:32:00', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(633, 2, 6, 'TRN0604230001', 23000, 23000, 0, 'tunai', '06-04-2023', '21:33:15', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(634, 2, 6, 'TRN0604230002', 33000, 33000, 0, 'tunai', '06-04-2023', '21:34:06', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(635, 2, 6, 'TRN0704230001', 139000, 139000, 0, 'tunai', '07-04-2023', '22:18:31', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(636, 2, 6, 'TRN0704230002', 39000, 39000, 0, 'tunai', '07-04-2023', '22:19:58', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(637, 2, 6, 'TRN0704230003', 37000, 37000, 0, 'tunai', '07-04-2023', '23:00:59', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, ''),
(638, 2, 6, 'TRN0704230004', 7000, 7000, 0, 'tunai', '07-04-2023', '23:01:10', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, ''),
(639, 2, 6, 'TRN0804230001', 76000, 76000, 0, 'tunai', '08-04-2023', '22:15:48', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(640, 2, 6, 'TRN0804230002', 48000, 48000, 0, 'tunai', '08-04-2023', '22:16:52', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(641, 2, 6, 'TRN0804230003', 26000, 26000, 0, 'tunai', '08-04-2023', '22:17:18', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(642, 2, 6, 'TRN0804230004', 48000, 48000, 0, 'tunai', '08-04-2023', '22:18:02', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(643, 2, 6, 'TRN1004230001', 44000, 44000, 0, 'tunai', '10-04-2023', '22:20:43', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(644, 2, 6, 'TRN1004230002', 22000, 22000, 0, 'tunai', '10-04-2023', '22:21:05', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(645, 2, 6, 'TRN1004230003', 12000, 12000, 0, 'tunai', '10-04-2023', '22:21:29', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(646, 2, 6, 'TRN1004230004', 16000, 16000, 0, 'tunai', '10-04-2023', '22:22:05', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(647, 2, 6, 'TRN1104230001', 30000, 30000, 0, 'tunai', '11-04-2023', '21:40:03', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(649, 2, 6, 'TRN1104230003', 34000, 34000, 0, 'tunai', '11-04-2023', '21:42:15', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(650, 2, 6, 'TRN1104230004', 50000, 50000, 0, 'tunai', '11-04-2023', '21:44:24', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(651, 2, 6, 'TRN1204230001', 66000, 66000, 0, 'tunai', '12-04-2023', '22:30:11', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, ''),
(652, 2, 6, 'TRN1204230002', 135000, 135000, 0, 'tunai', '12-04-2023', '21:24:10', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(653, 2, 6, 'TRN1204230003', 64000, 64000, 0, 'tunai', '12-04-2023', '21:25:24', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(654, 2, 6, 'TRN1304230001', 24000, 24000, 0, 'tunai', '13-04-2023', '21:39:09', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(655, 2, 6, 'TRN1304230002', 126000, 126000, 0, 'tunai', '13-04-2023', '21:41:05', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(656, 2, 6, 'TRN1304230003', 29000, 29000, 0, 'tunai', '13-04-2023', '21:42:10', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(657, 2, 6, 'TRN1304230004', 99000, 99000, 0, 'tunai', '13-04-2023', '21:43:08', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(658, 2, 6, 'TRN1404230001', 41000, 41000, 0, 'tunai', '14-04-2023', '20:27:32', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(659, 2, 6, 'TRN1404230002', 40000, 40000, 0, 'tunai', '14-04-2023', '20:29:08', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(660, 2, 6, 'TRN1404230003', 117000, 117000, 0, 'tunai', '14-04-2023', '20:30:30', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(661, 2, 6, 'TRN1404230004', 19000, 19000, 0, 'tunai', '14-04-2023', '20:31:11', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(662, 2, 6, 'TRN1404230005', 68000, 68000, 0, 'tunai', '14-04-2023', '20:33:16', '04', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(663, 2, 6, 'TRN1404230006', 50000, 50000, 0, 'tunai', '14-04-2023', '20:34:15', '04', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(664, 2, 6, 'TRN1404230007', 10000, 10000, 0, 'tunai', '14-04-2023', '20:34:47', '04', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(665, 2, 6, 'TRN2004230001', 67000, 67000, 0, 'tunai', '20-04-2023', '18:39:20', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(666, 2, 6, 'TRN2004230002', 25000, 25000, 0, 'tunai', '20-04-2023', '18:40:42', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(667, 2, 6, 'TRN2004230003', 51000, 51000, 0, 'tunai', '20-04-2023', '22:10:11', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(668, 2, 6, 'TRN2004230004', 42000, 42000, 0, 'tunai', '20-04-2023', '22:11:25', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(669, 2, 6, 'TRN2004230005', 15000, 15000, 0, 'tunai', '20-04-2023', '22:12:00', '04', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(670, 2, 6, 'TRN2004230006', 31000, 31000, 0, 'tunai', '20-04-2023', '22:13:27', '04', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '10000'),
(671, 2, 6, 'TRN3004230001', 78000, 78000, 0, 'tunai', '30-04-2023', '17:29:17', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(672, 2, 6, 'TRN3004230002', 80000, 80000, 0, 'tunai', '30-04-2023', '17:30:48', '04', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(673, 2, 6, 'TRN3004230003', 20000, 20000, 0, 'tunai', '30-04-2023', '20:59:55', '04', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(674, 2, 6, 'TRN3004230004', 12000, 12000, 0, 'tunai', '30-04-2023', '21:00:19', '04', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(676, 2, 6, 'TRN0105230002', 29000, 29000, 0, 'tunai', '01-05-2023', '21:12:32', '05', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(678, 2, 6, 'TRN0105230004', 34000, 34000, 0, 'tunai', '01-05-2023', '21:32:48', '05', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(679, 2, 6, 'TRN0305230001', 17000, 17000, 0, 'tunai', '03-05-2023', '19:46:38', '05', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(680, 2, 6, 'TRN0305230002', 22000, 22000, 0, 'tunai', '03-05-2023', '19:47:12', '05', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(681, 2, 6, 'TRN0305230003', 37000, 37000, 0, 'tunai', '03-05-2023', '21:38:07', '05', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(682, 2, 6, 'TRN0305230004', 25000, 25000, 0, 'tunai', '03-05-2023', '21:38:45', '05', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(683, 2, 6, 'TRN0505230001', 24000, 27000, 3000, 'tunai', '05-05-2023', '18:44:59', '05', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(684, 2, 6, 'TRN0505230002', 18500, 18500, 0, 'tunai', '05-05-2023', '18:46:29', '05', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(685, 2, 6, 'TRN0505230003', 36000, 36000, 0, 'tunai', '05-05-2023', '18:47:21', '05', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(686, 2, 6, 'TRN0505230004', 144000, 144000, 0, 'tunai', '05-05-2023', '18:51:33', '05', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(687, 2, 6, 'TRN0605230001', 7000, 7000, 0, 'tunai', '06-05-2023', '19:33:19', '05', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(688, 2, 6, 'TRN0605230002', 56500, 56500, 0, 'tunai', '06-05-2023', '19:34:16', '05', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(689, 2, 6, 'TRN0605230003', 24000, 24000, 0, 'tunai', '06-05-2023', '19:34:43', '05', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0'),
(690, 2, 6, 'TRN0605230004', 42000, 42000, 0, 'tunai', '06-05-2023', '19:35:28', '05', '2023', 1, '04', '04', 0, 0, 0, 'persen', NULL, '0'),
(691, 2, 6, 'TRN0605230005', 20000, 20000, 0, 'tunai', '06-05-2023', '23:09:53', '05', '2023', 1, '05', '05', 0, 0, 0, 'persen', NULL, '0'),
(692, 2, 6, 'TRN0605230006', 19000, 19000, 0, 'tunai', '06-05-2023', '23:10:27', '05', '2023', 1, '06', '06', 0, 0, 0, 'persen', NULL, '0'),
(693, 2, 6, 'TRN0605230007', 8000, 8000, 0, 'tunai', '06-05-2023', '23:11:22', '05', '2023', 1, '07', '07', 0, 0, 0, 'persen', NULL, '0'),
(694, 2, 6, 'TRN1005230001', 30000, 30000, 0, 'tunai', '10-05-2023', '12:34:21', '05', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(695, 2, 6, 'TRN1005230002', 33000, 33000, 0, 'tunai', '10-05-2023', '20:17:08', '05', '2023', 1, '02', '02', 0, 0, 0, 'persen', NULL, '0'),
(697, 2, 6, 'TRN1205230001', 34000, 34000, 0, 'tunai', '12-05-2023', '16:52:11', '05', '2023', 1, '01', '01', 0, 0, 0, 'persen', NULL, '0'),
(698, 2, 6, 'TRN1205230002', 27000, 0, 0, NULL, '12-05-2023', '16:52:56', '05', '2023', 0, '02', '02', 0, 0, 0, NULL, NULL, '0'),
(699, 2, 6, 'TRN1205230003', 15000, 15000, 0, 'tunai', '12-05-2023', '16:53:18', '05', '2023', 1, '03', '03', 0, 0, 0, 'persen', NULL, '0');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_detail`
--

CREATE TABLE `pembayaran_detail` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `id_pembayaran` int(15) DEFAULT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga_barang` varchar(255) DEFAULT NULL,
  `total_harga_barang` varchar(255) DEFAULT NULL,
  `jumlah_beli` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `uniqcode` varchar(100) DEFAULT NULL,
  `laba` varchar(255) DEFAULT '0',
  `total_laba` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pembayaran_detail`
--

INSERT INTO `pembayaran_detail` (`id`, `id_user`, `id_kasir`, `id_pembayaran`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(8, 2, 6, 6, 4, 'Roti Bakar', '10000', '30000', '3', '05-12-2022', '13:42:39', NULL, '2000', '6000'),
(9, 2, 6, 6, 5, 'Taro Ice', '10000', '20000', '2', '05-12-2022', '13:42:39', NULL, '2000', '4000'),
(10, 2, 6, 7, 4, 'Roti Bakar', '10000', '20000', '2', '05-12-2022', '13:52:43', NULL, '2000', '4000'),
(11, 2, 6, 7, 5, 'Taro Ice', '10000', '20000', '2', '05-12-2022', '13:52:43', NULL, '2000', '4000'),
(12, 2, 6, 8, 4, 'Roti Bakar', '10000', '10000', '1', '05-12-2022', '13:53:58', NULL, '2000', '2000'),
(13, 2, 6, 9, 8, 'Es Americano', '10000', '20000', '2', '05-12-2022', '13:56:45', NULL, '6000', '12000'),
(14, 2, 6, 10, 11, 'Roti maryam keju', '12000', '48000', '4', '05-12-2022', '14:20:02', NULL, '9000', '36000'),
(15, 2, 6, 11, 10, 'Roti maryam original ', '8000', '8000', '1', '05-12-2022', '14:22:58', NULL, '2000', '2000'),
(16, 2, 6, 12, 8, 'Es Americano', '10000', '10000', '1', '05-12-2022', '14:26:06', NULL, '6000', '6000'),
(17, 2, 6, 13, 11, 'Roti maryam keju', '12000', '12000', '1', '05-12-2022', '15:50:25', NULL, '9000', '9000'),
(18, 2, 6, 14, 11, 'Roti maryam original ', '8000', '8000', '1', '06-12-2022', '13:21:46', NULL, '0', '0'),
(19, 2, 6, 15, 11, 'Roti maryam original ', '8000', '8000', '1', '06-12-2022', '13:22:29', NULL, '0', '0'),
(20, 2, 6, 16, 11, 'Roti maryam original ', '8000', '8000', '1', '06-12-2022', '13:25:14', NULL, '0', '0'),
(21, 2, 6, 17, 11, 'Roti maryam original ', '8000', '8000', '1', '06-12-2022', '13:26:31', NULL, '0', '0'),
(22, 2, 6, 18, 11, 'Roti maryam original ', '8000', '8000', '1', '06-12-2022', '13:27:46', NULL, '0', '0'),
(23, 2, 6, 19, 11, 'Roti maryam original ', '8000', '8000', '1', '06-12-2022', '13:29:32', NULL, '0', '0'),
(24, 2, 6, 20, 13, 'Roti maryam keju', '12000', '12000', '1', '06-12-2022', '20:10:53', NULL, '0', '0'),
(25, 2, 6, 21, 14, 'Roti maryam spesial', '16000', '16000', '1', '08-12-2022', '15:51:31', NULL, '0', '0'),
(31, 2, 6, 25, 52, 'Mi goreng ori', '10000', '10000', '1', '13-12-2022', '16:15:06', NULL, '0', '0'),
(32, 2, 6, 25, 56, 'Mi nyemek', '15000', '15000', '1', '13-12-2022', '16:15:06', NULL, '0', '0'),
(33, 2, 6, 25, 72, 'Leci squash', '12000', '12000', '1', '13-12-2022', '16:15:06', NULL, '0', '0'),
(34, 2, 6, 25, 98, 'Kopi hitam', '5000', '5000', '1', '13-12-2022', '16:15:06', NULL, '0', '0'),
(36, 2, 6, 27, 92, 'Jeruk panas', '6000', '6000', '1', '13-12-2022', '20:03:18', NULL, '0', '0'),
(37, 2, 6, 28, 25, 'Seblak seafood', '15000', '15000', '1', '13-12-2022', '20:35:26', NULL, '0', '0'),
(38, 2, 6, 28, 76, 'Milk shake vanila', '15000', '15000', '1', '13-12-2022', '20:35:26', NULL, '0', '0'),
(39, 2, 6, 28, 81, 'Tea tarik', '8000', '8000', '1', '13-12-2022', '20:35:26', NULL, '0', '0'),
(40, 2, 6, 28, 20, 'Tahu walik', '15000', '15000', '1', '13-12-2022', '20:35:26', NULL, '0', '0'),
(41, 2, 6, 29, 20, 'Tahu walik', '15000', '15000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(42, 2, 6, 29, 30, 'Ceker judes', '13000', '13000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(43, 2, 6, 29, 85, 'Mangga', '10000', '10000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(44, 2, 6, 29, 87, 'Taro', '10000', '10000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(45, 2, 6, 29, 39, 'Soto ayam ', '10000', '10000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(46, 2, 6, 29, 88, 'Matcha', '10000', '10000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(47, 2, 6, 29, 89, 'Chocho malt', '10000', '10000', '1', '13-12-2022', '20:43:14', NULL, '0', '0'),
(50, 2, 6, 31, 11, 'Roti maryam original ', '8000', '8000', '1', '13-12-2022', '21:23:41', NULL, '0', '0'),
(51, 2, 6, 31, 50, 'Nasi bakar tongkol', '5000', '10000', '2', '13-12-2022', '21:23:41', NULL, '0', '0'),
(52, 2, 6, 31, 42, 'Jeroan', '2500', '5000', '2', '13-12-2022', '21:23:41', NULL, '0', '0'),
(53, 2, 6, 31, 72, 'Leci squash', '12000', '12000', '1', '13-12-2022', '21:23:41', NULL, '0', '0'),
(54, 2, 6, 31, 82, 'Es teh', '4000', '8000', '2', '13-12-2022', '21:23:41', NULL, '0', '0'),
(55, 2, 6, 29, 37, 'Nasi', '4000', '4000', '1', '13-12-2022', '21:35:13', NULL, '0', '0'),
(56, 2, 6, 31, 104, 'Krupuk', '3000', '3000', '1', '13-12-2022', '21:56:39', NULL, '0', '0'),
(59, 2, 6, 33, 20, 'Tahu walik', '15000', '15000', '1', '14-12-2022', '14:44:59', NULL, '0', '0'),
(60, 2, 6, 33, 34, 'Bakso aci', '15000', '15000', '1', '14-12-2022', '14:44:59', NULL, '0', '0'),
(61, 2, 6, 33, 68, 'Lalapan ayam potong', '18000', '36000', '2', '14-12-2022', '14:44:59', NULL, '0', '0'),
(62, 2, 6, 33, 79, 'Thaitea', '10000', '10000', '1', '14-12-2022', '14:44:59', NULL, '0', '0'),
(63, 2, 6, 33, 81, 'Tea tarik', '8000', '8000', '1', '14-12-2022', '14:44:59', NULL, '0', '0'),
(64, 2, 6, 33, 64, 'Lalapan 3T', '10000', '10000', '1', '14-12-2022', '15:05:59', NULL, '0', '0'),
(65, 2, 6, 33, 69, 'Mega mendung', '12000', '12000', '1', '14-12-2022', '15:05:59', NULL, '0', '0'),
(66, 2, 6, 34, 51, 'Nasi bakar teri', '5000', '5000', '1', '14-12-2022', '15:45:28', NULL, '0', '0'),
(67, 2, 6, 34, 44, 'Usus ', '2000', '4000', '2', '14-12-2022', '15:45:28', NULL, '0', '0'),
(68, 2, 6, 34, 42, 'Jeroan', '2500', '5000', '2', '14-12-2022', '15:45:28', NULL, '0', '0'),
(69, 2, 6, 34, 98, 'Kopi hitam', '5000', '5000', '1', '14-12-2022', '15:45:28', NULL, '0', '0'),
(70, 2, 6, 34, 102, 'Le mineral', '2500', '2500', '1', '14-12-2022', '15:45:28', NULL, '0', '0'),
(71, 2, 6, 35, 20, 'Tahu walik', '15000', '15000', '1', '14-12-2022', '15:50:04', NULL, '0', '0'),
(72, 2, 6, 35, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '14-12-2022', '15:50:04', NULL, '0', '0'),
(73, 2, 6, 35, 70, 'Soda gembira', '12000', '12000', '1', '14-12-2022', '15:50:04', NULL, '0', '0'),
(74, 2, 6, 36, 98, 'Kopi hitam', '5000', '5000', '1', '14-12-2022', '16:59:27', NULL, '0', '0'),
(75, 2, 6, 36, 96, 'Hot beng beng', '10000', '10000', '1', '14-12-2022', '16:59:27', NULL, '0', '0'),
(76, 2, 6, 36, 19, 'Tahu crispy', '12000', '12000', '1', '14-12-2022', '16:59:27', NULL, '0', '0'),
(77, 2, 6, 36, 51, 'Nasi bakar teri', '5000', '5000', '1', '14-12-2022', '16:59:27', NULL, '0', '0'),
(78, 2, 6, 37, 44, 'Usus ', '2000', '8000', '4', '14-12-2022', '17:01:37', NULL, '0', '0'),
(79, 2, 6, 37, 43, 'Telur puyuh', '3000', '6000', '2', '14-12-2022', '17:01:37', NULL, '0', '0'),
(80, 2, 6, 37, 47, 'Sayap', '4000', '8000', '2', '14-12-2022', '17:01:37', NULL, '0', '0'),
(81, 2, 6, 37, 51, 'Nasi bakar teri', '5000', '15000', '3', '14-12-2022', '17:01:37', NULL, '0', '0'),
(82, 2, 6, 37, 21, 'Tahu cabe garam', '15000', '15000', '1', '14-12-2022', '17:01:37', NULL, '0', '0'),
(83, 2, 6, 37, 71, 'Lemon squash', '12000', '12000', '1', '14-12-2022', '17:01:37', NULL, '0', '0'),
(84, 2, 6, 38, 61, 'Nasi goreng telur', '13000', '13000', '1', '14-12-2022', '19:49:42', NULL, '0', '0'),
(85, 2, 6, 38, 69, 'Mega mendung', '12000', '12000', '1', '14-12-2022', '19:49:42', NULL, '0', '0'),
(86, 2, 6, 38, 84, 'Dark chocholate', '10000', '10000', '1', '14-12-2022', '19:49:42', NULL, '0', '0'),
(87, 2, 6, 38, 98, 'Kopi hitam', '5000', '10000', '2', '14-12-2022', '19:49:42', NULL, '0', '0'),
(88, 2, 6, 39, 39, 'Soto ayam ', '10000', '20000', '2', '15-12-2022', '18:11:57', NULL, '0', '0'),
(89, 2, 6, 39, 92, 'Jeruk panas', '6000', '6000', '1', '15-12-2022', '18:11:57', NULL, '0', '0'),
(90, 2, 6, 39, 102, 'Le mineral', '2500', '2500', '1', '15-12-2022', '18:11:57', NULL, '0', '0'),
(91, 2, 6, 40, 86, 'Strawberry', '10000', '10000', '1', '15-12-2022', '18:12:47', NULL, '0', '0'),
(92, 2, 6, 41, 100, 'Wedang jahe', '7000', '7000', '1', '15-12-2022', '18:14:26', NULL, '0', '0'),
(93, 2, 6, 42, 39, 'Soto ayam ', '10000', '10000', '1', '15-12-2022', '18:19:31', NULL, '0', '0'),
(94, 2, 6, 42, 82, 'Es teh', '4000', '8000', '2', '15-12-2022', '18:19:31', NULL, '0', '0'),
(95, 2, 6, 43, 71, 'Lemon squash', '12000', '12000', '1', '15-12-2022', '18:23:41', NULL, '0', '0'),
(96, 2, 6, 43, 61, 'Nasi goreng telur', '13000', '13000', '1', '15-12-2022', '18:23:41', NULL, '0', '0'),
(97, 2, 6, 43, 98, 'Kopi hitam', '5000', '5000', '1', '15-12-2022', '18:23:41', NULL, '0', '0'),
(98, 2, 6, 43, 17, 'Kentang', '10000', '10000', '1', '15-12-2022', '18:23:41', NULL, '0', '0'),
(99, 2, 6, 44, 98, 'Kopi hitam', '5000', '5000', '1', '15-12-2022', '18:49:20', NULL, '0', '0'),
(100, 2, 6, 45, 85, 'Mangga', '10000', '10000', '1', '15-12-2022', '19:00:29', NULL, '0', '0'),
(101, 2, 6, 46, 49, 'Nasi ayam suwir', '5000', '10000', '2', '15-12-2022', '20:44:09', NULL, '0', '0'),
(102, 2, 6, 46, 43, 'Telur puyuh', '3000', '9000', '3', '15-12-2022', '20:44:09', NULL, '0', '0'),
(103, 2, 6, 46, 11, 'Roti maryam original ', '8000', '8000', '1', '15-12-2022', '20:44:09', NULL, '0', '0'),
(104, 2, 6, 47, 27, 'Seblak mie', '12000', '12000', '1', '15-12-2022', '20:45:03', NULL, '0', '0'),
(105, 2, 6, 48, 26, 'Seblak tulang', '12000', '12000', '1', '16-12-2022', '18:24:21', NULL, '0', '0'),
(106, 2, 6, 48, 27, 'Seblak mie', '12000', '24000', '2', '16-12-2022', '18:24:21', NULL, '0', '0'),
(107, 2, 6, 48, 82, 'Es teh', '4000', '12000', '3', '16-12-2022', '18:24:21', NULL, '0', '0'),
(108, 2, 6, 49, 98, 'Kopi hitam', '5000', '5000', '1', '16-12-2022', '18:43:14', NULL, '0', '0'),
(109, 2, 6, 50, 19, 'Tahu crispy', '12000', '12000', '1', '16-12-2022', '19:45:38', NULL, '0', '0'),
(110, 2, 6, 50, 13, 'Roti maryam keju', '12000', '12000', '1', '16-12-2022', '19:45:38', NULL, '0', '0'),
(111, 2, 6, 51, 49, 'Nasi ayam suwir', '5000', '5000', '1', '16-12-2022', '19:46:50', NULL, '0', '0'),
(112, 2, 6, 51, 43, 'Telur puyuh', '3000', '6000', '2', '16-12-2022', '19:46:50', NULL, '0', '0'),
(113, 2, 6, 52, 98, 'Kopi hitam', '5000', '5000', '1', '16-12-2022', '20:16:36', NULL, '0', '0'),
(114, 2, 6, 52, 84, 'Dark chocholate', '10000', '10000', '1', '16-12-2022', '20:16:36', NULL, '0', '0'),
(115, 2, 6, 52, 102, 'Le mineral', '2500', '2500', '1', '16-12-2022', '20:16:36', NULL, '0', '0'),
(116, 2, 6, 53, 77, 'Milk shake strawberry', '15000', '15000', '1', '16-12-2022', '20:24:55', NULL, '0', '0'),
(117, 2, 6, 53, 70, 'Soda gembira', '12000', '24000', '2', '16-12-2022', '20:24:55', NULL, '0', '0'),
(118, 2, 6, 54, 98, 'Kopi hitam', '5000', '5000', '1', '16-12-2022', '21:00:20', NULL, '0', '0'),
(119, 2, 6, 54, 75, 'Milk shake chocolate', '15000', '15000', '1', '16-12-2022', '21:00:20', NULL, '0', '0'),
(120, 2, 6, 54, 70, 'Soda gembira', '12000', '12000', '1', '16-12-2022', '21:00:20', NULL, '0', '0'),
(121, 2, 6, 54, 53, 'Mi goreng telur ', '13000', '13000', '1', '16-12-2022', '21:00:20', NULL, '0', '0'),
(122, 2, 6, 54, 43, 'Telur puyuh', '3000', '0', '0', '16-12-2022', '21:00:20', NULL, '0', '0'),
(123, 2, 6, 54, 40, 'Usus', '2000', '8000', '4', '16-12-2022', '21:00:20', NULL, '0', '0'),
(124, 2, 6, 54, 49, 'Nasi ayam suwir', '5000', '5000', '1', '16-12-2022', '21:00:20', NULL, '0', '0'),
(125, 2, 6, 54, 12, 'Roti maryam chocolat', '11000', '0', '0', '16-12-2022', '21:23:35', NULL, '0', '0'),
(126, 2, 6, 54, 11, 'Roti maryam original ', '8000', '8000', '1', '16-12-2022', '21:24:28', NULL, '0', '0'),
(127, 2, 6, 55, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '18:18:24', NULL, '0', '0'),
(128, 2, 6, 56, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '18:19:59', NULL, '0', '0'),
(129, 2, 6, 56, 30, 'Ceker judes', '13000', '0', '', '17-12-2022', '18:19:59', NULL, '0', '0'),
(130, 2, 6, 56, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '18:19:59', NULL, '0', '0'),
(131, 2, 6, 56, 43, 'Telur puyuh', '3000', '3000', '1', '17-12-2022', '18:19:59', NULL, '0', '0'),
(135, 2, 6, 58, 75, 'Milk shake chocolate', '15000', '15000', '1', '17-12-2022', '18:52:55', NULL, '0', '0'),
(136, 2, 6, 59, 89, 'Chocho malt', '10000', '10000', '1', '17-12-2022', '19:14:39', NULL, '0', '0'),
(137, 2, 6, 59, 70, 'Soda gembira', '12000', '24000', '2', '17-12-2022', '19:14:39', NULL, '0', '0'),
(138, 2, 6, 59, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '19:14:39', NULL, '0', '0'),
(139, 2, 6, 59, 65, 'Lalapan lele', '15000', '15000', '1', '17-12-2022', '19:14:39', NULL, '0', '0'),
(140, 2, 6, 59, 12, 'Roti maryam chocolat', '11000', '11000', '1', '17-12-2022', '19:14:39', NULL, '0', '0'),
(141, 2, 6, 59, 75, 'Milk shake chocolate', '15000', '0', '', '17-12-2022', '19:14:39', NULL, '0', '0'),
(142, 2, 6, 59, 59, 'Bakmi', '15000', '15000', '1', '17-12-2022', '19:14:39', NULL, '0', '0'),
(143, 2, 6, 59, 32, 'Pentol kering judes', '13000', '0', '', '17-12-2022', '19:14:39', NULL, '0', '0'),
(144, 2, 6, 60, 21, 'Tahu cabe garam', '15000', '15000', '1', '17-12-2022', '19:29:31', NULL, '0', '0'),
(145, 2, 6, 60, 27, 'Seblak mie', '12000', '12000', '1', '17-12-2022', '19:29:31', NULL, '0', '0'),
(146, 2, 6, 60, 72, 'Leci squash', '12000', '12000', '1', '17-12-2022', '19:29:31', NULL, '0', '0'),
(147, 2, 6, 60, 83, 'Es jeruk', '6000', '6000', '1', '17-12-2022', '19:29:31', NULL, '0', '0'),
(148, 2, 6, 60, 85, 'Mangga', '10000', '10000', '1', '17-12-2022', '19:29:31', NULL, '0', '0'),
(154, 2, 6, 59, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '19:49:48', NULL, '0', '0'),
(155, 2, 6, 59, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '19:49:48', NULL, '0', '0'),
(156, 2, 6, 59, 42, 'Jeroan', '2500', '5000', '2', '17-12-2022', '19:49:48', NULL, '0', '0'),
(157, 2, 6, 62, 88, 'Matcha', '10000', '10000', '1', '17-12-2022', '19:52:12', NULL, '0', '0'),
(158, 2, 6, 63, 75, 'Milk shake chocolate', '15000', '15000', '1', '17-12-2022', '19:52:39', NULL, '0', '0'),
(159, 2, 6, 64, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '19:53:15', NULL, '0', '0'),
(160, 2, 6, 65, 17, 'Kentang', '10000', '10000', '1', '17-12-2022', '19:55:23', NULL, '0', '0'),
(161, 2, 6, 65, 85, 'Mangga', '10000', '10000', '1', '17-12-2022', '19:55:23', NULL, '0', '0'),
(162, 2, 6, 65, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '17-12-2022', '19:55:23', NULL, '0', '0'),
(163, 2, 6, 65, 94, 'Hot capucino', '10000', '10000', '1', '17-12-2022', '19:55:23', NULL, '0', '0'),
(164, 2, 6, 66, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '20:08:49', NULL, '0', '0'),
(165, 2, 6, 66, 75, 'Milk shake chocolate', '15000', '15000', '1', '17-12-2022', '20:08:49', NULL, '0', '0'),
(166, 2, 6, 66, 32, 'Pentol kering judes', '13000', '13000', '1', '17-12-2022', '20:08:49', NULL, '0', '0'),
(167, 2, 6, 67, 84, 'Dark chocholate', '10000', '10000', '1', '17-12-2022', '20:44:52', NULL, '0', '0'),
(168, 2, 6, 67, 50, 'Nasi bakar tongkol', '5000', '10000', '2', '17-12-2022', '20:44:52', NULL, '0', '0'),
(169, 2, 6, 67, 40, 'Usus', '2000', '10000', '5', '17-12-2022', '20:44:52', NULL, '0', '0'),
(170, 2, 6, 67, 43, 'Telur puyuh', '3000', '15000', '5', '17-12-2022', '20:44:52', NULL, '0', '0'),
(171, 2, 6, 68, 49, 'Nasi ayam suwir', '5000', '10000', '2', '17-12-2022', '20:45:19', NULL, '0', '0'),
(172, 2, 6, 69, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '21:17:02', NULL, '0', '0'),
(173, 2, 6, 69, 88, 'Matcha', '10000', '10000', '1', '17-12-2022', '21:17:02', NULL, '0', '0'),
(174, 2, 6, 69, 75, 'Milk shake chocolate', '15000', '15000', '1', '17-12-2022', '21:17:02', NULL, '0', '0'),
(175, 2, 6, 69, 90, 'Es cokelat roti', '12000', '12000', '1', '17-12-2022', '21:17:02', NULL, '0', '0'),
(176, 2, 6, 69, 12, 'Roti maryam chocolat', '11000', '11000', '1', '17-12-2022', '21:17:02', NULL, '0', '0'),
(177, 2, 6, 69, 17, 'Kentang', '10000', '10000', '1', '17-12-2022', '21:17:02', NULL, '0', '0'),
(178, 2, 6, 70, 61, 'Nasi goreng telur', '13000', '13000', '1', '17-12-2022', '21:19:13', NULL, '0', '0'),
(179, 2, 6, 70, 90, 'Es cokelat roti', '12000', '12000', '1', '17-12-2022', '21:19:13', NULL, '0', '0'),
(180, 2, 6, 70, 94, 'Hot capucino', '10000', '10000', '1', '17-12-2022', '21:19:13', NULL, '0', '0'),
(181, 2, 6, 70, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '17-12-2022', '21:19:13', NULL, '0', '0'),
(182, 2, 6, 70, 77, 'Milk shake strawberry', '15000', '15000', '1', '17-12-2022', '21:33:10', NULL, '0', '0'),
(183, 2, 6, 71, 104, 'Krupuk', '2000', '4000', '2', '17-12-2022', '21:34:18', NULL, '0', '0'),
(184, 2, 6, 70, 82, 'Es teh', '4000', '4000', '1', '17-12-2022', '21:35:22', NULL, '0', '0'),
(185, 2, 6, 67, 17, 'Kentang', '10000', '10000', '1', '17-12-2022', '21:38:53', NULL, '0', '0'),
(186, 2, 6, 67, 77, 'Milk shake strawberry', '15000', '15000', '1', '17-12-2022', '21:38:53', NULL, '0', '0'),
(187, 2, 6, 67, 60, 'Nasi goreng ori', '10000', '10000', '1', '17-12-2022', '21:38:53', NULL, '0', '0'),
(188, 2, 6, 67, 39, 'Soto ayam ', '10000', '10000', '1', '17-12-2022', '21:38:53', NULL, '0', '0'),
(189, 2, 6, 67, 102, 'Le mineral', '2500', '2500', '1', '17-12-2022', '21:38:53', NULL, '0', '0'),
(192, 2, 6, 73, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '23:09:49', NULL, '0', '0'),
(193, 2, 6, 73, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '23:09:49', NULL, '0', '0'),
(194, 2, 6, 73, 43, 'Telur puyuh', '3000', '3000', '1', '17-12-2022', '23:09:49', NULL, '0', '0'),
(195, 2, 6, 74, 89, 'Chocho malt', '10000', '10000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(196, 2, 6, 74, 70, 'Soda gembira', '12000', '24000', '2', '17-12-2022', '23:14:08', NULL, '0', '0'),
(197, 2, 6, 74, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(198, 2, 6, 74, 65, 'Lalapan lele', '15000', '15000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(199, 2, 6, 74, 12, 'Roti maryam chocolat', '11000', '11000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(200, 2, 6, 74, 75, 'Milk shake chocolate', '15000', '0', '', '17-12-2022', '23:14:08', NULL, '0', '0'),
(201, 2, 6, 74, 59, 'Bakmi', '15000', '15000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(202, 2, 6, 74, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(203, 2, 6, 74, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '23:14:08', NULL, '0', '0'),
(204, 2, 6, 74, 42, 'Jeroan', '2500', '5000', '2', '17-12-2022', '23:14:08', NULL, '0', '0'),
(205, 2, 6, 75, 89, 'Chocho malt', '10000', '10000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(206, 2, 6, 75, 70, 'Soda gembira', '12000', '24000', '2', '17-12-2022', '23:17:01', NULL, '0', '0'),
(207, 2, 6, 75, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(208, 2, 6, 75, 65, 'Lalapan lele', '15000', '15000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(209, 2, 6, 75, 12, 'Roti maryam chocolat', '11000', '11000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(210, 2, 6, 75, 59, 'Bakmi', '15000', '15000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(211, 2, 6, 75, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(212, 2, 6, 75, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '23:17:01', NULL, '0', '0'),
(213, 2, 6, 75, 42, 'Jeroan', '2500', '5000', '2', '17-12-2022', '23:17:01', NULL, '0', '0'),
(214, 2, 6, 76, 75, 'Milk shake chocolate', '15000', '15000', '1', '17-12-2022', '23:18:40', NULL, '0', '0'),
(215, 2, 6, 76, 32, 'Pentol kering judes', '13000', '13000', '1', '17-12-2022', '23:18:40', NULL, '0', '0'),
(216, 2, 6, 76, 87, 'Taro', '10000', '10000', '1', '17-12-2022', '23:18:40', NULL, '0', '0'),
(217, 2, 6, 77, 104, 'Krupuk', '2000', '6000', '3', '18-12-2022', '15:01:14', NULL, '0', '0'),
(218, 2, 6, 78, 104, 'Krupuk', '2000', '2000', '1', '18-12-2022', '18:18:20', NULL, '0', '0'),
(219, 2, 6, 79, 86, 'Strawberry', '10000', '40000', '4', '18-12-2022', '18:19:19', NULL, '0', '0'),
(220, 2, 6, 80, 104, 'Krupuk', '2000', '10000', '5', '18-12-2022', '18:37:20', NULL, '0', '0'),
(221, 2, 6, 81, 49, 'Nasi ayam suwir', '5000', '25000', '5', '18-12-2022', '18:38:39', NULL, '0', '0'),
(222, 2, 6, 81, 60, 'Nasi goreng ori', '10000', '10000', '1', '18-12-2022', '18:38:39', NULL, '0', '0'),
(223, 2, 6, 81, 82, 'Es teh', '4000', '16000', '4', '18-12-2022', '18:38:39', NULL, '0', '0'),
(224, 2, 6, 82, 17, 'Kentang', '10000', '10000', '1', '18-12-2022', '18:39:16', NULL, '0', '0'),
(225, 2, 6, 82, 87, 'Taro', '10000', '10000', '1', '18-12-2022', '18:39:16', NULL, '0', '0'),
(226, 2, 6, 83, 98, 'Kopi hitam', '5000', '5000', '1', '18-12-2022', '18:40:42', NULL, '0', '0'),
(227, 2, 6, 83, 94, 'Hot capucino', '10000', '10000', '1', '18-12-2022', '18:40:42', NULL, '0', '0'),
(228, 2, 6, 84, 85, 'Mangga', '10000', '10000', '1', '18-12-2022', '19:08:40', NULL, '0', '0'),
(229, 2, 6, 84, 88, 'Matcha', '10000', '10000', '1', '18-12-2022', '19:08:40', NULL, '0', '0'),
(230, 2, 6, 84, 86, 'Strawberry', '10000', '10000', '1', '18-12-2022', '19:08:40', NULL, '0', '0'),
(231, 2, 6, 84, 61, 'Nasi goreng telur', '13000', '13000', '1', '18-12-2022', '19:08:40', NULL, '0', '0'),
(232, 2, 6, 84, 83, 'Es jeruk', '6000', '12000', '2', '18-12-2022', '19:08:40', NULL, '0', '0'),
(233, 2, 6, 84, 51, 'Nasi bakar teri', '5000', '5000', '1', '18-12-2022', '19:08:41', NULL, '0', '0'),
(234, 2, 6, 84, 41, 'Ceker', '2000', '4000', '2', '18-12-2022', '19:08:41', NULL, '0', '0'),
(235, 2, 6, 84, 25, 'Seblak seafood', '15000', '45000', '3', '18-12-2022', '19:08:41', NULL, '0', '0'),
(236, 2, 6, 85, 82, 'Es teh', '4000', '16000', '4', '18-12-2022', '20:12:08', NULL, '0', '0'),
(237, 2, 6, 86, 86, 'Strawberry', '10000', '10000', '1', '18-12-2022', '20:29:22', NULL, '0', '0'),
(238, 2, 6, 86, 53, 'Mi goreng telur ', '13000', '13000', '1', '18-12-2022', '20:29:22', NULL, '0', '0'),
(239, 2, 6, 86, 82, 'Es teh', '4000', '4000', '1', '18-12-2022', '20:29:22', NULL, '0', '0'),
(240, 2, 6, 86, 101, 'Jahe susu', '8000', '16000', '2', '18-12-2022', '20:29:22', NULL, '0', '0'),
(241, 2, 6, 87, 88, 'Matcha', '10000', '10000', '1', '18-12-2022', '20:49:40', NULL, '0', '0'),
(242, 2, 6, 87, 78, 'Milk shake oreo', '15000', '15000', '1', '18-12-2022', '20:49:40', NULL, '0', '0'),
(243, 2, 6, 87, 13, 'Roti maryam keju', '12000', '24000', '2', '18-12-2022', '20:49:40', NULL, '0', '0'),
(244, 2, 6, 88, 74, 'Chochopandan squash', '12000', '12000', '1', '18-12-2022', '20:53:46', NULL, '0', '0'),
(245, 2, 6, 88, 13, 'Roti maryam keju', '12000', '12000', '1', '18-12-2022', '20:53:46', NULL, '0', '0'),
(246, 2, 6, 88, 20, 'Tahu walik', '15000', '15000', '1', '18-12-2022', '20:53:46', NULL, '0', '0'),
(247, 2, 6, 88, 88, 'Matcha', '10000', '10000', '1', '18-12-2022', '20:53:46', NULL, '0', '0'),
(248, 2, 6, 89, 60, 'Nasi goreng ori', '10000', '10000', '1', '18-12-2022', '20:57:25', NULL, '0', '0'),
(249, 2, 6, 89, 82, 'Es teh', '4000', '4000', '1', '18-12-2022', '20:57:25', NULL, '0', '0'),
(250, 2, 6, 89, 98, 'Kopi hitam', '5000', '5000', '1', '18-12-2022', '20:57:25', NULL, '0', '0'),
(251, 2, 6, 90, 28, 'Sayap judes', '18000', '18000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(252, 2, 6, 90, 30, 'Ceker judes', '13000', '13000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(253, 2, 6, 90, 70, 'Soda gembira', '12000', '12000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(254, 2, 6, 90, 72, 'Leci squash', '12000', '12000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(255, 2, 6, 90, 74, 'Chochopandan squash', '12000', '24000', '2', '18-12-2022', '21:18:45', NULL, '0', '0'),
(256, 2, 6, 90, 102, 'Le mineral', '2500', '7500', '3', '18-12-2022', '21:18:45', NULL, '0', '0'),
(257, 2, 6, 90, 65, 'Lalapan lele', '15000', '15000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(258, 2, 6, 90, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(259, 2, 6, 90, 47, 'Sayap', '4000', '4000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(260, 2, 6, 90, 48, 'Telur puyuh', '3000', '3000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(261, 2, 6, 90, 56, 'Mi nyemek', '15000', '30000', '2', '18-12-2022', '21:18:45', NULL, '0', '0'),
(262, 2, 6, 90, 49, 'Nasi ayam suwir', '5000', '5000', '1', '18-12-2022', '21:18:45', NULL, '0', '0'),
(263, 2, 6, 91, 87, 'Taro', '10000', '10000', '1', '18-12-2022', '21:50:55', NULL, '0', '0'),
(264, 2, 6, 86, 98, 'Kopi hitam', '5000', '5000', '1', '18-12-2022', '22:14:32', NULL, '0', '0'),
(265, 2, 6, 92, 89, 'Chocho malt', '10000', '10000', '1', '19-12-2022', '16:49:47', NULL, '0', '0'),
(266, 2, 6, 92, 83, 'Es jeruk', '6000', '6000', '1', '19-12-2022', '16:49:47', NULL, '0', '0'),
(267, 2, 6, 92, 11, 'Roti maryam original ', '8000', '8000', '1', '19-12-2022', '16:49:47', NULL, '0', '0'),
(268, 2, 6, 93, 84, 'Dark chocholate', '10000', '10000', '1', '19-12-2022', '18:02:08', NULL, '0', '0'),
(269, 2, 6, 94, 60, 'Nasi goreng ori', '10000', '30000', '3', '19-12-2022', '18:04:05', NULL, '0', '0'),
(270, 2, 6, 94, 83, 'Es jeruk', '6000', '18000', '3', '19-12-2022', '18:04:05', NULL, '0', '0'),
(271, 2, 6, 94, 49, 'Nasi ayam suwir', '5000', '10000', '2', '19-12-2022', '18:04:05', NULL, '0', '0'),
(272, 2, 6, 95, 84, 'Dark chocholate', '10000', '10000', '1', '19-12-2022', '19:26:37', NULL, '0', '0'),
(273, 2, 6, 95, 25, 'Seblak seafood', '15000', '15000', '1', '19-12-2022', '19:26:37', NULL, '0', '0'),
(274, 2, 6, 95, 87, 'Taro', '10000', '10000', '1', '19-12-2022', '19:26:37', NULL, '0', '0'),
(275, 2, 6, 96, 72, 'Leci squash', '12000', '12000', '1', '19-12-2022', '20:34:47', NULL, '0', '0'),
(276, 2, 6, 96, 78, 'Milk shake oreo', '15000', '15000', '1', '19-12-2022', '20:34:47', NULL, '0', '0'),
(277, 2, 6, 96, 17, 'Kentang', '10000', '10000', '1', '19-12-2022', '20:34:47', NULL, '0', '0'),
(278, 2, 6, 97, 75, 'Milk shake chocolate', '15000', '15000', '1', '19-12-2022', '20:41:10', NULL, '0', '0'),
(279, 2, 6, 98, 21, 'Tahu cabe garam', '15000', '15000', '1', '20-12-2022', '17:59:45', NULL, '0', '0'),
(280, 2, 6, 98, 19, 'Tahu crispy', '12000', '12000', '1', '20-12-2022', '17:59:45', NULL, '0', '0'),
(281, 2, 6, 98, 61, 'Nasi goreng telur', '13000', '13000', '1', '20-12-2022', '17:59:45', NULL, '0', '0'),
(282, 2, 6, 98, 68, 'Lalapan ayam potong', '18000', '18000', '1', '20-12-2022', '17:59:45', NULL, '0', '0'),
(283, 2, 6, 98, 62, 'Nasi goreng ayam ', '13000', '13000', '1', '20-12-2022', '17:59:45', NULL, '0', '0'),
(284, 2, 6, 98, 93, 'Hot chochalate', '13000', '26000', '2', '20-12-2022', '17:59:45', NULL, '0', '0'),
(285, 2, 6, 99, 49, 'Nasi ayam suwir', '5000', '5000', '1', '20-12-2022', '18:00:51', NULL, '0', '0'),
(286, 2, 6, 99, 43, 'Telur puyuh', '3000', '3000', '1', '20-12-2022', '18:00:51', NULL, '0', '0'),
(287, 2, 6, 99, 41, 'Ceker', '2000', '2000', '1', '20-12-2022', '18:00:51', NULL, '0', '0'),
(288, 2, 6, 99, 82, 'Es teh', '4000', '4000', '1', '20-12-2022', '18:00:51', NULL, '0', '0'),
(289, 2, 6, 99, 61, 'Nasi goreng telur', '13000', '26000', '2', '20-12-2022', '18:00:51', NULL, '0', '0'),
(290, 2, 6, 100, 19, 'Tahu crispy', '12000', '12000', '1', '20-12-2022', '18:01:13', NULL, '0', '0'),
(291, 2, 6, 98, 20, 'Tahu walik', '15000', '15000', '1', '20-12-2022', '18:03:57', NULL, '0', '0'),
(294, 2, 6, 102, 88, 'Matcha', '10000', '10000', '1', '20-12-2022', '20:24:40', NULL, '0', '0'),
(295, 2, 6, 102, 86, 'Strawberry', '10000', '10000', '1', '20-12-2022', '20:24:40', NULL, '0', '0'),
(296, 2, 6, 102, 17, 'Kentang', '10000', '10000', '1', '20-12-2022', '20:24:40', NULL, '0', '0'),
(297, 2, 6, 103, 87, 'Taro', '10000', '10000', '1', '20-12-2022', '20:29:32', NULL, '0', '0'),
(298, 2, 6, 103, 85, 'Mangga', '10000', '10000', '1', '20-12-2022', '20:29:32', NULL, '0', '0'),
(299, 2, 6, 103, 20, 'Tahu walik', '15000', '15000', '1', '20-12-2022', '20:29:32', NULL, '0', '0'),
(300, 2, 6, 104, 83, 'Es jeruk', '6000', '6000', '1', '20-12-2022', '21:22:38', NULL, '0', '0'),
(301, 2, 6, 105, 49, 'Nasi ayam suwir', '5000', '10000', '2', '21-12-2022', '13:42:22', NULL, '0', '0'),
(302, 2, 6, 105, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '21-12-2022', '13:42:22', NULL, '0', '0'),
(303, 2, 6, 105, 43, 'Telur puyuh', '3000', '6000', '2', '21-12-2022', '13:42:22', NULL, '0', '0'),
(304, 2, 6, 105, 82, 'Es teh', '4000', '4000', '1', '21-12-2022', '13:42:22', NULL, '0', '0'),
(305, 2, 6, 105, 20, 'Tahu walik', '15000', '15000', '1', '21-12-2022', '13:42:22', NULL, '0', '0'),
(306, 2, 6, 106, 98, 'Kopi hitam', '5000', '5000', '1', '21-12-2022', '13:43:34', NULL, '0', '0'),
(307, 2, 6, 106, 51, 'Nasi bakar teri', '5000', '5000', '1', '21-12-2022', '13:43:34', NULL, '0', '0'),
(308, 2, 6, 106, 17, 'Kentang', '10000', '10000', '1', '21-12-2022', '13:43:34', NULL, '0', '0'),
(309, 2, 6, 106, 46, 'Kepala', '2000', '4000', '2', '21-12-2022', '13:43:34', NULL, '0', '0'),
(310, 2, 6, 106, 102, 'Le mineral', '2500', '2500', '1', '21-12-2022', '13:43:34', NULL, '0', '0'),
(311, 2, 6, 107, 87, 'Taro', '10000', '40000', '4', '21-12-2022', '15:44:44', NULL, '0', '0'),
(312, 2, 6, 108, 90, 'Es cokelat roti', '12000', '12000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(313, 2, 6, 108, 87, 'Taro', '10000', '10000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(314, 2, 6, 108, 49, 'Nasi ayam suwir', '5000', '5000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(315, 2, 6, 108, 43, 'Telur puyuh', '3000', '3000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(316, 2, 6, 108, 27, 'Seblak mie', '12000', '12000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(317, 2, 6, 108, 102, 'Le mineral', '2500', '2500', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(318, 2, 6, 108, 60, 'Nasi goreng ori', '10000', '10000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(319, 2, 6, 108, 17, 'Kentang', '10000', '10000', '1', '21-12-2022', '17:32:44', NULL, '0', '0'),
(320, 2, 6, 109, 67, 'Lalapan ayam kampung', '25000', '50000', '2', '21-12-2022', '17:33:46', NULL, '0', '0'),
(321, 2, 6, 109, 69, 'Mega mendung', '12000', '36000', '3', '21-12-2022', '17:33:46', NULL, '0', '0'),
(322, 2, 6, 109, 102, 'Le mineral', '2500', '7500', '3', '21-12-2022', '17:49:45', NULL, '0', '0'),
(323, 2, 6, 110, 19, 'Tahu crispy', '12000', '12000', '1', '21-12-2022', '19:03:40', NULL, '0', '0'),
(325, 2, 6, 112, 27, 'Seblak mie', '12000', '12000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(326, 2, 6, 112, 25, 'Seblak seafood', '15000', '15000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(327, 2, 6, 112, 70, 'Soda gembira', '12000', '12000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(328, 2, 6, 112, 82, 'Es teh', '4000', '12000', '3', '21-12-2022', '19:21:39', NULL, '0', '0'),
(329, 2, 6, 112, 98, 'Kopi hitam', '5000', '5000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(330, 2, 6, 112, 68, 'Lalapan ayam potong', '18000', '18000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(331, 2, 6, 112, 33, 'Pentol bakar', '13000', '13000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(332, 2, 6, 112, 66, 'Lalapan mujaer', '20000', '20000', '1', '21-12-2022', '19:21:39', NULL, '0', '0'),
(334, 2, 6, 109, 98, 'Kopi hitam', '5000', '10000', '2', '21-12-2022', '19:44:42', NULL, '0', '0'),
(335, 2, 6, 114, 25, 'Seblak seafood', '15000', '15000', '1', '21-12-2022', '19:51:18', NULL, '0', '0'),
(336, 2, 6, 114, 63, 'Nasi goreng spesial', '23000', '23000', '1', '21-12-2022', '19:51:18', NULL, '0', '0'),
(337, 2, 6, 114, 31, 'Pentol kuah judes', '13000', '13000', '1', '21-12-2022', '19:51:18', NULL, '0', '0'),
(338, 2, 6, 114, 69, 'Mega mendung', '12000', '12000', '1', '21-12-2022', '19:51:18', NULL, '0', '0'),
(339, 2, 6, 114, 71, 'Lemon squash', '12000', '12000', '1', '21-12-2022', '19:51:18', NULL, '0', '0'),
(340, 2, 6, 114, 75, 'Milk shake chocolate', '15000', '15000', '1', '21-12-2022', '19:51:18', NULL, '0', '0'),
(341, 2, 6, 115, 69, 'Mega mendung', '12000', '24000', '2', '21-12-2022', '19:51:41', NULL, '0', '0'),
(342, 2, 6, 115, 98, 'Kopi hitam', '5000', '5000', '1', '21-12-2022', '20:10:53', NULL, '0', '0'),
(343, 2, 6, 115, 53, 'Mi goreng telur ', '13000', '13000', '1', '21-12-2022', '20:10:53', NULL, '0', '0'),
(344, 2, 6, 115, 34, 'Bakso aci', '15000', '15000', '1', '21-12-2022', '20:10:53', NULL, '0', '0'),
(345, 2, 6, 116, 51, 'Nasi bakar teri', '5000', '10000', '2', '21-12-2022', '20:19:22', NULL, '0', '0'),
(346, 2, 6, 116, 98, 'Kopi hitam', '5000', '5000', '1', '21-12-2022', '20:19:22', NULL, '0', '0'),
(347, 2, 6, 116, 49, 'Nasi ayam suwir', '5000', '5000', '1', '21-12-2022', '20:19:22', NULL, '0', '0'),
(348, 2, 6, 116, 43, 'Telur puyuh', '3000', '12000', '4', '21-12-2022', '20:19:22', NULL, '0', '0'),
(349, 2, 6, 116, 82, 'Es teh', '4000', '4000', '1', '21-12-2022', '20:19:22', NULL, '0', '0'),
(350, 2, 6, 116, 77, 'Milk shake strawberry', '15000', '15000', '1', '21-12-2022', '20:19:22', NULL, '0', '0'),
(351, 2, 6, 116, 60, 'Nasi goreng ori', '10000', '10000', '1', '21-12-2022', '20:32:11', NULL, '0', '0'),
(352, 2, 6, 116, 102, 'Le mineral', '2500', '2500', '1', '21-12-2022', '20:32:11', NULL, '0', '0'),
(361, 2, 6, 118, 49, 'Nasi ayam suwir', '5000', '5000', '1', '21-12-2022', '21:52:33', NULL, '0', '0'),
(362, 2, 6, 118, 47, 'Sayap', '4000', '4000', '1', '21-12-2022', '21:52:33', NULL, '0', '0'),
(363, 2, 6, 118, 106, 'Gula aren ', '10000', '10000', '1', '21-12-2022', '21:52:33', NULL, '0', '0'),
(364, 2, 6, 119, 83, 'Es jeruk', '6000', '6000', '1', '21-12-2022', '21:53:11', NULL, '0', '0'),
(365, 2, 6, 119, 38, 'Soto ayam ', '5000', '5000', '1', '21-12-2022', '21:53:11', NULL, '0', '0'),
(366, 2, 6, 120, 47, 'Sayap', '4000', '4000', '1', '21-12-2022', '21:54:13', NULL, '0', '0'),
(367, 2, 6, 120, 49, 'Nasi ayam suwir', '5000', '5000', '1', '21-12-2022', '21:54:13', NULL, '0', '0'),
(368, 2, 6, 120, 82, 'Es teh', '4000', '4000', '1', '21-12-2022', '21:54:13', NULL, '0', '0'),
(369, 2, 6, 120, 41, 'Ceker', '2000', '4000', '2', '21-12-2022', '21:54:13', NULL, '0', '0'),
(370, 2, 6, 121, 60, 'Nasi goreng ori', '10000', '20000', '2', '21-12-2022', '22:37:18', NULL, '0', '0'),
(371, 2, 6, 121, 104, 'Krupuk', '2000', '4000', '2', '21-12-2022', '22:37:18', NULL, '0', '0'),
(372, 2, 6, 122, 72, 'Leci squash', '12000', '12000', '1', '22-12-2022', '18:16:52', NULL, '0', '0'),
(373, 2, 6, 122, 67, 'Lalapan ayam kampung', '25000', '25000', '1', '22-12-2022', '18:16:52', NULL, '0', '0'),
(374, 2, 6, 122, 76, 'Milk shake vanila', '15000', '15000', '1', '22-12-2022', '18:16:52', NULL, '0', '0'),
(375, 2, 6, 123, 72, 'Leci squash', '12000', '12000', '1', '22-12-2022', '18:18:51', NULL, '0', '0'),
(376, 2, 6, 123, 20, 'Tahu walik', '15000', '15000', '1', '22-12-2022', '18:18:51', NULL, '0', '0'),
(377, 2, 6, 123, 98, 'Kopi hitam', '5000', '15000', '3', '22-12-2022', '18:19:55', NULL, '0', '0'),
(378, 2, 6, 122, 20, 'Tahu walik', '15000', '15000', '1', '22-12-2022', '19:03:42', NULL, '0', '0'),
(379, 2, 6, 124, 94, 'Hot capucino', '10000', '10000', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(380, 2, 6, 124, 69, 'Mega mendung', '12000', '12000', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(381, 2, 6, 124, 98, 'Kopi hitam', '5000', '5000', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(382, 2, 6, 124, 17, 'Kentang', '10000', '10000', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(383, 2, 6, 124, 43, 'Telur puyuh', '3000', '3000', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(384, 2, 6, 124, 102, 'Le mineral', '2500', '2500', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(385, 2, 6, 124, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '22-12-2022', '19:11:03', NULL, '0', '0'),
(386, 2, 6, 125, 69, 'Mega mendung', '12000', '12000', '1', '22-12-2022', '19:11:31', NULL, '0', '0'),
(387, 2, 6, 125, 104, 'Krupuk', '2000', '2000', '1', '22-12-2022', '19:11:31', NULL, '0', '0'),
(388, 2, 6, 125, 70, 'Soda gembira', '12000', '12000', '1', '22-12-2022', '19:11:31', NULL, '0', '0'),
(389, 2, 6, 126, 60, 'Nasi goreng ori', '10000', '10000', '1', '22-12-2022', '19:25:05', NULL, '0', '0'),
(390, 2, 6, 126, 82, 'Es teh', '4000', '8000', '2', '22-12-2022', '19:25:05', NULL, '0', '0'),
(391, 2, 6, 126, 49, 'Nasi ayam suwir', '5000', '5000', '1', '22-12-2022', '19:25:05', NULL, '0', '0'),
(392, 2, 6, 126, 43, 'Telur puyuh', '3000', '6000', '2', '22-12-2022', '19:25:05', NULL, '0', '0'),
(393, 2, 6, 126, 40, 'Usus', '2000', '12000', '6', '22-12-2022', '19:25:05', NULL, '0', '0'),
(394, 2, 6, 126, 12, 'Roti maryam chocolat', '11000', '22000', '2', '22-12-2022', '19:34:06', NULL, '0', '0'),
(395, 2, 6, 126, 14, 'Roti maryam spesial', '16000', '16000', '1', '22-12-2022', '19:34:06', NULL, '0', '0'),
(396, 2, 6, 126, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '22-12-2022', '19:34:06', NULL, '0', '0'),
(397, 2, 6, 126, 105, 'Brown sugar', '10000', '10000', '1', '22-12-2022', '19:34:06', NULL, '0', '0'),
(402, 2, 6, 128, 72, 'Leci squash', '12000', '12000', '1', '22-12-2022', '19:48:23', NULL, '0', '0'),
(403, 2, 6, 128, 79, 'Thaitea', '10000', '10000', '1', '22-12-2022', '19:48:23', NULL, '0', '0'),
(404, 2, 6, 129, 82, 'Es teh', '4000', '8000', '2', '22-12-2022', '19:57:29', NULL, '0', '0'),
(405, 2, 6, 129, 63, 'Nasi goreng spesial', '23000', '23000', '1', '22-12-2022', '19:57:29', NULL, '0', '0'),
(406, 2, 6, 129, 40, 'Usus', '2000', '4000', '2', '22-12-2022', '19:57:29', NULL, '0', '0'),
(407, 2, 6, 129, 41, 'Ceker', '2000', '4000', '2', '22-12-2022', '19:57:29', NULL, '0', '0'),
(408, 2, 6, 129, 43, 'Telur puyuh', '3000', '6000', '2', '22-12-2022', '19:57:29', NULL, '0', '0'),
(409, 2, 6, 125, 80, 'Lemon tea', '10000', '10000', '1', '22-12-2022', '20:03:54', NULL, '0', '0'),
(410, 2, 6, 125, 98, 'Kopi hitam', '5000', '5000', '1', '22-12-2022', '20:03:54', NULL, '0', '0'),
(411, 2, 6, 130, 87, 'Taro', '10000', '10000', '1', '22-12-2022', '20:05:25', NULL, '0', '0'),
(412, 2, 6, 130, 99, 'Kopi robusta', '7000', '7000', '1', '22-12-2022', '20:05:25', NULL, '0', '0'),
(413, 2, 6, 131, 49, 'Nasi ayam suwir', '5000', '10000', '2', '22-12-2022', '20:07:04', NULL, '0', '0'),
(414, 2, 6, 131, 82, 'Es teh', '4000', '8000', '2', '22-12-2022', '20:07:04', NULL, '0', '0'),
(416, 2, 6, 131, 47, 'Sayap', '4000', '4000', '1', '22-12-2022', '20:07:04', NULL, '0', '0'),
(417, 2, 6, 131, 43, 'Telur puyuh', '3000', '3000', '1', '22-12-2022', '20:07:04', NULL, '0', '0'),
(418, 2, 6, 132, 49, 'Nasi ayam suwir', '5000', '5000', '1', '22-12-2022', '20:13:12', NULL, '0', '0'),
(419, 2, 6, 132, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '22-12-2022', '20:13:12', NULL, '0', '0'),
(420, 2, 6, 132, 40, 'Usus', '2000', '6000', '3', '22-12-2022', '20:13:12', NULL, '0', '0'),
(421, 2, 6, 133, 82, 'Es teh', '4000', '4000', '1', '22-12-2022', '22:28:31', NULL, '0', '0'),
(430, 2, 6, 136, 24, 'Seblak komplit', '20000', '40000', '2', '23-12-2022', '15:30:57', NULL, '0', '0'),
(431, 2, 6, 136, 62, 'Nasi goreng ayam ', '17000', '34000', '2', '23-12-2022', '15:30:57', NULL, '0', '0'),
(432, 2, 6, 136, 85, 'Mangga', '10000', '30000', '3', '23-12-2022', '15:30:57', NULL, '0', '0'),
(433, 2, 6, 136, 72, 'Leci squash', '12000', '24000', '2', '23-12-2022', '15:30:57', NULL, '0', '0'),
(434, 2, 6, 136, 13, 'Roti maryam keju', '12000', '24000', '2', '23-12-2022', '15:30:57', NULL, '0', '0'),
(435, 2, 6, 137, 21, 'Tahu cabe garam', '15000', '15000', '1', '23-12-2022', '16:11:58', NULL, '0', '0'),
(436, 2, 6, 137, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '16:11:58', NULL, '0', '0'),
(445, 2, 6, 140, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '23-12-2022', '18:36:49', NULL, '0', '0'),
(446, 2, 6, 140, 101, 'Jahe susu', '8000', '16000', '2', '23-12-2022', '18:36:49', NULL, '0', '0'),
(447, 2, 6, 140, 39, 'Soto ayam ', '10000', '10000', '1', '23-12-2022', '19:55:33', NULL, '0', '0'),
(448, 2, 6, 140, 40, 'Usus', '2000', '2000', '1', '23-12-2022', '19:55:33', NULL, '0', '0'),
(449, 2, 6, 140, 43, 'Telur puyuh', '3000', '3000', '1', '23-12-2022', '19:55:33', NULL, '0', '0'),
(450, 2, 6, 141, 104, 'Krupuk', '2000', '6000', '3', '23-12-2022', '19:58:49', NULL, '0', '0'),
(451, 2, 6, 142, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(452, 2, 6, 142, 75, 'Milk shake chocolate', '15000', '15000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(453, 2, 6, 142, 78, 'Milk shake oreo', '15000', '15000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(454, 2, 6, 142, 83, 'Es jeruk', '6000', '6000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(455, 2, 6, 142, 43, 'Telur puyuh', '3000', '6000', '2', '23-12-2022', '20:12:14', NULL, '0', '0'),
(456, 2, 6, 142, 11, 'Roti maryam original ', '8000', '8000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(457, 2, 6, 142, 17, 'Kentang', '10000', '10000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(458, 2, 6, 142, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '23-12-2022', '20:12:14', NULL, '0', '0'),
(464, 2, 6, 144, 61, 'Nasi goreng telur', '13000', '13000', '1', '23-12-2022', '20:59:11', NULL, '0', '0'),
(466, 2, 6, 145, 100, 'Wedang jahe', '7000', '7000', '1', '23-12-2022', '21:45:25', NULL, '0', '0'),
(467, 2, 6, 145, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '23-12-2022', '21:45:25', NULL, '0', '0'),
(468, 2, 6, 145, 88, 'Matcha', '10000', '10000', '1', '23-12-2022', '21:45:25', NULL, '0', '0'),
(469, 2, 6, 146, 39, 'Soto ayam ', '10000', '20000', '2', '23-12-2022', '22:02:23', NULL, '0', '0'),
(470, 2, 6, 146, 63, 'Nasi goreng spesial', '23000', '23000', '1', '23-12-2022', '22:02:23', NULL, '0', '0'),
(471, 2, 6, 146, 102, 'Le mineral', '2500', '7500', '3', '23-12-2022', '22:02:23', NULL, '0', '0'),
(472, 2, 6, 146, 49, 'Nasi ayam suwir', '5000', '5000', '1', '23-12-2022', '22:35:12', NULL, '0', '0'),
(473, 2, 6, 147, 72, 'Leci squash', '12000', '12000', '1', '24-12-2022', '17:57:15', NULL, '0', '0'),
(474, 2, 6, 147, 20, 'Tahu walik', '15000', '15000', '1', '24-12-2022', '17:57:15', NULL, '0', '0'),
(475, 2, 6, 147, 70, 'Soda gembira', '12000', '12000', '1', '24-12-2022', '17:57:15', NULL, '0', '0'),
(478, 2, 6, 149, 75, 'Milk shake chocolate', '15000', '30000', '2', '24-12-2022', '19:01:31', NULL, '0', '0'),
(479, 2, 6, 149, 80, 'Lemon tea', '10000', '10000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(480, 2, 6, 149, 69, 'Mega mendung', '12000', '12000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(481, 2, 6, 149, 101, 'Jahe susu', '8000', '8000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(482, 2, 6, 149, 61, 'Nasi goreng telur', '13000', '13000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(483, 2, 6, 149, 66, 'Lalapan mujaer', '20000', '20000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(484, 2, 6, 149, 53, 'Mi goreng telur ', '13000', '13000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(485, 2, 6, 149, 52, 'Mi goreng ori', '10000', '10000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(486, 2, 6, 149, 64, 'Lalapan 3T', '10000', '10000', '1', '24-12-2022', '19:01:31', NULL, '0', '0'),
(487, 2, 6, 150, 73, 'Melon squash', '12000', '12000', '1', '24-12-2022', '19:02:38', NULL, '0', '0'),
(488, 2, 6, 150, 85, 'Mangga', '10000', '10000', '1', '24-12-2022', '19:02:38', NULL, '0', '0'),
(493, 2, 6, 150, 87, 'Taro', '10000', '10000', '1', '24-12-2022', '19:20:36', NULL, '0', '0'),
(494, 2, 6, 150, 88, 'Matcha', '10000', '10000', '1', '24-12-2022', '19:20:36', NULL, '0', '0'),
(495, 2, 6, 150, 17, 'Kentang', '10000', '10000', '1', '24-12-2022', '19:20:36', NULL, '0', '0'),
(496, 2, 6, 152, 79, 'Thaitea', '10000', '10000', '1', '24-12-2022', '19:27:37', NULL, '0', '0'),
(497, 2, 6, 152, 88, 'Matcha', '10000', '10000', '1', '24-12-2022', '19:27:37', NULL, '0', '0'),
(498, 2, 6, 152, 87, 'Taro', '10000', '10000', '1', '24-12-2022', '19:27:37', NULL, '0', '0'),
(499, 2, 6, 153, 94, 'Hot capucino', '10000', '10000', '1', '24-12-2022', '19:31:32', NULL, '0', '0'),
(500, 2, 6, 153, 85, 'Mangga', '10000', '10000', '1', '24-12-2022', '19:31:32', NULL, '0', '0'),
(501, 2, 6, 149, 17, 'Kentang', '10000', '20000', '2', '24-12-2022', '19:39:28', NULL, '0', '0'),
(502, 2, 6, 153, 32, 'Pentol kering judes', '13000', '26000', '2', '24-12-2022', '19:43:13', NULL, '0', '0'),
(504, 2, 6, 155, 98, 'Kopi hitam', '5000', '5000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(505, 2, 6, 155, 70, 'Soda gembira', '12000', '12000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(506, 2, 6, 155, 85, 'Mangga', '10000', '10000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(507, 2, 6, 155, 51, 'Nasi bakar teri', '5000', '5000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(508, 2, 6, 155, 49, 'Nasi ayam suwir', '5000', '5000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(509, 2, 6, 155, 47, 'Sayap', '4000', '4000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(510, 2, 6, 155, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(511, 2, 6, 155, 30, 'Ceker judes', '13000', '13000', '1', '24-12-2022', '20:01:09', NULL, '0', '0'),
(512, 2, 6, 156, 107, 'Kopi susu', '6000', '6000', '1', '24-12-2022', '20:15:13', NULL, '0', '0'),
(513, 2, 6, 156, 36, 'Omlet', '12000', '12000', '1', '24-12-2022', '20:15:13', NULL, '0', '0'),
(514, 2, 6, 156, 82, 'Es teh', '4000', '4000', '1', '24-12-2022', '20:15:13', NULL, '0', '0'),
(515, 2, 6, 157, 88, 'Matcha', '10000', '10000', '1', '24-12-2022', '20:49:52', NULL, '0', '0'),
(516, 2, 6, 157, 79, 'Thaitea', '10000', '10000', '1', '24-12-2022', '20:49:52', NULL, '0', '0'),
(517, 2, 6, 158, 98, 'Kopi hitam', '5000', '10000', '2', '24-12-2022', '21:00:36', NULL, '0', '0'),
(518, 2, 6, 158, 83, 'Es jeruk', '6000', '12000', '2', '24-12-2022', '21:00:36', NULL, '0', '0'),
(519, 2, 6, 158, 91, 'Teh panas', '4000', '8000', '2', '24-12-2022', '21:00:36', NULL, '0', '0'),
(520, 2, 6, 158, 92, 'Jeruk panas', '6000', '6000', '1', '24-12-2022', '21:00:36', NULL, '0', '0'),
(521, 2, 6, 158, 99, 'Kopi robusta', '7000', '7000', '1', '24-12-2022', '21:00:36', NULL, '0', '0'),
(522, 2, 6, 158, 19, 'Tahu crispy', '12000', '36000', '3', '24-12-2022', '21:00:36', NULL, '0', '0'),
(523, 2, 6, 158, 84, 'Dark chocholate', '10000', '10000', '1', '24-12-2022', '21:00:36', NULL, '0', '0'),
(524, 2, 6, 158, 88, 'Matcha', '10000', '20000', '2', '24-12-2022', '21:00:36', NULL, '0', '0'),
(525, 2, 6, 158, 49, 'Nasi ayam suwir', '5000', '25000', '5', '24-12-2022', '21:00:36', NULL, '0', '0'),
(526, 2, 6, 158, 51, 'Nasi bakar teri', '5000', '5000', '1', '24-12-2022', '21:00:36', NULL, '0', '0'),
(527, 2, 6, 158, 50, 'Nasi bakar tongkol', '5000', '20000', '4', '24-12-2022', '21:00:36', NULL, '0', '0'),
(528, 2, 6, 158, 40, 'Usus', '2000', '4000', '2', '24-12-2022', '21:08:03', NULL, '0', '0'),
(529, 2, 6, 158, 43, 'Telur puyuh', '3000', '9000', '3', '24-12-2022', '21:08:03', NULL, '0', '0'),
(530, 2, 6, 159, 51, 'Nasi bakar teri', '5000', '10000', '2', '24-12-2022', '21:17:53', NULL, '0', '0'),
(531, 2, 6, 159, 40, 'Usus', '2000', '10000', '5', '24-12-2022', '21:17:53', NULL, '0', '0'),
(532, 2, 6, 159, 42, 'Jeroan', '2500', '12500', '5', '24-12-2022', '21:17:53', NULL, '0', '0'),
(533, 2, 6, 159, 102, 'Le mineral', '2500', '2500', '1', '24-12-2022', '21:34:50', NULL, '0', '0'),
(534, 2, 6, 158, 82, 'Es teh', '4000', '4000', '1', '24-12-2022', '21:47:13', NULL, '0', '0'),
(538, 2, 6, 157, 98, 'Kopi hitam', '5000', '5000', '1', '24-12-2022', '22:49:24', NULL, '0', '0'),
(539, 2, 6, 161, 61, 'Nasi goreng telur', '13000', '13000', '1', '25-12-2022', '17:53:28', NULL, '0', '0'),
(540, 2, 6, 161, 56, 'Mi nyemek', '15000', '15000', '1', '25-12-2022', '17:53:28', NULL, '0', '0'),
(541, 2, 6, 161, 83, 'Es jeruk', '6000', '12000', '2', '25-12-2022', '17:53:28', NULL, '0', '0'),
(542, 2, 6, 162, 61, 'Nasi goreng telur', '13000', '13000', '1', '25-12-2022', '18:18:06', NULL, '0', '0'),
(543, 2, 6, 162, 53, 'Mi goreng telur ', '13000', '13000', '1', '25-12-2022', '18:18:06', NULL, '0', '0'),
(550, 2, 6, 164, 54, 'Mi goreng ayam ', '18000', '18000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(551, 2, 6, 164, 63, 'Nasi goreng spesial', '23000', '23000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(552, 2, 6, 164, 87, 'Taro', '10000', '10000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(553, 2, 6, 164, 78, 'Milk shake oreo', '15000', '15000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(554, 2, 6, 164, 12, 'Roti maryam chocolat', '11000', '22000', '2', '25-12-2022', '18:32:13', NULL, '0', '0'),
(555, 2, 6, 164, 13, 'Roti maryam keju', '12000', '12000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(556, 2, 6, 164, 84, 'Dark chocholate', '10000', '10000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(557, 2, 6, 164, 49, 'Nasi ayam suwir', '5000', '5000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(558, 2, 6, 164, 43, 'Telur puyuh', '3000', '3000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(559, 2, 6, 164, 42, 'Jeroan', '2500', '7500', '3', '25-12-2022', '18:32:13', NULL, '0', '0'),
(560, 2, 6, 164, 94, 'Hot capucino', '10000', '10000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(561, 2, 6, 164, 55, 'Mi goreng spesial', '23000', '23000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(562, 2, 6, 164, 34, 'Bakso aci', '15000', '15000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(563, 2, 6, 164, 91, 'Teh panas', '4000', '4000', '1', '25-12-2022', '18:32:13', NULL, '0', '0'),
(565, 2, 6, 165, 72, 'Leci squash', '12000', '12000', '1', '25-12-2022', '19:23:20', NULL, '0', '0'),
(566, 2, 6, 165, 64, 'Lalapan 3T', '10000', '30000', '3', '25-12-2022', '19:23:20', NULL, '0', '0'),
(567, 2, 6, 165, 69, 'Mega mendung', '12000', '12000', '1', '25-12-2022', '19:23:20', NULL, '0', '0'),
(568, 2, 6, 165, 82, 'Es teh', '4000', '4000', '1', '25-12-2022', '19:23:20', NULL, '0', '0'),
(569, 2, 6, 166, 40, 'Usus', '2000', '6000', '3', '25-12-2022', '19:57:22', NULL, '0', '0'),
(570, 2, 6, 166, 49, 'Nasi ayam suwir', '5000', '15000', '3', '25-12-2022', '19:57:22', NULL, '0', '0'),
(571, 2, 6, 167, 17, 'Kentang', '10000', '10000', '1', '25-12-2022', '20:04:56', NULL, '0', '0'),
(572, 2, 6, 167, 107, 'Kopi susu', '6000', '6000', '1', '25-12-2022', '20:04:56', NULL, '0', '0'),
(573, 2, 6, 167, 87, 'Taro', '10000', '10000', '1', '25-12-2022', '20:04:56', NULL, '0', '0'),
(574, 2, 6, 168, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '25-12-2022', '20:32:57', NULL, '0', '0'),
(575, 2, 6, 168, 39, 'Soto ayam ', '10000', '10000', '1', '25-12-2022', '20:32:57', NULL, '0', '0'),
(576, 2, 6, 168, 17, 'Kentang', '10000', '10000', '1', '25-12-2022', '20:32:57', NULL, '0', '0'),
(579, 2, 6, 168, 40, 'Usus', '2000', '4000', '2', '25-12-2022', '20:32:57', NULL, '0', '0'),
(580, 2, 6, 168, 34, 'Bakso aci', '15000', '15000', '1', '25-12-2022', '20:32:57', NULL, '0', '0'),
(581, 2, 6, 169, 87, 'Taro', '10000', '10000', '1', '25-12-2022', '20:33:30', NULL, '0', '0'),
(582, 2, 6, 169, 85, 'Mangga', '10000', '10000', '1', '25-12-2022', '20:33:30', NULL, '0', '0'),
(583, 2, 6, 169, 20, 'Tahu walik', '15000', '15000', '1', '25-12-2022', '20:33:30', NULL, '0', '0'),
(584, 2, 6, 170, 71, 'Lemon squash', '12000', '12000', '1', '25-12-2022', '21:21:53', NULL, '0', '0'),
(585, 2, 6, 170, 94, 'Hot capucino', '10000', '10000', '1', '25-12-2022', '21:21:53', NULL, '0', '0'),
(586, 2, 6, 170, 69, 'Mega mendung', '12000', '12000', '1', '25-12-2022', '21:21:53', NULL, '0', '0'),
(587, 2, 6, 170, 21, 'Tahu cabe garam', '15000', '15000', '1', '25-12-2022', '21:21:53', NULL, '0', '0');
INSERT INTO `pembayaran_detail` (`id`, `id_user`, `id_kasir`, `id_pembayaran`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(588, 2, 6, 170, 92, 'Jeruk panas', '6000', '6000', '1', '25-12-2022', '21:37:51', NULL, '0', '0'),
(589, 2, 6, 171, 81, 'Tea tarik', '8000', '8000', '1', '25-12-2022', '21:58:23', NULL, '0', '0'),
(590, 2, 6, 171, 98, 'Kopi hitam', '5000', '5000', '1', '25-12-2022', '21:58:23', NULL, '0', '0'),
(591, 2, 6, 171, 17, 'Kentang', '10000', '10000', '1', '25-12-2022', '21:58:23', NULL, '0', '0'),
(592, 2, 6, 172, 53, 'Mi goreng telur ', '13000', '13000', '1', '25-12-2022', '22:48:57', NULL, '0', '0'),
(593, 2, 6, 172, 39, 'Soto ayam ', '10000', '10000', '1', '25-12-2022', '22:48:57', NULL, '0', '0'),
(594, 2, 6, 172, 57, 'Mi goreng indomie', '6000', '12000', '2', '25-12-2022', '22:48:57', NULL, '0', '0'),
(595, 2, 6, 172, 91, 'Teh panas', '4000', '4000', '1', '25-12-2022', '22:48:57', NULL, '0', '0'),
(596, 2, 6, 172, 83, 'Es jeruk', '6000', '12000', '2', '25-12-2022', '22:48:57', NULL, '0', '0'),
(597, 2, 6, 172, 87, 'Taro', '10000', '10000', '1', '25-12-2022', '22:48:57', NULL, '0', '0'),
(602, 2, 6, 174, 99, 'Kopi robusta', '7000', '7000', '1', '27-12-2022', '13:31:11', NULL, '0', '0'),
(603, 2, 6, 174, 73, 'Melon squash', '12000', '12000', '1', '27-12-2022', '13:31:11', NULL, '0', '0'),
(604, 2, 6, 174, 25, 'Seblak seafood', '15000', '15000', '1', '27-12-2022', '13:31:11', NULL, '0', '0'),
(605, 2, 6, 175, 51, 'Nasi bakar teri', '5000', '5000', '1', '27-12-2022', '18:49:59', NULL, '0', '0'),
(606, 2, 6, 175, 40, 'Usus', '2000', '4000', '2', '27-12-2022', '18:49:59', NULL, '0', '0'),
(607, 2, 6, 175, 47, 'Sayap', '4000', '4000', '1', '27-12-2022', '18:49:59', NULL, '0', '0'),
(608, 2, 6, 175, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '27-12-2022', '18:49:59', NULL, '0', '0'),
(609, 2, 6, 175, 21, 'Tahu cabe garam', '15000', '15000', '1', '27-12-2022', '18:49:59', NULL, '0', '0'),
(610, 2, 6, 175, 85, 'Mangga', '10000', '10000', '1', '27-12-2022', '18:49:59', NULL, '0', '0'),
(612, 2, 6, 176, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '27-12-2022', '19:01:09', NULL, '0', '0'),
(613, 2, 6, 176, 49, 'Nasi ayam suwir', '5000', '10000', '2', '27-12-2022', '19:01:09', NULL, '0', '0'),
(614, 2, 6, 176, 79, 'Thaitea', '10000', '10000', '1', '27-12-2022', '19:01:09', NULL, '0', '0'),
(615, 2, 6, 176, 82, 'Es teh', '4000', '4000', '1', '27-12-2022', '19:01:09', NULL, '0', '0'),
(616, 2, 6, 176, 41, 'Ceker', '2000', '6000', '3', '27-12-2022', '19:01:09', NULL, '0', '0'),
(617, 2, 6, 177, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '27-12-2022', '19:35:33', NULL, '0', '0'),
(618, 2, 6, 177, 47, 'Sayap', '4000', '4000', '1', '27-12-2022', '19:35:33', NULL, '0', '0'),
(619, 2, 6, 177, 41, 'Ceker', '2000', '2000', '1', '27-12-2022', '19:35:33', NULL, '0', '0'),
(620, 2, 6, 178, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '27-12-2022', '20:13:46', NULL, '0', '0'),
(621, 2, 6, 178, 49, 'Nasi ayam suwir', '5000', '5000', '1', '27-12-2022', '20:13:46', NULL, '0', '0'),
(622, 2, 6, 179, 49, 'Nasi ayam suwir', '5000', '5000', '1', '27-12-2022', '20:15:26', NULL, '0', '0'),
(623, 2, 6, 179, 40, 'Usus', '2000', '4000', '2', '27-12-2022', '20:15:26', NULL, '0', '0'),
(624, 2, 6, 179, 47, 'Sayap', '4000', '4000', '1', '27-12-2022', '20:15:26', NULL, '0', '0'),
(625, 2, 6, 179, 57, 'Mi goreng indomie', '6000', '6000', '1', '27-12-2022', '20:15:26', NULL, '0', '0'),
(626, 2, 6, 179, 88, 'Matcha', '10000', '10000', '1', '27-12-2022', '20:15:26', NULL, '0', '0'),
(627, 2, 6, 179, 78, 'Milk shake oreo', '15000', '15000', '1', '27-12-2022', '20:15:26', NULL, '0', '0'),
(628, 2, 6, 179, 84, 'Dark chocholate', '10000', '10000', '1', '27-12-2022', '20:15:26', NULL, '0', '0'),
(629, 2, 6, 180, 60, 'Nasi goreng ori', '10000', '10000', '1', '27-12-2022', '20:17:15', NULL, '0', '0'),
(630, 2, 6, 180, 88, 'Matcha', '10000', '10000', '1', '27-12-2022', '20:17:15', NULL, '0', '0'),
(631, 2, 6, 180, 82, 'Es teh', '4000', '4000', '1', '27-12-2022', '20:17:15', NULL, '0', '0'),
(632, 2, 6, 180, 85, 'Mangga', '10000', '10000', '1', '27-12-2022', '20:17:15', NULL, '0', '0'),
(633, 2, 6, 181, 70, 'Soda gembira', '12000', '12000', '1', '27-12-2022', '20:20:42', NULL, '0', '0'),
(634, 2, 6, 181, 86, 'Strawberry', '10000', '10000', '1', '27-12-2022', '20:20:42', NULL, '0', '0'),
(635, 2, 6, 181, 49, 'Nasi ayam suwir', '5000', '5000', '1', '27-12-2022', '20:20:42', NULL, '0', '0'),
(636, 2, 6, 181, 40, 'Usus', '2000', '4000', '2', '27-12-2022', '20:20:42', NULL, '0', '0'),
(637, 2, 6, 182, 61, 'Nasi goreng telur', '13000', '13000', '1', '27-12-2022', '20:36:31', NULL, '0', '0'),
(638, 2, 6, 182, 67, 'Lalapan ayam kampung', '25000', '25000', '1', '27-12-2022', '20:36:31', NULL, '0', '0'),
(639, 2, 6, 182, 70, 'Soda gembira', '12000', '12000', '1', '27-12-2022', '20:36:31', NULL, '0', '0'),
(640, 2, 6, 182, 82, 'Es teh', '4000', '4000', '1', '27-12-2022', '20:36:31', NULL, '0', '0'),
(641, 2, 6, 182, 17, 'Kentang', '10000', '10000', '1', '27-12-2022', '20:36:31', NULL, '0', '0'),
(642, 2, 6, 182, 76, 'Milk shake vanila', '15000', '15000', '1', '27-12-2022', '20:36:31', NULL, '0', '0'),
(643, 2, 6, 182, 68, 'Lalapan ayam potong', '18000', '18000', '1', '27-12-2022', '20:48:08', NULL, '0', '0'),
(644, 2, 6, 183, 49, 'Nasi ayam suwir', '5000', '10000', '2', '27-12-2022', '21:56:42', NULL, '0', '0'),
(645, 2, 6, 183, 41, 'Ceker', '2000', '2000', '1', '27-12-2022', '21:56:42', NULL, '0', '0'),
(646, 2, 6, 183, 47, 'Sayap', '4000', '8000', '2', '27-12-2022', '21:56:42', NULL, '0', '0'),
(647, 2, 6, 183, 82, 'Es teh', '4000', '8000', '2', '27-12-2022', '21:56:42', NULL, '0', '0'),
(648, 2, 6, 184, 14, 'Roti maryam chocolat keju', '16000', '16000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(649, 2, 6, 184, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(650, 2, 6, 184, 82, 'Es teh', '4000', '4000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(651, 2, 6, 184, 75, 'Milk shake chocolate', '15000', '15000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(652, 2, 6, 184, 67, 'Lalapan ayam kampung', '25000', '25000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(653, 2, 6, 184, 65, 'Lalapan lele', '15000', '15000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(654, 2, 6, 184, 25, 'Seblak seafood', '15000', '15000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(655, 2, 6, 184, 60, 'Nasi goreng ori', '10000', '10000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(656, 2, 6, 184, 100, 'Wedang jahe', '7000', '7000', '1', '28-12-2022', '19:39:23', NULL, '0', '0'),
(657, 2, 6, 184, 70, 'Soda gembira', '12000', '12000', '1', '28-12-2022', '20:00:17', NULL, '0', '0'),
(658, 2, 6, 185, 62, 'Nasi goreng ayam ', '17000', '17000', '1', '28-12-2022', '21:08:47', NULL, '0', '0'),
(659, 2, 6, 185, 83, 'Es jeruk', '6000', '6000', '1', '28-12-2022', '21:08:47', NULL, '0', '0'),
(660, 2, 6, 186, 11, 'Roti maryam original ', '8000', '8000', '1', '28-12-2022', '21:10:41', NULL, '0', '0'),
(661, 2, 6, 186, 92, 'Jeruk panas', '6000', '6000', '1', '28-12-2022', '21:10:41', NULL, '0', '0'),
(662, 2, 6, 186, 99, 'Kopi robusta', '7000', '7000', '1', '28-12-2022', '21:10:41', NULL, '0', '0'),
(663, 2, 6, 186, 17, 'Kentang', '10000', '10000', '1', '28-12-2022', '21:10:41', NULL, '0', '0'),
(664, 2, 6, 186, 13, 'Roti maryam keju', '12000', '12000', '1', '28-12-2022', '21:10:41', NULL, '0', '0'),
(665, 2, 6, 187, 98, 'Kopi hitam', '5000', '10000', '2', '28-12-2022', '21:27:15', NULL, '0', '0'),
(667, 2, 6, 187, 49, 'Nasi ayam suwir', '5000', '20000', '4', '28-12-2022', '21:27:15', NULL, '0', '0'),
(668, 2, 6, 187, 40, 'Usus', '2000', '4000', '2', '28-12-2022', '21:51:41', NULL, '0', '0'),
(669, 2, 6, 187, 47, 'Sayap', '4000', '8000', '2', '28-12-2022', '21:51:41', NULL, '0', '0'),
(670, 2, 6, 187, 41, 'Ceker', '2000', '4000', '2', '28-12-2022', '21:51:41', NULL, '0', '0'),
(671, 2, 6, 187, 43, 'Telur puyuh', '3000', '6000', '2', '28-12-2022', '21:51:41', NULL, '0', '0'),
(672, 2, 6, 188, 17, 'Kentang', '10000', '10000', '1', '29-12-2022', '16:39:54', NULL, '0', '0'),
(673, 2, 6, 188, 98, 'Kopi hitam', '5000', '10000', '2', '29-12-2022', '16:39:54', NULL, '0', '0'),
(674, 2, 6, 189, 67, 'Lalapan ayam kampung', '25000', '25000', '1', '29-12-2022', '16:59:04', NULL, '0', '0'),
(675, 2, 6, 189, 82, 'Es teh', '4000', '4000', '1', '29-12-2022', '16:59:04', NULL, '0', '0'),
(676, 2, 6, 189, 39, 'Soto ayam ', '10000', '10000', '1', '29-12-2022', '16:59:04', NULL, '0', '0'),
(677, 2, 6, 189, 76, 'Milk shake vanila', '15000', '15000', '1', '29-12-2022', '16:59:04', NULL, '0', '0'),
(678, 2, 6, 190, 102, 'Le mineral', '2500', '2500', '1', '29-12-2022', '17:44:52', NULL, '0', '0'),
(680, 2, 6, 192, 49, 'Nasi ayam suwir', '5000', '10000', '2', '29-12-2022', '17:55:40', NULL, '0', '0'),
(681, 2, 6, 192, 50, 'Nasi bakar tongkol', '5000', '10000', '2', '29-12-2022', '17:55:40', NULL, '0', '0'),
(682, 2, 6, 192, 42, 'Jeroan', '2500', '10000', '4', '29-12-2022', '17:55:40', NULL, '0', '0'),
(683, 2, 6, 192, 43, 'Telur puyuh', '3000', '6000', '2', '29-12-2022', '17:55:40', NULL, '0', '0'),
(684, 2, 6, 192, 40, 'Usus', '2000', '12000', '6', '29-12-2022', '17:55:40', NULL, '0', '0'),
(685, 2, 6, 193, 51, 'Nasi bakar teri', '5000', '20000', '4', '29-12-2022', '18:41:37', NULL, '0', '0'),
(686, 2, 6, 193, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '29-12-2022', '18:41:37', NULL, '0', '0'),
(688, 2, 6, 193, 83, 'Es jeruk', '6000', '12000', '2', '29-12-2022', '18:41:37', NULL, '0', '0'),
(689, 2, 6, 194, 61, 'Nasi goreng telur', '13000', '26000', '2', '29-12-2022', '19:21:24', NULL, '0', '0'),
(690, 2, 6, 194, 80, 'Lemon tea', '10000', '10000', '1', '29-12-2022', '19:21:24', NULL, '0', '0'),
(691, 2, 6, 194, 88, 'Matcha', '10000', '10000', '1', '29-12-2022', '19:21:24', NULL, '0', '0'),
(692, 2, 6, 195, 39, 'Soto ayam ', '10000', '20000', '2', '29-12-2022', '19:38:14', NULL, '0', '0'),
(693, 2, 6, 195, 17, 'Kentang', '10000', '10000', '1', '29-12-2022', '19:38:14', NULL, '0', '0'),
(694, 2, 6, 196, 60, 'Nasi goreng ori', '10000', '10000', '1', '29-12-2022', '19:38:47', NULL, '0', '0'),
(695, 2, 6, 196, 79, 'Thaitea', '10000', '10000', '1', '29-12-2022', '19:38:47', NULL, '0', '0'),
(696, 2, 6, 196, 88, 'Matcha', '10000', '20000', '2', '29-12-2022', '19:38:47', NULL, '0', '0'),
(697, 2, 6, 197, 20, 'Tahu walik', '15000', '15000', '1', '29-12-2022', '19:48:30', NULL, '0', '0'),
(698, 2, 6, 197, 78, 'Milk shake oreo', '15000', '30000', '2', '29-12-2022', '19:48:30', NULL, '0', '0'),
(699, 2, 6, 198, 61, 'Nasi goreng telur', '13000', '13000', '1', '29-12-2022', '20:04:16', NULL, '0', '0'),
(700, 2, 6, 198, 70, 'Soda gembira', '12000', '12000', '1', '29-12-2022', '20:04:16', NULL, '0', '0'),
(701, 2, 6, 198, 49, 'Nasi ayam suwir', '5000', '5000', '1', '29-12-2022', '20:04:16', NULL, '0', '0'),
(702, 2, 6, 198, 43, 'Telur puyuh', '3000', '3000', '1', '29-12-2022', '20:04:16', NULL, '0', '0'),
(703, 2, 6, 198, 41, 'Ceker', '2000', '2000', '1', '29-12-2022', '20:04:16', NULL, '0', '0'),
(704, 2, 6, 198, 82, 'Es teh', '4000', '4000', '1', '29-12-2022', '20:04:16', NULL, '0', '0'),
(705, 2, 6, 199, 99, 'Kopi robusta', '7000', '7000', '1', '29-12-2022', '20:43:18', NULL, '0', '0'),
(706, 2, 6, 199, 94, 'Hot capucino', '10000', '10000', '1', '29-12-2022', '20:43:18', NULL, '0', '0'),
(707, 2, 6, 200, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '29-12-2022', '20:51:30', NULL, '0', '0'),
(708, 2, 6, 200, 94, 'Hot capucino', '10000', '10000', '1', '29-12-2022', '20:51:30', NULL, '0', '0'),
(709, 2, 6, 200, 75, 'Milk shake chocolate', '15000', '30000', '2', '29-12-2022', '21:19:44', NULL, '0', '0'),
(710, 2, 6, 200, 100, 'Wedang jahe', '7000', '7000', '1', '29-12-2022', '21:19:44', NULL, '0', '0'),
(711, 2, 6, 200, 13, 'Roti maryam keju', '12000', '12000', '1', '29-12-2022', '21:19:44', NULL, '0', '0'),
(712, 2, 6, 200, 20, 'Tahu walik', '15000', '15000', '1', '29-12-2022', '21:19:44', NULL, '0', '0'),
(713, 2, 6, 201, 39, 'Soto ayam ', '10000', '10000', '1', '29-12-2022', '21:20:31', NULL, '0', '0'),
(714, 2, 6, 201, 52, 'Mi goreng ori', '10000', '10000', '1', '29-12-2022', '21:20:31', NULL, '0', '0'),
(715, 2, 6, 202, 62, 'Nasi goreng ayam ', '17000', '17000', '1', '30-12-2022', '17:49:48', NULL, '0', '0'),
(716, 2, 6, 202, 101, 'Jahe susu', '8000', '16000', '2', '30-12-2022', '17:49:48', NULL, '0', '0'),
(717, 2, 6, 202, 39, 'Soto ayam ', '10000', '10000', '1', '30-12-2022', '17:49:48', NULL, '0', '0'),
(718, 2, 6, 202, 56, 'Mi nyemek', '15000', '15000', '1', '30-12-2022', '17:49:48', NULL, '0', '0'),
(719, 2, 6, 202, 83, 'Es jeruk', '6000', '6000', '1', '30-12-2022', '17:49:48', NULL, '0', '0'),
(720, 2, 6, 203, 12, 'Roti maryam chocolat', '11000', '22000', '2', '30-12-2022', '20:21:56', NULL, '0', '0'),
(721, 2, 6, 203, 83, 'Es jeruk', '6000', '6000', '1', '30-12-2022', '20:21:56', NULL, '0', '0'),
(722, 2, 6, 203, 102, 'Le mineral', '2500', '2500', '1', '30-12-2022', '20:21:56', NULL, '0', '0'),
(723, 2, 6, 204, 49, 'Nasi ayam suwir', '5000', '5000', '1', '30-12-2022', '20:23:03', NULL, '0', '0'),
(724, 2, 6, 204, 12, 'Roti maryam chocolat', '11000', '11000', '1', '30-12-2022', '20:23:03', NULL, '0', '0'),
(725, 2, 6, 204, 43, 'Telur puyuh', '3000', '6000', '2', '30-12-2022', '20:23:03', NULL, '0', '0'),
(726, 2, 6, 205, 87, 'Taro', '10000', '10000', '1', '30-12-2022', '20:23:35', NULL, '0', '0'),
(727, 2, 6, 206, 85, 'Mangga', '10000', '10000', '1', '30-12-2022', '20:23:58', NULL, '0', '0'),
(728, 2, 6, 207, 39, 'Soto ayam ', '10000', '10000', '1', '31-12-2022', '13:06:27', NULL, '0', '0'),
(732, 2, 6, 210, 62, 'Nasi goreng ayam ', '17000', '17000', '1', '31-12-2022', '19:35:13', NULL, '0', '0'),
(733, 2, 6, 210, 43, 'Telur puyuh', '3000', '9000', '3', '31-12-2022', '19:35:13', NULL, '0', '0'),
(734, 2, 6, 211, 88, 'Matcha', '10000', '10000', '1', '31-12-2022', '19:43:50', NULL, '0', '0'),
(735, 2, 6, 211, 90, 'Es cokelat roti', '12000', '12000', '1', '31-12-2022', '19:43:50', NULL, '0', '0'),
(736, 2, 6, 212, 85, 'Mangga', '10000', '20000', '2', '31-12-2022', '19:54:37', NULL, '0', '0'),
(737, 2, 6, 212, 88, 'Matcha', '10000', '20000', '2', '31-12-2022', '19:54:37', NULL, '0', '0'),
(738, 2, 6, 212, 93, 'Hot chochalate', '13000', '13000', '1', '31-12-2022', '19:54:37', NULL, '0', '0'),
(739, 2, 6, 212, 84, 'Dark chocholate', '10000', '20000', '2', '31-12-2022', '20:00:21', NULL, '0', '0'),
(740, 2, 6, 213, 60, 'Nasi goreng ori', '10000', '20000', '2', '31-12-2022', '20:15:21', NULL, '0', '0'),
(741, 2, 6, 213, 50, 'Nasi bakar tongkol', '5000', '25000', '5', '31-12-2022', '20:15:21', NULL, '0', '0'),
(742, 2, 6, 213, 51, 'Nasi bakar teri', '5000', '10000', '2', '31-12-2022', '20:15:21', NULL, '0', '0'),
(743, 2, 6, 213, 91, 'Teh panas', '4000', '12000', '3', '31-12-2022', '20:15:21', NULL, '0', '0'),
(744, 2, 6, 213, 75, 'Milk shake chocolate', '15000', '30000', '2', '31-12-2022', '20:15:21', NULL, '0', '0'),
(745, 2, 6, 213, 52, 'Mi goreng ori', '10000', '20000', '2', '31-12-2022', '20:15:21', NULL, '0', '0'),
(746, 2, 6, 213, 89, 'Chocho malt', '10000', '20000', '2', '31-12-2022', '20:15:21', NULL, '0', '0'),
(747, 2, 6, 213, 20, 'Tahu walik', '15000', '15000', '1', '31-12-2022', '20:15:21', NULL, '0', '0'),
(749, 2, 6, 213, 82, 'Es teh', '4000', '4000', '1', '31-12-2022', '20:15:21', NULL, '0', '0'),
(751, 2, 6, 213, 61, 'Nasi goreng telur', '13000', '13000', '1', '31-12-2022', '20:23:05', NULL, '0', '0'),
(752, 2, 6, 213, 79, 'Thaitea', '10000', '20000', '2', '31-12-2022', '20:23:05', NULL, '0', '0'),
(753, 2, 6, 213, 49, 'Nasi ayam suwir', '5000', '5000', '1', '31-12-2022', '20:39:34', NULL, '0', '0'),
(754, 2, 6, 212, 87, 'Taro', '10000', '20000', '2', '31-12-2022', '20:44:31', NULL, '0', '0'),
(755, 2, 6, 212, 78, 'Milk shake oreo', '15000', '15000', '1', '31-12-2022', '20:44:31', NULL, '0', '0'),
(758, 2, 6, 214, 89, 'Chocho malt', '10000', '10000', '1', '31-12-2022', '22:13:03', NULL, '0', '0'),
(759, 2, 6, 214, 84, 'Dark chocholate', '10000', '10000', '1', '31-12-2022', '22:13:03', NULL, '0', '0'),
(760, 2, 6, 215, 49, 'Nasi ayam suwir', '5000', '5000', '1', '31-12-2022', '22:50:05', NULL, '0', '0'),
(761, 2, 6, 215, 51, 'Nasi bakar teri', '5000', '5000', '1', '31-12-2022', '22:50:05', NULL, '0', '0'),
(762, 2, 6, 215, 40, 'Usus', '2000', '6000', '3', '31-12-2022', '22:50:05', NULL, '0', '0'),
(763, 2, 6, 215, 70, 'Soda gembira', '12000', '12000', '1', '31-12-2022', '22:50:05', NULL, '0', '0'),
(764, 2, 6, 215, 82, 'Es teh', '4000', '4000', '1', '31-12-2022', '22:50:05', NULL, '0', '0'),
(765, 2, 6, 216, 75, 'Milk shake chocolate', '15000', '30000', '2', '31-12-2022', '23:03:00', NULL, '0', '0'),
(766, 2, 6, 215, 43, 'Telur puyuh', '3000', '6000', '2', '31-12-2022', '23:30:24', NULL, '0', '0'),
(777, 2, 6, 220, 12, 'Roti maryam chocolat', '11000', '11000', '1', '01-01-2023', '18:46:52', NULL, '0', '0'),
(778, 2, 6, 220, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '01-01-2023', '18:46:52', NULL, '0', '0'),
(779, 2, 6, 220, 62, 'Nasi goreng ayam ', '17000', '34000', '2', '01-01-2023', '18:46:52', NULL, '0', '0'),
(780, 2, 6, 220, 69, 'Mega mendung', '12000', '12000', '1', '01-01-2023', '18:46:52', NULL, '0', '0'),
(781, 2, 6, 220, 75, 'Milk shake chocolate', '15000', '15000', '1', '01-01-2023', '18:46:52', NULL, '0', '0'),
(782, 2, 6, 220, 81, 'Tea tarik', '8000', '8000', '1', '01-01-2023', '18:46:52', NULL, '0', '0'),
(783, 2, 6, 221, 51, 'Nasi bakar teri', '5000', '15000', '3', '01-01-2023', '19:04:56', NULL, '0', '0'),
(784, 2, 6, 221, 83, 'Es jeruk', '6000', '6000', '1', '01-01-2023', '19:04:56', NULL, '0', '0'),
(785, 2, 6, 221, 92, 'Jeruk panas', '6000', '6000', '1', '01-01-2023', '19:04:56', NULL, '0', '0'),
(786, 2, 6, 222, 12, 'Roti maryam chocolat', '11000', '11000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(787, 2, 6, 222, 17, 'Kentang', '10000', '10000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(788, 2, 6, 222, 20, 'Tahu walik', '15000', '15000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(789, 2, 6, 222, 32, 'Pentol kering judes', '13000', '13000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(790, 2, 6, 222, 36, 'Omlet', '12000', '12000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(791, 2, 6, 222, 72, 'Leci squash', '12000', '12000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(792, 2, 6, 222, 74, 'Chochopandan squash', '12000', '12000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(793, 2, 6, 222, 27, 'Seblak mie', '12000', '12000', '1', '01-01-2023', '19:37:58', NULL, '0', '0'),
(794, 2, 6, 223, 100, 'Wedang jahe', '7000', '7000', '1', '02-01-2023', '15:33:19', NULL, '0', '0'),
(795, 2, 6, 223, 79, 'Thaitea', '10000', '10000', '1', '02-01-2023', '15:33:19', NULL, '0', '0'),
(797, 2, 6, 224, 111, 'Krupuk seblak', '5000', '5000', '1', '02-01-2023', '15:39:33', NULL, '5000', '5000'),
(798, 2, 6, 224, 98, 'Kopi hitam', '5000', '5000', '1', '02-01-2023', '15:39:33', NULL, '0', '0'),
(799, 2, 6, 224, 39, 'Soto ayam ', '10000', '10000', '1', '02-01-2023', '15:39:33', NULL, '0', '0'),
(800, 2, 6, 224, 61, 'Nasi goreng telur', '13000', '13000', '1', '02-01-2023', '15:39:33', NULL, '0', '0'),
(801, 2, 6, 225, 85, 'Mangga', '10000', '10000', '1', '02-01-2023', '19:14:03', NULL, '0', '0'),
(802, 2, 6, 225, 88, 'Matcha', '10000', '10000', '1', '02-01-2023', '19:14:03', NULL, '0', '0'),
(803, 2, 6, 225, 94, 'Hot capucino', '10000', '10000', '1', '02-01-2023', '19:14:03', NULL, '0', '0'),
(804, 2, 6, 225, 92, 'Jeruk panas', '6000', '6000', '1', '02-01-2023', '19:14:03', NULL, '0', '0'),
(805, 2, 6, 226, 50, 'Nasi bakar tongkol', '5000', '10000', '2', '02-01-2023', '19:15:28', NULL, '0', '0'),
(806, 2, 6, 226, 49, 'Nasi ayam suwir', '5000', '10000', '2', '02-01-2023', '19:15:28', NULL, '0', '0'),
(807, 2, 6, 226, 91, 'Teh panas', '4000', '8000', '2', '02-01-2023', '19:15:28', NULL, '0', '0'),
(808, 2, 6, 226, 20, 'Tahu walik', '15000', '15000', '1', '02-01-2023', '19:15:28', NULL, '0', '0'),
(809, 2, 6, 227, 43, 'Telur puyuh', '3000', '3000', '1', '02-01-2023', '20:08:06', NULL, '0', '0'),
(810, 2, 6, 227, 66, 'Lalapan mujaer', '30000', '30000', '1', '02-01-2023', '20:08:06', NULL, '0', '0'),
(811, 2, 6, 227, 65, 'Lalapan lele', '15000', '15000', '1', '02-01-2023', '20:08:06', NULL, '0', '0'),
(812, 2, 6, 227, 92, 'Jeruk panas', '6000', '12000', '2', '02-01-2023', '20:08:06', NULL, '0', '0'),
(813, 2, 6, 227, 51, 'Nasi bakar teri', '5000', '5000', '1', '02-01-2023', '20:08:06', NULL, '0', '0'),
(814, 2, 6, 227, 40, 'Usus', '2000', '2000', '1', '02-01-2023', '20:08:06', NULL, '0', '0'),
(815, 2, 6, 228, 11, 'Roti maryam original ', '8000', '8000', '1', '02-01-2023', '20:10:00', NULL, '0', '0'),
(816, 2, 6, 225, 49, 'Nasi ayam suwir', '5000', '20000', '4', '02-01-2023', '20:20:24', NULL, '0', '0'),
(817, 2, 6, 225, 40, 'Usus', '2000', '8000', '4', '02-01-2023', '20:20:24', NULL, '0', '0'),
(818, 2, 6, 229, 68, 'Lalapan ayam potong', '18000', '216000', '12', '03-01-2023', '15:04:38', NULL, '0', '0'),
(819, 2, 6, 229, 24, 'Seblak komplit', '20000', '80000', '4', '03-01-2023', '15:04:38', NULL, '0', '0'),
(820, 2, 6, 229, 39, 'Soto ayam ', '10000', '40000', '4', '03-01-2023', '15:04:38', NULL, '0', '0'),
(821, 2, 6, 229, 25, 'Seblak seafood', '15000', '15000', '1', '03-01-2023', '15:04:38', NULL, '0', '0'),
(822, 2, 6, 229, 64, 'Lalapan 3T', '10000', '10000', '1', '03-01-2023', '15:04:38', NULL, '0', '0'),
(823, 2, 6, 229, 82, 'Es teh', '4000', '80000', '20', '03-01-2023', '15:04:38', NULL, '0', '0'),
(824, 2, 6, 229, 98, 'Kopi hitam', '5000', '10000', '2', '03-01-2023', '15:04:38', NULL, '0', '0'),
(825, 2, 6, 229, 83, 'Es jeruk', '6000', '18000', '3', '03-01-2023', '15:04:38', NULL, '0', '0'),
(826, 2, 6, 229, 69, 'Mega mendung', '12000', '12000', '1', '03-01-2023', '15:04:38', NULL, '0', '0'),
(827, 2, 6, 229, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '03-01-2023', '15:04:38', NULL, '0', '0'),
(828, 2, 6, 229, 66, 'Lalapan mujaer', '30000', '30000', '1', '03-01-2023', '15:04:38', NULL, '0', '0'),
(829, 2, 6, 229, 20, 'Tahu walik', '15000', '30000', '2', '03-01-2023', '15:04:38', NULL, '0', '0'),
(835, 2, 6, 229, 102, 'Le mineral', '2500', '10000', '4', '03-01-2023', '15:15:39', NULL, '0', '0'),
(837, 2, 6, 231, 78, 'Milk shake oreo', '15000', '15000', '1', '03-01-2023', '15:23:04', NULL, '0', '0'),
(838, 2, 6, 231, 17, 'Kentang', '10000', '20000', '2', '03-01-2023', '15:23:04', NULL, '0', '0'),
(839, 2, 6, 232, 80, 'Lemon tea', '10000', '20000', '2', '03-01-2023', '17:24:40', NULL, '0', '0'),
(840, 2, 6, 232, 25, 'Seblak seafood', '15000', '45000', '3', '03-01-2023', '17:24:40', NULL, '0', '0'),
(841, 2, 6, 232, 87, 'Taro', '10000', '10000', '1', '03-01-2023', '17:24:40', NULL, '0', '0'),
(842, 2, 6, 232, 72, 'Leci squash', '12000', '36000', '3', '03-01-2023', '17:24:40', NULL, '0', '0'),
(843, 2, 6, 232, 113, 'Happytos', '13000', '13000', '1', '03-01-2023', '17:24:40', NULL, '13000', '13000'),
(844, 2, 6, 232, 101, 'Jahe susu', '8000', '16000', '2', '03-01-2023', '17:24:40', NULL, '0', '0'),
(845, 2, 6, 232, 98, 'Kopi hitam', '5000', '10000', '2', '03-01-2023', '17:24:40', NULL, '0', '0'),
(846, 2, 6, 232, 79, 'Thaitea', '10000', '10000', '1', '03-01-2023', '17:24:40', NULL, '0', '0'),
(847, 2, 6, 232, 78, 'Milk shake oreo', '15000', '15000', '1', '03-01-2023', '17:24:40', NULL, '0', '0'),
(848, 2, 6, 232, 27, 'Seblak mie', '12000', '24000', '2', '03-01-2023', '17:24:40', NULL, '0', '0'),
(849, 2, 6, 232, 83, 'Es jeruk', '6000', '6000', '1', '03-01-2023', '17:24:40', NULL, '0', '0'),
(850, 2, 6, 232, 70, 'Soda gembira', '12000', '36000', '3', '03-01-2023', '17:24:40', NULL, '0', '0'),
(851, 2, 6, 232, 62, 'Nasi goreng ayam ', '17000', '51000', '3', '03-01-2023', '17:24:40', NULL, '0', '0'),
(852, 2, 6, 232, 75, 'Milk shake chocolate', '15000', '30000', '2', '03-01-2023', '17:24:40', NULL, '0', '0'),
(853, 2, 6, 232, 73, 'Melon squash', '12000', '12000', '1', '03-01-2023', '17:24:40', NULL, '0', '0'),
(854, 2, 6, 232, 114, 'Susu panas ', '8000', '8000', '1', '03-01-2023', '17:31:53', NULL, '0', '0'),
(855, 2, 6, 231, 85, 'Mangga', '10000', '10000', '1', '03-01-2023', '17:35:09', NULL, '0', '0'),
(856, 2, 6, 233, 84, 'Dark chocholate', '10000', '10000', '1', '03-01-2023', '17:38:22', NULL, '0', '0'),
(857, 2, 6, 233, 89, 'Chocho malt', '10000', '10000', '1', '03-01-2023', '17:38:22', NULL, '0', '0'),
(858, 2, 6, 233, 61, 'Nasi goreng telur', '13000', '26000', '2', '03-01-2023', '17:38:22', NULL, '0', '0'),
(859, 2, 6, 234, 101, 'Jahe susu', '8000', '8000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(860, 2, 6, 234, 75, 'Milk shake chocolate', '15000', '15000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(861, 2, 6, 234, 99, 'Kopi robusta', '7000', '7000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(862, 2, 6, 234, 94, 'Hot capucino', '10000', '10000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(863, 2, 6, 234, 76, 'Milk shake vanila', '15000', '15000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(864, 2, 6, 234, 17, 'Kentang', '10000', '10000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(865, 2, 6, 234, 12, 'Roti maryam chocolat', '11000', '11000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(866, 2, 6, 234, 20, 'Tahu walik', '15000', '15000', '1', '03-01-2023', '17:48:09', NULL, '0', '0'),
(867, 2, 6, 231, 115, 'Es white coffe', '10000', '10000', '1', '03-01-2023', '20:02:27', NULL, '0', '0'),
(868, 2, 6, 235, 87, 'Taro', '10000', '10000', '1', '03-01-2023', '20:04:28', NULL, '0', '0'),
(869, 2, 6, 235, 72, 'Leci squash', '12000', '12000', '1', '03-01-2023', '20:04:28', NULL, '0', '0'),
(870, 2, 6, 236, 49, 'Nasi ayam suwir', '5000', '5000', '1', '03-01-2023', '20:10:46', NULL, '0', '0'),
(871, 2, 6, 236, 98, 'Kopi hitam', '5000', '5000', '1', '03-01-2023', '20:10:46', NULL, '0', '0'),
(872, 2, 6, 236, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '03-01-2023', '20:10:46', NULL, '0', '0'),
(873, 2, 6, 236, 20, 'Tahu walik', '15000', '15000', '1', '03-01-2023', '20:10:46', NULL, '0', '0'),
(874, 2, 6, 236, 92, 'Jeruk panas', '6000', '6000', '1', '03-01-2023', '20:10:46', NULL, '0', '0'),
(875, 2, 6, 236, 101, 'Jahe susu', '8000', '8000', '1', '03-01-2023', '20:10:46', NULL, '0', '0'),
(876, 2, 6, 237, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '03-01-2023', '20:13:15', NULL, '0', '0'),
(877, 2, 6, 237, 92, 'Jeruk panas', '6000', '6000', '1', '03-01-2023', '20:13:15', NULL, '0', '0'),
(878, 2, 6, 237, 116, 'Es milo dino', '12000', '12000', '1', '03-01-2023', '20:13:15', NULL, '12000', '12000'),
(879, 2, 6, 238, 117, 'Es teler', '10000', '20000', '2', '03-01-2023', '20:17:20', NULL, '10000', '20000'),
(880, 2, 6, 239, 79, 'Thaitea', '10000', '20000', '2', '03-01-2023', '20:19:35', NULL, '0', '0'),
(881, 2, 6, 240, 99, 'Kopi robusta', '7000', '7000', '1', '03-01-2023', '21:11:34', NULL, '0', '0'),
(882, 2, 6, 240, 98, 'Kopi hitam', '5000', '5000', '1', '03-01-2023', '21:11:34', NULL, '0', '0'),
(887, 2, 6, 243, 49, 'Nasi ayam suwir', '5000', '25000', '5', '04-01-2023', '12:00:27', NULL, '0', '0'),
(888, 2, 6, 243, 40, 'Usus', '2000', '4000', '2', '04-01-2023', '12:00:27', NULL, '0', '0'),
(889, 2, 6, 243, 47, 'Sayap', '4000', '8000', '2', '04-01-2023', '12:00:27', NULL, '0', '0'),
(890, 2, 6, 243, 20, 'Tahu walik', '15000', '15000', '1', '04-01-2023', '12:00:27', NULL, '0', '0'),
(895, 2, 6, 245, 50, 'Nasi bakar tongkol', '5000', '40000', '8', '04-01-2023', '19:33:38', NULL, '0', '0'),
(896, 2, 6, 245, 40, 'Usus', '2000', '28000', '14', '04-01-2023', '19:33:38', NULL, '0', '0'),
(897, 2, 6, 245, 42, 'Jeroan', '2500', '10000', '4', '04-01-2023', '19:33:38', NULL, '0', '0'),
(898, 2, 6, 246, 118, 'Alpukat Milo', '10000', '10000', '1', '04-01-2023', '19:34:36', NULL, '0', '0'),
(899, 2, 6, 247, 37, 'Nasi', '5000', '5000', '1', '04-01-2023', '19:34:54', NULL, '0', '0'),
(900, 2, 6, 248, 49, 'Nasi ayam suwir', '5000', '10000', '2', '04-01-2023', '22:29:05', NULL, '0', '0'),
(901, 2, 6, 248, 83, 'Es jeruk', '6000', '6000', '1', '04-01-2023', '22:29:05', NULL, '0', '0'),
(902, 2, 6, 248, 118, 'Alpukat Milo', '10000', '10000', '1', '04-01-2023', '22:29:05', NULL, '0', '0'),
(903, 2, 6, 249, 60, 'Nasi goreng ori', '10000', '20000', '2', '05-01-2023', '16:01:45', NULL, '0', '0'),
(904, 2, 6, 249, 43, 'Telur puyuh', '3000', '6000', '2', '05-01-2023', '16:01:45', NULL, '0', '0'),
(905, 2, 6, 249, 79, 'Thaitea', '10000', '10000', '1', '05-01-2023', '16:01:45', NULL, '0', '0'),
(906, 2, 6, 249, 75, 'Milk shake chocolate', '15000', '15000', '1', '05-01-2023', '16:01:45', NULL, '0', '0'),
(907, 2, 6, 250, 83, 'Es jeruk', '6000', '12000', '2', '05-01-2023', '20:36:02', NULL, '0', '0'),
(908, 2, 6, 251, 85, 'Mangga', '10000', '10000', '1', '05-01-2023', '20:36:23', NULL, '0', '0'),
(909, 2, 6, 252, 79, 'Thaitea', '10000', '10000', '1', '05-01-2023', '22:02:36', NULL, '0', '0'),
(910, 2, 6, 252, 69, 'Mega mendung', '12000', '12000', '1', '05-01-2023', '22:02:36', NULL, '0', '0'),
(911, 2, 6, 253, 117, 'Es teler', '10000', '50000', '5', '06-01-2023', '12:25:54', NULL, '10000', '50000'),
(912, 2, 6, 254, 117, 'Es teler', '10000', '10000', '1', '06-01-2023', '15:04:31', NULL, '10000', '10000'),
(913, 2, 6, 255, 61, 'Nasi goreng telur', '13000', '13000', '1', '06-01-2023', '15:07:02', NULL, '0', '0'),
(914, 2, 6, 255, 17, 'Kentang', '10000', '10000', '1', '06-01-2023', '15:07:02', NULL, '0', '0'),
(915, 2, 6, 255, 98, 'Kopi hitam', '5000', '5000', '1', '06-01-2023', '15:07:02', NULL, '0', '0'),
(916, 2, 6, 255, 25, 'Seblak seafood', '15000', '15000', '1', '06-01-2023', '15:07:02', NULL, '0', '0'),
(917, 2, 6, 255, 82, 'Es teh', '4000', '8000', '2', '06-01-2023', '15:07:02', NULL, '0', '0'),
(918, 2, 6, 255, 75, 'Milk shake chocolate', '15000', '15000', '1', '06-01-2023', '15:07:02', NULL, '0', '0'),
(919, 2, 6, 255, 113, 'Happytos', '13000', '13000', '1', '06-01-2023', '15:31:34', NULL, '0', '0'),
(920, 2, 6, 256, 43, 'Telur puyuh', '3000', '6000', '2', '06-01-2023', '17:28:12', NULL, '0', '0'),
(921, 2, 6, 256, 39, 'Soto ayam ', '10000', '10000', '1', '06-01-2023', '17:28:12', NULL, '0', '0'),
(922, 2, 6, 256, 71, 'Lemon squash', '12000', '12000', '1', '06-01-2023', '17:28:12', NULL, '0', '0'),
(923, 2, 6, 256, 92, 'Jeruk panas', '6000', '6000', '1', '06-01-2023', '17:28:12', NULL, '0', '0'),
(924, 2, 6, 256, 113, 'Happytos', '13000', '13000', '1', '06-01-2023', '17:28:12', NULL, '13000', '13000'),
(925, 2, 6, 256, 51, 'Nasi bakar teri', '5000', '5000', '1', '06-01-2023', '17:28:12', NULL, '0', '0'),
(926, 2, 6, 256, 47, 'Sayap', '4000', '8000', '2', '06-01-2023', '17:28:12', NULL, '0', '0'),
(927, 2, 6, 256, 77, 'Milk shake strawberry', '15000', '15000', '1', '06-01-2023', '17:28:12', NULL, '0', '0'),
(928, 2, 6, 257, 51, 'Nasi bakar teri', '5000', '10000', '2', '06-01-2023', '17:29:15', NULL, '0', '0'),
(929, 2, 6, 257, 82, 'Es teh', '4000', '4000', '1', '06-01-2023', '17:29:15', NULL, '0', '0'),
(930, 2, 6, 257, 43, 'Telur puyuh', '3000', '6000', '2', '06-01-2023', '17:29:15', NULL, '0', '0'),
(931, 2, 6, 258, 49, 'Nasi ayam suwir', '5000', '5000', '1', '06-01-2023', '22:01:20', NULL, '0', '0'),
(932, 2, 6, 258, 40, 'Usus', '2000', '2000', '1', '06-01-2023', '22:01:20', NULL, '0', '0'),
(933, 2, 6, 258, 43, 'Telur puyuh', '3000', '3000', '1', '06-01-2023', '22:01:20', NULL, '0', '0'),
(934, 2, 6, 258, 82, 'Es teh', '4000', '4000', '1', '06-01-2023', '22:01:20', NULL, '0', '0'),
(935, 2, 6, 259, 83, 'Es jeruk', '6000', '6000', '1', '06-01-2023', '22:02:21', NULL, '0', '0'),
(936, 2, 6, 259, 70, 'Soda gembira', '12000', '12000', '1', '06-01-2023', '22:02:21', NULL, '0', '0'),
(937, 2, 6, 259, 113, 'Happytos', '13000', '13000', '1', '06-01-2023', '22:02:21', NULL, '13000', '13000'),
(938, 2, 6, 260, 94, 'Hot capucino', '10000', '10000', '1', '06-01-2023', '22:03:14', NULL, '0', '0'),
(939, 2, 6, 260, 101, 'Jahe susu', '8000', '8000', '1', '06-01-2023', '22:03:14', NULL, '0', '0'),
(940, 2, 6, 260, 91, 'Teh panas', '4000', '4000', '1', '06-01-2023', '22:03:14', NULL, '0', '0'),
(941, 2, 6, 260, 17, 'Kentang', '10000', '10000', '1', '06-01-2023', '22:03:14', NULL, '0', '0'),
(942, 2, 6, 261, 129, 'Ayam geprek', '13000', '26000', '2', '07-01-2023', '16:13:02', NULL, '0', '0'),
(952, 2, 6, 264, 49, 'Nasi ayam suwir', '5000', '10000', '2', '07-01-2023', '18:33:48', NULL, '0', '0'),
(953, 2, 6, 264, 40, 'Usus', '2000', '4000', '2', '07-01-2023', '18:33:48', NULL, '0', '0'),
(954, 2, 6, 264, 43, 'Telur puyuh', '3000', '3000', '1', '07-01-2023', '18:33:48', NULL, '0', '0'),
(955, 2, 6, 264, 41, 'Ceker', '2000', '4000', '2', '07-01-2023', '18:33:48', NULL, '0', '0'),
(956, 2, 6, 264, 82, 'Es teh', '4000', '8000', '2', '07-01-2023', '18:33:48', NULL, '0', '0'),
(957, 2, 6, 265, 20, 'Tahu walik', '15000', '15000', '1', '07-01-2023', '18:38:18', NULL, '0', '0'),
(958, 2, 6, 265, 100, 'Wedang jahe', '7000', '7000', '1', '07-01-2023', '18:38:18', NULL, '0', '0'),
(959, 2, 6, 265, 49, 'Nasi ayam suwir', '5000', '10000', '2', '07-01-2023', '18:38:18', NULL, '0', '0'),
(960, 2, 6, 265, 17, 'Kentang', '10000', '10000', '1', '07-01-2023', '18:38:18', NULL, '0', '0'),
(961, 2, 6, 265, 40, 'Usus', '2000', '4000', '2', '07-01-2023', '18:38:18', NULL, '0', '0'),
(962, 2, 6, 265, 87, 'Taro', '10000', '10000', '1', '07-01-2023', '18:38:18', NULL, '0', '0'),
(963, 2, 6, 265, 46, 'Kepala', '2000', '2000', '1', '07-01-2023', '18:38:18', NULL, '0', '0'),
(964, 2, 6, 266, 129, 'Ayam geprek', '13000', '26000', '2', '07-01-2023', '19:26:12', NULL, '0', '0'),
(965, 2, 6, 267, 116, 'Es milo dino', '12000', '12000', '1', '07-01-2023', '19:42:50', NULL, '0', '0'),
(966, 2, 6, 267, 83, 'Es jeruk', '6000', '6000', '1', '07-01-2023', '19:42:50', NULL, '0', '0'),
(967, 2, 6, 268, 88, 'Matcha', '10000', '30000', '3', '07-01-2023', '19:55:49', NULL, '0', '0'),
(968, 2, 6, 268, 70, 'Soda gembira', '12000', '12000', '1', '07-01-2023', '19:55:49', NULL, '0', '0'),
(969, 2, 6, 268, 61, 'Nasi goreng telur', '13000', '26000', '2', '07-01-2023', '19:55:49', NULL, '0', '0'),
(970, 2, 6, 269, 64, 'Lalapan 3T', '10000', '10000', '1', '07-01-2023', '20:24:18', NULL, '0', '0'),
(971, 2, 6, 269, 129, 'Ayam geprek', '13000', '13000', '1', '07-01-2023', '20:24:18', NULL, '0', '0'),
(972, 2, 6, 269, 82, 'Es teh', '4000', '4000', '1', '07-01-2023', '20:24:18', NULL, '0', '0'),
(973, 2, 6, 269, 85, 'Mangga', '10000', '10000', '1', '07-01-2023', '20:24:18', NULL, '0', '0'),
(974, 2, 6, 270, 49, 'Nasi ayam suwir', '5000', '5000', '1', '07-01-2023', '20:39:40', NULL, '0', '0'),
(975, 2, 6, 270, 40, 'Usus', '2000', '2000', '1', '07-01-2023', '20:39:40', NULL, '0', '0'),
(976, 2, 6, 270, 42, 'Jeroan', '2500', '2500', '1', '07-01-2023', '20:39:40', NULL, '0', '0'),
(977, 2, 6, 270, 17, 'Kentang', '10000', '10000', '1', '07-01-2023', '20:39:40', NULL, '0', '0'),
(978, 2, 6, 270, 71, 'Lemon squash', '12000', '12000', '1', '07-01-2023', '20:39:40', NULL, '0', '0'),
(980, 2, 6, 269, 49, 'Nasi ayam suwir', '5000', '5000', '1', '07-01-2023', '20:59:02', NULL, '0', '0'),
(981, 2, 6, 271, 102, 'Le mineral', '2500', '2500', '1', '07-01-2023', '21:20:51', NULL, '0', '0'),
(982, 2, 6, 271, 106, 'Gula aren ', '10000', '10000', '1', '07-01-2023', '21:20:51', NULL, '0', '0'),
(983, 2, 6, 271, 98, 'Kopi hitam', '5000', '5000', '1', '07-01-2023', '21:20:51', NULL, '0', '0'),
(984, 2, 6, 271, 116, 'Es milo dino', '12000', '12000', '1', '07-01-2023', '21:20:51', NULL, '0', '0'),
(985, 2, 6, 271, 72, 'Leci squash', '12000', '12000', '1', '07-01-2023', '21:20:51', NULL, '0', '0'),
(986, 2, 6, 271, 80, 'Lemon tea', '10000', '10000', '1', '07-01-2023', '21:20:51', NULL, '0', '0'),
(987, 2, 6, 271, 87, 'Taro', '10000', '20000', '2', '07-01-2023', '21:20:51', NULL, '0', '0'),
(988, 2, 6, 272, 88, 'Matcha', '10000', '10000', '1', '07-01-2023', '21:45:16', NULL, '0', '0'),
(989, 2, 6, 272, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '07-01-2023', '21:45:16', NULL, '0', '0'),
(990, 2, 6, 272, 102, 'Le mineral', '2500', '2500', '1', '07-01-2023', '21:45:16', NULL, '0', '0'),
(991, 2, 6, 273, 80, 'Lemon tea', '10000', '10000', '1', '07-01-2023', '21:47:32', NULL, '0', '0'),
(992, 2, 6, 273, 90, 'Es cokelat roti', '12000', '12000', '1', '07-01-2023', '21:47:32', NULL, '0', '0'),
(993, 2, 6, 273, 17, 'Kentang', '10000', '10000', '1', '07-01-2023', '21:47:32', NULL, '0', '0'),
(994, 2, 6, 273, 14, 'Roti maryam chocolat keju', '16000', '16000', '1', '07-01-2023', '21:47:32', NULL, '0', '0'),
(995, 2, 6, 273, 29, 'Kepala judes', '13000', '13000', '1', '07-01-2023', '21:47:32', NULL, '0', '0'),
(996, 2, 6, 274, 50, 'Nasi bakar tongkol', '5000', '15000', '3', '07-01-2023', '22:17:05', NULL, '0', '0'),
(997, 2, 6, 274, 41, 'Ceker', '2000', '2000', '1', '07-01-2023', '22:17:05', NULL, '0', '0'),
(998, 2, 6, 274, 43, 'Telur puyuh', '3000', '3000', '1', '07-01-2023', '22:17:05', NULL, '0', '0'),
(999, 2, 6, 274, 82, 'Es teh', '4000', '8000', '2', '07-01-2023', '22:17:05', NULL, '0', '0'),
(1000, 2, 6, 275, 90, 'Es cokelat roti', '12000', '12000', '1', '07-01-2023', '22:17:44', NULL, '0', '0'),
(1001, 2, 6, 275, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '07-01-2023', '22:17:44', NULL, '0', '0'),
(1002, 2, 6, 275, 79, 'Thaitea', '10000', '10000', '1', '07-01-2023', '22:17:44', NULL, '0', '0'),
(1003, 2, 6, 276, 50, 'Nasi bakar tongkol', '5000', '10000', '2', '07-01-2023', '22:44:10', NULL, '0', '0'),
(1004, 2, 6, 276, 40, 'Usus', '2000', '6000', '3', '07-01-2023', '22:44:10', NULL, '0', '0'),
(1005, 2, 6, 276, 43, 'Telur puyuh', '3000', '3000', '1', '07-01-2023', '22:44:10', NULL, '0', '0'),
(1006, 2, 6, 277, 70, 'Soda gembira', '12000', '12000', '1', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1007, 2, 6, 277, 83, 'Es jeruk', '6000', '6000', '1', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1008, 2, 6, 277, 39, 'Soto ayam ', '10000', '10000', '1', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1009, 2, 6, 277, 52, 'Mi goreng ori', '10000', '10000', '1', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1010, 2, 6, 277, 64, 'Lalapan 3T', '10000', '10000', '1', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1011, 2, 6, 277, 43, 'Telur puyuh', '3000', '6000', '2', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1012, 2, 6, 277, 98, 'Kopi hitam', '5000', '10000', '2', '07-01-2023', '22:48:23', NULL, '0', '0'),
(1013, 2, 6, 278, 94, 'Hot capucino', '10000', '20000', '2', '08-01-2023', '13:12:08', NULL, '0', '0'),
(1014, 2, 6, 279, 129, 'Ayam geprek', '13000', '26000', '2', '08-01-2023', '13:13:01', NULL, '0', '0'),
(1015, 2, 6, 279, 40, 'Usus', '2000', '12000', '6', '08-01-2023', '13:13:01', NULL, '0', '0'),
(1016, 2, 6, 279, 43, 'Telur puyuh', '3000', '3000', '1', '08-01-2023', '13:13:01', NULL, '0', '0'),
(1017, 2, 6, 280, 20, 'Tahu walik', '15000', '15000', '1', '08-01-2023', '15:41:41', NULL, '0', '0'),
(1018, 2, 6, 281, 106, 'Gula aren ', '10000', '10000', '1', '08-01-2023', '16:22:37', NULL, '0', '0'),
(1019, 2, 6, 281, 61, 'Nasi goreng telur', '13000', '13000', '1', '08-01-2023', '16:45:30', NULL, '0', '0'),
(1020, 2, 6, 282, 75, 'Milk shake chocolate', '15000', '15000', '1', '08-01-2023', '17:08:43', NULL, '0', '0'),
(1021, 2, 6, 282, 121, 'Coffe n cream', '12000', '12000', '1', '08-01-2023', '17:08:43', NULL, '0', '0'),
(1022, 2, 6, 282, 17, 'Kentang', '10000', '10000', '1', '08-01-2023', '17:08:43', NULL, '0', '0'),
(1023, 2, 6, 282, 21, 'Tahu cabe garam', '15000', '15000', '1', '08-01-2023', '17:08:43', NULL, '0', '0'),
(1024, 2, 6, 283, 49, 'Nasi ayam suwir', '5000', '10000', '2', '08-01-2023', '18:17:57', NULL, '0', '0'),
(1025, 2, 6, 283, 47, 'Sayap', '4000', '4000', '1', '08-01-2023', '18:17:57', NULL, '0', '0'),
(1026, 2, 6, 283, 46, 'Kepala', '2000', '2000', '1', '08-01-2023', '18:17:57', NULL, '0', '0'),
(1027, 2, 6, 283, 65, 'Lalapan lele', '15000', '15000', '1', '08-01-2023', '18:17:57', NULL, '0', '0'),
(1028, 2, 6, 283, 94, 'Hot capucino', '10000', '10000', '1', '08-01-2023', '18:17:57', NULL, '0', '0'),
(1029, 2, 6, 283, 119, 'Milo', '10000', '10000', '1', '08-01-2023', '18:19:18', NULL, '0', '0'),
(1030, 2, 6, 284, 105, 'Brown sugar', '10000', '10000', '1', '08-01-2023', '22:00:16', NULL, '0', '0'),
(1031, 2, 6, 284, 17, 'Kentang', '10000', '10000', '1', '08-01-2023', '22:00:16', NULL, '0', '0'),
(1032, 2, 6, 284, 94, 'Hot capucino', '10000', '10000', '1', '08-01-2023', '22:00:16', NULL, '0', '0'),
(1033, 2, 6, 284, 114, 'Susu panas ', '8000', '8000', '1', '08-01-2023', '22:00:16', NULL, '8000', '8000'),
(1036, 2, 6, 286, 26, 'Seblak tulang', '12000', '12000', '1', '08-01-2023', '22:44:46', NULL, '0', '0'),
(1037, 2, 6, 286, 72, 'Leci squash', '12000', '12000', '1', '08-01-2023', '22:44:46', NULL, '0', '0'),
(1038, 2, 6, 286, 49, 'Nasi ayam suwir', '5000', '5000', '1', '08-01-2023', '22:44:46', NULL, '0', '0'),
(1039, 2, 6, 287, 72, 'Leci squash', '12000', '12000', '1', '10-01-2023', '22:14:44', NULL, '0', '0'),
(1040, 2, 6, 287, 73, 'Melon squash', '12000', '12000', '1', '10-01-2023', '22:14:44', NULL, '0', '0'),
(1041, 2, 6, 287, 116, 'Es milo dino', '12000', '12000', '1', '10-01-2023', '22:14:44', NULL, '0', '0'),
(1042, 2, 6, 287, 36, 'Omlet', '12000', '12000', '1', '10-01-2023', '22:14:44', NULL, '0', '0'),
(1043, 2, 6, 287, 12, 'Roti maryam chocolat', '11000', '11000', '1', '10-01-2023', '22:14:44', NULL, '0', '0'),
(1044, 2, 6, 287, 82, 'Es teh', '4000', '8000', '2', '10-01-2023', '22:14:44', NULL, '0', '0'),
(1045, 2, 6, 288, 20, 'Tahu walik', '15000', '15000', '1', '10-01-2023', '22:15:59', NULL, '0', '0'),
(1046, 2, 6, 288, 82, 'Es teh', '4000', '4000', '1', '10-01-2023', '22:15:59', NULL, '0', '0'),
(1047, 2, 6, 288, 87, 'Taro', '10000', '10000', '1', '10-01-2023', '22:15:59', NULL, '0', '0'),
(1048, 2, 6, 288, 25, 'Seblak seafood', '15000', '15000', '1', '10-01-2023', '22:15:59', NULL, '0', '0'),
(1049, 2, 6, 288, 60, 'Nasi goreng ori', '10000', '30000', '3', '10-01-2023', '22:15:59', NULL, '0', '0'),
(1050, 2, 6, 289, 66, 'Lalapan mujaer', '30000', '30000', '1', '10-01-2023', '22:16:28', NULL, '0', '0'),
(1051, 2, 6, 289, 70, 'Soda gembira', '12000', '12000', '1', '10-01-2023', '22:16:28', NULL, '0', '0'),
(1052, 2, 6, 290, 49, 'Nasi ayam suwir', '5000', '10000', '2', '10-01-2023', '22:16:56', NULL, '0', '0'),
(1053, 2, 6, 291, 49, 'Nasi ayam suwir', '5000', '5000', '1', '11-01-2023', '16:05:00', NULL, '0', '0'),
(1054, 2, 6, 291, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '11-01-2023', '16:05:00', NULL, '0', '0'),
(1055, 2, 6, 292, 121, 'Coffe n cream', '12000', '12000', '1', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1056, 2, 6, 292, 81, 'Tea tarik', '8000', '8000', '1', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1057, 2, 6, 292, 49, 'Nasi ayam suwir', '5000', '5000', '1', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1058, 2, 6, 292, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1059, 2, 6, 292, 40, 'Usus', '2000', '4000', '2', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1060, 2, 6, 292, 42, 'Jeroan', '2500', '2500', '1', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1061, 2, 6, 292, 102, 'Le mineral', '2500', '7500', '3', '11-01-2023', '16:06:05', NULL, '0', '0'),
(1062, 2, 6, 293, 118, 'Alpukat Milo', '10000', '20000', '2', '11-01-2023', '16:07:10', NULL, '0', '0'),
(1063, 2, 6, 293, 33, 'Pentol bakar', '13000', '26000', '2', '11-01-2023', '16:07:10', NULL, '0', '0'),
(1064, 2, 6, 293, 56, 'Mi nyemek', '15000', '15000', '1', '11-01-2023', '16:07:10', NULL, '0', '0'),
(1065, 2, 6, 293, 24, 'Seblak komplit', '20000', '20000', '1', '11-01-2023', '16:07:10', NULL, '0', '0'),
(1066, 2, 6, 294, 124, 'Tahu kucek', '10000', '20000', '2', '11-01-2023', '16:07:47', NULL, '0', '0'),
(1067, 2, 6, 294, 126, 'Tempura judes', '13000', '13000', '1', '11-01-2023', '16:07:47', NULL, '0', '0'),
(1068, 2, 6, 292, 56, 'Mi nyemek', '15000', '15000', '1', '11-01-2023', '16:40:40', NULL, '0', '0'),
(1069, 2, 6, 295, 56, 'Mi nyemek', '15000', '15000', '1', '11-01-2023', '16:41:03', NULL, '0', '0'),
(1070, 2, 6, 295, 106, 'Gula aren ', '10000', '10000', '1', '11-01-2023', '16:41:03', NULL, '0', '0'),
(1071, 2, 6, 296, 13, 'Roti maryam keju', '12000', '12000', '1', '11-01-2023', '18:31:28', NULL, '0', '0'),
(1072, 2, 6, 296, 39, 'Soto ayam ', '10000', '10000', '1', '11-01-2023', '18:31:28', NULL, '0', '0'),
(1073, 2, 6, 296, 43, 'Telur puyuh', '3000', '6000', '2', '11-01-2023', '18:31:28', NULL, '0', '0'),
(1074, 2, 6, 296, 56, 'Mi nyemek', '15000', '15000', '1', '11-01-2023', '18:31:28', NULL, '0', '0'),
(1075, 2, 6, 296, 82, 'Es teh', '4000', '4000', '1', '11-01-2023', '18:31:28', NULL, '0', '0'),
(1076, 2, 6, 296, 83, 'Es jeruk', '6000', '6000', '1', '11-01-2023', '18:31:28', NULL, '0', '0'),
(1077, 2, 6, 297, 62, 'Nasi goreng ayam ', '17000', '17000', '1', '11-01-2023', '18:32:50', NULL, '0', '0'),
(1078, 2, 6, 297, 82, 'Es teh', '4000', '4000', '1', '11-01-2023', '18:32:50', NULL, '0', '0'),
(1079, 2, 6, 297, 118, 'Alpukat Milo', '10000', '10000', '1', '11-01-2023', '18:32:50', NULL, '0', '0'),
(1080, 2, 6, 298, 87, 'Taro', '10000', '10000', '1', '11-01-2023', '19:02:29', NULL, '0', '0'),
(1081, 2, 6, 298, 105, 'Brown sugar', '10000', '10000', '1', '11-01-2023', '19:02:29', NULL, '0', '0'),
(1082, 2, 6, 298, 64, 'Lalapan 3T', '10000', '20000', '2', '11-01-2023', '19:02:29', NULL, '0', '0'),
(1083, 2, 6, 299, 49, 'Nasi ayam suwir', '5000', '10000', '2', '11-01-2023', '20:44:40', NULL, '0', '0'),
(1084, 2, 6, 299, 87, 'Taro', '10000', '10000', '1', '11-01-2023', '20:44:40', NULL, '0', '0'),
(1085, 2, 6, 299, 46, 'Kepala', '2000', '2000', '1', '11-01-2023', '20:44:40', NULL, '0', '0'),
(1086, 2, 6, 299, 40, 'Usus', '2000', '4000', '2', '11-01-2023', '20:44:40', NULL, '0', '0'),
(1087, 2, 6, 299, 83, 'Es jeruk', '6000', '6000', '1', '11-01-2023', '20:44:40', NULL, '0', '0'),
(1088, 2, 6, 299, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '11-01-2023', '20:57:58', NULL, '0', '0'),
(1099, 2, 6, 301, 49, 'Nasi ayam suwir', '5000', '10000', '2', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1100, 2, 6, 301, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1101, 2, 6, 301, 43, 'Telur puyuh', '3000', '9000', '3', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1102, 2, 6, 301, 40, 'Usus', '2000', '4000', '2', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1103, 2, 6, 301, 42, 'Jeroan', '2500', '2500', '1', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1104, 2, 6, 301, 118, 'Alpukat Milo', '10000', '10000', '1', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1105, 2, 6, 301, 117, 'Es teler', '10000', '10000', '1', '12-01-2023', '17:56:45', NULL, '10000', '10000'),
(1106, 2, 6, 301, 90, 'Es cokelat roti', '12000', '12000', '1', '12-01-2023', '17:56:45', NULL, '0', '0'),
(1107, 2, 6, 302, 117, 'Es teler', '10000', '10000', '1', '12-01-2023', '17:57:52', NULL, '10000', '10000'),
(1108, 2, 6, 302, 19, 'Tahu crispy', '12000', '12000', '1', '12-01-2023', '17:57:52', NULL, '0', '0'),
(1109, 2, 6, 302, 118, 'Alpukat Milo', '10000', '10000', '1', '12-01-2023', '17:57:52', NULL, '0', '0'),
(1110, 2, 6, 303, 130, 'KSTG', '7000', '7000', '1', '12-01-2023', '18:27:45', NULL, '0', '0'),
(1111, 2, 6, 303, 105, 'Brown sugar', '10000', '10000', '1', '12-01-2023', '18:27:45', NULL, '0', '0'),
(1112, 2, 6, 304, 94, 'Hot capucino', '10000', '10000', '1', '12-01-2023', '20:32:48', NULL, '0', '0'),
(1113, 2, 6, 304, 11, 'Roti maryam original ', '8000', '8000', '1', '12-01-2023', '20:32:48', NULL, '0', '0'),
(1114, 2, 6, 304, 56, 'Mi nyemek', '15000', '15000', '1', '12-01-2023', '20:32:48', NULL, '0', '0'),
(1115, 2, 6, 304, 98, 'Kopi hitam', '5000', '5000', '1', '12-01-2023', '20:32:48', NULL, '0', '0'),
(1116, 2, 6, 304, 102, 'Le mineral', '2500', '2500', '1', '12-01-2023', '20:32:48', NULL, '0', '0'),
(1117, 2, 6, 305, 49, 'Nasi ayam suwir', '5000', '5000', '1', '12-01-2023', '20:34:10', NULL, '0', '0'),
(1118, 2, 6, 305, 40, 'Usus', '2000', '2000', '1', '12-01-2023', '20:34:10', NULL, '0', '0'),
(1119, 2, 6, 305, 126, 'Tempura judes', '13000', '13000', '1', '12-01-2023', '20:34:10', NULL, '0', '0'),
(1120, 2, 6, 305, 37, 'Nasi', '5000', '5000', '1', '12-01-2023', '20:34:10', NULL, '0', '0'),
(1121, 2, 6, 305, 82, 'Es teh', '4000', '8000', '2', '12-01-2023', '20:34:10', NULL, '0', '0'),
(1122, 2, 6, 306, 105, 'Brown sugar', '10000', '10000', '1', '12-01-2023', '20:51:14', NULL, '0', '0'),
(1123, 2, 6, 306, 98, 'Kopi hitam', '5000', '5000', '1', '12-01-2023', '20:51:14', NULL, '0', '0'),
(1124, 2, 6, 306, 89, 'Chocho malt', '10000', '10000', '1', '12-01-2023', '21:01:58', NULL, '0', '0'),
(1125, 2, 6, 306, 60, 'Nasi goreng ori', '10000', '10000', '1', '12-01-2023', '21:01:58', NULL, '0', '0'),
(1126, 2, 6, 306, 114, 'Susu panas ', '8000', '8000', '1', '12-01-2023', '21:08:40', NULL, '0', '0'),
(1127, 2, 6, 307, 17, 'Kentang', '10000', '10000', '1', '12-01-2023', '21:36:47', NULL, '0', '0'),
(1128, 2, 6, 307, 84, 'Dark chocholate', '10000', '10000', '1', '12-01-2023', '21:36:47', NULL, '0', '0'),
(1129, 2, 6, 307, 20, 'Tahu walik', '15000', '15000', '1', '12-01-2023', '21:36:47', NULL, '0', '0'),
(1130, 2, 6, 307, 102, 'Le mineral', '2500', '7500', '3', '12-01-2023', '21:36:47', NULL, '0', '0'),
(1131, 2, 6, 308, 118, 'Alpukat Milo', '10000', '10000', '1', '13-01-2023', '17:10:10', NULL, '0', '0'),
(1132, 2, 6, 308, 131, 'Alpukat', '10000', '20000', '2', '13-01-2023', '17:14:30', NULL, '0', '0'),
(1133, 2, 6, 308, 61, 'Nasi goreng telur', '13000', '13000', '1', '13-01-2023', '17:14:30', NULL, '0', '0'),
(1134, 2, 6, 308, 20, 'Tahu walik', '15000', '30000', '2', '13-01-2023', '17:14:30', NULL, '0', '0'),
(1135, 2, 6, 308, 31, 'Pentol kuah judes', '13000', '13000', '1', '13-01-2023', '17:14:30', NULL, '0', '0'),
(1136, 2, 6, 308, 110, 'Basreng snack', '5000', '5000', '1', '13-01-2023', '17:27:36', NULL, '0', '0'),
(1137, 2, 6, 309, 49, 'Nasi ayam suwir', '5000', '10000', '2', '13-01-2023', '18:42:50', NULL, '0', '0'),
(1138, 2, 6, 309, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '13-01-2023', '18:42:50', NULL, '0', '0'),
(1139, 2, 6, 310, 49, 'Nasi ayam suwir', '5000', '10000', '2', '13-01-2023', '18:44:45', NULL, '0', '0'),
(1141, 2, 6, 312, 50, 'Nasi bakar tongkol', '5000', '20000', '4', '13-01-2023', '18:48:49', NULL, '0', '0'),
(1142, 2, 6, 312, 49, 'Nasi ayam suwir', '5000', '20000', '4', '13-01-2023', '18:48:49', NULL, '0', '0'),
(1143, 2, 6, 308, 101, 'Jahe susu', '8000', '8000', '1', '13-01-2023', '19:13:47', NULL, '0', '0'),
(1144, 2, 6, 313, 49, 'Nasi ayam suwir', '5000', '5000', '1', '13-01-2023', '19:16:42', NULL, '0', '0'),
(1145, 2, 6, 313, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '13-01-2023', '19:16:42', NULL, '0', '0'),
(1146, 2, 6, 313, 40, 'Usus', '2000', '4000', '2', '13-01-2023', '19:16:42', NULL, '0', '0'),
(1147, 2, 6, 313, 43, 'Telur puyuh', '3000', '3000', '1', '13-01-2023', '19:16:42', NULL, '0', '0');
INSERT INTO `pembayaran_detail` (`id`, `id_user`, `id_kasir`, `id_pembayaran`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(1148, 2, 6, 313, 118, 'Alpukat Milo', '10000', '10000', '1', '13-01-2023', '19:16:42', NULL, '0', '0'),
(1149, 2, 6, 313, 82, 'Es teh', '4000', '4000', '1', '13-01-2023', '19:16:42', NULL, '0', '0'),
(1150, 2, 6, 314, 94, 'Hot capucino', '10000', '20000', '2', '13-01-2023', '19:46:13', NULL, '0', '0'),
(1151, 2, 6, 315, 79, 'Thaitea', '10000', '10000', '1', '13-01-2023', '20:05:47', NULL, '0', '0'),
(1152, 2, 6, 315, 89, 'Chocho malt', '10000', '10000', '1', '13-01-2023', '20:05:47', NULL, '0', '0'),
(1153, 2, 6, 316, 11, 'Roti maryam original ', '8000', '8000', '1', '13-01-2023', '20:15:58', NULL, '0', '0'),
(1154, 2, 6, 316, 19, 'Tahu crispy', '12000', '12000', '1', '13-01-2023', '20:15:58', NULL, '0', '0'),
(1159, 2, 6, 319, 80, 'Lemon tea', '10000', '10000', '1', '13-01-2023', '21:04:38', NULL, '0', '0'),
(1160, 2, 6, 319, 17, 'Kentang', '10000', '10000', '1', '13-01-2023', '21:04:38', NULL, '0', '0'),
(1161, 2, 6, 320, 21, 'Tahu cabe garam', '15000', '15000', '1', '13-01-2023', '21:07:46', NULL, '0', '0'),
(1162, 2, 6, 320, 69, 'Mega mendung', '12000', '24000', '2', '13-01-2023', '21:07:46', NULL, '0', '0'),
(1163, 2, 6, 321, 82, 'Es teh', '4000', '8000', '2', '13-01-2023', '21:23:14', NULL, '0', '0'),
(1164, 2, 6, 321, 98, 'Kopi hitam', '5000', '5000', '1', '13-01-2023', '21:23:14', NULL, '0', '0'),
(1165, 2, 6, 321, 84, 'Dark chocholate', '10000', '10000', '1', '13-01-2023', '21:23:14', NULL, '0', '0'),
(1166, 2, 6, 321, 38, 'Soto ayam ', '5000', '5000', '1', '13-01-2023', '21:23:14', NULL, '0', '0'),
(1167, 2, 6, 321, 40, 'Usus', '2000', '2000', '1', '13-01-2023', '21:23:14', NULL, '0', '0'),
(1168, 2, 6, 321, 42, 'Jeroan', '2500', '2500', '1', '13-01-2023', '21:23:14', NULL, '0', '0'),
(1169, 2, 6, 321, 39, 'Soto ayam ', '10000', '10000', '1', '13-01-2023', '21:35:31', NULL, '0', '0'),
(1170, 2, 6, 322, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '13-01-2023', '21:44:57', NULL, '0', '0'),
(1171, 2, 6, 322, 91, 'Teh panas', '4000', '4000', '1', '13-01-2023', '21:44:57', NULL, '0', '0'),
(1172, 2, 6, 322, 39, 'Soto ayam ', '10000', '20000', '2', '13-01-2023', '22:01:43', NULL, '0', '0'),
(1173, 2, 6, 323, 119, 'Milo', '10000', '10000', '1', '13-01-2023', '22:02:32', NULL, '0', '0'),
(1174, 2, 6, 323, 64, 'Lalapan 3T', '10000', '10000', '1', '13-01-2023', '22:02:32', NULL, '0', '0'),
(1175, 2, 6, 324, 17, 'Kentang', '10000', '10000', '1', '13-01-2023', '22:05:08', NULL, '0', '0'),
(1176, 2, 6, 324, 82, 'Es teh', '4000', '4000', '1', '13-01-2023', '22:05:08', NULL, '0', '0'),
(1177, 2, 6, 325, 119, 'Milo', '10000', '10000', '1', '13-01-2023', '22:57:56', NULL, '0', '0'),
(1178, 2, 6, 326, 118, 'Alpukat Milo', '10000', '10000', '1', '14-01-2023', '16:00:54', NULL, '0', '0'),
(1179, 2, 6, 326, 84, 'Dark chocholate', '10000', '10000', '1', '14-01-2023', '16:00:54', NULL, '0', '0'),
(1180, 2, 6, 327, 66, 'Lalapan mujaer', '30000', '60000', '2', '14-01-2023', '17:09:25', NULL, '0', '0'),
(1189, 2, 6, 331, 84, 'Dark chocholate', '10000', '20000', '2', '15-01-2023', '17:46:12', NULL, '0', '0'),
(1190, 2, 6, 331, 82, 'Es teh', '4000', '4000', '1', '15-01-2023', '17:46:12', NULL, '0', '0'),
(1191, 2, 6, 331, 49, 'Nasi ayam suwir', '5000', '5000', '1', '15-01-2023', '17:46:12', NULL, '0', '0'),
(1192, 2, 6, 331, 43, 'Telur puyuh', '3000', '3000', '1', '15-01-2023', '17:46:12', NULL, '0', '0'),
(1193, 2, 6, 331, 40, 'Usus', '2000', '2000', '1', '15-01-2023', '17:46:12', NULL, '0', '0'),
(1194, 2, 6, 332, 83, 'Es jeruk', '6000', '12000', '2', '15-01-2023', '17:46:59', NULL, '0', '0'),
(1195, 2, 6, 332, 20, 'Tahu walik', '15000', '15000', '1', '15-01-2023', '17:46:59', NULL, '0', '0'),
(1196, 2, 6, 332, 71, 'Lemon squash', '12000', '12000', '1', '15-01-2023', '17:46:59', NULL, '0', '0'),
(1197, 2, 6, 333, 17, 'Kentang', '10000', '10000', '1', '15-01-2023', '17:48:29', NULL, '0', '0'),
(1198, 2, 6, 333, 25, 'Seblak seafood', '15000', '15000', '1', '15-01-2023', '17:48:29', NULL, '0', '0'),
(1199, 2, 6, 333, 11, 'Roti maryam original ', '8000', '8000', '1', '15-01-2023', '17:48:29', NULL, '0', '0'),
(1200, 2, 6, 333, 12, 'Roti maryam chocolat', '11000', '11000', '1', '15-01-2023', '17:48:29', NULL, '0', '0'),
(1201, 2, 6, 333, 80, 'Lemon tea', '10000', '10000', '1', '15-01-2023', '17:48:29', NULL, '0', '0'),
(1202, 2, 6, 333, 82, 'Es teh', '4000', '8000', '2', '15-01-2023', '17:48:29', NULL, '0', '0'),
(1203, 2, 6, 334, 98, 'Kopi hitam', '5000', '5000', '1', '15-01-2023', '17:49:41', NULL, '0', '0'),
(1204, 2, 6, 334, 83, 'Es jeruk', '6000', '6000', '1', '15-01-2023', '17:49:41', NULL, '0', '0'),
(1205, 2, 6, 335, 98, 'Kopi hitam', '5000', '5000', '1', '15-01-2023', '17:50:33', NULL, '0', '0'),
(1206, 2, 6, 335, 91, 'Teh panas', '4000', '4000', '1', '15-01-2023', '17:50:33', NULL, '0', '0'),
(1207, 2, 6, 335, 100, 'Wedang jahe', '7000', '7000', '1', '15-01-2023', '17:50:33', NULL, '0', '0'),
(1208, 2, 6, 336, 91, 'Teh panas', '4000', '4000', '1', '15-01-2023', '17:52:38', NULL, '0', '0'),
(1209, 2, 6, 336, 98, 'Kopi hitam', '5000', '5000', '1', '15-01-2023', '17:52:38', NULL, '0', '0'),
(1210, 2, 6, 336, 100, 'Wedang jahe', '7000', '14000', '2', '15-01-2023', '17:52:38', NULL, '0', '0'),
(1211, 2, 6, 336, 94, 'Hot capucino', '10000', '10000', '1', '15-01-2023', '17:52:38', NULL, '0', '0'),
(1212, 2, 6, 337, 98, 'Kopi hitam', '5000', '15000', '3', '15-01-2023', '17:54:15', NULL, '0', '0'),
(1213, 2, 6, 337, 100, 'Wedang jahe', '7000', '21000', '3', '15-01-2023', '17:54:15', NULL, '0', '0'),
(1214, 2, 6, 338, 78, 'Milk shake oreo', '15000', '15000', '1', '15-01-2023', '17:59:19', NULL, '0', '0'),
(1215, 2, 6, 338, 102, 'Le mineral', '2500', '2500', '1', '15-01-2023', '17:59:19', NULL, '0', '0'),
(1216, 2, 6, 339, 49, 'Nasi ayam suwir', '5000', '15000', '3', '16-01-2023', '15:16:45', NULL, '0', '0'),
(1217, 2, 6, 339, 87, 'Taro', '10000', '10000', '1', '16-01-2023', '15:16:45', NULL, '0', '0'),
(1218, 2, 6, 339, 82, 'Es teh', '4000', '4000', '1', '16-01-2023', '15:16:45', NULL, '0', '0'),
(1219, 2, 6, 339, 47, 'Sayap', '4000', '12000', '3', '16-01-2023', '15:16:45', NULL, '0', '0'),
(1220, 2, 6, 339, 43, 'Telur puyuh', '3000', '3000', '1', '16-01-2023', '15:16:45', NULL, '0', '0'),
(1221, 2, 6, 339, 12, 'Roti maryam chocolat', '11000', '11000', '1', '16-01-2023', '15:16:45', NULL, '0', '0'),
(1222, 2, 6, 339, 24, 'Seblak komplit', '20000', '0', '', '16-01-2023', '15:28:40', NULL, '0', '0'),
(1223, 2, 6, 339, 132, 'Seblak ceker', '22000', '22000', '1', '16-01-2023', '15:33:15', NULL, '0', '0'),
(1224, 2, 6, 340, 25, 'Seblak seafood', '15000', '15000', '1', '16-01-2023', '16:30:57', NULL, '0', '0'),
(1225, 2, 6, 341, 49, 'Nasi ayam suwir', '5000', '10000', '2', '16-01-2023', '17:07:57', NULL, '0', '0'),
(1226, 2, 6, 341, 47, 'Sayap', '4000', '4000', '1', '16-01-2023', '17:07:57', NULL, '0', '0'),
(1227, 2, 6, 342, 61, 'Nasi goreng telur', '13000', '13000', '1', '16-01-2023', '19:02:24', NULL, '0', '0'),
(1228, 2, 6, 343, 70, 'Soda gembira', '12000', '12000', '1', '16-01-2023', '19:27:29', NULL, '0', '0'),
(1229, 2, 6, 343, 72, 'Leci squash', '12000', '12000', '1', '16-01-2023', '19:27:29', NULL, '0', '0'),
(1230, 2, 6, 343, 61, 'Nasi goreng telur', '13000', '13000', '1', '16-01-2023', '19:47:11', NULL, '0', '0'),
(1231, 2, 6, 344, 102, 'Le mineral', '2500', '2500', '1', '16-01-2023', '20:30:51', NULL, '0', '0'),
(1232, 2, 6, 344, 70, 'Soda gembira', '12000', '12000', '1', '16-01-2023', '20:30:51', NULL, '0', '0'),
(1233, 2, 6, 344, 49, 'Nasi ayam suwir', '5000', '5000', '1', '16-01-2023', '20:30:51', NULL, '0', '0'),
(1234, 2, 6, 344, 47, 'Sayap', '4000', '8000', '2', '16-01-2023', '20:30:51', NULL, '0', '0'),
(1235, 2, 6, 345, 39, 'Soto ayam ', '10000', '10000', '1', '16-01-2023', '22:48:06', NULL, '0', '0'),
(1236, 2, 6, 345, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '16-01-2023', '22:48:06', NULL, '0', '0'),
(1237, 2, 6, 345, 29, 'Kepala judes', '13000', '13000', '1', '16-01-2023', '22:48:06', NULL, '0', '0'),
(1238, 2, 6, 346, 49, 'Nasi ayam suwir', '5000', '5000', '1', '16-01-2023', '23:05:01', NULL, '0', '0'),
(1239, 2, 6, 347, 131, 'Alpukat', '10000', '30000', '3', '17-01-2023', '11:41:55', NULL, '0', '0'),
(1240, 2, 6, 347, 118, 'Alpukat Milo', '12000', '24000', '2', '17-01-2023', '11:41:55', NULL, '0', '0'),
(1241, 2, 6, 348, 68, 'Lalapan ayam potong', '18000', '36000', '2', '17-01-2023', '19:28:32', NULL, '0', '0'),
(1242, 2, 6, 348, 60, 'Nasi goreng ori', '10000', '10000', '1', '17-01-2023', '19:28:32', NULL, '0', '0'),
(1243, 2, 6, 348, 82, 'Es teh', '4000', '4000', '1', '17-01-2023', '19:28:32', NULL, '0', '0'),
(1244, 2, 6, 348, 91, 'Teh panas', '4000', '4000', '1', '17-01-2023', '19:28:32', NULL, '0', '0'),
(1245, 2, 6, 348, 102, 'Le mineral', '2500', '2500', '1', '17-01-2023', '19:28:32', NULL, '0', '0'),
(1246, 2, 6, 349, 98, 'Kopi hitam', '5000', '10000', '2', '17-01-2023', '19:28:58', NULL, '0', '0'),
(1247, 2, 6, 350, 98, 'Kopi hitam', '5000', '10000', '2', '17-01-2023', '20:10:59', NULL, '0', '0'),
(1248, 2, 6, 350, 20, 'Tahu walik', '15000', '30000', '2', '17-01-2023', '20:10:59', NULL, '0', '0'),
(1249, 2, 6, 351, 20, 'Tahu walik', '15000', '15000', '1', '17-01-2023', '20:12:36', NULL, '0', '0'),
(1250, 2, 6, 351, 99, 'Kopi robusta', '7000', '14000', '2', '17-01-2023', '20:12:36', NULL, '0', '0'),
(1251, 2, 6, 352, 98, 'Kopi hitam', '5000', '5000', '1', '17-01-2023', '20:22:06', NULL, '0', '0'),
(1252, 2, 6, 352, 68, 'Lalapan ayam potong', '18000', '18000', '1', '17-01-2023', '20:22:06', NULL, '0', '0'),
(1253, 2, 6, 351, 80, 'Lemon tea', '10000', '10000', '1', '17-01-2023', '20:41:23', NULL, '0', '0'),
(1254, 2, 6, 351, 100, 'Wedang jahe', '7000', '7000', '1', '17-01-2023', '20:41:23', NULL, '0', '0'),
(1255, 2, 6, 353, 85, 'Mangga', '10000', '10000', '1', '17-01-2023', '20:42:35', NULL, '0', '0'),
(1256, 2, 6, 353, 17, 'Kentang', '10000', '10000', '1', '17-01-2023', '20:42:35', NULL, '0', '0'),
(1257, 2, 6, 354, 81, 'Tea tarik', '8000', '8000', '1', '17-01-2023', '20:45:14', NULL, '0', '0'),
(1258, 2, 6, 354, 60, 'Nasi goreng ori', '10000', '20000', '2', '17-01-2023', '20:45:14', NULL, '0', '0'),
(1259, 2, 6, 354, 98, 'Kopi hitam', '5000', '10000', '2', '17-01-2023', '20:45:14', NULL, '0', '0'),
(1260, 2, 6, 355, 78, 'Milk shake oreo', '15000', '15000', '1', '17-01-2023', '20:52:03', NULL, '0', '0'),
(1261, 2, 6, 355, 94, 'Hot capucino', '10000', '10000', '1', '17-01-2023', '20:52:03', NULL, '0', '0'),
(1262, 2, 6, 356, 99, 'Kopi robusta', '7000', '7000', '1', '17-01-2023', '20:56:38', NULL, '0', '0'),
(1263, 2, 6, 357, 75, 'Milk shake chocolate', '15000', '15000', '1', '17-01-2023', '22:13:00', NULL, '0', '0'),
(1264, 2, 6, 357, 12, 'Roti maryam chocolat', '11000', '11000', '1', '17-01-2023', '22:13:00', NULL, '0', '0'),
(1265, 2, 6, 358, 98, 'Kopi hitam', '5000', '15000', '3', '17-01-2023', '22:17:02', NULL, '0', '0'),
(1266, 2, 6, 358, 20, 'Tahu walik', '15000', '15000', '1', '17-01-2023', '22:17:02', NULL, '0', '0'),
(1267, 2, 6, 350, 80, 'Lemon tea', '10000', '10000', '1', '17-01-2023', '22:50:33', NULL, '0', '0'),
(1271, 2, 6, 360, 49, 'Nasi ayam suwir', '5000', '20000', '4', '19-01-2023', '12:47:39', NULL, '0', '0'),
(1272, 2, 6, 360, 50, 'Nasi bakar tongkol', '5000', '20000', '4', '19-01-2023', '12:47:39', NULL, '0', '0'),
(1273, 2, 6, 360, 82, 'Es teh', '4000', '16000', '4', '19-01-2023', '12:47:39', NULL, '0', '0'),
(1274, 2, 6, 361, 98, 'Kopi hitam', '5000', '10000', '2', '19-01-2023', '12:48:04', NULL, '0', '0'),
(1275, 2, 6, 362, 17, 'Kentang', '10000', '20000', '2', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1276, 2, 6, 362, 87, 'Taro', '10000', '10000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1277, 2, 6, 362, 70, 'Soda gembira', '12000', '24000', '2', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1278, 2, 6, 362, 72, 'Leci squash', '12000', '12000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1279, 2, 6, 362, 39, 'Soto ayam ', '10000', '10000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1280, 2, 6, 362, 43, 'Telur puyuh', '3000', '3000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1281, 2, 6, 362, 32, 'Pentol kering judes', '13000', '13000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1282, 2, 6, 362, 94, 'Hot capucino', '10000', '10000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1283, 2, 6, 362, 100, 'Wedang jahe', '7000', '7000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1284, 2, 6, 362, 60, 'Nasi goreng ori', '10000', '10000', '1', '19-01-2023', '14:55:16', NULL, '0', '0'),
(1285, 2, 6, 362, 117, 'Es teler', '10000', '10000', '1', '19-01-2023', '14:59:47', NULL, '0', '0'),
(1286, 2, 6, 363, 62, 'Nasi goreng ayam ', '17000', '34000', '2', '19-01-2023', '17:27:46', NULL, '0', '0'),
(1287, 2, 6, 363, 80, 'Lemon tea', '10000', '40000', '4', '19-01-2023', '17:27:46', NULL, '0', '0'),
(1288, 2, 6, 363, 50, 'Nasi bakar tongkol', '5000', '15000', '3', '19-01-2023', '17:27:46', NULL, '0', '0'),
(1289, 2, 6, 363, 64, 'Lalapan 3T', '10000', '10000', '1', '19-01-2023', '17:27:46', NULL, '0', '0'),
(1290, 2, 6, 364, 84, 'Dark chocholate', '10000', '10000', '1', '19-01-2023', '18:37:21', NULL, '0', '0'),
(1291, 2, 6, 365, 60, 'Nasi goreng ori', '10000', '10000', '1', '19-01-2023', '18:37:38', NULL, '0', '0'),
(1292, 2, 6, 366, 60, 'Nasi goreng ori', '10000', '40000', '4', '19-01-2023', '18:37:57', NULL, '0', '0'),
(1293, 2, 6, 367, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '19-01-2023', '20:38:29', NULL, '0', '0'),
(1294, 2, 6, 367, 49, 'Nasi ayam suwir', '5000', '5000', '1', '19-01-2023', '20:38:29', NULL, '0', '0'),
(1295, 2, 6, 368, 49, 'Nasi ayam suwir', '5000', '10000', '2', '19-01-2023', '20:46:33', NULL, '0', '0'),
(1296, 2, 6, 368, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '19-01-2023', '20:46:33', NULL, '0', '0'),
(1297, 2, 6, 368, 43, 'Telur puyuh', '3000', '6000', '2', '19-01-2023', '20:46:33', NULL, '0', '0'),
(1298, 2, 6, 368, 41, 'Ceker', '2000', '4000', '2', '19-01-2023', '20:46:33', NULL, '0', '0'),
(1299, 2, 6, 369, 49, 'Nasi ayam suwir', '5000', '10000', '2', '19-01-2023', '20:47:18', NULL, '0', '0'),
(1300, 2, 6, 369, 82, 'Es teh', '4000', '8000', '2', '19-01-2023', '20:47:18', NULL, '0', '0'),
(1301, 2, 6, 370, 49, 'Nasi ayam suwir', '5000', '5000', '1', '19-01-2023', '22:30:10', NULL, '0', '0'),
(1302, 2, 6, 370, 43, 'Telur puyuh', '3000', '3000', '1', '19-01-2023', '22:30:10', NULL, '0', '0'),
(1303, 2, 6, 371, 130, 'KSTG', '7000', '7000', '1', '20-01-2023', '14:20:06', NULL, '0', '0'),
(1304, 2, 6, 371, 81, 'Tea tarik', '8000', '8000', '1', '20-01-2023', '14:20:06', NULL, '0', '0'),
(1305, 2, 6, 371, 98, 'Kopi hitam', '5000', '5000', '1', '20-01-2023', '14:20:06', NULL, '0', '0'),
(1306, 2, 6, 372, 82, 'Es teh', '4000', '4000', '1', '20-01-2023', '14:20:56', NULL, '0', '0'),
(1307, 2, 6, 372, 79, 'Thaitea', '10000', '10000', '1', '20-01-2023', '14:20:56', NULL, '0', '0'),
(1308, 2, 6, 373, 118, 'Alpukat Milo', '12000', '36000', '3', '20-01-2023', '14:21:50', NULL, '0', '0'),
(1309, 2, 6, 373, 131, 'Alpukat', '10000', '20000', '2', '20-01-2023', '14:21:50', NULL, '0', '0'),
(1310, 2, 6, 374, 133, 'Bakso sayur', '12000', '24000', '2', '20-01-2023', '14:25:58', NULL, '0', '0'),
(1311, 2, 6, 375, 17, 'Kentang', '10000', '10000', '1', '20-01-2023', '16:09:56', NULL, '0', '0'),
(1312, 2, 6, 375, 20, 'Tahu walik', '15000', '15000', '1', '20-01-2023', '16:09:56', NULL, '0', '0'),
(1313, 2, 6, 375, 83, 'Es jeruk', '6000', '6000', '1', '20-01-2023', '16:09:56', NULL, '0', '0'),
(1314, 2, 6, 375, 81, 'Tea tarik', '8000', '8000', '1', '20-01-2023', '16:09:56', NULL, '0', '0'),
(1315, 2, 6, 376, 49, 'Nasi ayam suwir', '5000', '5000', '1', '20-01-2023', '16:44:24', NULL, '0', '0'),
(1316, 2, 6, 377, 87, 'Taro', '10000', '20000', '2', '20-01-2023', '16:45:08', NULL, '0', '0'),
(1317, 2, 6, 378, 81, 'Tea tarik', '8000', '8000', '1', '20-01-2023', '16:51:49', NULL, '0', '0'),
(1318, 2, 6, 378, 94, 'Hot capucino', '10000', '10000', '1', '20-01-2023', '16:51:49', NULL, '0', '0'),
(1319, 2, 6, 378, 20, 'Tahu walik', '15000', '15000', '1', '20-01-2023', '16:51:49', NULL, '0', '0'),
(1320, 2, 6, 379, 105, 'Brown sugar', '10000', '10000', '1', '20-01-2023', '21:34:07', NULL, '0', '0'),
(1321, 2, 6, 380, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '20-01-2023', '21:52:21', NULL, '0', '0'),
(1322, 2, 6, 381, 82, 'Es teh', '4000', '4000', '1', '21-01-2023', '19:53:41', NULL, '0', '0'),
(1323, 2, 6, 381, 103, 'Es susu', '8000', '8000', '1', '21-01-2023', '19:53:41', NULL, '0', '0'),
(1324, 2, 6, 382, 88, 'Matcha', '10000', '20000', '2', '21-01-2023', '20:17:48', NULL, '0', '0'),
(1325, 2, 6, 382, 70, 'Soda gembira', '12000', '12000', '1', '21-01-2023', '20:17:48', NULL, '0', '0'),
(1326, 2, 6, 383, 133, 'Bakso sayur', '12000', '12000', '1', '21-01-2023', '21:49:29', NULL, '0', '0'),
(1327, 2, 6, 383, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '21-01-2023', '21:49:29', NULL, '0', '0'),
(1328, 2, 6, 383, 105, 'Brown sugar', '10000', '10000', '1', '21-01-2023', '21:49:29', NULL, '0', '0'),
(1329, 2, 6, 384, 87, 'Taro', '10000', '20000', '2', '21-01-2023', '21:52:32', NULL, '0', '0'),
(1330, 2, 6, 384, 49, 'Nasi ayam suwir', '5000', '10000', '2', '21-01-2023', '21:52:32', NULL, '0', '0'),
(1331, 2, 6, 384, 20, 'Tahu walik', '15000', '15000', '1', '21-01-2023', '21:52:32', NULL, '0', '0'),
(1332, 2, 6, 384, 40, 'Usus', '2000', '4000', '2', '21-01-2023', '21:52:32', NULL, '0', '0'),
(1333, 2, 6, 384, 43, 'Telur puyuh', '3000', '3000', '1', '21-01-2023', '21:52:32', NULL, '0', '0'),
(1334, 2, 6, 385, 39, 'Soto ayam ', '10000', '10000', '1', '21-01-2023', '22:38:03', NULL, '0', '0'),
(1335, 2, 6, 385, 26, 'Seblak tulang', '12000', '12000', '1', '21-01-2023', '22:38:03', NULL, '0', '0'),
(1336, 2, 6, 386, 84, 'Dark chocholate', '10000', '10000', '1', '21-01-2023', '22:40:53', NULL, '0', '0'),
(1337, 2, 6, 386, 98, 'Kopi hitam', '5000', '5000', '1', '21-01-2023', '22:40:53', NULL, '0', '0'),
(1338, 2, 6, 387, 43, 'Telur puyuh', '3000', '6000', '2', '22-01-2023', '16:02:23', NULL, '0', '0'),
(1339, 2, 6, 387, 60, 'Nasi goreng ori', '10000', '10000', '1', '22-01-2023', '16:02:23', NULL, '0', '0'),
(1340, 2, 6, 387, 52, 'Mi goreng ori', '10000', '10000', '1', '22-01-2023', '16:02:23', NULL, '0', '0'),
(1341, 2, 6, 387, 83, 'Es jeruk', '6000', '6000', '1', '22-01-2023', '16:02:23', NULL, '0', '0'),
(1342, 2, 6, 387, 82, 'Es teh', '4000', '4000', '1', '22-01-2023', '16:02:23', NULL, '0', '0'),
(1343, 2, 6, 388, 134, 'Jus semangka', '8000', '16000', '2', '22-01-2023', '18:53:13', NULL, '0', '0'),
(1344, 2, 6, 388, 135, 'Jus jambu', '7000', '14000', '2', '22-01-2023', '18:53:13', NULL, '0', '0'),
(1345, 2, 6, 389, 75, 'Milk shake chocolate', '15000', '15000', '1', '22-01-2023', '19:24:52', NULL, '0', '0'),
(1346, 2, 6, 390, 87, 'Taro', '10000', '20000', '2', '22-01-2023', '20:02:41', NULL, '0', '0'),
(1350, 2, 6, 392, 135, 'Jus jambu', '7000', '7000', '1', '22-01-2023', '20:43:49', NULL, '0', '0'),
(1351, 2, 6, 392, 121, 'Coffe n cream', '12000', '12000', '1', '22-01-2023', '20:43:49', NULL, '0', '0'),
(1352, 2, 6, 392, 20, 'Tahu walik', '15000', '15000', '1', '22-01-2023', '20:43:49', NULL, '0', '0'),
(1356, 2, 6, 394, 50, 'Nasi bakar tongkol', '5000', '10000', '2', '22-01-2023', '22:30:17', NULL, '0', '0'),
(1357, 2, 6, 394, 49, 'Nasi ayam suwir', '5000', '10000', '2', '22-01-2023', '22:30:17', NULL, '0', '0'),
(1358, 2, 6, 394, 42, 'Jeroan', '2500', '5000', '2', '22-01-2023', '22:30:17', NULL, '0', '0'),
(1359, 2, 6, 394, 40, 'Usus', '2000', '4000', '2', '22-01-2023', '22:30:17', NULL, '0', '0'),
(1360, 2, 6, 394, 82, 'Es teh', '4000', '8000', '2', '22-01-2023', '22:30:17', NULL, '0', '0'),
(1361, 2, 6, 395, 101, 'Jahe susu', '8000', '16000', '2', '24-01-2023', '18:40:30', NULL, '0', '0'),
(1362, 2, 6, 395, 98, 'Kopi hitam', '5000', '5000', '1', '24-01-2023', '18:54:11', NULL, '0', '0'),
(1363, 2, 6, 396, 61, 'Nasi goreng telur', '13000', '26000', '2', '24-01-2023', '19:51:16', NULL, '0', '0'),
(1364, 2, 6, 396, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '24-01-2023', '19:51:16', NULL, '0', '0'),
(1365, 2, 6, 396, 131, 'Alpukat', '10000', '30000', '3', '24-01-2023', '19:51:16', NULL, '0', '0'),
(1366, 2, 6, 396, 70, 'Soda gembira', '12000', '24000', '2', '24-01-2023', '19:51:16', NULL, '0', '0'),
(1367, 2, 6, 396, 63, 'Nasi goreng spesial', '23000', '23000', '1', '24-01-2023', '19:51:16', NULL, '0', '0'),
(1368, 2, 6, 396, 102, 'Le mineral', '2500', '2500', '1', '24-01-2023', '19:51:16', NULL, '0', '0'),
(1370, 2, 6, 397, 70, 'Soda gembira', '12000', '12000', '1', '24-01-2023', '20:18:38', NULL, '0', '0'),
(1371, 2, 6, 398, 101, 'Jahe susu', '8000', '8000', '1', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1372, 2, 6, 398, 17, 'Kentang', '10000', '20000', '2', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1373, 2, 6, 398, 85, 'Mangga', '10000', '10000', '1', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1374, 2, 6, 398, 102, 'Le mineral', '2500', '7500', '3', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1375, 2, 6, 398, 12, 'Roti maryam chocolat', '11000', '22000', '2', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1376, 2, 6, 398, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1377, 2, 6, 398, 91, 'Teh panas', '4000', '4000', '1', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1378, 2, 6, 398, 83, 'Es jeruk', '6000', '6000', '1', '25-01-2023', '13:49:56', NULL, '0', '0'),
(1379, 2, 6, 399, 94, 'Hot capucino', '10000', '20000', '2', '25-01-2023', '13:50:54', NULL, '0', '0'),
(1380, 2, 6, 399, 20, 'Tahu walik', '15000', '15000', '1', '25-01-2023', '13:50:54', NULL, '0', '0'),
(1381, 2, 6, 399, 17, 'Kentang', '10000', '10000', '1', '25-01-2023', '13:50:54', NULL, '0', '0'),
(1382, 2, 6, 399, 79, 'Thaitea', '10000', '10000', '1', '25-01-2023', '13:50:54', NULL, '0', '0'),
(1383, 2, 6, 400, 105, 'Brown sugar', '10000', '10000', '1', '25-01-2023', '19:06:44', NULL, '0', '0'),
(1384, 2, 6, 400, 87, 'Taro', '10000', '10000', '1', '25-01-2023', '19:06:44', NULL, '0', '0'),
(1385, 2, 6, 401, 119, 'Milo', '10000', '20000', '2', '25-01-2023', '22:10:51', NULL, '0', '0'),
(1386, 2, 6, 402, 98, 'Kopi hitam', '5000', '35000', '7', '26-01-2023', '19:44:31', NULL, '0', '0'),
(1387, 2, 6, 402, 70, 'Soda gembira', '12000', '24000', '2', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1388, 2, 6, 402, 100, 'Wedang jahe', '7000', '7000', '1', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1389, 2, 6, 402, 75, 'Milk shake chocolate', '15000', '15000', '1', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1390, 2, 6, 402, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1391, 2, 6, 402, 20, 'Tahu walik', '15000', '30000', '2', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1392, 2, 6, 402, 17, 'Kentang', '10000', '10000', '1', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1393, 2, 6, 402, 91, 'Teh panas', '4000', '12000', '3', '26-01-2023', '20:22:51', NULL, '0', '0'),
(1394, 2, 6, 403, 81, 'Tea tarik', '8000', '8000', '1', '26-01-2023', '20:41:56', NULL, '0', '0'),
(1395, 2, 6, 403, 88, 'Matcha', '10000', '10000', '1', '26-01-2023', '20:41:56', NULL, '0', '0'),
(1396, 2, 6, 404, 87, 'Taro', '10000', '20000', '2', '27-01-2023', '21:52:44', NULL, '0', '0'),
(1397, 2, 6, 405, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '27-01-2023', '21:53:38', NULL, '0', '0'),
(1398, 2, 6, 405, 98, 'Kopi hitam', '5000', '5000', '1', '27-01-2023', '21:53:38', NULL, '0', '0'),
(1399, 2, 6, 405, 70, 'Soda gembira', '12000', '12000', '1', '27-01-2023', '21:53:38', NULL, '0', '0'),
(1400, 2, 6, 406, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1401, 2, 6, 406, 49, 'Nasi ayam suwir', '5000', '5000', '1', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1402, 2, 6, 406, 40, 'Usus', '2000', '4000', '2', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1403, 2, 6, 406, 62, 'Nasi goreng ayam ', '17000', '51000', '3', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1404, 2, 6, 406, 82, 'Es teh', '4000', '8000', '2', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1405, 2, 6, 406, 92, 'Jeruk panas', '6000', '6000', '1', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1406, 2, 6, 406, 131, 'Alpukat', '10000', '10000', '1', '28-01-2023', '20:00:30', NULL, '0', '0'),
(1407, 2, 6, 407, 60, 'Nasi goreng ori', '10000', '20000', '2', '28-01-2023', '20:02:37', NULL, '0', '0'),
(1408, 2, 6, 408, 69, 'Mega mendung', '12000', '12000', '1', '28-01-2023', '20:03:09', NULL, '0', '0'),
(1409, 2, 6, 409, 70, 'Soda gembira', '12000', '12000', '1', '28-01-2023', '22:50:57', NULL, '0', '0'),
(1410, 2, 6, 410, 98, 'Kopi hitam', '5000', '15000', '3', '30-01-2023', '14:14:49', NULL, '0', '0'),
(1411, 2, 6, 410, 130, 'KSTG', '7000', '21000', '3', '30-01-2023', '14:14:49', NULL, '0', '0'),
(1412, 2, 6, 411, 98, 'Kopi hitam', '5000', '5000', '1', '30-01-2023', '14:24:01', NULL, '0', '0'),
(1413, 2, 6, 411, 88, 'Matcha', '10000', '10000', '1', '30-01-2023', '14:24:01', NULL, '0', '0'),
(1414, 2, 6, 412, 122, 'Bubble gum', '10000', '10000', '1', '30-01-2023', '17:05:10', NULL, '0', '0'),
(1415, 2, 6, 413, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '30-01-2023', '19:29:36', NULL, '0', '0'),
(1416, 2, 6, 413, 17, 'Kentang', '10000', '10000', '1', '30-01-2023', '19:29:36', NULL, '0', '0'),
(1417, 2, 6, 414, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '31-01-2023', '21:55:08', NULL, '0', '0'),
(1418, 2, 6, 414, 60, 'Nasi goreng ori', '10000', '30000', '3', '31-01-2023', '21:55:08', NULL, '0', '0'),
(1419, 2, 6, 414, 91, 'Teh panas', '4000', '12000', '3', '31-01-2023', '21:55:08', NULL, '0', '0'),
(1420, 2, 6, 414, 98, 'Kopi hitam', '5000', '10000', '2', '31-01-2023', '21:55:08', NULL, '0', '0'),
(1421, 2, 6, 414, 102, 'Le mineral', '2500', '2500', '1', '31-01-2023', '21:55:08', NULL, '0', '0'),
(1422, 2, 6, 415, 14, 'Roti maryam chocolat keju', '16000', '16000', '1', '31-01-2023', '21:56:29', NULL, '0', '0'),
(1423, 2, 6, 415, 17, 'Kentang', '10000', '10000', '1', '31-01-2023', '21:56:29', NULL, '0', '0'),
(1424, 2, 6, 415, 79, 'Thaitea', '10000', '10000', '1', '31-01-2023', '21:56:29', NULL, '0', '0'),
(1431, 2, 6, 418, 98, 'Kopi hitam', '5000', '10000', '2', '01-02-2023', '21:03:08', NULL, '0', '0'),
(1432, 2, 6, 418, 131, 'Alpukat', '10000', '20000', '2', '01-02-2023', '21:03:08', NULL, '0', '0'),
(1433, 2, 6, 418, 70, 'Soda gembira', '12000', '12000', '1', '01-02-2023', '21:03:08', NULL, '0', '0'),
(1434, 2, 6, 418, 114, 'Susu panas ', '8000', '8000', '1', '01-02-2023', '21:03:08', NULL, '8000', '8000'),
(1435, 2, 6, 419, 98, 'Kopi hitam', '5000', '10000', '2', '01-02-2023', '21:03:38', NULL, '0', '0'),
(1436, 2, 6, 420, 118, 'Alpukat Milo', '12000', '12000', '1', '01-02-2023', '21:04:17', NULL, '0', '0'),
(1437, 2, 6, 421, 91, 'Teh panas', '4000', '4000', '1', '01-02-2023', '22:39:36', NULL, '0', '0'),
(1438, 2, 6, 421, 83, 'Es jeruk', '6000', '6000', '1', '01-02-2023', '22:39:36', NULL, '0', '0'),
(1439, 2, 6, 422, 114, 'Susu panas ', '8000', '8000', '1', '02-02-2023', '20:46:05', NULL, '8000', '8000'),
(1440, 2, 6, 422, 78, 'Milk shake oreo', '15000', '15000', '1', '02-02-2023', '20:46:05', NULL, '0', '0'),
(1441, 2, 6, 422, 12, 'Roti maryam chocolat', '11000', '11000', '1', '02-02-2023', '20:46:05', NULL, '0', '0'),
(1442, 2, 6, 422, 17, 'Kentang', '10000', '10000', '1', '02-02-2023', '20:46:05', NULL, '0', '0'),
(1443, 2, 6, 423, 98, 'Kopi hitam', '5000', '10000', '2', '02-02-2023', '20:47:03', NULL, '0', '0'),
(1446, 2, 6, 425, 98, 'Kopi hitam', '5000', '10000', '2', '03-02-2023', '22:50:22', NULL, '0', '0'),
(1447, 2, 6, 426, 116, 'Es milo dino', '12000', '12000', '1', '03-02-2023', '22:51:10', NULL, '0', '0'),
(1448, 2, 6, 426, 61, 'Nasi goreng telur', '13000', '13000', '1', '03-02-2023', '22:51:10', NULL, '0', '0'),
(1449, 2, 6, 427, 116, 'Es milo dino', '12000', '12000', '1', '03-02-2023', '22:51:40', NULL, '0', '0'),
(1450, 2, 6, 427, 83, 'Es jeruk', '6000', '6000', '1', '03-02-2023', '22:51:40', NULL, '0', '0'),
(1451, 2, 6, 428, 59, 'Bakmi', '15000', '15000', '1', '04-02-2023', '17:39:12', NULL, '0', '0'),
(1452, 2, 6, 428, 72, 'Leci squash', '12000', '12000', '1', '04-02-2023', '17:39:12', NULL, '0', '0'),
(1453, 2, 6, 428, 14, 'Roti maryam chocolat keju', '16000', '16000', '1', '04-02-2023', '17:39:12', NULL, '0', '0'),
(1454, 2, 6, 428, 77, 'Milk shake strawberry', '15000', '15000', '1', '04-02-2023', '17:39:12', NULL, '0', '0'),
(1455, 2, 6, 429, 87, 'Taro', '10000', '10000', '1', '04-02-2023', '17:40:01', NULL, '0', '0'),
(1456, 2, 6, 429, 89, 'Chocho malt', '10000', '10000', '1', '04-02-2023', '17:40:01', NULL, '0', '0'),
(1457, 2, 6, 429, 91, 'Teh panas', '4000', '4000', '1', '04-02-2023', '17:40:01', NULL, '0', '0'),
(1458, 2, 6, 430, 98, 'Kopi hitam', '5000', '10000', '2', '04-02-2023', '17:40:55', NULL, '0', '0'),
(1459, 2, 6, 430, 66, 'Lalapan mujaer', '30000', '30000', '1', '04-02-2023', '17:40:55', NULL, '0', '0'),
(1460, 2, 6, 430, 102, 'Le mineral', '2500', '5000', '2', '04-02-2023', '17:40:55', NULL, '0', '0'),
(1461, 2, 6, 431, 50, 'Nasi bakar tongkol', '5000', '25000', '5', '04-02-2023', '17:41:41', NULL, '0', '0'),
(1462, 2, 6, 431, 49, 'Nasi ayam suwir', '5000', '75000', '15', '04-02-2023', '17:41:41', NULL, '0', '0'),
(1463, 2, 6, 432, 49, 'Nasi ayam suwir', '5000', '20000', '4', '04-02-2023', '17:42:10', NULL, '0', '0'),
(1464, 2, 6, 433, 49, 'Nasi ayam suwir', '5000', '10000', '2', '04-02-2023', '17:42:37', NULL, '0', '0'),
(1465, 2, 6, 434, 39, 'Soto ayam ', '10000', '10000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1466, 2, 6, 434, 40, 'Usus', '2000', '2000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1467, 2, 6, 434, 60, 'Nasi goreng ori', '10000', '10000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1468, 2, 6, 434, 52, 'Mi goreng ori', '10000', '10000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1469, 2, 6, 434, 116, 'Es milo dino', '12000', '12000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1470, 2, 6, 434, 91, 'Teh panas', '4000', '4000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1471, 2, 6, 434, 75, 'Milk shake chocolate', '15000', '15000', '1', '04-02-2023', '19:59:00', NULL, '0', '0'),
(1472, 2, 6, 435, 52, 'Mi goreng ori', '10000', '20000', '2', '04-02-2023', '20:30:24', NULL, '0', '0'),
(1473, 2, 6, 435, 86, 'Strawberry', '10000', '10000', '1', '04-02-2023', '20:30:24', NULL, '0', '0'),
(1474, 2, 6, 435, 91, 'Teh panas', '4000', '8000', '2', '04-02-2023', '20:30:24', NULL, '0', '0'),
(1475, 2, 6, 435, 60, 'Nasi goreng ori', '10000', '10000', '1', '04-02-2023', '20:30:24', NULL, '0', '0'),
(1476, 2, 6, 436, 98, 'Kopi hitam', '5000', '10000', '2', '04-02-2023', '22:05:43', NULL, '0', '0'),
(1477, 2, 6, 437, 89, 'Chocho malt', '10000', '10000', '1', '04-02-2023', '22:06:08', NULL, '0', '0'),
(1478, 2, 6, 438, 78, 'Milk shake oreo', '15000', '15000', '1', '04-02-2023', '22:12:21', NULL, '0', '0'),
(1479, 2, 6, 438, 53, 'Mi goreng telur ', '13000', '13000', '1', '04-02-2023', '22:12:21', NULL, '0', '0'),
(1480, 2, 6, 438, 73, 'Melon squash', '12000', '12000', '1', '04-02-2023', '22:12:21', NULL, '0', '0'),
(1481, 2, 6, 438, 24, 'Seblak komplit', '20000', '20000', '1', '04-02-2023', '22:12:21', NULL, '0', '0'),
(1482, 2, 6, 439, 100, 'Wedang jahe', '7000', '7000', '1', '04-02-2023', '22:13:13', NULL, '0', '0'),
(1483, 2, 6, 439, 99, 'Kopi robusta', '7000', '7000', '1', '04-02-2023', '22:13:13', NULL, '0', '0'),
(1484, 2, 6, 440, 70, 'Soda gembira', '12000', '12000', '1', '05-02-2023', '18:28:49', NULL, '0', '0'),
(1485, 2, 6, 440, 100, 'Wedang jahe', '7000', '7000', '1', '05-02-2023', '18:28:49', NULL, '0', '0'),
(1486, 2, 6, 441, 98, 'Kopi hitam', '5000', '5000', '1', '05-02-2023', '18:29:08', NULL, '0', '0'),
(1487, 2, 6, 442, 61, 'Nasi goreng telur', '13000', '13000', '1', '05-02-2023', '18:29:36', NULL, '0', '0'),
(1488, 2, 6, 443, 103, 'Es susu', '8000', '8000', '1', '05-02-2023', '18:30:29', NULL, '0', '0'),
(1489, 2, 6, 443, 81, 'Tea tarik', '8000', '8000', '1', '05-02-2023', '18:30:29', NULL, '0', '0'),
(1490, 2, 6, 443, 82, 'Es teh', '4000', '8000', '2', '05-02-2023', '18:30:29', NULL, '0', '0'),
(1491, 2, 6, 444, 49, 'Nasi ayam suwir', '5000', '100000', '20', '05-02-2023', '18:31:22', NULL, '0', '0'),
(1492, 2, 6, 445, 116, 'Es milo dino', '12000', '12000', '1', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1493, 2, 6, 445, 61, 'Nasi goreng telur', '13000', '52000', '4', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1494, 2, 6, 445, 11, 'Roti maryam original ', '8000', '8000', '1', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1495, 2, 6, 445, 31, 'Pentol kuah judes', '13000', '13000', '1', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1496, 2, 6, 445, 71, 'Lemon squash', '12000', '12000', '1', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1497, 2, 6, 445, 40, 'Usus', '2000', '2000', '1', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1498, 2, 6, 445, 135, 'Jus jambu', '7000', '14000', '2', '05-02-2023', '19:19:19', NULL, '0', '0'),
(1499, 2, 6, 445, 88, 'Matcha', '10000', '10000', '1', '05-02-2023', '19:23:24', NULL, '0', '0'),
(1500, 2, 6, 446, 49, 'Nasi ayam suwir', '5000', '10000', '2', '05-02-2023', '19:25:33', NULL, '0', '0'),
(1501, 2, 6, 447, 60, 'Nasi goreng ori', '10000', '10000', '1', '05-02-2023', '19:44:32', NULL, '0', '0'),
(1502, 2, 6, 447, 40, 'Usus', '2000', '4000', '2', '05-02-2023', '19:44:32', NULL, '0', '0'),
(1503, 2, 6, 447, 42, 'Jeroan', '2500', '2500', '1', '05-02-2023', '19:44:32', NULL, '0', '0'),
(1504, 2, 6, 447, 98, 'Kopi hitam', '5000', '5000', '1', '05-02-2023', '19:44:32', NULL, '0', '0'),
(1505, 2, 6, 443, 49, 'Nasi ayam suwir', '5000', '15000', '3', '05-02-2023', '21:15:32', NULL, '0', '0'),
(1506, 2, 6, 443, 40, 'Usus', '2000', '6000', '3', '05-02-2023', '21:15:32', NULL, '0', '0'),
(1507, 2, 6, 443, 41, 'Ceker', '2000', '2000', '1', '05-02-2023', '21:15:32', NULL, '0', '0'),
(1508, 2, 6, 443, 42, 'Jeroan', '2500', '5000', '2', '05-02-2023', '21:15:32', NULL, '0', '0'),
(1509, 2, 6, 448, 83, 'Es jeruk', '6000', '12000', '2', '05-02-2023', '21:42:48', NULL, '0', '0'),
(1510, 2, 6, 449, 83, 'Es jeruk', '6000', '12000', '2', '05-02-2023', '22:01:59', NULL, '0', '0'),
(1511, 2, 6, 449, 88, 'Matcha', '10000', '10000', '1', '05-02-2023', '22:01:59', NULL, '0', '0'),
(1512, 2, 6, 449, 38, 'Soto ayam ', '5000', '5000', '1', '05-02-2023', '22:01:59', NULL, '0', '0'),
(1513, 2, 6, 450, 98, 'Kopi hitam', '5000', '10000', '2', '05-02-2023', '22:04:12', NULL, '0', '0'),
(1514, 2, 6, 451, 60, 'Nasi goreng ori', '10000', '10000', '1', '05-02-2023', '22:04:44', NULL, '0', '0'),
(1515, 2, 6, 451, 83, 'Es jeruk', '6000', '6000', '1', '05-02-2023', '22:04:44', NULL, '0', '0'),
(1516, 2, 6, 452, 99, 'Kopi robusta', '7000', '14000', '2', '05-02-2023', '22:17:23', NULL, '0', '0'),
(1517, 2, 6, 452, 70, 'Soda gembira', '12000', '12000', '1', '05-02-2023', '22:17:23', NULL, '0', '0'),
(1518, 2, 6, 453, 88, 'Matcha', '10000', '10000', '1', '07-02-2023', '18:55:37', NULL, '0', '0'),
(1519, 2, 6, 454, 49, 'Nasi ayam suwir', '5000', '15000', '3', '07-02-2023', '18:56:17', NULL, '0', '0'),
(1520, 2, 6, 455, 58, 'Mi goreng soto', '6000', '6000', '1', '07-02-2023', '18:57:35', NULL, '0', '0'),
(1521, 2, 6, 455, 102, 'Le mineral', '2500', '2500', '1', '07-02-2023', '18:57:35', NULL, '0', '0'),
(1522, 2, 6, 455, 98, 'Kopi hitam', '5000', '10000', '2', '07-02-2023', '18:57:35', NULL, '0', '0'),
(1523, 2, 6, 456, 98, 'Kopi hitam', '5000', '5000', '1', '07-02-2023', '18:58:12', NULL, '0', '0'),
(1524, 2, 6, 456, 80, 'Lemon tea', '10000', '10000', '1', '07-02-2023', '18:58:12', NULL, '0', '0'),
(1525, 2, 6, 457, 94, 'Hot capucino', '10000', '30000', '3', '07-02-2023', '18:58:53', NULL, '0', '0'),
(1526, 2, 6, 458, 94, 'Hot capucino', '10000', '10000', '1', '07-02-2023', '18:59:39', NULL, '0', '0'),
(1527, 2, 6, 459, 19, 'Tahu crispy', '12000', '12000', '1', '07-02-2023', '19:00:18', NULL, '0', '0'),
(1528, 2, 6, 460, 98, 'Kopi hitam', '5000', '5000', '1', '07-02-2023', '19:01:10', NULL, '0', '0'),
(1529, 2, 6, 460, 102, 'Le mineral', '2500', '2500', '1', '07-02-2023', '19:01:10', NULL, '0', '0'),
(1530, 2, 6, 456, 93, 'Hot chochalate', '13000', '13000', '1', '07-02-2023', '19:02:19', NULL, '0', '0'),
(1531, 2, 6, 456, 101, 'Jahe susu', '8000', '8000', '1', '07-02-2023', '19:02:19', NULL, '0', '0'),
(1532, 2, 6, 456, 124, 'Tahu kucek', '10000', '10000', '1', '07-02-2023', '19:02:19', NULL, '0', '0'),
(1533, 2, 6, 456, 17, 'Kentang', '10000', '10000', '1', '07-02-2023', '19:02:19', NULL, '0', '0'),
(1534, 2, 6, 456, 49, 'Nasi ayam suwir', '5000', '10000', '2', '07-02-2023', '22:30:00', NULL, '0', '0'),
(1536, 2, 6, 462, 98, 'Kopi hitam', '5000', '5000', '1', '08-02-2023', '13:05:05', NULL, '0', '0'),
(1537, 2, 6, 462, 85, 'Mangga', '10000', '10000', '1', '08-02-2023', '13:05:05', NULL, '0', '0'),
(1538, 2, 6, 463, 61, 'Nasi goreng telur', '13000', '26000', '2', '08-02-2023', '18:42:25', NULL, '0', '0'),
(1539, 2, 6, 463, 98, 'Kopi hitam', '5000', '10000', '2', '08-02-2023', '18:42:25', NULL, '0', '0'),
(1540, 2, 6, 463, 102, 'Le mineral', '2500', '5000', '2', '08-02-2023', '18:42:25', NULL, '0', '0'),
(1541, 2, 6, 464, 61, 'Nasi goreng telur', '13000', '13000', '1', '08-02-2023', '18:43:26', NULL, '0', '0'),
(1542, 2, 6, 465, 89, 'Chocho malt', '10000', '10000', '1', '08-02-2023', '22:34:38', NULL, '0', '0'),
(1543, 2, 6, 465, 91, 'Teh panas', '4000', '4000', '1', '08-02-2023', '22:34:38', NULL, '0', '0'),
(1544, 2, 6, 466, 84, 'Dark chocholate', '10000', '10000', '1', '09-02-2023', '17:11:46', NULL, '0', '0'),
(1545, 2, 6, 466, 14, 'Roti maryam chocolat keju', '16000', '16000', '1', '09-02-2023', '17:11:46', NULL, '0', '0'),
(1546, 2, 6, 467, 96, 'Hot beng beng', '10000', '20000', '2', '09-02-2023', '17:33:37', NULL, '0', '0'),
(1547, 2, 6, 467, 97, 'Hot chocholatos', '10000', '30000', '3', '09-02-2023', '17:33:37', NULL, '0', '0'),
(1548, 2, 6, 467, 87, 'Taro', '10000', '10000', '1', '09-02-2023', '17:33:37', NULL, '0', '0'),
(1549, 2, 6, 467, 17, 'Kentang', '10000', '40000', '4', '09-02-2023', '17:33:37', NULL, '0', '0'),
(1550, 2, 6, 467, 60, 'Nasi goreng ori', '10000', '10000', '1', '09-02-2023', '17:33:37', NULL, '0', '0'),
(1551, 2, 6, 467, 57, 'Mi goreng indomie', '6000', '6000', '1', '09-02-2023', '17:33:37', NULL, '0', '0'),
(1552, 2, 6, 468, 61, 'Nasi goreng telur', '13000', '13000', '1', '09-02-2023', '17:48:03', NULL, '0', '0'),
(1553, 2, 6, 468, 20, 'Tahu walik', '15000', '15000', '1', '09-02-2023', '17:48:03', NULL, '0', '0'),
(1554, 2, 6, 468, 83, 'Es jeruk', '6000', '6000', '1', '09-02-2023', '17:48:03', NULL, '0', '0'),
(1555, 2, 6, 469, 119, 'Milo', '10000', '30000', '3', '09-02-2023', '20:13:54', NULL, '0', '0'),
(1556, 2, 6, 469, 60, 'Nasi goreng ori', '10000', '30000', '3', '09-02-2023', '20:13:54', NULL, '0', '0'),
(1557, 2, 6, 470, 85, 'Mangga', '10000', '10000', '1', '09-02-2023', '20:14:29', NULL, '0', '0'),
(1558, 2, 6, 470, 122, 'Bubble gum', '10000', '10000', '1', '09-02-2023', '20:14:29', NULL, '0', '0'),
(1559, 2, 6, 471, 92, 'Jeruk panas', '6000', '12000', '2', '09-02-2023', '20:59:34', NULL, '0', '0'),
(1560, 2, 6, 471, 96, 'Hot beng beng', '10000', '10000', '1', '09-02-2023', '20:59:34', NULL, '0', '0'),
(1561, 2, 6, 471, 100, 'Wedang jahe', '7000', '14000', '2', '09-02-2023', '20:59:34', NULL, '0', '0'),
(1562, 2, 6, 471, 11, 'Roti maryam original ', '8000', '8000', '1', '09-02-2023', '20:59:34', NULL, '0', '0'),
(1563, 2, 6, 472, 61, 'Nasi goreng telur', '13000', '52000', '4', '10-02-2023', '19:09:46', NULL, '0', '0'),
(1564, 2, 6, 472, 20, 'Tahu walik', '15000', '15000', '1', '10-02-2023', '19:09:46', NULL, '0', '0'),
(1565, 2, 6, 472, 79, 'Thaitea', '10000', '10000', '1', '10-02-2023', '19:09:46', NULL, '0', '0'),
(1566, 2, 6, 473, 85, 'Mangga', '10000', '10000', '1', '10-02-2023', '19:10:10', NULL, '0', '0'),
(1567, 2, 6, 474, 60, 'Nasi goreng ori', '10000', '10000', '1', '10-02-2023', '19:27:07', NULL, '0', '0'),
(1568, 2, 6, 474, 75, 'Milk shake chocolate', '15000', '15000', '1', '10-02-2023', '19:27:07', NULL, '0', '0'),
(1569, 2, 6, 474, 102, 'Le mineral', '2500', '5000', '2', '10-02-2023', '19:27:07', NULL, '0', '0'),
(1570, 2, 6, 475, 98, 'Kopi hitam', '5000', '5000', '1', '10-02-2023', '19:28:51', NULL, '0', '0'),
(1571, 2, 6, 475, 86, 'Strawberry', '10000', '10000', '1', '10-02-2023', '19:28:51', NULL, '0', '0'),
(1572, 2, 6, 475, 14, 'Roti maryam chocolat keju', '16000', '16000', '1', '10-02-2023', '19:28:51', NULL, '0', '0'),
(1573, 2, 6, 476, 61, 'Nasi goreng telur', '13000', '13000', '1', '10-02-2023', '21:47:43', NULL, '0', '0'),
(1574, 2, 6, 476, 20, 'Tahu walik', '15000', '15000', '1', '10-02-2023', '21:47:43', NULL, '0', '0'),
(1575, 2, 6, 476, 82, 'Es teh', '4000', '4000', '1', '10-02-2023', '21:47:43', NULL, '0', '0'),
(1576, 2, 6, 476, 91, 'Teh panas', '4000', '4000', '1', '10-02-2023', '21:47:43', NULL, '0', '0'),
(1579, 2, 6, 478, 64, 'Lalapan 3T', '10000', '10000', '1', '11-02-2023', '18:59:07', NULL, '0', '0'),
(1580, 2, 6, 478, 49, 'Nasi ayam suwir', '5000', '10000', '2', '11-02-2023', '18:59:07', NULL, '0', '0'),
(1581, 2, 6, 478, 46, 'Kepala', '2000', '4000', '2', '11-02-2023', '18:59:07', NULL, '0', '0'),
(1582, 2, 6, 478, 91, 'Teh panas', '4000', '4000', '1', '11-02-2023', '18:59:07', NULL, '0', '0'),
(1583, 2, 6, 479, 98, 'Kopi hitam', '5000', '10000', '2', '11-02-2023', '19:00:14', NULL, '0', '0'),
(1584, 2, 6, 479, 75, 'Milk shake chocolate', '15000', '15000', '1', '11-02-2023', '19:00:15', NULL, '0', '0'),
(1585, 2, 6, 479, 17, 'Kentang', '10000', '10000', '1', '11-02-2023', '19:00:15', NULL, '0', '0'),
(1586, 2, 6, 480, 49, 'Nasi ayam suwir', '5000', '10000', '2', '11-02-2023', '19:01:20', NULL, '0', '0'),
(1587, 2, 6, 481, 49, 'Nasi ayam suwir', '5000', '5000', '1', '11-02-2023', '19:39:21', NULL, '0', '0'),
(1588, 2, 6, 481, 129, 'Ayam geprek', '13000', '13000', '1', '11-02-2023', '19:39:21', NULL, '0', '0'),
(1589, 2, 6, 481, 79, 'Thaitea', '10000', '10000', '1', '11-02-2023', '19:39:21', NULL, '0', '0'),
(1590, 2, 6, 482, 75, 'Milk shake chocolate', '15000', '30000', '2', '11-02-2023', '19:39:53', NULL, '0', '0'),
(1591, 2, 6, 482, 80, 'Lemon tea', '10000', '10000', '1', '11-02-2023', '19:39:53', NULL, '0', '0'),
(1592, 2, 6, 483, 20, 'Tahu walik', '15000', '15000', '1', '11-02-2023', '20:14:28', NULL, '0', '0'),
(1593, 2, 6, 484, 85, 'Mangga', '10000', '10000', '1', '11-02-2023', '20:33:33', NULL, '0', '0'),
(1594, 2, 6, 484, 87, 'Taro', '10000', '10000', '1', '11-02-2023', '20:33:33', NULL, '0', '0'),
(1595, 2, 6, 484, 17, 'Kentang', '10000', '10000', '1', '11-02-2023', '20:33:33', NULL, '0', '0'),
(1596, 2, 6, 485, 96, 'Hot beng beng', '10000', '20000', '2', '11-02-2023', '21:16:06', NULL, '0', '0'),
(1597, 2, 6, 485, 20, 'Tahu walik', '15000', '15000', '1', '11-02-2023', '21:16:06', NULL, '0', '0'),
(1598, 2, 6, 486, 52, 'Mi goreng ori', '10000', '10000', '1', '11-02-2023', '21:16:29', NULL, '0', '0'),
(1599, 2, 6, 486, 69, 'Mega mendung', '12000', '12000', '1', '11-02-2023', '21:16:29', NULL, '0', '0'),
(1601, 2, 6, 488, 73, 'Melon squash', '12000', '12000', '1', '11-02-2023', '21:27:31', NULL, '0', '0'),
(1602, 2, 6, 488, 75, 'Milk shake chocolate', '15000', '15000', '1', '11-02-2023', '21:27:31', NULL, '0', '0'),
(1603, 2, 6, 488, 20, 'Tahu walik', '15000', '15000', '1', '11-02-2023', '21:27:31', NULL, '0', '0'),
(1604, 2, 6, 486, 17, 'Kentang', '10000', '10000', '1', '11-02-2023', '21:27:59', NULL, '0', '0'),
(1605, 2, 6, 487, 33, 'Pentol bakar', '13000', '13000', '1', '11-02-2023', '21:57:41', NULL, '0', '0'),
(1606, 2, 6, 489, 88, 'Matcha', '10000', '10000', '1', '12-02-2023', '22:17:00', NULL, '0', '0'),
(1607, 2, 6, 489, 129, 'Ayam geprek', '13000', '26000', '2', '12-02-2023', '22:17:00', NULL, '0', '0'),
(1608, 2, 6, 489, 49, 'Nasi ayam suwir', '5000', '5000', '1', '12-02-2023', '22:17:00', NULL, '0', '0'),
(1609, 2, 6, 490, 98, 'Kopi hitam', '5000', '5000', '1', '13-02-2023', '20:07:43', NULL, '0', '0'),
(1610, 2, 6, 490, 20, 'Tahu walik', '15000', '15000', '1', '13-02-2023', '20:07:43', NULL, '0', '0'),
(1611, 2, 6, 490, 49, 'Nasi ayam suwir', '5000', '10000', '2', '13-02-2023', '20:07:43', NULL, '0', '0'),
(1612, 2, 6, 490, 91, 'Teh panas', '4000', '12000', '3', '13-02-2023', '20:07:43', NULL, '0', '0'),
(1613, 2, 6, 491, 82, 'Es teh', '4000', '4000', '1', '13-02-2023', '20:11:39', NULL, '0', '0'),
(1614, 2, 6, 491, 49, 'Nasi ayam suwir', '5000', '15000', '3', '13-02-2023', '20:11:39', NULL, '0', '0'),
(1615, 2, 6, 491, 80, 'Lemon tea', '10000', '10000', '1', '13-02-2023', '20:11:39', NULL, '0', '0'),
(1616, 2, 6, 491, 40, 'Usus', '2000', '6000', '3', '13-02-2023', '20:11:39', NULL, '0', '0'),
(1617, 2, 6, 492, 131, 'Alpukat', '10000', '20000', '2', '13-02-2023', '20:13:32', NULL, '0', '0'),
(1618, 2, 6, 492, 20, 'Tahu walik', '15000', '45000', '3', '13-02-2023', '20:13:32', NULL, '0', '0'),
(1619, 2, 6, 492, 61, 'Nasi goreng telur', '13000', '26000', '2', '13-02-2023', '20:13:32', NULL, '0', '0'),
(1620, 2, 6, 492, 40, 'Usus', '2000', '4000', '2', '13-02-2023', '20:20:20', NULL, '0', '0'),
(1621, 2, 6, 492, 135, 'Jus jambu', '7000', '7000', '1', '13-02-2023', '20:31:50', NULL, '0', '0'),
(1622, 2, 6, 493, 99, 'Kopi robusta', '7000', '14000', '2', '13-02-2023', '21:42:09', NULL, '0', '0'),
(1623, 2, 6, 493, 11, 'Roti maryam original ', '8000', '32000', '4', '13-02-2023', '21:42:09', NULL, '0', '0'),
(1624, 2, 6, 493, 100, 'Wedang jahe', '7000', '7000', '1', '13-02-2023', '21:42:09', NULL, '0', '0'),
(1625, 2, 6, 493, 91, 'Teh panas', '4000', '4000', '1', '13-02-2023', '21:42:09', NULL, '0', '0'),
(1626, 2, 6, 493, 12, 'Roti maryam chocolat', '11000', '11000', '1', '13-02-2023', '22:28:43', NULL, '0', '0'),
(1627, 2, 6, 493, 13, 'Roti maryam keju', '12000', '12000', '1', '13-02-2023', '22:28:43', NULL, '0', '0'),
(1628, 2, 6, 494, 106, 'Gula aren ', '10000', '10000', '1', '14-02-2023', '19:55:50', NULL, '0', '0'),
(1629, 2, 6, 494, 17, 'Kentang', '10000', '10000', '1', '14-02-2023', '19:55:50', NULL, '0', '0'),
(1630, 2, 6, 494, 102, 'Le mineral', '2500', '2500', '1', '14-02-2023', '19:55:50', NULL, '0', '0'),
(1631, 2, 6, 494, 20, 'Tahu walik', '15000', '15000', '1', '14-02-2023', '19:55:50', NULL, '0', '0'),
(1632, 2, 6, 494, 97, 'Hot chocholatos', '10000', '20000', '2', '14-02-2023', '19:55:50', NULL, '0', '0'),
(1633, 2, 6, 495, 49, 'Nasi ayam suwir', '5000', '10000', '2', '14-02-2023', '19:57:20', NULL, '0', '0'),
(1634, 2, 6, 495, 42, 'Jeroan', '2500', '2500', '1', '14-02-2023', '19:57:20', NULL, '0', '0'),
(1636, 2, 6, 495, 48, 'Telur puyuh', '2000', '2000', '1', '14-02-2023', '19:58:31', NULL, '0', '0'),
(1637, 2, 6, 496, 49, 'Nasi ayam suwir', '5000', '10000', '2', '14-02-2023', '19:59:39', NULL, '0', '0'),
(1638, 2, 6, 496, 46, 'Kepala', '2000', '4000', '2', '14-02-2023', '19:59:39', NULL, '0', '0'),
(1639, 2, 6, 497, 53, 'Mi goreng telur ', '13000', '39000', '3', '14-02-2023', '20:00:15', NULL, '0', '0'),
(1640, 2, 6, 498, 40, 'Usus', '2000', '4000', '2', '14-02-2023', '20:00:54', NULL, '0', '0'),
(1650, 2, 6, 500, 37, 'Nasi', '5000', '5000', '1', '14-02-2023', '20:17:49', NULL, '0', '0'),
(1651, 2, 6, 500, 47, 'Sayap', '4000', '8000', '2', '14-02-2023', '20:17:49', NULL, '0', '0'),
(1652, 2, 6, 500, 42, 'Jeroan', '2500', '5000', '2', '14-02-2023', '20:17:49', NULL, '0', '0'),
(1653, 2, 6, 501, 41, 'Ceker', '2000', '2000', '1', '14-02-2023', '20:19:15', NULL, '0', '0'),
(1654, 2, 6, 501, 40, 'Usus', '2000', '2000', '1', '14-02-2023', '20:19:15', NULL, '0', '0'),
(1655, 2, 6, 502, 37, 'Nasi', '5000', '5000', '1', '14-02-2023', '20:20:14', NULL, '0', '0'),
(1656, 2, 6, 502, 47, 'Sayap', '4000', '4000', '1', '14-02-2023', '20:20:14', NULL, '0', '0'),
(1657, 2, 6, 502, 42, 'Jeroan', '2500', '5000', '2', '14-02-2023', '20:20:14', NULL, '0', '0'),
(1659, 2, 6, 504, 50, 'Nasi bakar tongkol', '5000', '15000', '3', '14-02-2023', '20:48:42', NULL, '0', '0'),
(1660, 2, 6, 504, 49, 'Nasi ayam suwir', '5000', '10000', '2', '14-02-2023', '20:48:42', NULL, '0', '0'),
(1661, 2, 6, 504, 47, 'Sayap', '4000', '4000', '1', '14-02-2023', '20:48:42', NULL, '0', '0'),
(1662, 2, 6, 504, 42, 'Jeroan', '2500', '2500', '1', '14-02-2023', '20:48:42', NULL, '0', '0'),
(1672, 2, 6, 506, 88, 'Matcha', '10000', '20000', '2', '15-02-2023', '14:01:57', NULL, '0', '0'),
(1673, 2, 6, 506, 99, 'Kopi robusta', '7000', '7000', '1', '15-02-2023', '14:01:57', NULL, '0', '0'),
(1674, 2, 6, 506, 20, 'Tahu walik', '15000', '30000', '2', '15-02-2023', '14:01:57', NULL, '0', '0'),
(1675, 2, 6, 506, 17, 'Kentang', '10000', '10000', '1', '15-02-2023', '14:01:57', NULL, '0', '0'),
(1676, 2, 6, 506, 94, 'Hot capucino', '10000', '10000', '1', '15-02-2023', '14:01:57', NULL, '0', '0'),
(1677, 2, 6, 506, 73, 'Melon squash', '12000', '12000', '1', '15-02-2023', '14:24:31', NULL, '0', '0'),
(1678, 2, 6, 507, 138, 'Nasi', '4000', '4000', '1', '15-02-2023', '20:00:28', NULL, '0', '0'),
(1679, 2, 6, 507, 129, 'Ayam geprek', '10000', '20000', '2', '15-02-2023', '20:00:28', NULL, '0', '0'),
(1680, 2, 6, 507, 139, 'Sosis bakar', '6000', '6000', '1', '15-02-2023', '20:00:28', NULL, '0', '0'),
(1681, 2, 6, 507, 137, 'Tempe', '2000', '2000', '1', '15-02-2023', '20:00:28', NULL, '0', '0'),
(1682, 2, 6, 507, 48, 'Telur puyuh', '2000', '2000', '1', '15-02-2023', '20:01:10', NULL, '0', '0'),
(1683, 2, 6, 508, 129, 'Ayam geprek', '10000', '20000', '2', '15-02-2023', '20:01:54', NULL, '0', '0'),
(1684, 2, 6, 509, 56, 'Mi nyemek', '15000', '30000', '2', '15-02-2023', '20:02:47', NULL, '0', '0'),
(1685, 2, 6, 509, 61, 'Nasi goreng telur', '13000', '13000', '1', '15-02-2023', '20:02:47', NULL, '0', '0'),
(1686, 2, 6, 509, 82, 'Es teh', '4000', '8000', '2', '15-02-2023', '20:02:47', NULL, '0', '0'),
(1687, 2, 6, 509, 91, 'Teh panas', '4000', '4000', '1', '15-02-2023', '20:02:47', NULL, '0', '0'),
(1688, 2, 6, 510, 119, 'Milo', '10000', '40000', '4', '16-02-2023', '21:54:33', NULL, '0', '0'),
(1689, 2, 6, 510, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '16-02-2023', '21:54:33', NULL, '0', '0'),
(1690, 2, 6, 511, 49, 'Nasi ayam suwir', '5000', '10000', '2', '16-02-2023', '21:55:11', NULL, '0', '0'),
(1691, 2, 6, 512, 50, 'Nasi bakar tongkol', '5000', '15000', '3', '16-02-2023', '21:57:26', NULL, '0', '0'),
(1692, 2, 6, 512, 45, 'Ceker', '2000', '4000', '2', '16-02-2023', '21:57:26', NULL, '0', '0'),
(1693, 2, 6, 512, 47, 'Sayap', '4000', '8000', '2', '16-02-2023', '21:57:26', NULL, '0', '0'),
(1694, 2, 6, 512, 42, 'Jeroan', '2500', '5000', '2', '16-02-2023', '21:57:26', NULL, '0', '0'),
(1695, 2, 6, 512, 131, 'Alpukat', '10000', '10000', '1', '16-02-2023', '21:57:26', NULL, '0', '0'),
(1696, 2, 6, 512, 44, 'Usus ', '2000', '8000', '4', '16-02-2023', '21:57:26', NULL, '0', '0');
INSERT INTO `pembayaran_detail` (`id`, `id_user`, `id_kasir`, `id_pembayaran`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(1701, 2, 6, 515, 98, 'Kopi hitam', '5000', '5000', '1', '19-02-2023', '14:10:10', NULL, '0', '0'),
(1702, 2, 6, 515, 107, 'Kopi susu', '6000', '6000', '1', '19-02-2023', '14:10:10', NULL, '0', '0'),
(1703, 2, 6, 515, 102, 'Le mineral', '2500', '2500', '1', '19-02-2023', '14:10:10', NULL, '0', '0'),
(1704, 2, 6, 515, 11, 'Roti maryam original ', '8000', '8000', '1', '19-02-2023', '14:10:10', NULL, '0', '0'),
(1705, 2, 6, 515, 60, 'Nasi goreng ori', '10000', '10000', '1', '19-02-2023', '14:10:10', NULL, '0', '0'),
(1706, 2, 6, 516, 94, 'Hot capucino', '10000', '10000', '1', '01-03-2023', '18:21:26', NULL, '0', '0'),
(1707, 2, 6, 516, 120, 'Es beng beng', '10000', '20000', '2', '01-03-2023', '18:21:26', NULL, '0', '0'),
(1708, 2, 6, 516, 57, 'Mi goreng indomie', '6000', '18000', '3', '01-03-2023', '18:21:26', NULL, '0', '0'),
(1709, 2, 6, 517, 75, 'Milk shake chocolate', '15000', '30000', '2', '01-03-2023', '18:51:18', NULL, '0', '0'),
(1710, 2, 6, 518, 61, 'Nasi goreng telur', '13000', '13000', '1', '01-03-2023', '18:52:01', NULL, '0', '0'),
(1711, 2, 6, 518, 94, 'Hot capucino', '10000', '10000', '1', '01-03-2023', '18:52:01', NULL, '0', '0'),
(1712, 2, 6, 519, 138, 'Nasi', '4000', '4000', '1', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1713, 2, 6, 519, 60, 'Nasi goreng ori', '10000', '10000', '1', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1714, 2, 6, 519, 56, 'Mi nyemek', '15000', '15000', '1', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1715, 2, 6, 519, 58, 'Mi goreng soto', '6000', '6000', '1', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1716, 2, 6, 519, 57, 'Mi goreng indomie', '6000', '6000', '1', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1717, 2, 6, 519, 91, 'Teh panas', '4000', '4000', '1', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1718, 2, 6, 519, 82, 'Es teh', '4000', '8000', '2', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1719, 2, 6, 519, 102, 'Le mineral', '2500', '5000', '2', '01-03-2023', '21:10:21', NULL, '0', '0'),
(1720, 2, 6, 520, 56, 'Mi nyemek', '15000', '15000', '1', '01-03-2023', '21:10:56', NULL, '0', '0'),
(1721, 2, 6, 521, 98, 'Kopi hitam', '5000', '10000', '2', '01-03-2023', '22:29:22', NULL, '0', '0'),
(1722, 2, 6, 522, 11, 'Roti maryam original ', '8000', '8000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1723, 2, 6, 522, 19, 'Tahu crispy', '12000', '12000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1724, 2, 6, 522, 148, 'Dubling', '4000', '4000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1725, 2, 6, 522, 151, 'Sosis ', '1000', '1000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1726, 2, 6, 522, 153, 'Odeng', '2000', '4000', '2', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1727, 2, 6, 522, 154, 'Bakso ikan', '2000', '2000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1728, 2, 6, 522, 149, 'Cikuwa', '3000', '3000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1729, 2, 6, 522, 146, 'Bakso udang', '2000', '2000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1730, 2, 6, 522, 150, 'Cedea', '2000', '2000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1731, 2, 6, 522, 17, 'Kentang', '10000', '10000', '1', '02-03-2023', '17:27:23', NULL, '0', '0'),
(1732, 2, 6, 523, 153, 'Odeng', '2000', '2000', '1', '02-03-2023', '21:24:34', NULL, '0', '0'),
(1733, 2, 6, 523, 151, 'Sosis ', '1000', '1000', '1', '02-03-2023', '21:24:34', NULL, '0', '0'),
(1734, 2, 6, 523, 148, 'Dubling', '4000', '4000', '1', '02-03-2023', '21:24:34', NULL, '0', '0'),
(1735, 2, 6, 524, 69, 'Mega mendung', '12000', '12000', '1', '02-03-2023', '21:25:20', NULL, '0', '0'),
(1736, 2, 6, 524, 11, 'Roti maryam original ', '8000', '8000', '1', '02-03-2023', '21:25:20', NULL, '0', '0'),
(1737, 2, 6, 524, 80, 'Lemon tea', '10000', '10000', '1', '02-03-2023', '21:25:20', NULL, '0', '0'),
(1738, 2, 6, 525, 147, 'Fisrol', '2000', '6000', '3', '02-03-2023', '21:27:04', NULL, '0', '0'),
(1739, 2, 6, 525, 151, 'Sosis ', '1000', '2000', '2', '02-03-2023', '21:27:04', NULL, '0', '0'),
(1740, 2, 6, 525, 155, 'Bakso sapi ', '3000', '6000', '2', '02-03-2023', '21:27:04', NULL, '0', '0'),
(1741, 2, 6, 525, 146, 'Bakso udang', '2000', '4000', '2', '02-03-2023', '21:27:04', NULL, '0', '0'),
(1742, 2, 6, 525, 139, 'Sosis bakar', '6000', '6000', '1', '02-03-2023', '21:27:04', NULL, '0', '0'),
(1743, 2, 6, 523, 156, 'Cumi flower', '2000', '4000', '2', '02-03-2023', '21:30:31', NULL, '0', '0'),
(1744, 2, 6, 526, 78, 'Milk shake oreo', '15000', '15000', '1', '02-03-2023', '21:31:18', NULL, '0', '0'),
(1745, 2, 6, 527, 61, 'Nasi goreng telur', '13000', '13000', '1', '02-03-2023', '21:46:24', NULL, '0', '0'),
(1746, 2, 6, 528, 64, 'Lalapan 3T', '10000', '10000', '1', '03-03-2023', '22:47:17', NULL, '0', '0'),
(1747, 2, 6, 528, 87, 'Taro', '10000', '10000', '1', '03-03-2023', '22:47:17', NULL, '0', '0'),
(1748, 2, 6, 528, 118, 'Alpukat Milo', '12000', '24000', '2', '03-03-2023', '22:47:17', NULL, '0', '0'),
(1749, 2, 6, 528, 98, 'Kopi hitam', '5000', '5000', '1', '03-03-2023', '22:47:17', NULL, '0', '0'),
(1750, 2, 6, 528, 52, 'Mi goreng ori', '10000', '10000', '1', '03-03-2023', '22:47:17', NULL, '0', '0'),
(1751, 2, 6, 528, 57, 'Mi goreng indomie', '6000', '6000', '1', '03-03-2023', '22:47:17', NULL, '0', '0'),
(1752, 2, 6, 529, 88, 'Matcha', '10000', '10000', '1', '04-03-2023', '17:49:59', NULL, '0', '0'),
(1753, 2, 6, 529, 80, 'Lemon tea', '10000', '10000', '1', '04-03-2023', '17:49:59', NULL, '0', '0'),
(1754, 2, 6, 530, 70, 'Soda gembira', '12000', '24000', '2', '04-03-2023', '17:50:49', NULL, '0', '0'),
(1755, 2, 6, 531, 89, 'Chocho malt', '10000', '10000', '1', '04-03-2023', '21:02:06', NULL, '0', '0'),
(1757, 2, 6, 533, 60, 'Nasi goreng ori', '10000', '10000', '1', '05-03-2023', '21:56:22', NULL, '0', '0'),
(1758, 2, 6, 533, 98, 'Kopi hitam', '5000', '10000', '2', '05-03-2023', '21:56:22', NULL, '0', '0'),
(1759, 2, 6, 533, 102, 'Le mineral', '2500', '2500', '1', '05-03-2023', '21:56:22', NULL, '0', '0'),
(1760, 2, 6, 534, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '05-03-2023', '21:57:18', NULL, '0', '0'),
(1761, 2, 6, 534, 87, 'Taro', '10000', '10000', '1', '05-03-2023', '21:57:18', NULL, '0', '0'),
(1762, 2, 6, 534, 94, 'Hot capucino', '10000', '10000', '1', '05-03-2023', '21:57:18', NULL, '0', '0'),
(1765, 2, 6, 536, 98, 'Kopi hitam', '5000', '5000', '1', '07-03-2023', '22:19:24', NULL, '0', '0'),
(1766, 2, 6, 536, 17, 'Kentang', '10000', '10000', '1', '07-03-2023', '22:19:24', NULL, '0', '0'),
(1767, 2, 6, 536, 85, 'Mangga', '10000', '10000', '1', '07-03-2023', '22:19:24', NULL, '0', '0'),
(1768, 2, 6, 537, 61, 'Nasi goreng telur', '13000', '13000', '1', '07-03-2023', '22:20:11', NULL, '0', '0'),
(1769, 2, 6, 537, 96, 'Hot beng beng', '10000', '10000', '1', '07-03-2023', '22:20:11', NULL, '0', '0'),
(1770, 2, 6, 537, 87, 'Taro', '10000', '10000', '1', '07-03-2023', '22:20:11', NULL, '0', '0'),
(1771, 2, 6, 538, 96, 'Hot beng beng', '10000', '10000', '1', '07-03-2023', '22:25:11', NULL, '0', '0'),
(1772, 2, 6, 538, 79, 'Thaitea', '10000', '10000', '1', '07-03-2023', '22:25:11', NULL, '0', '0'),
(1773, 2, 6, 539, 70, 'Soda gembira', '12000', '12000', '1', '07-03-2023', '22:25:43', NULL, '0', '0'),
(1774, 2, 6, 539, 64, 'Lalapan 3T', '10000', '10000', '1', '07-03-2023', '22:25:43', NULL, '0', '0'),
(1775, 2, 6, 540, 64, 'Lalapan 3T', '10000', '10000', '1', '08-03-2023', '22:21:38', NULL, '0', '0'),
(1776, 2, 6, 540, 88, 'Matcha', '10000', '10000', '1', '08-03-2023', '22:21:38', NULL, '0', '0'),
(1777, 2, 6, 540, 79, 'Thaitea', '10000', '10000', '1', '08-03-2023', '22:21:38', NULL, '0', '0'),
(1778, 2, 6, 541, 139, 'Sosis bakar', '6000', '6000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1779, 2, 6, 541, 156, 'Cumi flower', '2000', '2000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1780, 2, 6, 541, 148, 'Dubling', '4000', '4000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1781, 2, 6, 541, 153, 'Odeng', '2000', '2000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1782, 2, 6, 541, 152, 'Tempura', '2000', '2000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1783, 2, 6, 541, 155, 'Bakso sapi ', '3000', '3000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1784, 2, 6, 541, 149, 'Cikuwa', '3000', '3000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1785, 2, 6, 541, 150, 'Cedea', '2000', '2000', '1', '08-03-2023', '22:23:01', NULL, '0', '0'),
(1786, 2, 6, 542, 135, 'Jus jambu', '7000', '7000', '1', '09-03-2023', '18:05:48', NULL, '0', '0'),
(1787, 2, 6, 542, 12, 'Roti maryam chocolat', '11000', '11000', '1', '09-03-2023', '18:05:48', NULL, '0', '0'),
(1788, 2, 6, 542, 13, 'Roti maryam keju', '12000', '12000', '1', '09-03-2023', '18:05:48', NULL, '0', '0'),
(1789, 2, 6, 543, 152, 'Tempura', '2000', '10000', '5', '09-03-2023', '18:06:23', NULL, '0', '0'),
(1792, 2, 6, 545, 57, 'Mi goreng indomie', '6000', '12000', '2', '09-03-2023', '18:07:34', NULL, '0', '0'),
(1793, 2, 6, 546, 78, 'Milk shake oreo', '15000', '15000', '1', '09-03-2023', '21:46:20', NULL, '0', '0'),
(1794, 2, 6, 546, 19, 'Tahu crispy', '12000', '12000', '1', '09-03-2023', '21:46:20', NULL, '0', '0'),
(1795, 2, 6, 546, 98, 'Kopi hitam', '5000', '5000', '1', '09-03-2023', '21:46:20', NULL, '0', '0'),
(1796, 2, 6, 547, 11, 'Roti maryam original ', '8000', '8000', '1', '11-03-2023', '22:11:17', NULL, '0', '0'),
(1797, 2, 6, 547, 81, 'Tea tarik', '8000', '8000', '1', '11-03-2023', '22:11:17', NULL, '0', '0'),
(1798, 2, 6, 548, 79, 'Thaitea', '10000', '10000', '1', '11-03-2023', '22:11:52', NULL, '0', '0'),
(1799, 2, 6, 548, 17, 'Kentang', '10000', '10000', '1', '11-03-2023', '22:11:52', NULL, '0', '0'),
(1800, 2, 6, 549, 69, 'Mega mendung', '12000', '12000', '1', '11-03-2023', '22:12:23', NULL, '0', '0'),
(1801, 2, 6, 549, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '11-03-2023', '22:12:23', NULL, '0', '0'),
(1802, 2, 6, 550, 11, 'Roti maryam original ', '8000', '8000', '1', '11-03-2023', '23:20:15', NULL, '0', '0'),
(1803, 2, 6, 550, 56, 'Mi nyemek', '15000', '15000', '1', '11-03-2023', '23:20:15', NULL, '0', '0'),
(1804, 2, 6, 551, 80, 'Lemon tea', '10000', '20000', '2', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1805, 2, 6, 551, 61, 'Nasi goreng telur', '13000', '13000', '1', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1806, 2, 6, 551, 64, 'Lalapan 3T', '10000', '10000', '1', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1807, 2, 6, 551, 57, 'Mi goreng indomie', '6000', '6000', '1', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1808, 2, 6, 551, 148, 'Dubling', '4000', '4000', '1', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1809, 2, 6, 551, 150, 'Cedea', '2000', '2000', '1', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1810, 2, 6, 551, 154, 'Bakso ikan', '2000', '2000', '1', '11-03-2023', '23:23:37', NULL, '0', '0'),
(1811, 2, 6, 552, 79, 'Thaitea', '10000', '30000', '3', '12-03-2023', '20:17:02', NULL, '0', '0'),
(1812, 2, 6, 552, 81, 'Tea tarik', '8000', '8000', '1', '12-03-2023', '20:17:02', NULL, '0', '0'),
(1813, 2, 6, 553, 98, 'Kopi hitam', '5000', '5000', '1', '12-03-2023', '20:17:26', NULL, '0', '0'),
(1814, 2, 6, 554, 70, 'Soda gembira', '12000', '12000', '1', '12-03-2023', '21:55:22', NULL, '0', '0'),
(1815, 2, 6, 555, 17, 'Kentang', '10000', '10000', '1', '13-03-2023', '19:53:35', NULL, '0', '0'),
(1816, 2, 6, 555, 82, 'Es teh', '4000', '4000', '1', '13-03-2023', '19:53:35', NULL, '0', '0'),
(1817, 2, 6, 555, 83, 'Es jeruk', '6000', '6000', '1', '13-03-2023', '19:53:35', NULL, '0', '0'),
(1818, 2, 6, 555, 64, 'Lalapan 3T', '10000', '20000', '2', '13-03-2023', '19:53:35', NULL, '0', '0'),
(1819, 2, 6, 556, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '13-03-2023', '19:54:14', NULL, '0', '0'),
(1820, 2, 6, 556, 98, 'Kopi hitam', '5000', '5000', '1', '13-03-2023', '19:55:23', NULL, '0', '0'),
(1821, 2, 6, 557, 80, 'Lemon tea', '10000', '10000', '1', '13-03-2023', '19:56:13', NULL, '0', '0'),
(1822, 2, 6, 557, 85, 'Mangga', '10000', '10000', '1', '13-03-2023', '19:56:13', NULL, '0', '0'),
(1823, 2, 6, 557, 17, 'Kentang', '10000', '10000', '1', '13-03-2023', '19:56:13', NULL, '0', '0'),
(1824, 2, 6, 558, 98, 'Kopi hitam', '5000', '5000', '1', '13-03-2023', '19:56:52', NULL, '0', '0'),
(1825, 2, 6, 558, 82, 'Es teh', '4000', '4000', '1', '13-03-2023', '19:56:52', NULL, '0', '0'),
(1826, 2, 6, 558, 64, 'Lalapan 3T', '10000', '10000', '1', '13-03-2023', '19:56:52', NULL, '0', '0'),
(1827, 2, 6, 559, 13, 'Roti maryam keju', '12000', '12000', '1', '13-03-2023', '23:43:04', NULL, '0', '0'),
(1828, 2, 6, 560, 100, 'Wedang jahe', '7000', '14000', '2', '14-03-2023', '22:06:44', NULL, '0', '0'),
(1829, 2, 6, 560, 17, 'Kentang', '10000', '10000', '1', '14-03-2023', '22:06:44', NULL, '0', '0'),
(1830, 2, 6, 560, 98, 'Kopi hitam', '5000', '5000', '1', '14-03-2023', '22:06:44', NULL, '0', '0'),
(1831, 2, 6, 561, 98, 'Kopi hitam', '5000', '10000', '2', '14-03-2023', '22:07:06', NULL, '0', '0'),
(1832, 2, 6, 562, 85, 'Mangga', '10000', '10000', '1', '15-03-2023', '22:14:08', NULL, '0', '0'),
(1833, 2, 6, 562, 17, 'Kentang', '10000', '10000', '1', '15-03-2023', '22:14:08', NULL, '0', '0'),
(1834, 2, 6, 562, 12, 'Roti maryam chocolat', '11000', '11000', '1', '15-03-2023', '22:14:08', NULL, '0', '0'),
(1835, 2, 6, 563, 80, 'Lemon tea', '10000', '10000', '1', '15-03-2023', '22:14:41', NULL, '0', '0'),
(1836, 2, 6, 563, 13, 'Roti maryam keju', '12000', '12000', '1', '15-03-2023', '22:14:41', NULL, '0', '0'),
(1837, 2, 6, 564, 74, 'Chochopandan squash', '12000', '12000', '1', '15-03-2023', '22:16:39', NULL, '0', '0'),
(1838, 2, 6, 564, 118, 'Alpukat Milo', '12000', '12000', '1', '15-03-2023', '22:16:39', NULL, '0', '0'),
(1839, 2, 6, 564, 17, 'Kentang', '10000', '10000', '1', '15-03-2023', '22:16:39', NULL, '0', '0'),
(1840, 2, 6, 565, 11, 'Roti maryam original ', '8000', '8000', '1', '15-03-2023', '22:17:11', NULL, '0', '0'),
(1841, 2, 6, 566, 85, 'Mangga', '10000', '10000', '1', '15-03-2023', '22:18:19', NULL, '0', '0'),
(1842, 2, 6, 566, 131, 'Alpukat', '10000', '10000', '1', '15-03-2023', '22:18:19', NULL, '0', '0'),
(1843, 2, 6, 566, 64, 'Lalapan 3T', '10000', '10000', '1', '15-03-2023', '22:18:19', NULL, '0', '0'),
(1844, 2, 6, 566, 52, 'Mi goreng ori', '10000', '10000', '1', '15-03-2023', '22:18:19', NULL, '0', '0'),
(1845, 2, 6, 567, 61, 'Nasi goreng telur', '13000', '13000', '1', '15-03-2023', '22:19:03', NULL, '0', '0'),
(1846, 2, 6, 567, 70, 'Soda gembira', '12000', '36000', '3', '15-03-2023', '22:19:03', NULL, '0', '0'),
(1847, 2, 6, 568, 88, 'Matcha', '10000', '10000', '1', '16-03-2023', '21:59:51', NULL, '0', '0'),
(1848, 2, 6, 568, 87, 'Taro', '10000', '10000', '1', '16-03-2023', '21:59:51', NULL, '0', '0'),
(1849, 2, 6, 569, 60, 'Nasi goreng ori', '10000', '10000', '1', '16-03-2023', '22:00:23', NULL, '0', '0'),
(1850, 2, 6, 569, 82, 'Es teh', '4000', '4000', '1', '16-03-2023', '22:00:23', NULL, '0', '0'),
(1858, 2, 6, 571, 80, 'Lemon tea', '10000', '10000', '1', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1859, 2, 6, 571, 17, 'Kentang', '10000', '20000', '2', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1860, 2, 6, 571, 82, 'Es teh', '4000', '8000', '2', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1861, 2, 6, 571, 119, 'Milo', '10000', '10000', '1', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1862, 2, 6, 571, 96, 'Hot beng beng', '10000', '10000', '1', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1863, 2, 6, 571, 123, 'Snack mix', '25000', '50000', '2', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1864, 2, 6, 571, 84, 'Dark chocholate', '10000', '20000', '2', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1865, 2, 6, 571, 102, 'Le mineral', '2500', '2500', '1', '17-03-2023', '18:04:02', NULL, '0', '0'),
(1866, 2, 6, 572, 98, 'Kopi hitam', '5000', '5000', '1', '17-03-2023', '18:04:24', NULL, '0', '0'),
(1867, 2, 6, 573, 92, 'Jeruk panas', '6000', '6000', '1', '17-03-2023', '18:11:25', NULL, '0', '0'),
(1868, 2, 6, 574, 85, 'Mangga', '10000', '10000', '1', '17-03-2023', '19:39:39', NULL, '0', '0'),
(1869, 2, 6, 575, 98, 'Kopi hitam', '5000', '10000', '2', '17-03-2023', '19:40:12', NULL, '0', '0'),
(1870, 2, 6, 576, 87, 'Taro', '10000', '30000', '3', '17-03-2023', '19:40:35', NULL, '0', '0'),
(1871, 2, 6, 577, 94, 'Hot capucino', '10000', '20000', '2', '18-03-2023', '22:18:57', NULL, '0', '0'),
(1872, 2, 6, 577, 101, 'Jahe susu', '8000', '8000', '1', '18-03-2023', '22:18:57', NULL, '0', '0'),
(1873, 2, 6, 578, 101, 'Jahe susu', '8000', '8000', '1', '18-03-2023', '22:19:43', NULL, '0', '0'),
(1874, 2, 6, 578, 70, 'Soda gembira', '12000', '12000', '1', '18-03-2023', '22:19:43', NULL, '0', '0'),
(1875, 2, 6, 578, 80, 'Lemon tea', '10000', '10000', '1', '18-03-2023', '22:19:43', NULL, '0', '0'),
(1876, 2, 6, 579, 84, 'Dark chocholate', '10000', '20000', '2', '18-03-2023', '22:20:21', NULL, '0', '0'),
(1877, 2, 6, 579, 81, 'Tea tarik', '8000', '8000', '1', '18-03-2023', '22:20:21', NULL, '0', '0'),
(1878, 2, 6, 580, 70, 'Soda gembira', '12000', '24000', '2', '18-03-2023', '22:20:49', NULL, '0', '0'),
(1879, 2, 6, 580, 19, 'Tahu crispy', '12000', '12000', '1', '18-03-2023', '22:20:49', NULL, '0', '0'),
(1880, 2, 6, 581, 61, 'Nasi goreng telur', '13000', '13000', '1', '19-03-2023', '19:01:00', NULL, '0', '0'),
(1881, 2, 6, 581, 91, 'Teh panas', '4000', '4000', '1', '19-03-2023', '19:01:00', NULL, '0', '0'),
(1882, 2, 6, 582, 86, 'Strawberry', '10000', '10000', '1', '19-03-2023', '19:01:24', NULL, '0', '0'),
(1883, 2, 6, 583, 60, 'Nasi goreng ori', '10000', '50000', '5', '19-03-2023', '19:09:49', NULL, '0', '0'),
(1884, 2, 6, 584, 98, 'Kopi hitam', '5000', '5000', '1', '19-03-2023', '21:24:59', NULL, '0', '0'),
(1885, 2, 6, 585, 70, 'Soda gembira', '12000', '12000', '1', '19-03-2023', '21:26:15', NULL, '0', '0'),
(1886, 2, 6, 586, 98, 'Kopi hitam', '5000', '5000', '1', '19-03-2023', '21:26:42', NULL, '0', '0'),
(1887, 2, 6, 586, 70, 'Soda gembira', '12000', '12000', '1', '19-03-2023', '21:26:42', NULL, '0', '0'),
(1888, 2, 6, 586, 69, 'Mega mendung', '12000', '12000', '1', '19-03-2023', '21:26:42', NULL, '0', '0'),
(1889, 2, 6, 587, 89, 'Chocho malt', '10000', '10000', '1', '19-03-2023', '21:27:08', NULL, '0', '0'),
(1890, 2, 6, 588, 56, 'Mi nyemek', '15000', '15000', '1', '19-03-2023', '21:27:41', NULL, '0', '0'),
(1891, 2, 6, 588, 58, 'Mi goreng soto', '6000', '6000', '1', '19-03-2023', '21:27:41', NULL, '0', '0'),
(1892, 2, 6, 589, 85, 'Mangga', '10000', '10000', '1', '20-03-2023', '19:08:34', NULL, '0', '0'),
(1893, 2, 6, 589, 87, 'Taro', '10000', '10000', '1', '20-03-2023', '19:08:34', NULL, '0', '0'),
(1894, 2, 6, 590, 88, 'Matcha', '10000', '10000', '1', '20-03-2023', '19:13:51', NULL, '0', '0'),
(1895, 2, 6, 590, 73, 'Melon squash', '12000', '12000', '1', '20-03-2023', '19:13:51', NULL, '0', '0'),
(1896, 2, 6, 590, 17, 'Kentang', '10000', '10000', '1', '20-03-2023', '19:13:51', NULL, '0', '0'),
(1901, 2, 6, 592, 129, 'Ayam geprek', '13000', '13000', '1', '20-03-2023', '19:17:08', NULL, '0', '0'),
(1902, 2, 6, 593, 98, 'Kopi hitam', '5000', '5000', '1', '20-03-2023', '19:17:59', NULL, '0', '0'),
(1903, 2, 6, 593, 89, 'Chocho malt', '10000', '10000', '1', '20-03-2023', '19:17:59', NULL, '0', '0'),
(1904, 2, 6, 594, 131, 'Alpukat', '10000', '10000', '1', '20-03-2023', '19:18:46', NULL, '0', '0'),
(1905, 2, 6, 595, 60, 'Nasi goreng ori', '10000', '10000', '1', '21-03-2023', '16:53:02', NULL, '0', '0'),
(1906, 2, 6, 595, 102, 'Le mineral', '2500', '2500', '1', '21-03-2023', '16:53:02', NULL, '0', '0'),
(1907, 2, 6, 596, 131, 'Alpukat', '10000', '40000', '4', '21-03-2023', '16:53:59', NULL, '0', '0'),
(1909, 2, 6, 596, 53, 'Mi goreng telur ', '13000', '13000', '1', '21-03-2023', '16:53:59', NULL, '0', '0'),
(1910, 2, 6, 596, 129, 'Ayam geprek', '13000', '13000', '1', '21-03-2023', '16:53:59', NULL, '0', '0'),
(1911, 2, 6, 596, 68, 'Lalapan ayam potong', '18000', '18000', '1', '21-03-2023', '16:53:59', NULL, '0', '0'),
(1912, 2, 6, 596, 64, 'Lalapan 3T', '10000', '10000', '1', '21-03-2023', '16:53:59', NULL, '0', '0'),
(1913, 2, 6, 596, 135, 'Jus jambu', '8000', '8000', '1', '21-03-2023', '16:54:52', NULL, '0', '0'),
(1914, 2, 6, 596, 157, 'Jus melon', '8000', '8000', '1', '21-03-2023', '17:04:01', NULL, '0', '0'),
(1915, 2, 6, 596, 158, 'Nasi teluyam', '12000', '12000', '1', '21-03-2023', '17:25:31', NULL, '0', '0'),
(1916, 2, 6, 596, 138, 'Nasi', '4000', '4000', '1', '21-03-2023', '17:28:05', NULL, '0', '0'),
(1918, 2, 6, 597, 69, 'Mega mendung', '12000', '12000', '1', '21-03-2023', '20:32:26', NULL, '0', '0'),
(1920, 2, 6, 597, 17, 'Kentang', '10000', '10000', '1', '21-03-2023', '20:32:26', NULL, '0', '0'),
(1921, 2, 6, 597, 158, 'Nasi teluyam', '12000', '12000', '1', '21-03-2023', '20:32:26', NULL, '0', '0'),
(1922, 2, 6, 597, 159, 'Es kopi susu', '10000', '10000', '1', '21-03-2023', '20:34:21', NULL, '0', '0'),
(1923, 2, 6, 598, 131, 'Alpukat', '10000', '20000', '2', '21-03-2023', '20:37:56', NULL, '0', '0'),
(1924, 2, 6, 598, 82, 'Es teh', '4000', '4000', '1', '21-03-2023', '20:37:56', NULL, '0', '0'),
(1925, 2, 6, 598, 69, 'Mega mendung', '12000', '12000', '1', '21-03-2023', '20:37:56', NULL, '0', '0'),
(1926, 2, 6, 598, 70, 'Soda gembira', '12000', '12000', '1', '21-03-2023', '20:37:56', NULL, '0', '0'),
(1927, 2, 6, 598, 13, 'Roti maryam keju', '12000', '12000', '1', '21-03-2023', '20:37:56', NULL, '0', '0'),
(1928, 2, 6, 598, 17, 'Kentang', '10000', '30000', '3', '21-03-2023', '20:37:56', NULL, '0', '0'),
(1930, 2, 6, 598, 160, 'Sosis tempura', '13000', '26000', '2', '21-03-2023', '20:40:13', NULL, '0', '0'),
(1931, 2, 6, 598, 119, 'Milo', '10000', '10000', '1', '21-03-2023', '20:56:24', NULL, '0', '0'),
(1932, 2, 6, 599, 84, 'Dark chocholate', '10000', '10000', '1', '21-03-2023', '21:43:30', NULL, '0', '0'),
(1934, 2, 6, 598, 102, 'Le mineral', '2500', '2500', '1', '21-03-2023', '21:52:12', NULL, '0', '0'),
(1935, 2, 6, 600, 131, 'Alpukat', '10000', '20000', '2', '22-03-2023', '18:01:11', NULL, '0', '0'),
(1936, 2, 6, 601, 99, 'Kopi robusta', '7000', '7000', '1', '22-03-2023', '18:01:47', NULL, '0', '0'),
(1937, 2, 6, 601, 85, 'Mangga', '10000', '10000', '1', '22-03-2023', '18:01:47', NULL, '0', '0'),
(1938, 2, 6, 601, 80, 'Lemon tea', '10000', '10000', '1', '22-03-2023', '18:01:47', NULL, '0', '0'),
(1939, 2, 6, 602, 129, 'Ayam geprek', '13000', '91000', '7', '22-03-2023', '18:02:17', NULL, '0', '0'),
(1940, 2, 6, 603, 162, 'Paket teluyam', '13000', '13000', '1', '25-03-2023', '17:46:13', NULL, '0', '0'),
(1941, 2, 6, 603, 163, 'Paket ayam geprek', '14000', '14000', '1', '25-03-2023', '17:46:13', NULL, '0', '0'),
(1942, 2, 6, 604, 60, 'Nasi goreng ori', '10000', '10000', '1', '25-03-2023', '17:46:44', NULL, '0', '0'),
(1943, 2, 6, 604, 82, 'Es teh', '4000', '4000', '1', '25-03-2023', '17:46:44', NULL, '0', '0'),
(1944, 2, 6, 605, 60, 'Nasi goreng ori', '10000', '10000', '1', '25-03-2023', '22:29:21', NULL, '0', '0'),
(1945, 2, 6, 605, 82, 'Es teh', '4000', '4000', '1', '25-03-2023', '22:29:21', NULL, '0', '0'),
(1946, 2, 6, 606, 100, 'Wedang jahe', '7000', '7000', '1', '25-03-2023', '22:30:50', NULL, '0', '0'),
(1947, 2, 6, 606, 98, 'Kopi hitam', '5000', '10000', '2', '25-03-2023', '22:30:50', NULL, '0', '0'),
(1948, 2, 6, 606, 17, 'Kentang', '10000', '20000', '2', '25-03-2023', '22:30:50', NULL, '0', '0'),
(1949, 2, 6, 606, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '25-03-2023', '22:30:50', NULL, '0', '0'),
(1950, 2, 6, 607, 163, 'Paket ayam geprek', '14000', '14000', '1', '26-03-2023', '18:12:34', NULL, '0', '0'),
(1951, 2, 6, 608, 162, 'Paket teluyam', '13000', '13000', '1', '26-03-2023', '18:12:57', NULL, '0', '0'),
(1952, 2, 6, 609, 41, 'Ceker', '2000', '2000', '1', '26-03-2023', '22:22:29', NULL, '0', '0'),
(1953, 2, 6, 609, 48, 'Telur puyuh', '2000', '2000', '1', '26-03-2023', '22:22:29', NULL, '0', '0'),
(1954, 2, 6, 610, 98, 'Kopi hitam', '5000', '15000', '3', '26-03-2023', '22:22:59', NULL, '0', '0'),
(1955, 2, 6, 611, 78, 'Milk shake oreo', '15000', '15000', '1', '27-03-2023', '21:01:41', NULL, '0', '0'),
(1956, 2, 6, 611, 145, 'Bebek rica rica', '28000', '28000', '1', '27-03-2023', '21:01:41', NULL, '0', '0'),
(1957, 2, 6, 611, 164, 'Iga bakar', '28000', '28000', '1', '27-03-2023', '21:03:03', NULL, '0', '0'),
(1958, 2, 6, 612, 163, 'Paket ayam geprek', '14000', '14000', '1', '27-03-2023', '21:09:15', NULL, '0', '0'),
(1961, 2, 6, 614, 83, 'Es jeruk', '6000', '18000', '3', '27-03-2023', '21:10:25', NULL, '0', '0'),
(1962, 2, 6, 614, 98, 'Kopi hitam', '5000', '5000', '1', '27-03-2023', '21:10:25', NULL, '0', '0'),
(1963, 2, 6, 614, 130, 'KSTG', '7000', '7000', '1', '27-03-2023', '21:58:24', NULL, '0', '0'),
(1964, 2, 6, 614, 119, 'Milo', '10000', '10000', '1', '27-03-2023', '21:58:24', NULL, '0', '0'),
(1965, 2, 6, 614, 11, 'Roti maryam original ', '8000', '16000', '2', '27-03-2023', '23:09:25', NULL, '0', '0'),
(1966, 2, 6, 614, 13, 'Roti maryam keju', '12000', '12000', '1', '27-03-2023', '23:09:25', NULL, '0', '0'),
(1967, 2, 6, 614, 47, 'Sayap', '5000', '15000', '3', '27-03-2023', '23:11:34', NULL, '0', '0'),
(1968, 2, 6, 614, 41, 'Ceker', '2000', '6000', '3', '27-03-2023', '23:11:34', NULL, '0', '0'),
(1969, 2, 6, 614, 40, 'Usus', '2000', '16000', '8', '27-03-2023', '23:11:34', NULL, '0', '0'),
(1971, 2, 6, 614, 48, 'Telur puyuh', '3000', '36000', '12', '27-03-2023', '23:14:29', NULL, '0', '0'),
(1972, 2, 6, 614, 138, 'Nasi', '5000', '30000', '6', '27-03-2023', '23:16:10', NULL, '0', '0'),
(1973, 2, 6, 614, 102, 'Le mineral', '2500', '12500', '5', '27-03-2023', '23:16:10', NULL, '0', '0'),
(1974, 2, 6, 615, 83, 'Es jeruk', '6000', '6000', '1', '27-03-2023', '23:31:43', NULL, '0', '0'),
(1975, 2, 6, 615, 99, 'Kopi robusta', '7000', '7000', '1', '27-03-2023', '23:31:43', NULL, '0', '0'),
(1976, 2, 6, 615, 98, 'Kopi hitam', '5000', '10000', '2', '27-03-2023', '23:31:43', NULL, '0', '0'),
(1977, 2, 6, 615, 93, 'Hot chochalate', '13000', '13000', '1', '27-03-2023', '23:31:43', NULL, '0', '0'),
(1978, 2, 6, 615, 17, 'Kentang', '10000', '10000', '1', '27-03-2023', '23:31:43', NULL, '0', '0'),
(1979, 2, 6, 616, 118, 'Alpukat Milo', '12000', '12000', '1', '27-03-2023', '23:32:33', NULL, '0', '0'),
(1980, 2, 6, 617, 163, 'Paket ayam geprek', '14000', '14000', '1', '28-03-2023', '21:20:07', NULL, '0', '0'),
(1981, 2, 6, 618, 162, 'Paket teluyam', '13000', '13000', '1', '28-03-2023', '21:20:43', NULL, '0', '0'),
(1982, 2, 6, 618, 163, 'Paket ayam geprek', '14000', '14000', '1', '28-03-2023', '21:20:43', NULL, '0', '0'),
(1983, 2, 6, 619, 60, 'Nasi goreng ori', '10000', '10000', '1', '28-03-2023', '21:21:04', NULL, '0', '0'),
(1988, 2, 6, 621, 82, 'Es teh', '4000', '16000', '4', '29-03-2023', '21:26:18', NULL, '0', '0'),
(1989, 2, 6, 621, 49, 'Nasi ayam suwir', '5000', '10000', '2', '29-03-2023', '21:26:18', NULL, '0', '0'),
(1990, 2, 6, 621, 51, 'Nasi bakar teri', '5000', '10000', '2', '29-03-2023', '21:26:18', NULL, '0', '0'),
(1991, 2, 6, 621, 102, 'Le mineral', '2500', '5000', '2', '29-03-2023', '21:26:18', NULL, '0', '0'),
(1992, 2, 6, 622, 163, 'Paket ayam geprek', '14000', '28000', '2', '29-03-2023', '22:07:24', NULL, '0', '0'),
(1993, 2, 6, 623, 75, 'Milk shake chocolate', '15000', '30000', '2', '29-03-2023', '22:09:01', NULL, '0', '0'),
(1994, 2, 6, 624, 87, 'Taro', '10000', '10000', '1', '29-03-2023', '22:14:44', NULL, '0', '0'),
(1995, 2, 6, 625, 162, 'Paket teluyam', '13000', '13000', '1', '02-04-2023', '17:39:53', NULL, '0', '0'),
(1996, 2, 6, 625, 163, 'Paket ayam geprek', '14000', '14000', '1', '02-04-2023', '17:39:53', NULL, '0', '0'),
(1997, 2, 6, 625, 79, 'Thaitea', '10000', '10000', '1', '02-04-2023', '17:39:53', NULL, '0', '0'),
(2009, 2, 6, 629, 98, 'Kopi hitam', '5000', '10000', '2', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2010, 2, 6, 629, 140, 'Ayam lodo', '25000', '25000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2011, 2, 6, 629, 158, 'Nasi teluyam', '12000', '12000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2012, 2, 6, 629, 131, 'Alpukat', '10000', '10000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2013, 2, 6, 629, 70, 'Soda gembira', '12000', '12000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2014, 2, 6, 629, 138, 'Nasi', '5000', '5000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2015, 2, 6, 629, 165, 'Josua', '7000', '7000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2016, 2, 6, 629, 17, 'Kentang', '10000', '10000', '1', '04-04-2023', '21:41:30', NULL, '0', '0'),
(2017, 2, 6, 630, 84, 'Dark chocholate', '10000', '20000', '2', '04-04-2023', '21:42:39', NULL, '0', '0'),
(2018, 2, 6, 630, 88, 'Matcha', '10000', '10000', '1', '04-04-2023', '21:42:39', NULL, '0', '0'),
(2019, 2, 6, 630, 99, 'Kopi robusta', '7000', '7000', '1', '04-04-2023', '21:42:39', NULL, '0', '0'),
(2020, 2, 6, 630, 57, 'Mi goreng indomie', '6000', '6000', '1', '04-04-2023', '21:42:39', NULL, '0', '0'),
(2021, 2, 6, 630, 17, 'Kentang', '10000', '10000', '1', '04-04-2023', '21:42:39', NULL, '0', '0'),
(2022, 2, 6, 631, 61, 'Nasi goreng telur', '13000', '26000', '2', '05-04-2023', '22:30:56', NULL, '0', '0'),
(2023, 2, 6, 631, 82, 'Es teh', '4000', '4000', '1', '05-04-2023', '22:30:56', NULL, '0', '0'),
(2024, 2, 6, 631, 17, 'Kentang', '10000', '10000', '1', '05-04-2023', '22:30:56', NULL, '0', '0'),
(2025, 2, 6, 631, 165, 'Josua', '7000', '7000', '1', '05-04-2023', '22:30:56', NULL, '0', '0'),
(2026, 2, 6, 632, 77, 'Milk shake strawberry', '15000', '15000', '1', '05-04-2023', '22:32:00', NULL, '0', '0'),
(2027, 2, 6, 632, 19, 'Tahu crispy', '12000', '12000', '1', '05-04-2023', '22:32:00', NULL, '0', '0'),
(2028, 2, 6, 632, 40, 'Usus', '2000', '2000', '1', '05-04-2023', '22:32:00', NULL, '0', '0'),
(2029, 2, 6, 632, 80, 'Lemon tea', '10000', '10000', '1', '05-04-2023', '22:32:00', NULL, '0', '0'),
(2030, 2, 6, 632, 51, 'Nasi bakar teri', '5000', '5000', '1', '05-04-2023', '22:32:00', NULL, '0', '0'),
(2031, 2, 6, 633, 98, 'Kopi hitam', '5000', '5000', '1', '06-04-2023', '21:33:15', NULL, '0', '0'),
(2032, 2, 6, 633, 99, 'Kopi robusta', '7000', '14000', '2', '06-04-2023', '21:33:15', NULL, '0', '0'),
(2033, 2, 6, 633, 82, 'Es teh', '4000', '4000', '1', '06-04-2023', '21:33:15', NULL, '0', '0'),
(2034, 2, 6, 634, 165, 'Josua', '7000', '28000', '4', '06-04-2023', '21:34:06', NULL, '0', '0'),
(2035, 2, 6, 634, 98, 'Kopi hitam', '5000', '5000', '1', '06-04-2023', '21:34:06', NULL, '0', '0'),
(2036, 2, 6, 635, 162, 'Paket teluyam', '13000', '13000', '1', '07-04-2023', '22:18:31', NULL, '0', '0'),
(2037, 2, 6, 635, 163, 'Paket ayam geprek', '14000', '56000', '4', '07-04-2023', '22:18:31', NULL, '0', '0'),
(2038, 2, 6, 635, 67, 'Ayam laos', '25000', '25000', '1', '07-04-2023', '22:18:31', NULL, '0', '0'),
(2039, 2, 6, 635, 140, 'Ayam lodo', '25000', '25000', '1', '07-04-2023', '22:18:31', NULL, '0', '0'),
(2040, 2, 6, 635, 131, 'Alpukat', '10000', '20000', '2', '07-04-2023', '22:18:31', NULL, '0', '0'),
(2041, 2, 6, 636, 99, 'Kopi robusta', '7000', '7000', '1', '07-04-2023', '22:19:58', NULL, '0', '0'),
(2042, 2, 6, 636, 17, 'Kentang', '10000', '10000', '1', '07-04-2023', '22:19:58', NULL, '0', '0'),
(2043, 2, 6, 636, 94, 'Hot capucino', '10000', '10000', '1', '07-04-2023', '22:19:58', NULL, '0', '0'),
(2044, 2, 6, 636, 158, 'Nasi teluyam', '12000', '12000', '1', '07-04-2023', '22:19:58', NULL, '0', '0'),
(2045, 2, 6, 637, 79, 'Thaitea', '10000', '10000', '1', '07-04-2023', '22:20:43', NULL, '0', '0'),
(2046, 2, 6, 637, 98, 'Kopi hitam', '5000', '5000', '1', '07-04-2023', '22:20:43', NULL, '0', '0'),
(2047, 2, 6, 637, 103, 'Es susu', '8000', '8000', '1', '07-04-2023', '22:20:43', NULL, '0', '0'),
(2048, 2, 6, 637, 17, 'Kentang', '10000', '10000', '1', '07-04-2023', '22:20:43', NULL, '0', '0'),
(2049, 2, 6, 637, 91, 'Teh panas', '4000', '4000', '1', '07-04-2023', '22:20:43', NULL, '0', '0'),
(2050, 2, 6, 638, 165, 'Josua', '7000', '7000', '1', '07-04-2023', '22:21:24', NULL, '0', '0'),
(2051, 2, 6, 639, 163, 'Paket ayam geprek', '14000', '28000', '2', '08-04-2023', '22:15:48', NULL, '0', '0'),
(2052, 2, 6, 639, 80, 'Lemon tea', '10000', '10000', '1', '08-04-2023', '22:15:48', NULL, '0', '0'),
(2053, 2, 6, 639, 17, 'Kentang', '10000', '10000', '1', '08-04-2023', '22:15:48', NULL, '0', '0'),
(2054, 2, 6, 639, 20, 'Tahu walik', '15000', '15000', '1', '08-04-2023', '22:15:48', NULL, '0', '0'),
(2055, 2, 6, 639, 61, 'Nasi goreng telur', '13000', '13000', '1', '08-04-2023', '22:15:48', NULL, '0', '0'),
(2056, 2, 6, 640, 57, 'Mi goreng indomie', '6000', '6000', '1', '08-04-2023', '22:16:52', NULL, '0', '0'),
(2057, 2, 6, 640, 61, 'Nasi goreng telur', '13000', '26000', '2', '08-04-2023', '22:16:52', NULL, '0', '0'),
(2058, 2, 6, 640, 83, 'Es jeruk', '6000', '6000', '1', '08-04-2023', '22:16:52', NULL, '0', '0'),
(2059, 2, 6, 640, 87, 'Taro', '10000', '10000', '1', '08-04-2023', '22:16:52', NULL, '0', '0'),
(2060, 2, 6, 641, 162, 'Paket teluyam', '13000', '26000', '2', '08-04-2023', '22:17:18', NULL, '0', '0'),
(2061, 2, 6, 642, 65, 'Lalapan lele', '15000', '15000', '1', '08-04-2023', '22:18:02', NULL, '0', '0'),
(2062, 2, 6, 642, 61, 'Nasi goreng telur', '13000', '13000', '1', '08-04-2023', '22:18:02', NULL, '0', '0'),
(2063, 2, 6, 642, 87, 'Taro', '10000', '20000', '2', '08-04-2023', '22:18:02', NULL, '0', '0'),
(2064, 2, 6, 643, 68, 'Lalapan ayam potong', '18000', '36000', '2', '10-04-2023', '22:20:43', NULL, '0', '0'),
(2065, 2, 6, 643, 82, 'Es teh', '4000', '8000', '2', '10-04-2023', '22:20:43', NULL, '0', '0'),
(2066, 2, 6, 644, 130, 'KSTG', '7000', '7000', '1', '10-04-2023', '22:21:05', NULL, '0', '0'),
(2067, 2, 6, 644, 20, 'Tahu walik', '15000', '15000', '1', '10-04-2023', '22:21:05', NULL, '0', '0'),
(2068, 2, 6, 645, 98, 'Kopi hitam', '5000', '5000', '1', '10-04-2023', '22:21:29', NULL, '0', '0'),
(2069, 2, 6, 645, 130, 'KSTG', '7000', '7000', '1', '10-04-2023', '22:21:29', NULL, '0', '0'),
(2070, 2, 6, 646, 131, 'Alpukat', '10000', '10000', '1', '10-04-2023', '22:22:05', NULL, '0', '0'),
(2071, 2, 6, 646, 57, 'Mi goreng indomie', '6000', '6000', '1', '10-04-2023', '22:22:05', NULL, '0', '0'),
(2072, 2, 6, 647, 129, 'Ayam geprek', '13000', '26000', '2', '11-04-2023', '21:40:03', NULL, '0', '0'),
(2073, 2, 6, 647, 82, 'Es teh', '4000', '4000', '1', '11-04-2023', '21:40:03', NULL, '0', '0'),
(2075, 2, 6, 649, 162, 'Paket teluyam', '13000', '26000', '2', '11-04-2023', '21:42:15', NULL, '0', '0'),
(2076, 2, 6, 649, 11, 'Roti maryam original ', '8000', '8000', '1', '11-04-2023', '21:42:15', NULL, '0', '0'),
(2077, 2, 6, 650, 71, 'Lemon squash', '12000', '12000', '1', '11-04-2023', '21:44:24', NULL, '0', '0'),
(2078, 2, 6, 650, 118, 'Alpukat Milo', '12000', '12000', '1', '11-04-2023', '21:44:24', NULL, '0', '0'),
(2079, 2, 6, 650, 162, 'Paket teluyam', '13000', '26000', '2', '11-04-2023', '21:44:24', NULL, '0', '0'),
(2080, 2, 6, 651, 162, 'Paket teluyam', '13000', '52000', '4', '12-04-2023', '21:22:07', NULL, '0', '0'),
(2081, 2, 6, 651, 163, 'Paket ayam geprek', '14000', '14000', '1', '12-04-2023', '21:22:07', NULL, '0', '0'),
(2082, 2, 6, 652, 88, 'Matcha', '10000', '20000', '2', '12-04-2023', '21:24:10', NULL, '0', '0'),
(2083, 2, 6, 652, 87, 'Taro', '10000', '10000', '1', '12-04-2023', '21:24:10', NULL, '0', '0'),
(2084, 2, 6, 652, 84, 'Dark chocholate', '10000', '30000', '3', '12-04-2023', '21:24:10', NULL, '0', '0'),
(2085, 2, 6, 652, 60, 'Nasi goreng ori', '10000', '10000', '1', '12-04-2023', '21:24:10', NULL, '0', '0'),
(2086, 2, 6, 652, 61, 'Nasi goreng telur', '13000', '26000', '2', '12-04-2023', '21:24:10', NULL, '0', '0'),
(2087, 2, 6, 652, 129, 'Ayam geprek', '13000', '39000', '3', '12-04-2023', '21:24:10', NULL, '0', '0'),
(2088, 2, 6, 653, 70, 'Soda gembira', '12000', '12000', '1', '12-04-2023', '21:25:24', NULL, '0', '0'),
(2089, 2, 6, 653, 17, 'Kentang', '10000', '20000', '2', '12-04-2023', '21:25:24', NULL, '0', '0'),
(2090, 2, 6, 653, 72, 'Leci squash', '12000', '12000', '1', '12-04-2023', '21:25:24', NULL, '0', '0'),
(2091, 2, 6, 653, 157, 'Jus melon', '8000', '8000', '1', '12-04-2023', '21:25:24', NULL, '0', '0'),
(2092, 2, 6, 653, 69, 'Mega mendung', '12000', '12000', '1', '12-04-2023', '21:25:24', NULL, '0', '0'),
(2093, 2, 6, 654, 70, 'Soda gembira', '12000', '24000', '2', '13-04-2023', '21:39:09', NULL, '0', '0'),
(2094, 2, 6, 655, 65, 'Lalapan lele', '15000', '30000', '2', '13-04-2023', '21:41:05', NULL, '0', '0'),
(2095, 2, 6, 655, 130, 'KSTG', '7000', '7000', '1', '13-04-2023', '21:41:05', NULL, '0', '0'),
(2096, 2, 6, 655, 70, 'Soda gembira', '12000', '12000', '1', '13-04-2023', '21:41:05', NULL, '0', '0'),
(2097, 2, 6, 655, 68, 'Lalapan ayam potong', '18000', '54000', '3', '13-04-2023', '21:41:05', NULL, '0', '0'),
(2098, 2, 6, 655, 103, 'Es susu', '8000', '8000', '1', '13-04-2023', '21:41:05', NULL, '0', '0'),
(2099, 2, 6, 655, 138, 'Nasi', '5000', '15000', '3', '13-04-2023', '21:41:05', NULL, '0', '0'),
(2100, 2, 6, 656, 158, 'Nasi teluyam', '12000', '12000', '1', '13-04-2023', '21:42:10', NULL, '0', '0'),
(2101, 2, 6, 656, 130, 'KSTG', '7000', '7000', '1', '13-04-2023', '21:42:10', NULL, '0', '0'),
(2102, 2, 6, 656, 131, 'Alpukat', '10000', '10000', '1', '13-04-2023', '21:42:10', NULL, '0', '0'),
(2103, 2, 6, 657, 162, 'Paket teluyam', '13000', '39000', '3', '13-04-2023', '21:43:08', NULL, '0', '0'),
(2104, 2, 6, 657, 163, 'Paket ayam geprek', '14000', '28000', '2', '13-04-2023', '21:43:08', NULL, '0', '0'),
(2105, 2, 6, 657, 17, 'Kentang', '10000', '10000', '1', '13-04-2023', '21:43:08', NULL, '0', '0'),
(2106, 2, 6, 657, 19, 'Tahu crispy', '12000', '12000', '1', '13-04-2023', '21:43:08', NULL, '0', '0'),
(2107, 2, 6, 657, 52, 'Mi goreng ori', '10000', '10000', '1', '13-04-2023', '21:43:08', NULL, '0', '0'),
(2108, 2, 6, 658, 64, 'Lalapan 3T', '10000', '20000', '2', '14-04-2023', '20:27:32', NULL, '0', '0'),
(2109, 2, 6, 658, 103, 'Es susu', '8000', '16000', '2', '14-04-2023', '20:27:32', NULL, '0', '0'),
(2110, 2, 6, 658, 138, 'Nasi', '5000', '5000', '1', '14-04-2023', '20:27:32', NULL, '0', '0'),
(2111, 2, 6, 659, 60, 'Nasi goreng ori', '10000', '10000', '1', '14-04-2023', '20:29:08', NULL, '0', '0'),
(2112, 2, 6, 659, 61, 'Nasi goreng telur', '13000', '13000', '1', '14-04-2023', '20:29:08', NULL, '0', '0'),
(2113, 2, 6, 659, 165, 'Josua', '7000', '7000', '1', '14-04-2023', '20:29:08', NULL, '0', '0'),
(2114, 2, 6, 659, 131, 'Alpukat', '10000', '10000', '1', '14-04-2023', '20:29:08', NULL, '0', '0'),
(2115, 2, 6, 660, 163, 'Paket ayam geprek', '14000', '112000', '8', '14-04-2023', '20:30:30', NULL, '0', '0'),
(2116, 2, 6, 660, 138, 'Nasi', '5000', '5000', '1', '14-04-2023', '20:30:30', NULL, '0', '0'),
(2117, 2, 6, 661, 130, 'KSTG', '7000', '7000', '1', '14-04-2023', '20:31:11', NULL, '0', '0'),
(2118, 2, 6, 661, 19, 'Tahu crispy', '12000', '12000', '1', '14-04-2023', '20:31:11', NULL, '0', '0'),
(2119, 2, 6, 662, 143, 'Sop iga', '30000', '30000', '1', '14-04-2023', '20:33:16', NULL, '0', '0'),
(2120, 2, 6, 662, 131, 'Alpukat', '10000', '10000', '1', '14-04-2023', '20:33:16', NULL, '0', '0'),
(2121, 2, 6, 662, 80, 'Lemon tea', '10000', '10000', '1', '14-04-2023', '20:33:16', NULL, '0', '0'),
(2122, 2, 6, 662, 68, 'Lalapan ayam potong', '18000', '18000', '1', '14-04-2023', '20:33:16', NULL, '0', '0'),
(2123, 2, 6, 663, 162, 'Paket teluyam', '13000', '13000', '1', '14-04-2023', '20:34:15', NULL, '0', '0'),
(2124, 2, 6, 663, 52, 'Mi goreng ori', '10000', '10000', '1', '14-04-2023', '20:34:15', NULL, '0', '0'),
(2125, 2, 6, 663, 165, 'Josua', '7000', '7000', '1', '14-04-2023', '20:34:15', NULL, '0', '0'),
(2126, 2, 6, 663, 94, 'Hot capucino', '10000', '10000', '1', '14-04-2023', '20:34:15', NULL, '0', '0'),
(2127, 2, 6, 663, 79, 'Thaitea', '10000', '10000', '1', '14-04-2023', '20:34:15', NULL, '0', '0'),
(2128, 2, 6, 664, 98, 'Kopi hitam', '5000', '10000', '2', '14-04-2023', '20:34:47', NULL, '0', '0'),
(2129, 2, 6, 665, 158, 'Nasi teluyam', '12000', '24000', '2', '20-04-2023', '18:39:20', NULL, '0', '0'),
(2130, 2, 6, 665, 91, 'Teh panas', '4000', '8000', '2', '20-04-2023', '18:39:20', NULL, '0', '0'),
(2131, 2, 6, 665, 140, 'Ayam lodo', '25000', '25000', '1', '20-04-2023', '18:39:20', NULL, '0', '0'),
(2132, 2, 6, 665, 94, 'Hot capucino', '10000', '10000', '1', '20-04-2023', '18:39:20', NULL, '0', '0'),
(2133, 2, 6, 666, 75, 'Milk shake chocolate', '15000', '15000', '1', '20-04-2023', '18:40:42', NULL, '0', '0'),
(2134, 2, 6, 666, 79, 'Thaitea', '10000', '10000', '1', '20-04-2023', '18:40:42', NULL, '0', '0'),
(2135, 2, 6, 667, 82, 'Es teh', '4000', '4000', '1', '20-04-2023', '22:10:11', NULL, '0', '0'),
(2136, 2, 6, 667, 83, 'Es jeruk', '6000', '6000', '1', '20-04-2023', '22:10:11', NULL, '0', '0'),
(2137, 2, 6, 667, 60, 'Nasi goreng ori', '10000', '10000', '1', '20-04-2023', '22:10:11', NULL, '0', '0'),
(2138, 2, 6, 667, 144, 'Bebek goreng', '25000', '25000', '1', '20-04-2023', '22:10:11', NULL, '0', '0'),
(2139, 2, 6, 667, 58, 'Mi goreng soto', '6000', '6000', '1', '20-04-2023', '22:10:11', NULL, '0', '0'),
(2140, 2, 6, 668, 94, 'Hot capucino', '10000', '10000', '1', '20-04-2023', '22:11:25', NULL, '0', '0'),
(2141, 2, 6, 668, 88, 'Matcha', '10000', '10000', '1', '20-04-2023', '22:11:25', NULL, '0', '0'),
(2142, 2, 6, 668, 17, 'Kentang', '10000', '10000', '1', '20-04-2023', '22:11:25', NULL, '0', '0'),
(2143, 2, 6, 668, 19, 'Tahu crispy', '12000', '12000', '1', '20-04-2023', '22:11:25', NULL, '0', '0'),
(2144, 2, 6, 669, 98, 'Kopi hitam', '5000', '15000', '3', '20-04-2023', '22:12:00', NULL, '0', '0'),
(2145, 2, 6, 670, 115, 'Es white coffe', '10000', '10000', '1', '20-04-2023', '22:13:27', NULL, '10000', '10000'),
(2146, 2, 6, 670, 99, 'Kopi robusta', '7000', '7000', '1', '20-04-2023', '22:13:27', NULL, '0', '0'),
(2147, 2, 6, 670, 135, 'Jus jambu', '8000', '8000', '1', '20-04-2023', '22:13:27', NULL, '0', '0'),
(2148, 2, 6, 670, 58, 'Mi goreng soto', '6000', '6000', '1', '20-04-2023', '22:13:27', NULL, '0', '0'),
(2149, 2, 6, 671, 64, 'Lalapan 3T', '10000', '20000', '2', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2150, 2, 6, 671, 158, 'Nasi teluyam', '12000', '12000', '1', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2151, 2, 6, 671, 36, 'Omlet', '12000', '12000', '1', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2152, 2, 6, 671, 98, 'Kopi hitam', '5000', '5000', '1', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2153, 2, 6, 671, 84, 'Dark chocholate', '10000', '10000', '1', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2154, 2, 6, 671, 83, 'Es jeruk', '6000', '6000', '1', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2155, 2, 6, 671, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '30-04-2023', '17:29:17', NULL, '0', '0'),
(2156, 2, 6, 672, 129, 'Ayam geprek', '13000', '52000', '4', '30-04-2023', '17:30:48', NULL, '0', '0'),
(2157, 2, 6, 672, 88, 'Matcha', '10000', '10000', '1', '30-04-2023', '17:30:48', NULL, '0', '0'),
(2158, 2, 6, 672, 94, 'Hot capucino', '10000', '10000', '1', '30-04-2023', '17:30:48', NULL, '0', '0'),
(2159, 2, 6, 672, 103, 'Es susu', '8000', '8000', '1', '30-04-2023', '17:30:48', NULL, '0', '0'),
(2160, 2, 6, 673, 96, 'Hot beng beng', '10000', '10000', '1', '30-04-2023', '20:59:55', NULL, '0', '0'),
(2161, 2, 6, 673, 119, 'Milo', '10000', '10000', '1', '30-04-2023', '20:59:55', NULL, '0', '0'),
(2162, 2, 6, 674, 158, 'Nasi teluyam', '12000', '12000', '1', '30-04-2023', '21:00:19', NULL, '0', '0'),
(2168, 2, 6, 676, 65, 'Lalapan lele', '15000', '15000', '1', '01-05-2023', '21:12:32', NULL, '0', '0'),
(2169, 2, 6, 676, 64, 'Lalapan 3T', '10000', '10000', '1', '01-05-2023', '21:12:32', NULL, '0', '0'),
(2170, 2, 6, 676, 82, 'Es teh', '4000', '4000', '1', '01-05-2023', '21:12:32', NULL, '0', '0'),
(2175, 2, 6, 678, 61, 'Nasi goreng telur', '13000', '13000', '1', '01-05-2023', '21:32:48', NULL, '0', '0'),
(2176, 2, 6, 678, 129, 'Ayam geprek', '13000', '13000', '1', '01-05-2023', '21:32:48', NULL, '0', '0'),
(2177, 2, 6, 678, 82, 'Es teh', '4000', '8000', '2', '01-05-2023', '21:32:48', NULL, '0', '0'),
(2178, 2, 6, 679, 129, 'Ayam geprek', '13000', '13000', '1', '03-05-2023', '19:46:38', NULL, '0', '0'),
(2179, 2, 6, 679, 82, 'Es teh', '4000', '4000', '1', '03-05-2023', '19:46:38', NULL, '0', '0'),
(2180, 2, 6, 680, 84, 'Dark chocholate', '10000', '10000', '1', '03-05-2023', '19:47:12', NULL, '0', '0'),
(2181, 2, 6, 680, 72, 'Leci squash', '12000', '12000', '1', '03-05-2023', '19:47:12', NULL, '0', '0'),
(2182, 2, 6, 681, 59, 'Bakmi', '15000', '15000', '1', '03-05-2023', '21:38:07', NULL, '0', '0'),
(2183, 2, 6, 681, 135, 'Jus jambu', '8000', '8000', '1', '03-05-2023', '21:38:07', NULL, '0', '0'),
(2184, 2, 6, 681, 64, 'Lalapan 3T', '10000', '10000', '1', '03-05-2023', '21:38:07', NULL, '0', '0'),
(2185, 2, 6, 681, 82, 'Es teh', '4000', '4000', '1', '03-05-2023', '21:38:07', NULL, '0', '0'),
(2186, 2, 6, 682, 60, 'Nasi goreng ori', '10000', '10000', '1', '03-05-2023', '21:38:45', NULL, '0', '0'),
(2187, 2, 6, 682, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '03-05-2023', '21:38:45', NULL, '0', '0'),
(2188, 2, 6, 683, 70, 'Soda gembira', '12000', '12000', '1', '05-05-2023', '18:44:59', NULL, '0', '0'),
(2189, 2, 6, 683, 36, 'Omlet', '12000', '12000', '1', '05-05-2023', '18:44:59', NULL, '0', '0'),
(2190, 2, 6, 684, 64, 'Lalapan 3T', '10000', '10000', '1', '05-05-2023', '18:46:29', NULL, '0', '0'),
(2191, 2, 6, 684, 83, 'Es jeruk', '6000', '6000', '1', '05-05-2023', '18:46:29', NULL, '0', '0'),
(2192, 2, 6, 684, 102, 'Le mineral', '2500', '2500', '1', '05-05-2023', '18:46:29', NULL, '0', '0'),
(2193, 2, 6, 685, 69, 'Mega mendung', '12000', '36000', '3', '05-05-2023', '18:47:21', NULL, '0', '0'),
(2194, 2, 6, 686, 60, 'Nasi goreng ori', '10000', '10000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2195, 2, 6, 686, 105, 'Brown sugar', '10000', '10000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2196, 2, 6, 686, 61, 'Nasi goreng telur', '13000', '39000', '3', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2197, 2, 6, 686, 165, 'Josua', '7000', '21000', '3', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2198, 2, 6, 686, 53, 'Mi goreng telur ', '13000', '13000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2199, 2, 6, 686, 129, 'Ayam geprek', '13000', '13000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2200, 2, 6, 686, 119, 'Milo', '10000', '10000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2201, 2, 6, 686, 68, 'Lalapan ayam potong', '18000', '18000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2202, 2, 6, 686, 79, 'Thaitea', '10000', '10000', '1', '05-05-2023', '18:51:33', NULL, '0', '0'),
(2203, 2, 6, 687, 165, 'Josua', '7000', '7000', '1', '06-05-2023', '19:33:19', NULL, '0', '0'),
(2204, 2, 6, 688, 121, 'Coffe n cream', '12000', '24000', '2', '06-05-2023', '19:34:16', NULL, '0', '0'),
(2205, 2, 6, 688, 107, 'Kopi susu', '6000', '6000', '1', '06-05-2023', '19:34:16', NULL, '0', '0'),
(2206, 2, 6, 688, 102, 'Le mineral', '2500', '2500', '1', '06-05-2023', '19:34:16', NULL, '0', '0'),
(2207, 2, 6, 688, 158, 'Nasi teluyam', '12000', '24000', '2', '06-05-2023', '19:34:16', NULL, '0', '0'),
(2208, 2, 6, 689, 158, 'Nasi teluyam', '12000', '24000', '2', '06-05-2023', '19:34:43', NULL, '0', '0'),
(2209, 2, 6, 690, 60, 'Nasi goreng ori', '10000', '30000', '3', '06-05-2023', '19:35:28', NULL, '0', '0'),
(2210, 2, 6, 690, 82, 'Es teh', '4000', '12000', '3', '06-05-2023', '19:35:28', NULL, '0', '0'),
(2211, 2, 6, 691, 98, 'Kopi hitam', '5000', '5000', '1', '06-05-2023', '23:09:53', NULL, '0', '0'),
(2212, 2, 6, 691, 20, 'Tahu walik', '15000', '15000', '1', '06-05-2023', '23:09:53', NULL, '0', '0'),
(2213, 2, 6, 692, 158, 'Nasi teluyam', '12000', '12000', '1', '06-05-2023', '23:10:27', NULL, '0', '0'),
(2214, 2, 6, 692, 165, 'Josua', '7000', '7000', '1', '06-05-2023', '23:10:27', NULL, '0', '0'),
(2215, 2, 6, 693, 135, 'Jus jambu', '8000', '8000', '1', '06-05-2023', '23:11:22', NULL, '0', '0'),
(2216, 2, 6, 694, 98, 'Kopi hitam', '5000', '30000', '6', '10-05-2023', '12:34:21', NULL, '0', '0'),
(2217, 2, 6, 695, 60, 'Nasi goreng ori', '10000', '20000', '2', '10-05-2023', '20:17:08', NULL, '0', '0'),
(2218, 2, 6, 695, 82, 'Es teh', '4000', '8000', '2', '10-05-2023', '20:17:08', NULL, '0', '0'),
(2219, 2, 6, 695, 98, 'Kopi hitam', '5000', '5000', '1', '10-05-2023', '20:17:08', NULL, '0', '0'),
(2225, 2, 6, 697, 159, 'Es kopi susu', '10000', '10000', '1', '12-05-2023', '16:52:11', NULL, '0', '0'),
(2226, 2, 6, 697, 84, 'Dark chocholate', '10000', '10000', '1', '12-05-2023', '16:52:11', NULL, '0', '0'),
(2227, 2, 6, 697, 119, 'Milo', '10000', '10000', '1', '12-05-2023', '16:52:11', NULL, '0', '0'),
(2228, 2, 6, 697, 91, 'Teh panas', '4000', '4000', '1', '12-05-2023', '16:52:11', NULL, '0', '0'),
(2229, 2, 6, 698, 99, 'Kopi robusta', '7000', '7000', '1', '12-05-2023', '16:52:56', NULL, '0', '0'),
(2230, 2, 6, 698, 103, 'Es susu', '8000', '8000', '1', '12-05-2023', '16:52:56', NULL, '0', '0'),
(2231, 2, 6, 698, 36, 'Omlet', '12000', '12000', '1', '12-05-2023', '16:52:56', NULL, '0', '0'),
(2232, 2, 6, 699, 98, 'Kopi hitam', '5000', '15000', '3', '12-05-2023', '16:53:18', NULL, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_detail_copy1`
--

CREATE TABLE `pembayaran_detail_copy1` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `id_pembayaran` int(15) DEFAULT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga_barang` varchar(255) DEFAULT NULL,
  `total_harga_barang` varchar(255) DEFAULT NULL,
  `jumlah_beli` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `uniqcode` varchar(100) DEFAULT NULL,
  `laba` varchar(255) DEFAULT '0',
  `total_laba` varchar(255) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pembayaran_detail_copy1`
--

INSERT INTO `pembayaran_detail_copy1` (`id`, `id_user`, `id_kasir`, `id_pembayaran`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(3, 2, 2, 2, 3, 'Pizza Jumbo Ayam', '4000', '8000', '2', '11-03-2022', '14:18:59', NULL, '0', '0'),
(4, 2, 2, 3, 2, 'Pizza Jumbo Sosis', '40000', '40000', '1', '11-03-2022', '16:41:37', NULL, '0', '0'),
(5, 2, 2, 3, 12, 'Pizza Bantal Super Lumer', '85000', '85000', '1', '11-03-2022', '16:41:37', NULL, '0', '0'),
(8, 2, 2, 4, 3, 'Pizza Jumbo Ayam', '45000', '45000', '2', '13-03-2022', '21:21:04', NULL, '0', '0'),
(9, 2, 2, 4, 2, 'Pizza Jumbo Sosis', '40000', '40000', '3', '13-03-2022', '21:21:04', NULL, '0', '0'),
(10, 2, 2, 5, 6, 'Pizza Jumbo Daging', '50000', '50000', '1', '13-03-2022', '21:45:03', NULL, '0', '0'),
(11, 2, 2, 5, 4, 'Pizza Jumbo Jamur', '45000', '45000', '1', '13-03-2022', '21:45:03', NULL, '0', '0'),
(17, 2, 2, 6, 3, 'Ayam Geprek', '20000', '40000', '2', '14-03-2022', '14:05:46', NULL, '0', '0'),
(18, 2, 2, 6, 3, 'Pizza Jumbo Ayam', '45000', '225000', '5', '14-03-2022', '15:04:49', NULL, '0', '0'),
(19, 2, 2, 7, 3, 'Pizza Jumbo Ayam', '45000', '180000', '4', '14-03-2022', '15:20:16', NULL, '0', '0'),
(20, 2, 2, 7, 147, 'Ayam Geprek', '20000', '120000', '6', '14-03-2022', '15:20:16', NULL, '7000', '42000'),
(29, 2, 2, 15, 2, 'Pizza Jumbo Sosis', '40000', '200000', '5', '15-03-2022', '16:28:04', NULL, '0', '0'),
(30, 2, 2, 15, 1, 'Pizza Original Sosis', '20000', '60000', '3', '15-03-2022', '16:28:04', NULL, '0', '0'),
(31, 2, 2, 19, 3, 'Red Velvet', '14000', '14000', '2', '21-03-2022', '10:05:02', NULL, '2000', '4000'),
(33, 2, 2, 21, 3, 'Red Velvet', '14000', '14000', '2', '23-03-2022', '14:35:53', NULL, '2000', '4000'),
(34, 2, 2, 22, 3, 'Red Velvet', '14000', '28000', '2', '23-03-2022', '14:40:14', NULL, '2000', '4000'),
(36, 2, 2, 23, 2, 'Croffle', '8000', '16000', '2', '23-03-2022', '14:42:54', NULL, '3000', '6000'),
(37, 2, 2, 23, 3, 'Red Velvet', '14000', '28000', '2', '24-03-2022', '09:04:12', NULL, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_detail_hapus`
--

CREATE TABLE `pembayaran_detail_hapus` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL,
  `id_pembayaran_hapus` int(11) DEFAULT NULL,
  `id_barang` int(11) DEFAULT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga_barang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_harga_barang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_beli` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `laba` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_laba` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran_detail_hapus`
--

INSERT INTO `pembayaran_detail_hapus` (`id`, `id_user`, `id_kasir`, `id_pembayaran_hapus`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(1, 2, 5, 2, 5, 'Taro Ice', '10000', '10000', '1', '28-11-2022', '08:45:17', NULL, '2000', '2000'),
(2, 2, 5, 2, 4, 'Roti Bakar', '10000', '10000', '1', '28-11-2022', '08:45:37', NULL, '0', '0'),
(3, 2, 5, 3, 4, 'Roti Bakar', '10000', '30000', '3', '26-11-2022', '10:48:17', NULL, '2000', '12000'),
(4, 2, 5, 4, 5, 'Taro Ice', '10000', '10000', '1', '10-05-2022', '09:14:00', NULL, '2000', '2000'),
(5, 2, 6, 5, 98, 'Kopi hitam', '5000', '5000', '1', '12-12-2022', '16:39:35', NULL, '0', '0'),
(6, 2, 6, 6, 102, 'Le mineral', '2500', '2500', '1', '12-12-2022', '16:37:48', NULL, '0', '0'),
(7, 2, 6, 7, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '18:21:50', NULL, '0', '0'),
(8, 2, 6, 7, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '18:21:50', NULL, '0', '0'),
(9, 2, 6, 7, 43, 'Telur puyuh', '3000', '3000', '1', '17-12-2022', '18:21:50', NULL, '0', '0'),
(10, 2, 6, 8, 25, 'Seblak seafood', '15000', '15000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(11, 2, 6, 8, 17, 'Kentang', '10000', '10000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(12, 2, 6, 8, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(13, 2, 6, 8, 19, 'Tahu crispy', '12000', '12000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(14, 2, 6, 9, 24, 'Seblak komplit', '20000', '40000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(15, 2, 6, 9, 62, 'Nasi goreng ayam ', '13000', '26000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(16, 2, 6, 9, 72, 'Leci squash', '12000', '24000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(17, 2, 6, 9, 85, 'Mangga', '10000', '30000', '3', '23-12-2022', '12:13:23', NULL, '0', '0'),
(18, 2, 6, 9, 13, 'Roti maryam keju', '12000', '24000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(19, 2, 6, 10, 21, 'Tahu cabe garam', '15000', '15000', '1', '23-12-2022', '14:15:57', NULL, '0', '0'),
(20, 2, 6, 10, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '14:15:57', NULL, '0', '0'),
(21, 2, 6, 10, 99, 'Kopi robusta', '7000', '14000', '2', '23-12-2022', '14:15:57', NULL, '0', '0'),
(22, 2, 6, 11, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '17:19:46', NULL, '0', '0'),
(23, 2, 6, 11, 39, 'Soto ayam ', '10000', '10000', '1', '23-12-2022', '17:19:46', NULL, '0', '0'),
(24, 2, 6, 11, 46, 'Kepala', '2000', '4000', '2', '23-12-2022', '17:19:46', NULL, '0', '0'),
(25, 2, 6, 11, 11, 'Roti maryam original ', '8000', '16000', '2', '23-12-2022', '17:19:46', NULL, '0', '0'),
(26, 2, 6, 12, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '20:54:19', NULL, '0', '0'),
(27, 2, 6, 12, 100, 'Wedang jahe', '7000', '14000', '2', '23-12-2022', '20:54:19', NULL, '0', '0'),
(28, 2, 6, 12, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '23-12-2022', '20:54:19', NULL, '0', '0'),
(29, 2, 6, 12, 88, 'Matcha', '10000', '10000', '1', '23-12-2022', '20:54:19', NULL, '0', '0'),
(30, 2, 6, 12, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '23-12-2022', '21:23:05', NULL, '0', '0'),
(31, 2, 6, 13, 82, 'Es teh', '4000', '4000', '1', '24-12-2022', '21:53:07', NULL, '0', '0'),
(32, 2, 6, 13, 98, 'Kopi hitam', '5000', '5000', '1', '24-12-2022', '21:53:07', NULL, '0', '0'),
(33, 2, 6, 14, 98, 'Kopi hitam', '5000', '5000', '1', '24-12-2022', '19:50:02', NULL, '0', '0'),
(34, 2, 6, 15, 30, 'Ceker judes', '13000', '0', '', '25-12-2022', '18:25:52', NULL, '0', '0'),
(35, 2, 6, 15, 53, 'Mi goreng telur ', '13000', '13000', '1', '25-12-2022', '18:25:52', NULL, '0', '0'),
(36, 2, 6, 15, 39, 'Soto ayam ', '10000', '10000', '1', '25-12-2022', '18:25:52', NULL, '0', '0'),
(37, 2, 6, 15, 57, 'Mi goreng indomie', '6000', '12000', '2', '25-12-2022', '18:25:52', NULL, '0', '0'),
(38, 2, 6, 15, 91, 'Teh panas', '4000', '4000', '1', '25-12-2022', '18:25:52', NULL, '0', '0'),
(39, 2, 6, 15, 83, 'Es jeruk', '6000', '12000', '2', '25-12-2022', '18:25:52', NULL, '0', '0'),
(40, 2, 6, 15, 87, 'Taro', '10000', '10000', '1', '25-12-2022', '18:37:37', NULL, '0', '0'),
(41, 2, 6, 16, 99, 'Kopi robusta', '7000', '7000', '1', '27-12-2022', '12:32:16', NULL, '0', '0'),
(42, 2, 6, 16, 25, 'Seblak seafood', '15000', '15000', '1', '27-12-2022', '12:32:16', NULL, '0', '0'),
(43, 2, 6, 16, 73, 'Melon squash', '12000', '12000', '1', '27-12-2022', '12:32:16', NULL, '0', '0'),
(44, 2, 6, 16, 102, 'Le mineral', '2500', '0', '', '27-12-2022', '13:29:00', NULL, '0', '0'),
(45, 2, 6, 17, 85, 'Mangga', '10000', '30000', '3', '11-12-2022', '16:15:16', NULL, '0', '0'),
(46, 2, 6, 17, 39, 'Soto ayam ', '10000', '30000', '3', '11-12-2022', '16:15:16', NULL, '0', '0'),
(47, 2, 6, 17, 43, 'Telur puyuh', '3000', '9000', '3', '11-12-2022', '16:15:16', NULL, '0', '0'),
(48, 2, 6, 18, 102, 'Le mineral', '2500', '2500', '1', '29-12-2022', '17:45:21', NULL, '0', '0'),
(49, 2, 5, 19, 5, 'Taro Ice', '10000', '20000', '2', '29-11-2022', '16:43:03', NULL, '2000', '4000'),
(50, 2, 6, 20, 8, 'Es Americano', '10000', '20000', '2', '05-12-2022', '13:38:51', NULL, '6000', '12000'),
(51, 2, 6, 20, 5, 'Taro Ice', '10000', '10000', '1', '05-12-2022', '13:38:51', NULL, '2000', '2000'),
(52, 2, 6, 21, 92, 'Jeruk panas', '6000', '6000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(53, 2, 6, 21, 82, 'Es teh', '4000', '4000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(54, 2, 6, 21, 87, 'Taro', '10000', '10000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(55, 2, 6, 21, 105, 'Brown sugar', '10000', '10000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(56, 2, 6, 21, 70, 'Soda gembira', '12000', '12000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(57, 2, 6, 21, 109, 'Sehati snack', '10000', '10000', '1', '01-01-2023', '01:23:07', NULL, '10000', '10000'),
(58, 2, 6, 21, 102, 'Le mineral', '2500', '5000', '2', '01-01-2023', '01:23:07', NULL, '0', '0'),
(59, 2, 6, 22, 17, 'Kentang', '10000', '10000', '1', '01-01-2023', '00:29:47', NULL, '0', '0'),
(60, 2, 6, 22, 89, 'Chocho malt', '10000', '10000', '1', '01-01-2023', '00:29:47', NULL, '0', '0'),
(61, 2, 6, 23, 94, 'Hot capucino', '10000', '20000', '2', '31-12-2022', '23:41:20', NULL, '0', '0'),
(62, 2, 6, 24, 91, 'Teh panas', '4000', '4000', '1', '04-01-2023', '11:39:46', NULL, '0', '0'),
(63, 2, 6, 24, 83, 'Es jeruk', '6000', '12000', '2', '04-01-2023', '11:39:46', NULL, '0', '0'),
(64, 2, 6, 25, 129, 'Ayam geprek', '13000', '26000', '2', '07-01-2023', '18:32:04', NULL, '0', '0'),
(65, 2, 6, 26, 99, 'Kopi robusta', '7000', '0', '', '07-01-2023', '16:20:39', NULL, '0', '0'),
(66, 2, 6, 26, 70, 'Soda gembira', '12000', '12000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(67, 2, 6, 26, 83, 'Es jeruk', '6000', '6000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(68, 2, 6, 26, 39, 'Soto ayam ', '10000', '10000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(69, 2, 6, 26, 52, 'Mi goreng ori', '10000', '10000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(70, 2, 6, 26, 64, 'Lalapan 3T', '10000', '10000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(71, 2, 6, 26, 43, 'Telur puyuh', '3000', '6000', '2', '07-01-2023', '16:20:39', NULL, '0', '0'),
(72, 2, 6, 26, 98, 'Kopi hitam', '5000', '10000', '2', '07-01-2023', '16:20:39', NULL, '0', '0'),
(73, 2, 6, 27, 26, 'Seblak tulang', '12000', '12000', '1', '08-01-2023', '22:33:06', NULL, '0', '0'),
(74, 2, 6, 27, 72, 'Leci squash', '12000', '12000', '1', '08-01-2023', '22:33:06', NULL, '0', '0'),
(75, 2, 5, 28, 49, 'Nasi ayam suwir', '5000', '10000', '2', '12-01-2023', '12:15:26', NULL, '0', '0'),
(76, 2, 5, 28, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(77, 2, 5, 28, 43, 'Telur puyuh', '3000', '9000', '3', '12-01-2023', '12:15:26', NULL, '0', '0'),
(78, 2, 5, 28, 42, 'Jeroan', '2500', '2500', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(79, 2, 5, 28, 40, 'Usus', '2000', '4000', '2', '12-01-2023', '12:15:26', NULL, '0', '0'),
(80, 2, 5, 28, 118, 'Alpukat Milo', '10000', '10000', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(81, 2, 5, 28, 117, 'Es teler', '10000', '10000', '1', '12-01-2023', '12:15:26', NULL, '10000', '10000'),
(82, 2, 5, 28, 90, 'Es cokelat roti', '12000', '12000', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(83, 2, 5, 28, 109, 'Sehati snack', '10000', '10000', '1', '12-01-2023', '12:15:26', NULL, '10000', '10000'),
(84, 2, 5, 28, 102, 'Le mineral', '2500', '7500', '3', '12-01-2023', '15:47:15', NULL, '0', '0'),
(85, 2, 6, 29, 49, 'Nasi ayam suwir', '5000', '10000', '2', '13-01-2023', '18:47:03', NULL, '0', '0'),
(86, 2, 6, 30, 17, 'Kentang', '10000', '10000', '1', '13-01-2023', '20:51:08', NULL, '0', '0'),
(87, 2, 6, 30, 80, 'Lemon tea', '10000', '10000', '1', '13-01-2023', '20:51:08', NULL, '0', '0'),
(88, 2, 6, 31, 99, 'Kopi robusta', '7000', '7000', '1', '05-03-2023', '22:29:36', NULL, '0', '0'),
(89, 2, 6, 31, 84, 'Dark chocholate', '10000', '20000', '2', '05-03-2023', '22:29:36', NULL, '0', '0'),
(90, 2, 6, 32, 94, 'Hot capucino', '10000', '10000', '1', '09-03-2023', '18:07:10', NULL, '0', '0'),
(91, 2, 6, 32, 72, 'Leci squash', '12000', '12000', '1', '09-03-2023', '18:07:10', NULL, '0', '0'),
(92, 2, 6, 33, 80, 'Lemon tea', '10000', '10000', '1', '17-03-2023', '17:10:03', NULL, '0', '0'),
(93, 2, 6, 33, 17, 'Kentang', '10000', '20000', '2', '17-03-2023', '17:10:03', NULL, '0', '0'),
(94, 2, 6, 33, 82, 'Es teh', '4000', '8000', '2', '17-03-2023', '17:10:03', NULL, '0', '0'),
(95, 2, 6, 33, 119, 'Milo', '10000', '10000', '1', '17-03-2023', '17:10:03', NULL, '0', '0'),
(96, 2, 6, 33, 96, 'Hot beng beng', '10000', '10000', '1', '17-03-2023', '17:10:03', NULL, '0', '0'),
(97, 2, 6, 33, 123, 'Snack mix', '25000', '75000', '3', '17-03-2023', '17:10:03', NULL, '0', '0'),
(98, 2, 6, 33, 84, 'Dark chocholate', '10000', '20000', '2', '17-03-2023', '17:10:03', NULL, '0', '0'),
(99, 2, 6, 34, 89, 'Chocho malt', '10000', '10000', '1', '27-03-2023', '21:10:00', NULL, '0', '0'),
(100, 2, 6, 34, 118, 'Alpukat Milo', '12000', '12000', '1', '27-03-2023', '21:10:00', NULL, '0', '0'),
(101, 2, 6, 35, 82, 'Es teh', '4000', '16000', '4', '29-03-2023', '16:03:54', NULL, '0', '0'),
(102, 2, 6, 35, 49, 'Nasi ayam suwir', '5000', '10000', '2', '29-03-2023', '16:03:54', NULL, '0', '0'),
(103, 2, 6, 35, 51, 'Nasi bakar teri', '5000', '10000', '2', '29-03-2023', '16:03:54', NULL, '0', '0'),
(104, 2, 6, 35, 102, 'Le mineral', '2500', '5000', '2', '29-03-2023', '16:03:54', NULL, '0', '0'),
(105, 2, 6, 36, 98, 'Kopi hitam', '5000', '5000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(106, 2, 6, 36, 140, 'Ayam lodo', '25000', '25000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(107, 2, 6, 36, 158, 'Nasi teluyam', '12000', '12000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(108, 2, 6, 36, 131, 'Alpukat', '10000', '10000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(109, 2, 6, 36, 70, 'Soda gembira', '12000', '12000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(110, 2, 6, 36, 165, 'Josua', '7000', '7000', '1', '04-04-2023', '19:12:26', NULL, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_hapus`
--

CREATE TABLE `pembayaran_hapus` (
  `id` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `no_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai_transaksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dibayar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kembali` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_pembayaran` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_meja` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atas_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_dapur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_diskon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diskon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe_diskon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uniqcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nilai_total_laba` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_kasir` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembayaran_hapus`
--

INSERT INTO `pembayaran_hapus` (`id`, `id_user`, `no_transaksi`, `nilai_transaksi`, `dibayar`, `kembali`, `jenis_pembayaran`, `tanggal`, `waktu`, `bulan`, `tahun`, `status`, `nama_meja`, `atas_nama`, `status_dapur`, `status_diskon`, `diskon`, `tipe_diskon`, `uniqcode`, `nilai_total_laba`, `id_kasir`) VALUES
(1, 2, 'TRN2811220001', '20000', '20000', '0', 'tunai', '28-11-2022', '09:12:02', '11', '2022', '1', '-', 'amin', '0', '0', '0', 'persen', NULL, '', 5),
(2, 2, 'TRN2811220001', '20000', '20000', '0', 'tunai', '28-11-2022', '09:12:02', '11', '2022', '1', '-', 'amin', '0', '0', '0', 'persen', NULL, '', 5),
(3, 2, 'TRN2611220001', '30000', '30000', '0', 'tunai', '26-11-2022', '10:49:25', '11', '2022', '1', '-', 'Parjo', '0', '0', '0', 'persen', NULL, '', 5),
(4, 2, 'TRN1005220001', '10000', '10000', '0', 'tunai', '10-05-2022', '09:14:00', '05', '2022', '1', '-', 'Sus', '0', '0', '0', 'persen', NULL, '2000', 5),
(5, 2, 'TRN1212220002', '5000', '5000', '0', 'tunai', '12-12-2022', '16:49:36', '12', '2022', '1', '01', 'P', '0', '0', '0', 'persen', NULL, '', 6),
(6, 2, 'TRN1212220001', '2500', '2500', '0', 'tunai', '12-12-2022', '16:37:48', '12', '2022', '1', '01', 'Dika', '0', '0', '0', 'persen', NULL, '0', 6),
(7, 2, 'TRN1712220003', '10000', '10000', '0', 'tunai', '17-12-2022', '18:21:50', '12', '2022', '1', '02', 'Udin', '0', '0', '0', 'persen', NULL, '0', 6),
(8, 2, 'TRN2212220006', '50000', '50000', '0', 'tunai', '22-12-2022', '19:38:45', '12', '2022', '1', '01', 'Tw', '0', '0', '0', 'persen', NULL, '0', 6),
(9, 2, 'TRN2312220001', '144000', '144000', '0', 'tunai', '23-12-2022', '14:16:51', '12', '2022', '1', '01', '01', '0', '0', '0', 'persen', NULL, '', 6),
(10, 2, 'TRN2312220002', '34000', '50000', '16000', 'tunai', '23-12-2022', '16:09:02', '12', '2022', '1', '02', '02', '0', '0', '0', 'persen', NULL, '', 6),
(11, 2, 'TRN2312220005', '35000', '35000', '0', 'tunai', '23-12-2022', '17:19:46', '12', '2022', '1', '03', 'Mas faris', '0', '0', '0', 'persen', NULL, '0', 6),
(12, 2, 'TRN2312220009', '57000', '100000', '43000', 'tunai', '23-12-2022', '21:38:29', '12', '2022', '1', '07', '07', '0', '0', '0', 'persen', NULL, '', 6),
(13, 2, 'TRN2412220014', '9000', '9000', '0', 'tunai', '24-12-2022', '21:53:07', '12', '2022', '1', '01', 'Firman', '0', '0', '0', 'persen', NULL, '0', 6),
(14, 2, 'TRN2412220008', '5000', '5000', '0', 'tunai', '24-12-2022', '19:50:02', '12', '2022', '1', '08', 'Lukman', '0', '0', '0', 'persen', NULL, '0', 6),
(15, 2, 'TRN2512220003', '61000', '100000', '39000', 'tunai', '25-12-2022', '19:05:57', '12', '2022', '1', '02', '02', '0', '0', '0', 'persen', NULL, '', 6),
(16, 2, 'TRN2712220001', '34000', '34000', '0', 'tunai', '27-12-2022', '13:29:45', '12', '2022', '1', '01', '01', '0', '0', '0', 'persen', NULL, '', 6),
(17, 2, 'TRN1112220001', '69000', '100000', '31000', 'tunai', '11-12-2022', '16:15:16', '12', '2022', '1', '01', 'Riki', '0', '0', '0', 'persen', NULL, '0', 6),
(18, 2, 'TRN2912220004', '2500', '2500', '0', 'tunai', '29-12-2022', '17:45:21', '12', '2022', '1', '01', '09', '0', '0', '0', 'persen', NULL, '0', 6),
(19, 2, 'TRN2911220001', '20000', '20000', '0', 'tunai', '29-11-2022', '16:44:32', '11', '2022', '1', '25', 'Dodo', '0', '0', '0', 'persen', NULL, '', 5),
(20, 2, 'TRN0512220001', '30000', '50000', '20000', 'tunai', '05-12-2022', '13:40:12', '12', '2022', '1', '25', 'Udin', '0', '0', '0', 'nominal', NULL, '', 6),
(21, 2, 'TRN0101230011', '57000', '57000', '0', 'tunai', '01-01-2023', '01:23:07', '01', '2023', '1', '11', 'Mbak fini', '0', '0', '0', 'persen', NULL, '10000', 6),
(22, 2, 'TRN0101230012', '20000', '20000', '0', 'tunai', '01-01-2023', '01:19:33', '01', '2023', '1', '10', '10', '0', '0', '0', 'persen', NULL, '', 6),
(23, 2, 'TRN3112220011', '20000', '20000', '0', 'tunai', '01-01-2023', '01:19:17', '01', '2023', '1', '09', '09', '0', '0', '0', 'persen', NULL, '', 6),
(24, 2, 'TRN0401230001', '16000', '16000', '0', 'tunai', '04-01-2023', '11:39:46', '01', '2023', '1', '12', '12', '0', '0', '0', 'persen', NULL, '0', 6),
(25, 2, 'TRN0701230003', '26000', '26000', '0', 'tunai', '07-01-2023', '18:32:04', '01', '2023', '1', '01', '01', '0', '0', '0', 'persen', NULL, '0', 6),
(26, 2, 'TRN0701230002', '64000', '100000', '36000', 'tunai', '07-01-2023', '17:31:15', '01', '2023', '1', '02', '02', '0', '0', '0', 'persen', NULL, '', 6),
(27, 2, 'TRN0801230008', '24000', '24000', '0', 'tunai', '08-01-2023', '22:35:48', '01', '2023', '1', '09', '09', '0', '0', '0', 'persen', NULL, '', 6),
(28, 2, 'TRN1201230001', '80000', '100000', '20000', 'tunai', '12-01-2023', '15:49:37', '01', '2023', '1', '01', '03', '0', '0', '0', 'persen', NULL, '', 5),
(29, 2, 'TRN1301230004', '10000', '10000', '0', 'tunai', '13-01-2023', '18:47:03', '01', '2023', '1', '03', '03', '0', '0', '0', 'persen', NULL, '0', 6),
(30, 2, 'TRN1301230010', '20000', '20000', '0', 'tunai', '13-01-2023', '20:51:08', '01', '2023', '1', '01', '02', '0', '0', '0', 'persen', NULL, '0', 6),
(31, 2, 'TRN0503230003', '27000', '27000', '0', 'tunai', '05-03-2023', '22:29:36', '03', '2023', '1', '03', '03', '0', '0', '0', 'persen', NULL, '0', 6),
(32, 2, 'TRN0903230003', '22000', '22000', '0', 'tunai', '09-03-2023', '18:07:10', '03', '2023', '1', '03', '03', '0', '0', '0', 'persen', NULL, '0', 6),
(33, 2, 'TRN1703230001', '153000', '200000', '47000', 'tunai', '17-03-2023', '17:17:14', '03', '2023', '1', '01', '01', '0', '0', '0', 'persen', NULL, '', 6),
(34, 2, 'TRN2703230003', '22000', '22000', '0', 'tunai', '27-03-2023', '21:10:00', '03', '2023', '1', '03', '03', '0', '0', '0', 'persen', NULL, '0', 6),
(35, 2, 'TRN2903230001', '41000', '41000', '0', 'tunai', '29-03-2023', '16:03:54', '03', '2023', '1', '01', '01', '0', '0', '0', 'persen', NULL, '0', 6),
(36, 2, 'TRN0404230001', '71000', '71000', '0', 'tunai', '04-04-2023', '19:12:35', '04', '2023', '1', '01', '01', '0', '0', '0', 'persen', NULL, '', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_promo_a`
--

CREATE TABLE `pembayaran_promo_a` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_promo_b`
--

CREATE TABLE `pembayaran_promo_b` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran_promo_c`
--

CREATE TABLE `pembayaran_promo_c` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `id_pembayaran` int(15) DEFAULT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_promo` varchar(255) DEFAULT NULL,
  `harga_barang` varchar(255) DEFAULT NULL,
  `jumlah_beli` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT current_timestamp(6),
  `uniqcode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `pengaturan_hak_akses`
--

CREATE TABLE `pengaturan_hak_akses` (
  `id` int(15) NOT NULL,
  `level` varchar(255) DEFAULT NULL,
  `id_menu` int(15) DEFAULT NULL,
  `tipe_menu` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pengaturan_hak_akses`
--

INSERT INTO `pengaturan_hak_akses` (`id`, `level`, `id_menu`, `tipe_menu`) VALUES
(346, '3', 2, 'menu_1'),
(347, '3', 4, 'menu_1'),
(348, '3', 6, 'menu_1'),
(349, '3', 7, 'menu_1'),
(350, '3', 1, 'menu_2'),
(351, '3', 2, 'menu_2'),
(352, '3', 6, 'menu_2'),
(353, '3', 8, 'menu_2'),
(354, '3', 9, 'menu_2'),
(355, '3', 11, 'menu_2'),
(356, '3', 18, 'menu_2'),
(357, '3', 21, 'menu_2'),
(358, '3', 1, 'menu_3'),
(359, '3', 2, 'menu_3'),
(360, '3', 3, 'menu_3'),
(361, '3', 9, 'menu_3'),
(362, '2', 1, 'menu_1'),
(363, '2', 2, 'menu_1'),
(364, '2', 3, 'menu_1'),
(365, '2', 4, 'menu_1'),
(366, '2', 6, 'menu_1'),
(367, '2', 7, 'menu_1'),
(368, '2', 8, 'menu_1'),
(369, '2', 9, 'menu_1'),
(370, '2', 1, 'menu_2'),
(371, '2', 2, 'menu_2'),
(372, '2', 4, 'menu_2'),
(373, '2', 5, 'menu_2'),
(374, '2', 6, 'menu_2'),
(375, '2', 8, 'menu_2'),
(376, '2', 9, 'menu_2'),
(377, '2', 11, 'menu_2'),
(378, '2', 12, 'menu_2'),
(379, '2', 18, 'menu_2'),
(380, '2', 21, 'menu_2'),
(381, '2', 22, 'menu_2'),
(382, '2', 23, 'menu_2'),
(383, '2', 24, 'menu_2'),
(384, '2', 25, 'menu_2'),
(385, '2', 26, 'menu_2'),
(386, '2', 27, 'menu_2'),
(387, '2', 32, 'menu_2'),
(388, '2', 34, 'menu_2'),
(389, '2', 36, 'menu_2'),
(390, '2', 37, 'menu_2'),
(391, '2', 38, 'menu_2'),
(392, '2', 39, 'menu_2'),
(393, '2', 40, 'menu_2'),
(394, '2', 41, 'menu_2'),
(395, '2', 42, 'menu_2'),
(396, '2', 43, 'menu_2'),
(397, '2', 44, 'menu_2'),
(398, '2', 45, 'menu_2'),
(399, '2', 1, 'menu_3'),
(400, '2', 2, 'menu_3'),
(401, '2', 3, 'menu_3'),
(402, '2', 9, 'menu_3'),
(403, '2', 4, 'menu_3'),
(404, '2', 6, 'menu_3'),
(405, '2', 7, 'menu_3');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `invoice` varchar(255) DEFAULT NULL,
  `nama_pengeluaran` varchar(255) DEFAULT NULL,
  `nominal` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `printer`
--

CREATE TABLE `printer` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nama_printer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat_printer` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_cetak_struk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_cetak_dapur` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banyak_struk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `banyak_struk_dapur` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ukuran_struk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe_printer` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `printer`
--

INSERT INTO `printer` (`id`, `id_user`, `nama_printer`, `alamat_printer`, `status_cetak_struk`, `status_cetak_dapur`, `banyak_struk`, `banyak_struk_dapur`, `ukuran_struk`, `tipe_printer`, `created_at`) VALUES
(15, 2, 'MPT-II\n', '66:12:9D:A7:F2:D0', '1', '0', '1', '0', '58', '1', '2019-12-12 22:05:07');

-- --------------------------------------------------------

--
-- Table structure for table `promo_a`
--

CREATE TABLE `promo_a` (
  `id` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dipromo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_berdasarkan` int(100) NOT NULL DEFAULT 0,
  `diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banyak_beli` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_berakhir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_berakhir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senin` int(100) NOT NULL DEFAULT 0,
  `selasa` int(100) NOT NULL DEFAULT 0,
  `rabu` int(100) NOT NULL DEFAULT 0,
  `kamis` int(100) NOT NULL DEFAULT 0,
  `jumat` int(100) NOT NULL DEFAULT 0,
  `sabtu` int(100) NOT NULL DEFAULT 0,
  `minggu` int(100) NOT NULL DEFAULT 0,
  `status_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `promo_b`
--

CREATE TABLE `promo_b` (
  `id` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dipromo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_berdasarkan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipe_diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banyak_bayar` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_berakhir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_berakhir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selasa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rabu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kamis` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sabtu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minggu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `promo_c`
--

CREATE TABLE `promo_c` (
  `id` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama_dipromo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_berdasarkan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gratis_barang` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_kelipatan` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banyak_beli` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `banyak_gratis` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_mulai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_berakhir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_mulai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_berakhir` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senin` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `selasa` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rabu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kamis` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jumat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sabtu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `minggu` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `rekap_kas`
--

CREATE TABLE `rekap_kas` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tanggal_tutup` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `rekap_kas_detail`
--

CREATE TABLE `rekap_kas_detail` (
  `id` int(11) NOT NULL,
  `id_rekapkas` int(11) NOT NULL,
  `total_penjualan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_void` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_kasmasuk` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_kaskeluar` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penerimaan_sistem` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penerimaan_aktual_tunai` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `penerimaan_aktual_kartu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selisih` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_transaksi_tersimpan` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE `retur` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `no_transaksi` varchar(15) DEFAULT NULL,
  `nilai_transaksi` double(65,0) NOT NULL,
  `dibayar` double(65,0) NOT NULL,
  `kembali` double(65,0) NOT NULL,
  `jenis_pembayaran` varchar(100) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL,
  `status` int(15) DEFAULT NULL,
  `nama_meja` varchar(255) DEFAULT NULL,
  `atas_nama` varchar(255) DEFAULT NULL,
  `status_dapur` int(15) DEFAULT NULL,
  `status_diskon` int(255) NOT NULL,
  `diskon` double(255,0) NOT NULL,
  `tipe_diskon` varchar(100) DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `tanggal_retur` varchar(255) DEFAULT NULL,
  `waktu_retur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `retur`
--

INSERT INTO `retur` (`id`, `id_user`, `id_kasir`, `no_transaksi`, `nilai_transaksi`, `dibayar`, `kembali`, `jenis_pembayaran`, `tanggal`, `waktu`, `bulan`, `tahun`, `status`, `nama_meja`, `atas_nama`, `status_dapur`, `status_diskon`, `diskon`, `tipe_diskon`, `alasan`, `tanggal_retur`, `waktu_retur`) VALUES
(27, 2, 5, 'TRN2803220001', 10000, 10000, 0, 'tunai', '28-03-2022', '11:01:37', '03', '2022', 1, '-', 'test', 1, 0, 0, 'persen', 'test', '28-03-2022', '11:30:31'),
(28, 2, 5, 'TRN2811220001', 20000, 20000, 0, 'tunai', '28-11-2022', '09:12:02', '11', '2022', 1, '-', 'amin', 0, 0, 0, 'persen', '-', '28-11-2022', '09:16:15'),
(29, 2, 5, 'TRN2811220001', 20000, 20000, 0, 'tunai', '28-11-2022', '09:12:02', '11', '2022', 1, '-', 'amin', 0, 0, 0, 'persen', '-', '28-11-2022', '09:19:01'),
(30, 2, 5, 'TRN2811220001', 20000, 20000, 0, 'tunai', '28-11-2022', '09:12:02', '11', '2022', 1, '-', 'amin', 0, 0, 0, 'persen', '-', '28-11-2022', '09:36:12'),
(31, 2, 5, 'TRN2811220001', 20000, 20000, 0, 'tunai', '28-11-2022', '09:12:02', '11', '2022', 1, '-', 'amin', 0, 0, 0, 'persen', '-', '28-11-2022', '09:36:58'),
(32, 2, 5, 'TRN2811220001', 20000, 20000, 0, 'tunai', '28-11-2022', '09:12:02', '11', '2022', 1, '-', 'amin', 0, 0, 0, 'persen', '-', '28-11-2022', '09:37:20'),
(33, 2, 5, 'TRN2611220001', 30000, 30000, 0, 'tunai', '26-11-2022', '10:49:25', '11', '2022', 1, '-', 'Parjo', 0, 0, 0, 'persen', '-', '28-11-2022', '09:58:44'),
(34, 2, 5, 'TRN1005220001', 10000, 10000, 0, 'tunai', '10-05-2022', '09:14:00', '05', '2022', 1, '-', 'Sus', 0, 0, 0, 'persen', '-', '28-11-2022', '09:58:50'),
(35, 2, 6, 'TRN1212220002', 5000, 5000, 0, 'tunai', '12-12-2022', '16:49:36', '12', '2022', 1, '01', 'P', 0, 0, 0, 'persen', 'Sudah seles', '13-12-2022', '04:29:25'),
(36, 2, 6, 'TRN1212220001', 2500, 2500, 0, 'tunai', '12-12-2022', '16:37:48', '12', '2022', 1, '01', 'Dika', 0, 0, 0, 'persen', 'Ihkuhiug', '13-12-2022', '04:30:12'),
(37, 2, 6, 'TRN1712220003', 10000, 10000, 0, 'tunai', '17-12-2022', '18:21:50', '12', '2022', 1, '02', 'Udin', 0, 0, 0, 'persen', 'Gkjjkk', '17-12-2022', '06:22:41'),
(38, 2, 6, 'TRN2212220006', 50000, 50000, 0, 'tunai', '22-12-2022', '19:38:45', '12', '2022', 1, '01', 'Tw', 0, 0, 0, 'persen', 'Jghuu', '22-12-2022', '08:27:32'),
(39, 2, 6, 'TRN2312220001', 144000, 144000, 0, 'tunai', '23-12-2022', '14:16:51', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', 'Jbuuffuy', '23-12-2022', '03:33:34'),
(40, 2, 6, 'TRN2312220002', 34000, 50000, 16000, 'tunai', '23-12-2022', '16:09:02', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', 'Mbiubiu', '23-12-2022', '04:12:10'),
(41, 2, 6, 'TRN2312220005', 35000, 35000, 0, 'tunai', '23-12-2022', '17:19:46', '12', '2022', 1, '03', 'Mas faris', 0, 0, 0, 'persen', 'Hycfnfj', '23-12-2022', '05:24:25'),
(42, 2, 6, 'TRN2312220009', 57000, 100000, 43000, 'tunai', '23-12-2022', '21:38:29', '12', '2022', 1, '07', '07', 0, 0, 0, 'persen', 'Yf tyty', '23-12-2022', '09:41:40'),
(43, 2, 6, 'TRN2412220014', 9000, 9000, 0, 'tunai', '24-12-2022', '21:53:07', '12', '2022', 1, '01', 'Firman', 0, 0, 0, 'persen', 'H hn nh', '24-12-2022', '10:23:54'),
(44, 2, 6, 'TRN2412220008', 5000, 5000, 0, 'tunai', '24-12-2022', '19:50:02', '12', '2022', 1, '08', 'Lukman', 0, 0, 0, 'persen', 'Ujbbju', '24-12-2022', '10:36:54'),
(45, 2, 6, 'TRN2512220003', 61000, 100000, 39000, 'tunai', '25-12-2022', '19:05:57', '12', '2022', 1, '02', '02', 0, 0, 0, 'persen', 'Gujfujfju', '25-12-2022', '10:47:43'),
(46, 2, 6, 'TRN2712220001', 34000, 34000, 0, 'tunai', '27-12-2022', '13:29:45', '12', '2022', 1, '01', '01', 0, 0, 0, 'persen', 'Yyuu', '27-12-2022', '01:30:06'),
(47, 2, 6, 'TRN1112220001', 69000, 100000, 31000, 'tunai', '11-12-2022', '16:15:16', '12', '2022', 1, '01', 'Riki', 0, 0, 0, 'persen', 'U6v6gjvy', '29-12-2022', '11:44:05'),
(48, 2, 6, 'TRN2912220004', 2500, 2500, 0, 'tunai', '29-12-2022', '17:45:21', '12', '2022', 1, '01', '09', 0, 0, 0, 'persen', 'J hvjhvjh', '29-12-2022', '05:59:51'),
(49, 2, 5, 'TRN2911220001', 20000, 20000, 0, 'tunai', '29-11-2022', '16:44:32', '11', '2022', 1, '25', 'Dodo', 0, 0, 0, 'persen', '-', '30-12-2022', '08:10:29'),
(50, 2, 6, 'TRN0512220001', 30000, 50000, 20000, 'tunai', '05-12-2022', '13:40:12', '12', '2022', 1, '25', 'Udin', 0, 0, 0, 'nominal', '-', '30-12-2022', '08:10:48'),
(51, 2, 6, 'TRN0101230011', 57000, 57000, 0, 'tunai', '01-01-2023', '01:23:07', '01', '2023', 1, '11', 'Mbak fini', 0, 0, 0, 'persen', 'Jugguukguk', '01-01-2023', '09:53:02'),
(52, 2, 6, 'TRN0101230012', 20000, 20000, 0, 'tunai', '01-01-2023', '01:19:33', '01', '2023', 1, '10', '10', 0, 0, 0, 'persen', 'Jgffj', '01-01-2023', '09:53:12'),
(53, 2, 6, 'TRN3112220011', 20000, 20000, 0, 'tunai', '01-01-2023', '01:19:17', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', 'Jhjhg', '01-01-2023', '09:53:21'),
(54, 2, 6, 'TRN0401230001', 16000, 16000, 0, 'tunai', '04-01-2023', '11:39:46', '01', '2023', 1, '12', '12', 0, 0, 0, 'persen', 'Nvv', '04-01-2023', '11:58:27'),
(55, 2, 6, 'TRN0701230003', 26000, 26000, 0, 'tunai', '07-01-2023', '18:32:04', '01', '2023', 1, '01', '01', 0, 0, 0, 'persen', 'Jhuuh', '07-01-2023', '06:38:50'),
(56, 2, 6, 'TRN0701230002', 64000, 100000, 36000, 'tunai', '07-01-2023', '17:31:15', '01', '2023', 1, '02', '02', 0, 0, 0, 'persen', 'Gujg', '07-01-2023', '10:49:05'),
(57, 2, 6, 'TRN0801230008', 24000, 24000, 0, 'tunai', '08-01-2023', '22:35:48', '01', '2023', 1, '09', '09', 0, 0, 0, 'persen', 'Bgdd', '08-01-2023', '10:43:57'),
(58, 2, 5, 'TRN1201230001', 80000, 100000, 20000, 'tunai', '12-01-2023', '15:49:37', '01', '2023', 1, '01', '03', 0, 0, 0, 'persen', 'Hhhh', '13-01-2023', '12:46:41'),
(59, 2, 6, 'TRN1301230004', 10000, 10000, 0, 'tunai', '13-01-2023', '18:47:03', '01', '2023', 1, '03', '03', 0, 0, 0, 'persen', '7hibbuib', '13-01-2023', '06:47:27'),
(60, 2, 6, 'TRN1301230010', 20000, 20000, 0, 'tunai', '13-01-2023', '20:51:08', '01', '2023', 1, '01', '02', 0, 0, 0, 'persen', '6nhuh', '13-01-2023', '09:01:51'),
(61, 2, 6, 'TRN0503230003', 27000, 27000, 0, 'tunai', '05-03-2023', '22:29:36', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', 'Jjmn', '07-03-2023', '02:37:33'),
(62, 2, 6, 'TRN0903230003', 22000, 22000, 0, 'tunai', '09-03-2023', '18:07:10', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', 'Hhhu', '09-03-2023', '09:52:42'),
(63, 2, 6, 'TRN1703230001', 153000, 200000, 47000, 'tunai', '17-03-2023', '17:17:14', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', ' U iun', '17-03-2023', '06:00:31'),
(64, 2, 6, 'TRN2703230003', 22000, 22000, 0, 'tunai', '27-03-2023', '21:10:00', '03', '2023', 1, '03', '03', 0, 0, 0, 'persen', 'Jhgf', '27-03-2023', '11:32:08'),
(65, 2, 6, 'TRN2903230001', 41000, 41000, 0, 'tunai', '29-03-2023', '16:03:54', '03', '2023', 1, '01', '01', 0, 0, 0, 'persen', 'Ffg', '29-03-2023', '10:13:12'),
(66, 2, 6, 'TRN0404230001', 71000, 71000, 0, 'tunai', '04-04-2023', '19:12:35', '04', '2023', 1, '01', '01', 0, 0, 0, 'persen', 'Jycnyycd', '04-04-2023', '09:38:47');

-- --------------------------------------------------------

--
-- Table structure for table `retur_detail`
--

CREATE TABLE `retur_detail` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `id_pembayaran` int(15) DEFAULT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `harga_barang` varchar(255) DEFAULT NULL,
  `total_harga_barang` varchar(255) DEFAULT NULL,
  `jumlah_beli` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `uniqcode` varchar(100) DEFAULT NULL,
  `laba` varchar(255) DEFAULT NULL,
  `total_laba` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `retur_detail`
--

INSERT INTO `retur_detail` (`id`, `id_user`, `id_kasir`, `id_pembayaran`, `id_barang`, `nama_barang`, `harga_barang`, `total_harga_barang`, `jumlah_beli`, `tanggal`, `waktu`, `uniqcode`, `laba`, `total_laba`) VALUES
(45, 2, 5, 28, 4, 'Roti Bakar', '10000', '10000', '1', '28-03-2022', '11:01:37', NULL, '2000', '2000'),
(46, 2, 5, 3, 5, 'Taro Ice', '10000', '10000', '1', '28-11-2022', '08:45:17', NULL, '2000', '2000'),
(47, 2, 5, 3, 4, 'Roti Bakar', '10000', '10000', '1', '28-11-2022', '08:45:37', NULL, '0', '0'),
(48, 2, 5, 3, 5, 'Taro Ice', '10000', '10000', '1', '28-11-2022', '08:45:17', NULL, '2000', '2000'),
(49, 2, 5, 3, 4, 'Roti Bakar', '10000', '10000', '1', '28-11-2022', '08:45:37', NULL, '0', '0'),
(50, 2, 5, 3, 5, 'Taro Ice', '10000', '10000', '1', '28-11-2022', '08:45:17', NULL, '2000', '2000'),
(51, 2, 5, 3, 4, 'Roti Bakar', '10000', '10000', '1', '28-11-2022', '08:45:37', NULL, '0', '0'),
(52, 2, 5, 3, 5, 'Taro Ice', '10000', '10000', '1', '28-11-2022', '08:45:17', NULL, '2000', '2000'),
(53, 2, 5, 3, 4, 'Roti Bakar', '10000', '10000', '1', '28-11-2022', '08:45:37', NULL, '0', '0'),
(54, 2, 5, 3, 5, 'Taro Ice', '10000', '10000', '1', '28-11-2022', '08:45:17', NULL, '2000', '2000'),
(55, 2, 5, 3, 4, 'Roti Bakar', '10000', '10000', '1', '28-11-2022', '08:45:37', NULL, '0', '0'),
(56, 2, 5, 2, 4, 'Roti Bakar', '10000', '30000', '3', '26-11-2022', '10:48:17', NULL, '2000', '12000'),
(57, 2, 5, 1, 5, 'Taro Ice', '10000', '10000', '1', '10-05-2022', '09:14:00', NULL, '2000', '2000'),
(58, 2, 6, 24, 98, 'Kopi hitam', '5000', '5000', '1', '12-12-2022', '16:39:35', NULL, '0', '0'),
(59, 2, 6, 23, 102, 'Le mineral', '2500', '2500', '1', '12-12-2022', '16:37:48', NULL, '0', '0'),
(60, 2, 6, 57, 49, 'Nasi ayam suwir', '5000', '5000', '1', '17-12-2022', '18:21:50', NULL, '0', '0'),
(61, 2, 6, 57, 41, 'Ceker', '2000', '2000', '1', '17-12-2022', '18:21:50', NULL, '0', '0'),
(62, 2, 6, 57, 43, 'Telur puyuh', '3000', '3000', '1', '17-12-2022', '18:21:50', NULL, '0', '0'),
(63, 2, 6, 127, 25, 'Seblak seafood', '15000', '15000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(64, 2, 6, 127, 17, 'Kentang', '10000', '10000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(65, 2, 6, 127, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(66, 2, 6, 127, 19, 'Tahu crispy', '12000', '12000', '1', '22-12-2022', '19:38:45', NULL, '0', '0'),
(67, 2, 6, 134, 24, 'Seblak komplit', '20000', '40000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(68, 2, 6, 134, 62, 'Nasi goreng ayam ', '13000', '26000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(69, 2, 6, 134, 72, 'Leci squash', '12000', '24000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(70, 2, 6, 134, 85, 'Mangga', '10000', '30000', '3', '23-12-2022', '12:13:23', NULL, '0', '0'),
(71, 2, 6, 134, 13, 'Roti maryam keju', '12000', '24000', '2', '23-12-2022', '12:13:23', NULL, '0', '0'),
(72, 2, 6, 135, 21, 'Tahu cabe garam', '15000', '15000', '1', '23-12-2022', '14:15:57', NULL, '0', '0'),
(73, 2, 6, 135, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '14:15:57', NULL, '0', '0'),
(74, 2, 6, 135, 99, 'Kopi robusta', '7000', '14000', '2', '23-12-2022', '14:15:57', NULL, '0', '0'),
(75, 2, 6, 138, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '17:19:46', NULL, '0', '0'),
(76, 2, 6, 138, 39, 'Soto ayam ', '10000', '10000', '1', '23-12-2022', '17:19:46', NULL, '0', '0'),
(77, 2, 6, 138, 46, 'Kepala', '2000', '4000', '2', '23-12-2022', '17:19:46', NULL, '0', '0'),
(78, 2, 6, 138, 11, 'Roti maryam original ', '8000', '16000', '2', '23-12-2022', '17:19:46', NULL, '0', '0'),
(79, 2, 6, 143, 98, 'Kopi hitam', '5000', '5000', '1', '23-12-2022', '20:54:19', NULL, '0', '0'),
(80, 2, 6, 143, 100, 'Wedang jahe', '7000', '14000', '2', '23-12-2022', '20:54:19', NULL, '0', '0'),
(81, 2, 6, 143, 15, 'Roti bakar cokelat+keju', '13000', '13000', '1', '23-12-2022', '20:54:19', NULL, '0', '0'),
(82, 2, 6, 143, 88, 'Matcha', '10000', '10000', '1', '23-12-2022', '20:54:19', NULL, '0', '0'),
(83, 2, 6, 143, 16, 'Roti bakar cokelat+kacang', '15000', '15000', '1', '23-12-2022', '21:23:05', NULL, '0', '0'),
(84, 2, 6, 160, 82, 'Es teh', '4000', '4000', '1', '24-12-2022', '21:53:07', NULL, '0', '0'),
(85, 2, 6, 160, 98, 'Kopi hitam', '5000', '5000', '1', '24-12-2022', '21:53:07', NULL, '0', '0'),
(86, 2, 6, 154, 98, 'Kopi hitam', '5000', '5000', '1', '24-12-2022', '19:50:02', NULL, '0', '0'),
(87, 2, 6, 163, 30, 'Ceker judes', '13000', '0', '', '25-12-2022', '18:25:52', NULL, '0', '0'),
(88, 2, 6, 163, 53, 'Mi goreng telur ', '13000', '13000', '1', '25-12-2022', '18:25:52', NULL, '0', '0'),
(89, 2, 6, 163, 39, 'Soto ayam ', '10000', '10000', '1', '25-12-2022', '18:25:52', NULL, '0', '0'),
(90, 2, 6, 163, 57, 'Mi goreng indomie', '6000', '12000', '2', '25-12-2022', '18:25:52', NULL, '0', '0'),
(91, 2, 6, 163, 91, 'Teh panas', '4000', '4000', '1', '25-12-2022', '18:25:52', NULL, '0', '0'),
(92, 2, 6, 163, 83, 'Es jeruk', '6000', '12000', '2', '25-12-2022', '18:25:52', NULL, '0', '0'),
(93, 2, 6, 163, 87, 'Taro', '10000', '10000', '1', '25-12-2022', '18:37:37', NULL, '0', '0'),
(94, 2, 6, 173, 99, 'Kopi robusta', '7000', '7000', '1', '27-12-2022', '12:32:16', NULL, '0', '0'),
(95, 2, 6, 173, 25, 'Seblak seafood', '15000', '15000', '1', '27-12-2022', '12:32:16', NULL, '0', '0'),
(96, 2, 6, 173, 73, 'Melon squash', '12000', '12000', '1', '27-12-2022', '12:32:16', NULL, '0', '0'),
(97, 2, 6, 173, 102, 'Le mineral', '2500', '0', '', '27-12-2022', '13:29:00', NULL, '0', '0'),
(98, 2, 6, 22, 85, 'Mangga', '10000', '30000', '3', '11-12-2022', '16:15:16', NULL, '0', '0'),
(99, 2, 6, 22, 39, 'Soto ayam ', '10000', '30000', '3', '11-12-2022', '16:15:16', NULL, '0', '0'),
(100, 2, 6, 22, 43, 'Telur puyuh', '3000', '9000', '3', '11-12-2022', '16:15:16', NULL, '0', '0'),
(101, 2, 6, 191, 102, 'Le mineral', '2500', '2500', '1', '29-12-2022', '17:45:21', NULL, '0', '0'),
(102, 2, 5, 4, 5, 'Taro Ice', '10000', '20000', '2', '29-11-2022', '16:43:03', NULL, '2000', '4000'),
(103, 2, 6, 5, 8, 'Es Americano', '10000', '20000', '2', '05-12-2022', '13:38:51', NULL, '6000', '12000'),
(104, 2, 6, 5, 5, 'Taro Ice', '10000', '10000', '1', '05-12-2022', '13:38:51', NULL, '2000', '2000'),
(105, 2, 6, 219, 92, 'Jeruk panas', '6000', '6000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(106, 2, 6, 219, 82, 'Es teh', '4000', '4000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(107, 2, 6, 219, 87, 'Taro', '10000', '10000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(108, 2, 6, 219, 105, 'Brown sugar', '10000', '10000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(109, 2, 6, 219, 70, 'Soda gembira', '12000', '12000', '1', '01-01-2023', '01:23:07', NULL, '0', '0'),
(110, 2, 6, 219, 109, 'Sehati snack', '10000', '10000', '1', '01-01-2023', '01:23:07', NULL, '10000', '10000'),
(111, 2, 6, 219, 102, 'Le mineral', '2500', '5000', '2', '01-01-2023', '01:23:07', NULL, '0', '0'),
(112, 2, 6, 218, 17, 'Kentang', '10000', '10000', '1', '01-01-2023', '00:29:47', NULL, '0', '0'),
(113, 2, 6, 218, 89, 'Chocho malt', '10000', '10000', '1', '01-01-2023', '00:29:47', NULL, '0', '0'),
(114, 2, 6, 217, 94, 'Hot capucino', '10000', '20000', '2', '31-12-2022', '23:41:20', NULL, '0', '0'),
(115, 2, 6, 242, 91, 'Teh panas', '4000', '4000', '1', '04-01-2023', '11:39:46', NULL, '0', '0'),
(116, 2, 6, 242, 83, 'Es jeruk', '6000', '12000', '2', '04-01-2023', '11:39:46', NULL, '0', '0'),
(117, 2, 6, 263, 129, 'Ayam geprek', '13000', '26000', '2', '07-01-2023', '18:32:04', NULL, '0', '0'),
(118, 2, 6, 262, 99, 'Kopi robusta', '7000', '0', '', '07-01-2023', '16:20:39', NULL, '0', '0'),
(119, 2, 6, 262, 70, 'Soda gembira', '12000', '12000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(120, 2, 6, 262, 83, 'Es jeruk', '6000', '6000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(121, 2, 6, 262, 39, 'Soto ayam ', '10000', '10000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(122, 2, 6, 262, 52, 'Mi goreng ori', '10000', '10000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(123, 2, 6, 262, 64, 'Lalapan 3T', '10000', '10000', '1', '07-01-2023', '16:20:39', NULL, '0', '0'),
(124, 2, 6, 262, 43, 'Telur puyuh', '3000', '6000', '2', '07-01-2023', '16:20:39', NULL, '0', '0'),
(125, 2, 6, 262, 98, 'Kopi hitam', '5000', '10000', '2', '07-01-2023', '16:20:39', NULL, '0', '0'),
(126, 2, 6, 285, 26, 'Seblak tulang', '12000', '12000', '1', '08-01-2023', '22:33:06', NULL, '0', '0'),
(127, 2, 6, 285, 72, 'Leci squash', '12000', '12000', '1', '08-01-2023', '22:33:06', NULL, '0', '0'),
(128, 2, 5, 300, 49, 'Nasi ayam suwir', '5000', '10000', '2', '12-01-2023', '12:15:26', NULL, '0', '0'),
(129, 2, 5, 300, 50, 'Nasi bakar tongkol', '5000', '5000', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(130, 2, 5, 300, 43, 'Telur puyuh', '3000', '9000', '3', '12-01-2023', '12:15:26', NULL, '0', '0'),
(131, 2, 5, 300, 42, 'Jeroan', '2500', '2500', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(132, 2, 5, 300, 40, 'Usus', '2000', '4000', '2', '12-01-2023', '12:15:26', NULL, '0', '0'),
(133, 2, 5, 300, 118, 'Alpukat Milo', '10000', '10000', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(134, 2, 5, 300, 117, 'Es teler', '10000', '10000', '1', '12-01-2023', '12:15:26', NULL, '10000', '10000'),
(135, 2, 5, 300, 90, 'Es cokelat roti', '12000', '12000', '1', '12-01-2023', '12:15:26', NULL, '0', '0'),
(136, 2, 5, 300, 109, 'Sehati snack', '10000', '10000', '1', '12-01-2023', '12:15:26', NULL, '10000', '10000'),
(137, 2, 5, 300, 102, 'Le mineral', '2500', '7500', '3', '12-01-2023', '15:47:15', NULL, '0', '0'),
(138, 2, 6, 311, 49, 'Nasi ayam suwir', '5000', '10000', '2', '13-01-2023', '18:47:03', NULL, '0', '0'),
(139, 2, 6, 318, 17, 'Kentang', '10000', '10000', '1', '13-01-2023', '20:51:08', NULL, '0', '0'),
(140, 2, 6, 318, 80, 'Lemon tea', '10000', '10000', '1', '13-01-2023', '20:51:08', NULL, '0', '0'),
(141, 2, 6, 535, 99, 'Kopi robusta', '7000', '7000', '1', '05-03-2023', '22:29:36', NULL, '0', '0'),
(142, 2, 6, 535, 84, 'Dark chocholate', '10000', '20000', '2', '05-03-2023', '22:29:36', NULL, '0', '0'),
(143, 2, 6, 544, 94, 'Hot capucino', '10000', '10000', '1', '09-03-2023', '18:07:10', NULL, '0', '0'),
(144, 2, 6, 544, 72, 'Leci squash', '12000', '12000', '1', '09-03-2023', '18:07:10', NULL, '0', '0'),
(145, 2, 6, 570, 80, 'Lemon tea', '10000', '10000', '1', '17-03-2023', '17:10:03', NULL, '0', '0'),
(146, 2, 6, 570, 17, 'Kentang', '10000', '20000', '2', '17-03-2023', '17:10:03', NULL, '0', '0'),
(147, 2, 6, 570, 82, 'Es teh', '4000', '8000', '2', '17-03-2023', '17:10:03', NULL, '0', '0'),
(148, 2, 6, 570, 119, 'Milo', '10000', '10000', '1', '17-03-2023', '17:10:03', NULL, '0', '0'),
(149, 2, 6, 570, 96, 'Hot beng beng', '10000', '10000', '1', '17-03-2023', '17:10:03', NULL, '0', '0'),
(150, 2, 6, 570, 123, 'Snack mix', '25000', '75000', '3', '17-03-2023', '17:10:03', NULL, '0', '0'),
(151, 2, 6, 570, 84, 'Dark chocholate', '10000', '20000', '2', '17-03-2023', '17:10:03', NULL, '0', '0'),
(152, 2, 6, 613, 89, 'Chocho malt', '10000', '10000', '1', '27-03-2023', '21:10:00', NULL, '0', '0'),
(153, 2, 6, 613, 118, 'Alpukat Milo', '12000', '12000', '1', '27-03-2023', '21:10:00', NULL, '0', '0'),
(154, 2, 6, 620, 82, 'Es teh', '4000', '16000', '4', '29-03-2023', '16:03:54', NULL, '0', '0'),
(155, 2, 6, 620, 49, 'Nasi ayam suwir', '5000', '10000', '2', '29-03-2023', '16:03:54', NULL, '0', '0'),
(156, 2, 6, 620, 51, 'Nasi bakar teri', '5000', '10000', '2', '29-03-2023', '16:03:54', NULL, '0', '0'),
(157, 2, 6, 620, 102, 'Le mineral', '2500', '5000', '2', '29-03-2023', '16:03:54', NULL, '0', '0'),
(158, 2, 6, 628, 98, 'Kopi hitam', '5000', '5000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(159, 2, 6, 628, 140, 'Ayam lodo', '25000', '25000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(160, 2, 6, 628, 158, 'Nasi teluyam', '12000', '12000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(161, 2, 6, 628, 131, 'Alpukat', '10000', '10000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(162, 2, 6, 628, 70, 'Soda gembira', '12000', '12000', '1', '04-04-2023', '19:09:12', NULL, '0', '0'),
(163, 2, 6, 628, 165, 'Josua', '7000', '7000', '1', '04-04-2023', '19:12:26', NULL, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `retur_promo_a`
--

CREATE TABLE `retur_promo_a` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `id_retur` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `retur_promo_b`
--

CREATE TABLE `retur_promo_b` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kasir` int(11) NOT NULL,
  `id_retur` int(11) NOT NULL,
  `nama_promo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_diskon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniqcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `retur_promo_c`
--

CREATE TABLE `retur_promo_c` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) DEFAULT NULL,
  `id_retur` int(15) DEFAULT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_promo` varchar(255) DEFAULT NULL,
  `harga_barang` varchar(255) DEFAULT NULL,
  `jumlah_beli` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT current_timestamp(6),
  `uniqcode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `satuan_bahan`
--

CREATE TABLE `satuan_bahan` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `satuan_bahan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_bahan` int(15) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `stok` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok_barang`
--

CREATE TABLE `stok_barang` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL,
  `total_semua` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stok_barang`
--

INSERT INTO `stok_barang` (`id`, `id_user`, `id_kasir`, `kode`, `tanggal`, `waktu`, `bulan`, `tahun`, `total_semua`) VALUES
(6, 1, 0, 'SB-2603220001', '26-03-2022', '14:57:43', '03', '2022', '100000'),
(7, 1, 0, 'SB-2603220002', '26-03-2022', '14:59:23', '03', '2022', '100000'),
(13, 2, 6, 'SB-1112220001', '11-12-2022', '04:30:32', '12', '2022', '32800000'),
(14, 2, 6, 'SB-1112220002', '11-12-2022', '05:05:04', '12', '2022', '5250000'),
(15, 2, 6, 'SB-1112220003', '11-12-2022', '05:30:14', '12', '2022', '25300000'),
(16, 2, 6, 'SB-1112220004', '11-12-2022', '05:55:54', '12', '2022', '33200000'),
(17, 2, 6, 'SB-1212220005', '12-12-2022', '09:36:59', '12', '2022', '250000'),
(18, 2, 6, 'SB-1312220006', '13-12-2022', '14:56:08', '12', '2022', '30000'),
(20, 2, 6, 'SB-1712220007', '17-12-2022', '13:11:49', '12', '2022', '72000'),
(21, 2, 6, 'SB-2012220008', '20-12-2022', '11:29:26', '12', '2022', '1000000'),
(22, 2, 6, 'SB-2112220009', '21-12-2022', '12:16:51', '12', '2022', '500000000'),
(23, 2, 6, 'SB-2412220010', '24-12-2022', '13:13:52', '12', '2022', '300000'),
(24, 2, 6, 'SB-2512220011', '25-12-2022', '12:08:56', '12', '2022', '750000'),
(25, 2, 6, 'SB-3112220012', '31-12-2022', '06:23:28', '12', '2022', '85000'),
(26, 2, 6, 'SB-3112220013', '31-12-2022', '06:23:58', '12', '2022', '70000'),
(27, 2, 6, 'SB-3112220014', '31-12-2022', '06:25:04', '12', '2022', '115000'),
(28, 2, 6, 'SB-3112220015', '31-12-2022', '06:25:49', '12', '2022', '165000'),
(29, 2, 6, 'SB-3112220016', '31-12-2022', '11:48:55', '12', '2022', '208000'),
(30, 2, 6, 'SB-0301230017', '03-01-2023', '10:27:02', '01', '2023', '800000'),
(31, 2, 6, 'SB-0301230017', '03-01-2023', '13:00:13', '01', '2023', '1200000'),
(32, 2, 6, 'SB-0301230017', '03-01-2023', '13:00:36', '01', '2023', '1000000'),
(33, 2, 6, 'SB-0301230017', '03-01-2023', '13:16:51', '01', '2023', '1000000'),
(34, 2, 6, 'SB-0401230017', '04-01-2023', '12:30:22', '01', '2023', '1000000'),
(35, 2, 6, 'SB-0501230017', '05-01-2023', '05:18:09', '01', '2023', '10400000'),
(36, 2, 6, 'SB-0501230017', '05-01-2023', '05:18:18', '01', '2023', '10400000'),
(37, 2, 6, 'SB-0501230017', '05-01-2023', '05:21:56', '01', '2023', '1000000'),
(38, 2, 6, 'SB-0701230017', '07-01-2023', '09:12:46', '01', '2023', '1300000'),
(39, 2, 6, 'SB-0801230017', '08-01-2023', '11:18:19', '01', '2023', '1000000'),
(40, 2, 6, 'SB-1201230017', '12-01-2023', '11:08:54', '01', '2023', '700000'),
(41, 2, 6, 'SB-1301230017', '13-01-2023', '10:12:10', '01', '2023', '1000000'),
(42, 2, 6, 'SB-1601230017', '16-01-2023', '08:32:37', '01', '2023', '2200000'),
(43, 2, 6, 'SB-1901230017', '19-01-2023', '05:46:54', '01', '2023', '500000'),
(44, 2, 6, 'SB-1901230017', '19-01-2023', '13:44:10', '01', '2023', '0'),
(45, 2, 6, 'SB-1901230017', '19-01-2023', '13:44:22', '01', '2023', '2500000'),
(46, 2, 6, 'SB-2001230017', '20-01-2023', '07:25:27', '01', '2023', '1200000'),
(47, 2, 6, 'SB-2101230017', '21-01-2023', '12:52:18', '01', '2023', '800000'),
(48, 2, 6, 'SB-2201230017', '22-01-2023', '11:52:39', '01', '2023', '1500000'),
(49, 2, 6, 'SB-2801230017', '28-01-2023', '13:01:06', '01', '2023', '400000'),
(50, 2, 6, 'SB-1402230017', '14-02-2023', '13:07:27', '02', '2023', '400000'),
(51, 2, 6, 'SB-1402230017', '14-02-2023', '13:09:46', '02', '2023', '200000'),
(52, 2, 6, 'SB-1502230017', '15-02-2023', '07:05:16', '02', '2023', '400000'),
(53, 2, 6, 'SB-1502230017', '15-02-2023', '12:56:31', '02', '2023', '600000'),
(54, 2, 6, 'SB-2802230017', '28-02-2023', '13:44:16', '02', '2023', '50492000'),
(55, 2, 6, 'SB-0203230017', '02-03-2023', '14:29:58', '03', '2023', '30000'),
(56, 2, 6, 'SB-1303230017', '13-03-2023', '12:54:56', '03', '2023', '500000'),
(57, 2, 6, 'SB-2103230017', '21-03-2023', '10:03:41', '03', '2023', '800000'),
(58, 2, 6, 'SB-2103230017', '21-03-2023', '10:25:08', '03', '2023', '1200000'),
(59, 2, 6, 'SB-2103230017', '21-03-2023', '13:33:53', '03', '2023', '1000000'),
(60, 2, 6, 'SB-2103230017', '21-03-2023', '13:39:19', '03', '2023', '1300000'),
(61, 2, 6, 'SB-2103230017', '21-03-2023', '14:46:25', '03', '2023', '12000'),
(62, 2, 6, 'SB-2503230017', '25-03-2023', '10:45:23', '03', '2023', '390000'),
(63, 2, 6, 'SB-2503230017', '25-03-2023', '10:45:42', '03', '2023', '420000'),
(64, 2, 6, 'SB-2703230017', '27-03-2023', '14:02:33', '03', '2023', '1400000'),
(65, 2, 6, 'SB-2703230017', '27-03-2023', '16:12:15', '03', '2023', '40000'),
(66, 2, 6, 'SB-0404230017', '04-04-2023', '12:11:45', '04', '2023', '700000'),
(67, 2, 6, 'SB-1104230017', '11-04-2023', '14:41:04', '04', '2023', '1400000'),
(68, 2, 6, 'SB-1104230017', '11-04-2023', '14:41:08', '04', '2023', '1400000');

-- --------------------------------------------------------

--
-- Table structure for table `stok_barang_detail`
--

CREATE TABLE `stok_barang_detail` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) NOT NULL,
  `id_stok_barang` int(15) DEFAULT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `jumlah` varchar(255) DEFAULT NULL,
  `harga_jual` varchar(255) DEFAULT NULL,
  `total_harga` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stok_barang_detail`
--

INSERT INTO `stok_barang_detail` (`id`, `id_user`, `id_kasir`, `id_stok_barang`, `id_barang`, `nama_barang`, `jumlah`, `harga_jual`, `total_harga`) VALUES
(6, 2, 0, 6, 4, 'Roti Bakar', '10', '10000', '100000'),
(7, 2, 0, 7, 5, 'Taro Ice', '10', '10000', '100000'),
(18, 2, 6, 13, 11, 'Roti maryam original ', '100', '8000', ''),
(19, 2, 6, 13, 12, 'Roti maryam chocolat', '100', '11000', '1100000'),
(20, 2, 6, 13, 13, 'Roti maryam keju', '100', '12000', '1200000'),
(21, 2, 6, 13, 14, 'Roti maryam spesial', '100', '16000', '1600000'),
(22, 2, 6, 13, 15, 'Roti bakar cokelat+keju', '100', '13000', '1300000'),
(23, 2, 6, 13, 16, 'Roti bakar cokelat+kacang', '100', '15000', '1500000'),
(24, 2, 6, 13, 17, 'Kentang', '100', '10000', '1000000'),
(25, 2, 6, 13, 18, 'Jamur crispy', '100', '12000', '1200000'),
(26, 2, 6, 13, 19, 'Tahu crispy', '100', '12000', '1200000'),
(27, 2, 6, 13, 20, 'Tahu walik', '100', '15000', '1500000'),
(28, 2, 6, 13, 21, 'Tahu cabe garam', '100', '15000', '1500000'),
(29, 2, 6, 13, 22, 'Tahu asin', '100', '12000', '1200000'),
(30, 2, 6, 13, 24, 'Seblak komplit', '100', '20000', '2000000'),
(31, 2, 6, 13, 25, 'Seblak seafood', '100', '15000', '1500000'),
(32, 2, 6, 13, 26, 'Seblak tulang', '100', '12000', '1200000'),
(33, 2, 6, 13, 27, 'Seblak mie', '100', '12000', '1200000'),
(34, 2, 6, 13, 28, 'Sayap judes', '100', '18000', '1800000'),
(35, 2, 6, 13, 29, 'Kepala judes', '100', '13000', '1300000'),
(36, 2, 6, 13, 30, 'Ceker judes', '100', '13000', '1300000'),
(37, 2, 6, 13, 31, 'Pentol kuah judes', '100', '13000', '1300000'),
(38, 2, 6, 13, 32, 'Pentol kering judes', '100', '13000', '1300000'),
(39, 2, 6, 13, 33, 'Pentol bakar', '100', '13000', '1300000'),
(40, 2, 6, 13, 34, 'Bakso aci', '100', '15000', '1500000'),
(41, 2, 6, 13, 35, 'Bakso aci frozen', '100', '12000', '1200000'),
(42, 2, 6, 13, 36, 'Omlet', '100', '12000', '1200000'),
(43, 2, 6, 13, 37, 'Nasi', '100', '4000', '400000'),
(44, 2, 6, 14, 38, 'Soto ayam ', '100', '5000', '500000'),
(45, 2, 6, 14, 39, 'Soto ayam ', '100', '10000', '1000000'),
(46, 2, 6, 14, 40, 'Usus', '100', '2000', '200000'),
(47, 2, 6, 14, 41, 'Ceker', '100', '2000', '200000'),
(48, 2, 6, 14, 42, 'Jeroan', '100', '2500', '250000'),
(49, 2, 6, 14, 43, 'Telur puyuh', '100', '3000', '300000'),
(50, 2, 6, 14, 44, 'Usus ', '100', '2000', '200000'),
(51, 2, 6, 14, 45, 'Ceker', '100', '2000', '200000'),
(52, 2, 6, 14, 46, 'Kepala', '100', '2000', '200000'),
(53, 2, 6, 14, 47, 'Sayap', '100', '4000', '400000'),
(54, 2, 6, 14, 48, 'Telur puyuh', '100', '3000', '300000'),
(55, 2, 6, 14, 49, 'Nasi ayam suwir', '100', '5000', '500000'),
(56, 2, 6, 14, 50, 'Nasi bakar tongkol', '100', '5000', '500000'),
(57, 2, 6, 14, 51, 'Nasi bakar teri', '100', '5000', '500000'),
(58, 2, 6, 15, 52, 'Mi goreng ori', '100', '10000', '1000000'),
(59, 2, 6, 15, 53, 'Mi goreng telur ', '100', '13000', '1300000'),
(60, 2, 6, 15, 54, 'Mi goreng ayam ', '100', '18000', '1800000'),
(61, 2, 6, 15, 55, 'Mi goreng spesial', '100', '23000', '2300000'),
(62, 2, 6, 15, 56, 'Mi nyemek', '100', '15000', '1500000'),
(63, 2, 6, 15, 57, 'Mi goreng indomie', '100', '6000', '600000'),
(64, 2, 6, 15, 58, 'Mi goreng soto', '100', '6000', '600000'),
(65, 2, 6, 15, 59, 'Bakmi', '100', '15000', '1500000'),
(66, 2, 6, 15, 60, 'Nasi goreng ori', '100', '10000', '1000000'),
(67, 2, 6, 15, 61, 'Nasi goreng telur', '100', '13000', '1300000'),
(68, 2, 6, 15, 62, 'Nasi goreng ayam ', '100', '13000', '1300000'),
(69, 2, 6, 15, 63, 'Nasi goreng spesial', '100', '23000', '2300000'),
(70, 2, 6, 15, 64, 'Lalapan 3T', '100', '10000', '1000000'),
(71, 2, 6, 15, 65, 'Lalapan lele', '100', '15000', '1500000'),
(72, 2, 6, 15, 66, 'Lalapan mujaer', '100', '20000', '2000000'),
(73, 2, 6, 15, 67, 'Lalapan ayam kampung', '100', '25000', '2500000'),
(74, 2, 6, 15, 68, 'Lalapan ayam potong', '100', '18000', '1800000'),
(75, 2, 6, 16, 69, 'Mega mendung', '100', '12000', '1200000'),
(76, 2, 6, 16, 70, 'Soda gembira', '100', '12000', '1200000'),
(77, 2, 6, 16, 71, 'Lemon squash', '100', '12000', '1200000'),
(78, 2, 6, 16, 72, 'Leci squash', '100', '12000', '1200000'),
(79, 2, 6, 16, 73, 'Melon squash', '100', '12000', '1200000'),
(80, 2, 6, 16, 74, 'Chochopandan squash', '100', '12000', '1200000'),
(81, 2, 6, 16, 75, 'Milk shake chocolate', '100', '15000', '1500000'),
(82, 2, 6, 16, 76, 'Milk shake vanila', '100', '15000', '1500000'),
(83, 2, 6, 16, 77, 'Milk shake strawberry', '100', '15000', '1500000'),
(84, 2, 6, 16, 78, 'Milk shake oreo', '100', '15000', '1500000'),
(85, 2, 6, 16, 79, 'Thaitea', '100', '10000', '1000000'),
(86, 2, 6, 16, 80, 'Lemon tea', '100', '10000', '1000000'),
(87, 2, 6, 16, 81, 'Tea tarik', '100', '8000', '800000'),
(88, 2, 6, 16, 82, 'Es teh', '100', '4000', '400000'),
(89, 2, 6, 16, 83, 'Es jeruk', '100', '6000', '600000'),
(90, 2, 6, 16, 84, 'Dark chocholate', '100', '10000', '1000000'),
(91, 2, 6, 16, 85, 'Mangga', '100', '10000', '1000000'),
(92, 2, 6, 16, 86, 'Strawberry', '100', '10000', '1000000'),
(93, 2, 6, 16, 87, 'Taro', '100', '10000', '1000000'),
(94, 2, 6, 16, 88, 'Matcha', '100', '10000', '1000000'),
(95, 2, 6, 16, 89, 'Chocho malt', '100', '10000', '1000000'),
(96, 2, 6, 16, 90, 'Es cokelat roti', '100', '12000', '1200000'),
(97, 2, 6, 16, 91, 'Teh panas', '100', '4000', '400000'),
(98, 2, 6, 16, 92, 'Jeruk panas', '100', '6000', '600000'),
(99, 2, 6, 16, 93, 'Hot chochalate', '100', '13000', '1300000'),
(100, 2, 6, 16, 94, 'Hot capucino', '100', '10000', '1000000'),
(101, 2, 6, 16, 95, 'Hot matcha', '100', '10000', '1000000'),
(102, 2, 6, 16, 96, 'Hot beng beng', '100', '10000', '1000000'),
(103, 2, 6, 16, 97, 'Hot chocholatos', '100', '10000', '1000000'),
(104, 2, 6, 16, 98, 'Kopi hitam', '100', '5000', '500000'),
(105, 2, 6, 16, 99, 'Kopi robusta', '100', '7000', '700000'),
(106, 2, 6, 16, 100, 'Wedang jahe', '100', '7000', '700000'),
(107, 2, 6, 16, 101, 'Jahe susu', '100', '8000', '800000'),
(108, 2, 6, 17, 102, 'Le mineral', '100', '2500', '250000'),
(109, 2, 6, 18, 104, 'Krupuk', '10', '3000', '30000'),
(111, 2, 6, 20, 104, 'Krupuk', '36', '2000', '72000'),
(112, 2, 6, 21, 105, 'Brown sugar', '100', '10000', '1000000'),
(113, 2, 6, 22, 106, 'Gula aren ', '50000', '10000', '500000000'),
(114, 2, 6, 23, 107, 'Kopi susu', '50', '6000', '300000'),
(115, 2, 6, 24, 108, 'Roti maryam coklat keju', '50', '15000', '750000'),
(116, 2, 6, 25, 112, 'Makaroni bantet', '17', '5000', '85000'),
(117, 2, 6, 26, 109, 'Sehati snack', '7', '10000', '70000'),
(118, 2, 6, 27, 110, 'Basreng snack', '23', '5000', '115000'),
(119, 2, 6, 28, 111, 'Krupuk seblak', '33', '5000', '165000'),
(120, 2, 6, 29, 113, 'Happytos', '16', '13000', '208000'),
(121, 2, 6, 30, 114, 'Susu panas ', '100', '8000', '800000'),
(122, 2, 6, 31, 116, 'Es milo dino', '100', '12000', '1200000'),
(123, 2, 6, 32, 115, 'Es white coffe', '100', '10000', '1000000'),
(124, 2, 6, 33, 117, 'Es teler', '100', '10000', '1000000'),
(125, 2, 6, 34, 118, 'Alpukat Milo', '100', '10000', '1000000'),
(126, 2, 6, 35, 123, 'Snack mix', '100', '25000', '2500000'),
(127, 2, 6, 35, 126, 'Tempura judes', '100', '13000', '1300000'),
(128, 2, 6, 35, 124, 'Tahu kucek', '100', '10000', '1000000'),
(129, 2, 6, 35, 125, 'Seblak krupuk', '100', '18000', '1800000'),
(130, 2, 6, 35, 121, 'Coffe n cream', '100', '12000', '1200000'),
(131, 2, 6, 35, 116, 'Es milo dino', '50', '12000', '600000'),
(132, 2, 6, 35, 118, 'Alpukat Milo', '50', '10000', '500000'),
(133, 2, 6, 35, 117, 'Es teler', '50', '10000', '500000'),
(134, 2, 6, 35, 122, 'Bubble gum', '50', '10000', '500000'),
(135, 2, 6, 35, 105, 'Brown sugar', '50', '10000', '500000'),
(136, 2, 6, 35, 0, '', '', '', ''),
(137, 2, 6, 36, 123, 'Snack mix', '100', '25000', '2500000'),
(138, 2, 6, 36, 126, 'Tempura judes', '100', '13000', '1300000'),
(139, 2, 6, 36, 124, 'Tahu kucek', '100', '10000', '1000000'),
(140, 2, 6, 36, 125, 'Seblak krupuk', '100', '18000', '1800000'),
(141, 2, 6, 36, 121, 'Coffe n cream', '100', '12000', '1200000'),
(142, 2, 6, 36, 116, 'Es milo dino', '50', '12000', '600000'),
(143, 2, 6, 36, 118, 'Alpukat Milo', '50', '10000', '500000'),
(144, 2, 6, 36, 117, 'Es teler', '50', '10000', '500000'),
(145, 2, 6, 36, 122, 'Bubble gum', '50', '10000', '500000'),
(146, 2, 6, 36, 105, 'Brown sugar', '50', '10000', '500000'),
(147, 2, 6, 37, 120, 'Es beng beng', '100', '10000', '1000000'),
(148, 2, 6, 38, 129, 'Ayam geprek', '100', '13000', '1300000'),
(149, 2, 6, 39, 119, 'Milo', '100', '10000', '1000000'),
(150, 2, 6, 40, 130, 'KSTG', '100', '7000', '700000'),
(151, 2, 6, 41, 131, 'Alpukat', '100', '10000', '1000000'),
(152, 2, 6, 42, 132, 'Seblak ceker', '100', '22000', '2200000'),
(153, 2, 6, 43, 49, 'Nasi ayam suwir', '100', '5000', '500000'),
(154, 2, 6, 44, 66, 'Lalapan mujaer', '', '25000', '0'),
(155, 2, 6, 45, 66, 'Lalapan mujaer', '100', '25000', '2500000'),
(156, 2, 6, 46, 133, 'Bakso sayur', '100', '12000', '1200000'),
(157, 2, 6, 47, 103, 'Es susu', '100', '8000', '800000'),
(158, 2, 6, 48, 134, 'Jus semangka', '100', '8000', '800000'),
(159, 2, 6, 48, 135, 'Jus jambu', '100', '7000', '700000'),
(160, 2, 6, 49, 82, 'Es teh', '100', '4000', '400000'),
(161, 2, 6, 50, 136, 'Tahu', '100', '2000', '200000'),
(162, 2, 6, 50, 137, 'Tempe', '100', '2000', '200000'),
(163, 2, 6, 51, 44, 'Usus ', '100', '2000', '200000'),
(164, 2, 6, 52, 138, 'Nasi', '100', '4000', '400000'),
(165, 2, 6, 53, 139, 'Sosis bakar', '100', '6000', '600000'),
(166, 2, 6, 54, 67, 'Ayam laos', '14', '25000', '350000'),
(167, 2, 6, 54, 140, 'Ayam lodo', '11', '25000', '275000'),
(168, 2, 6, 54, 141, 'Ayam rica rica', '11', '32000', '352000'),
(169, 2, 6, 54, 142, 'Iga penyet', '7', '28000', '196000'),
(170, 2, 6, 54, 143, 'Sop iga', '6', '30000', '180000'),
(171, 2, 6, 54, 146, 'Bakso udang', '46', '2000', '92000'),
(172, 2, 6, 54, 147, 'Fisrol', '22', '2000', '44000'),
(173, 2, 6, 54, 148, 'Dubling', '12000', '4000', '48000000'),
(174, 2, 6, 54, 149, 'Cikuwa', '33', '3000', '99000'),
(175, 2, 6, 54, 150, 'Cedea', '28', '2000', '56000'),
(176, 2, 6, 54, 151, 'Sosis ', '74', '1000', '74000'),
(177, 2, 6, 54, 152, 'Tempura', '35', '2000', '70000'),
(178, 2, 6, 54, 153, 'Odeng', '40', '2000', '80000'),
(179, 2, 6, 54, 154, 'Bakso ikan', '33', '2000', '66000'),
(180, 2, 6, 54, 155, 'Bakso sapi ', '28', '3000', '84000'),
(181, 2, 6, 54, 145, 'Bebek rica rica', '8', '28000', '224000'),
(182, 2, 6, 54, 144, 'Bebek goreng', '10', '25000', '250000'),
(183, 2, 6, 55, 156, 'Cumi flower', '15', '2000', '30000'),
(184, 2, 6, 56, 98, 'Kopi hitam', '100', '5000', '500000'),
(185, 2, 6, 57, 157, 'Jus melon', '100', '8000', '800000'),
(186, 2, 6, 58, 158, 'Nasi teluyam', '100', '12000', '1200000'),
(187, 2, 6, 59, 159, 'Es kopi susu', '100', '10000', '1000000'),
(188, 2, 6, 60, 160, 'Sosis tempura', '100', '13000', '1300000'),
(189, 2, 6, 61, 161, 'Mineral', '4', '3000', '12000'),
(190, 2, 6, 62, 162, 'Paket teluyam', '30', '13000', '390000'),
(191, 2, 6, 63, 163, 'Paket ayam geprek', '30', '14000', '420000'),
(192, 2, 6, 64, 164, 'Iga bakar', '50', '28000', '1400000'),
(193, 2, 6, 65, 40, 'Usus', '20', '2000', '40000'),
(194, 2, 6, 66, 165, 'Josua', '100', '7000', '700000'),
(195, 2, 6, 67, 163, 'Paket ayam geprek', '100', '14000', '1400000'),
(196, 2, 6, 67, 0, '', '', '', ''),
(197, 2, 6, 68, 163, 'Paket ayam geprek', '100', '14000', '1400000');

-- --------------------------------------------------------

--
-- Table structure for table `stok_keluar`
--

CREATE TABLE `stok_keluar` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `kode_stok_keluar` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `total_semua` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok_keluar_detail`
--

CREATE TABLE `stok_keluar_detail` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `id_stok_keluar` varchar(255) DEFAULT NULL,
  `id_bahan` varchar(255) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `jumlah_keluar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok_masuk`
--

CREATE TABLE `stok_masuk` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `kode_stok_masuk` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `total_semua` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok_masuk_detail`
--

CREATE TABLE `stok_masuk_detail` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `id_stok_masuk` varchar(255) DEFAULT NULL,
  `id_bahan` varchar(255) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `jumlah_beli` varchar(255) DEFAULT NULL,
  `harga_beli` varchar(255) DEFAULT NULL,
  `total_harga_beli` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok_opname`
--

CREATE TABLE `stok_opname` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) NOT NULL,
  `kode` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `waktu` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stok_opname`
--

INSERT INTO `stok_opname` (`id`, `id_user`, `id_kasir`, `kode`, `tanggal`, `waktu`, `bulan`, `tahun`) VALUES
(9, 2, 5, 'SP-2803220001', '28-03-2022', '07:02:35', '03', '2022'),
(10, 2, 2, 'SP-1804220002', '18-04-2022', '10:15:00', '04', '2022'),
(11, 2, 5, 'SP-1804220002', '18-04-2022', '10:38:36', '04', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `stok_opname_detail`
--

CREATE TABLE `stok_opname_detail` (
  `id` int(15) NOT NULL,
  `id_stok_opname` int(15) DEFAULT NULL,
  `id_user` int(15) DEFAULT NULL,
  `id_kasir` int(15) NOT NULL,
  `id_barang` int(15) DEFAULT NULL,
  `nama_barang` varchar(255) DEFAULT NULL,
  `stok_sistem` varchar(255) DEFAULT NULL,
  `stok_dapur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `stok_opname_detail`
--

INSERT INTO `stok_opname_detail` (`id`, `id_stok_opname`, `id_user`, `id_kasir`, `id_barang`, `nama_barang`, `stok_sistem`, `stok_dapur`) VALUES
(10, 9, 2, 5, 4, 'Roti Bakar', '8', '9'),
(11, 10, 2, 2, 5, 'Taro Ice', '8', '5'),
(12, 10, 2, 2, 4, 'Roti Bakar', '9', '7'),
(13, 11, 2, 5, 4, 'Roti Bakar', '7', '6');

-- --------------------------------------------------------

--
-- Table structure for table `stok_penjualan_detail`
--

CREATE TABLE `stok_penjualan_detail` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `id_pembayaran` varchar(255) DEFAULT NULL,
  `id_bahan` varchar(255) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `jumlah` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `stok_retur_detail`
--

CREATE TABLE `stok_retur_detail` (
  `id` int(15) NOT NULL,
  `id_user` varchar(255) DEFAULT NULL,
  `id_retur` varchar(255) DEFAULT NULL,
  `id_bahan` varchar(255) DEFAULT NULL,
  `nama_bahan` varchar(255) DEFAULT NULL,
  `jumlah` varchar(255) DEFAULT NULL,
  `tanggal` varchar(255) DEFAULT NULL,
  `bulan` varchar(255) DEFAULT NULL,
  `tahun` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `struk`
--

CREATE TABLE `struk` (
  `id` int(15) NOT NULL,
  `logo_struk` varchar(255) DEFAULT NULL,
  `tampil_facebook` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `tampil_instagram` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `tampil_twitter` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `nama_cafe` varchar(255) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_telp` varchar(255) DEFAULT NULL,
  `footer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `struk`
--

INSERT INTO `struk` (`id`, `logo_struk`, `tampil_facebook`, `facebook`, `tampil_instagram`, `instagram`, `tampil_twitter`, `twitter`, `keterangan`, `nama_cafe`, `alamat`, `no_telp`, `footer`) VALUES
(2, 'IMG-20221122-WA0005.png', '1', 'ByCafe Coffe eatery', '1', 'bycafe_coffeneatery', '0', '', NULL, 'By Cafe', 'Jl. Musi No. 12 sekarputih sumberjo lumajang\r\n(DEPAN KAMPUS UNILU)', '081234744399', '#bycafe');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apikey` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refresh_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `id_user`, `token`, `apikey`, `refresh_code`, `expired`, `created_at`) VALUES
(144, 3, '1448c0b725cd76d8b329a3620b0afdef', '43231413afdf1786aca8d76a20949b20', '5dbb8b577a3b6', '2019-11-03 08:33:11', '2019-11-01 08:33:11'),
(170, 2, '1c2131ecbedd7b28c4bfe60e61ec24bd', 'b5291a398aeeb6c4f93cffab296843db', '5df2ed357b20f', '2019-12-15 08:45:25', '2019-12-13 08:45:25');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(15) NOT NULL,
  `id_user` int(15) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `nama_toko` varchar(255) DEFAULT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `no_telepon` varchar(255) DEFAULT NULL,
  `ktp` varchar(255) DEFAULT NULL,
  `status_login` int(255) NOT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `id_level` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `id_user`, `username`, `password`, `level`, `nama_toko`, `nama_lengkap`, `alamat`, `updated_at`, `no_telepon`, `ktp`, `status_login`, `latitude`, `longitude`, `created_at`, `login_time`, `id_level`) VALUES
(5, 2, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Owner', 'Resto', 'ADMIN', 'LUMAJANG', '26-03-22 09:19:36', '0334', 'no_avatar.jpg', 0, NULL, NULL, '26-03-22 09:19:20', '2022-11-25 10:47:53', 2),
(6, 2, 'syahrudin', 'c7911af3adbd12a035b289556d96470a', 'Kasir', 'BY CAFE', 'Syahrudin', '-', '21-12-22 01:48:12', '-', 'no_avatar.jpg', 0, NULL, NULL, '05-12-22 01:33:24', '2022-12-21 06:48:12', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bahan`
--
ALTER TABLE `bahan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `bonus_pegawai`
--
ALTER TABLE `bonus_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hutang_pegawai`
--
ALTER TABLE `hutang_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ijin_pegawai`
--
ALTER TABLE `ijin_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `kelola_bahan`
--
ALTER TABLE `kelola_bahan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu_1`
--
ALTER TABLE `menu_1`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu_2`
--
ALTER TABLE `menu_2`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `menu_3`
--
ALTER TABLE `menu_3`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pelanggaran_pegawai`
--
ALTER TABLE `pelanggaran_pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pembayaran_detail`
--
ALTER TABLE `pembayaran_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pembayaran_detail_copy1`
--
ALTER TABLE `pembayaran_detail_copy1`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pembayaran_detail_hapus`
--
ALTER TABLE `pembayaran_detail_hapus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran_hapus`
--
ALTER TABLE `pembayaran_hapus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembayaran_promo_a`
--
ALTER TABLE `pembayaran_promo_a`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pembayaran_promo_b`
--
ALTER TABLE `pembayaran_promo_b`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pembayaran_promo_c`
--
ALTER TABLE `pembayaran_promo_c`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pengaturan_hak_akses`
--
ALTER TABLE `pengaturan_hak_akses`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `printer`
--
ALTER TABLE `printer`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promo_a`
--
ALTER TABLE `promo_a`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promo_b`
--
ALTER TABLE `promo_b`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `promo_c`
--
ALTER TABLE `promo_c`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `rekap_kas`
--
ALTER TABLE `rekap_kas`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `rekap_kas_detail`
--
ALTER TABLE `rekap_kas_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `retur_detail`
--
ALTER TABLE `retur_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `retur_promo_a`
--
ALTER TABLE `retur_promo_a`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `retur_promo_b`
--
ALTER TABLE `retur_promo_b`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `retur_promo_c`
--
ALTER TABLE `retur_promo_c`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `satuan_bahan`
--
ALTER TABLE `satuan_bahan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_barang`
--
ALTER TABLE `stok_barang`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_barang_detail`
--
ALTER TABLE `stok_barang_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_keluar`
--
ALTER TABLE `stok_keluar`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_keluar_detail`
--
ALTER TABLE `stok_keluar_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_masuk_detail`
--
ALTER TABLE `stok_masuk_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_opname`
--
ALTER TABLE `stok_opname`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_opname_detail`
--
ALTER TABLE `stok_opname_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_penjualan_detail`
--
ALTER TABLE `stok_penjualan_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `stok_retur_detail`
--
ALTER TABLE `stok_retur_detail`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `struk`
--
ALTER TABLE `struk`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bahan`
--
ALTER TABLE `bahan`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `bonus_pegawai`
--
ALTER TABLE `bonus_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hutang_pegawai`
--
ALTER TABLE `hutang_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ijin_pegawai`
--
ALTER TABLE `ijin_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `kelola_bahan`
--
ALTER TABLE `kelola_bahan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `meja`
--
ALTER TABLE `meja`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `menu_1`
--
ALTER TABLE `menu_1`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `menu_2`
--
ALTER TABLE `menu_2`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `menu_3`
--
ALTER TABLE `menu_3`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggaran_pegawai`
--
ALTER TABLE `pelanggaran_pegawai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=700;

--
-- AUTO_INCREMENT for table `pembayaran_detail`
--
ALTER TABLE `pembayaran_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2233;

--
-- AUTO_INCREMENT for table `pembayaran_detail_copy1`
--
ALTER TABLE `pembayaran_detail_copy1`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `pembayaran_detail_hapus`
--
ALTER TABLE `pembayaran_detail_hapus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `pembayaran_hapus`
--
ALTER TABLE `pembayaran_hapus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pembayaran_promo_a`
--
ALTER TABLE `pembayaran_promo_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran_promo_b`
--
ALTER TABLE `pembayaran_promo_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran_promo_c`
--
ALTER TABLE `pembayaran_promo_c`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pengaturan_hak_akses`
--
ALTER TABLE `pengaturan_hak_akses`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printer`
--
ALTER TABLE `printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `promo_a`
--
ALTER TABLE `promo_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_b`
--
ALTER TABLE `promo_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promo_c`
--
ALTER TABLE `promo_c`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rekap_kas`
--
ALTER TABLE `rekap_kas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rekap_kas_detail`
--
ALTER TABLE `rekap_kas_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retur`
--
ALTER TABLE `retur`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `retur_detail`
--
ALTER TABLE `retur_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `retur_promo_a`
--
ALTER TABLE `retur_promo_a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retur_promo_b`
--
ALTER TABLE `retur_promo_b`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retur_promo_c`
--
ALTER TABLE `retur_promo_c`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `satuan_bahan`
--
ALTER TABLE `satuan_bahan`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_barang`
--
ALTER TABLE `stok_barang`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `stok_barang_detail`
--
ALTER TABLE `stok_barang_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `stok_keluar`
--
ALTER TABLE `stok_keluar`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_keluar_detail`
--
ALTER TABLE `stok_keluar_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_masuk`
--
ALTER TABLE `stok_masuk`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_masuk_detail`
--
ALTER TABLE `stok_masuk_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_opname`
--
ALTER TABLE `stok_opname`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stok_opname_detail`
--
ALTER TABLE `stok_opname_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `stok_penjualan_detail`
--
ALTER TABLE `stok_penjualan_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stok_retur_detail`
--
ALTER TABLE `stok_retur_detail`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `struk`
--
ALTER TABLE `struk`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
