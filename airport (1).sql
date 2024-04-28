-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 28 Apr 2024 pada 06.30
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airport`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `user_name` varchar(30) NOT NULL,
  `admin_id` varchar(30) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`first_name`, `last_name`, `user_name`, `admin_id`, `password`) VALUES
('sonya', 'alexandra', 'sonya14', '170705', 'pass1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `airlines`
--

CREATE TABLE `airlines` (
  `airline_name` varchar(30) NOT NULL,
  `no_of_planes` int(11) DEFAULT NULL,
  `no_of_pilots` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `airlines`
--

INSERT INTO `airlines` (`airline_name`, `no_of_planes`, `no_of_pilots`) VALUES
('Air Asia', 30, 50),
('Air France', 35, 110),
('American Airlines', 40, 120),
('British Airways', 42, 130),
('Cathay Pacific', 20, 70),
('Delta Air Lines', 50, 150),
('Emirates', 30, 100),
('Lufthansa', 45, 140),
('Qatar Airways', 25, 80),
('Singapore Airlines', 28, 90),
('United Airlines', 60, 180);

-- --------------------------------------------------------

--
-- Struktur dari tabel `booked_flights`
--

CREATE TABLE `booked_flights` (
  `username` varchar(30) DEFAULT NULL,
  `flight_id` varchar(30) DEFAULT NULL,
  `ticket_number` int(11) NOT NULL,
  `price` decimal(7,5) DEFAULT NULL,
  `seat_number` varchar(30) DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `flights`
--

CREATE TABLE `flights` (
  `flight_id` varchar(30) NOT NULL,
  `source` varchar(30) DEFAULT NULL,
  `destination` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `boarding_time` time DEFAULT NULL,
  `airline` varchar(30) DEFAULT NULL,
  `pilot_id` varchar(30) DEFAULT NULL,
  `hangar_id` varchar(30) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `booked` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `flights`
--

INSERT INTO `flights` (`flight_id`, `source`, `destination`, `date`, `boarding_time`, `airline`, `pilot_id`, `hangar_id`, `capacity`, `booked`) VALUES
('1', 'Madrid', 'Rome', '2024-12-15', '12:00:00', 'Emirates', '1', 'HNGR001', 10, 0),
('2', 'Tokyo', 'Seoul', '2024-12-16', '14:30:00', 'United Airlines', '2', 'HNGR002', 10, 0),
('3', 'Jakarta', 'Singapore', '2024-12-17', '10:45:00', 'Singapore Airlines', '3', 'HNGR003', 10, 0),
('4', 'Canada', 'Toronto', '2024-12-18', '08:00:00', 'American Airlines', '4', 'HNGR004', 10, 0),
('5', 'Los Angeles', 'London', '2024-12-19', '16:15:00', 'British Airways', '5', 'HNGR005', 10, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pilots`
--

CREATE TABLE `pilots` (
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `pilot_id` varchar(30) NOT NULL,
  `airline_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pilots`
--

INSERT INTO `pilots` (`first_name`, `last_name`, `pilot_id`, `airline_name`) VALUES
('John', 'Smith', '1', 'Delta Air Lines'),
('Olivia', 'Anderson', '10', 'British Airways'),
('Emily', 'Johnson', '2', 'United Airlines'),
('Michael', 'Williams', '3', 'American Airlines'),
('Jessica', 'Jones', '4', 'Lufthansa'),
('David', 'Brown', '5', 'Emirates'),
('Jennifer', 'Davis', '6', 'Air France'),
('Daniel', 'Miller', '7', 'Qatar Airways'),
('Emma', 'Wilson', '8', 'Singapore Airlines'),
('Christopher', 'Moore', '9', 'Cathay Pacific');

-- --------------------------------------------------------

--
-- Struktur dari tabel `registration_code`
--

CREATE TABLE `registration_code` (
  `registration_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `registration_code`
--

INSERT INTO `registration_code` (`registration_code`) VALUES
('random');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `ticket_number` int(11) NOT NULL,
  `flight_id` varchar(30) DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `seat_number` varchar(30) DEFAULT NULL,
  `class` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `tickets`
--

INSERT INTO `tickets` (`ticket_number`, `flight_id`, `price`, `seat_number`, `class`) VALUES
(1, '1', 2500000.00, 'A1', 'Business'),
(2, '1', 5500000.00, 'A2', 'First Class'),
(3, '1', 5500000.00, 'B1', 'First Class'),
(4, '1', 1500000.00, 'B2', 'Economy'),
(5, '1', 1500000.00, 'C1', 'Economy'),
(6, '1', 1500000.00, 'C2', 'Economy'),
(7, '1', 1500000.00, 'D1', 'Economy'),
(8, '1', 1500000.00, 'D2', 'Economy'),
(9, '1', 1500000.00, 'E1', 'Economy'),
(10, '1', 1500000.00, 'E2', 'Economy'),
(11, '2', 2500000.00, 'A1', 'Business'),
(12, '2', 2500000.00, 'A2', 'Business'),
(13, '2', 1500000.00, 'B1', 'Economy'),
(14, '2', 5500000.00, 'B2', 'First Class'),
(15, '2', 1500000.00, 'C1', 'Economy'),
(16, '2', 1500000.00, 'C2', 'Economy'),
(17, '2', 5500000.00, 'D1', 'First Class'),
(18, '2', 1500000.00, 'D2', 'Economy'),
(19, '2', 1500000.00, 'E1', 'Economy'),
(20, '2', 1500000.00, 'E2', 'Economy'),
(21, '3', 2500000.00, 'A1', 'Business'),
(22, '3', 2500000.00, 'A2', 'Business'),
(23, '3', 1500000.00, 'B1', 'Economy'),
(24, '3', 1500000.00, 'B2', 'Economy'),
(25, '3', 1500000.00, 'C1', 'Economy'),
(26, '3', 5500000.00, 'C2', 'First Class'),
(27, '3', 1500000.00, 'D1', 'Economy'),
(28, '3', 1500000.00, 'D2', 'Economy'),
(29, '3', 1500000.00, 'E1', 'Economy'),
(30, '3', 1500000.00, 'E2', 'Economy'),
(31, '4', 2500000.00, 'A1', 'Business'),
(32, '4', 2500000.00, 'A2', 'Business'),
(33, '4', 1500000.00, 'B1', 'Economy'),
(34, '4', 1500000.00, 'B2', 'Economy'),
(35, '4', 1500000.00, 'C1', 'Economy'),
(36, '4', 1500000.00, 'C2', 'Economy'),
(37, '4', 5500000.00, 'D1', 'First Class'),
(38, '4', 1500000.00, 'D2', 'Economy'),
(39, '4', 1500000.00, 'E1', 'Economy'),
(40, '4', 5500000.00, 'E2', 'First Class'),
(41, '5', 2500000.00, 'A1', 'Business'),
(42, '5', 2500000.00, 'A2', 'Business'),
(43, '5', 1500000.00, 'B1', 'Economy'),
(44, '5', 1500000.00, 'B2', 'Economy'),
(45, '5', 5500000.00, 'C1', 'First Class'),
(46, '5', 5500000.00, 'C2', 'First Class'),
(47, '5', 1500000.00, 'D1', 'Economy'),
(48, '5', 1500000.00, 'D2', 'Economy'),
(49, '5', 1500000.00, 'E1', 'Economy'),
(50, '5', 2500000.00, 'A6', 'Business');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `passport` varchar(30) DEFAULT NULL,
  `nid` varchar(30) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`first_name`, `last_name`, `username`, `passport`, `nid`, `date_of_birth`, `city`, `country`, `phone_no`, `email`, `password`) VALUES
('aroliani', '', 'user1', 'temppass', 'tempnid', '2001-08-08', 'seoul', 'south korea', 1730495601, 'aro@gmail.com', 'pass1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Indeks untuk tabel `airlines`
--
ALTER TABLE `airlines`
  ADD PRIMARY KEY (`airline_name`),
  ADD UNIQUE KEY `airline_name` (`airline_name`);

--
-- Indeks untuk tabel `booked_flights`
--
ALTER TABLE `booked_flights`
  ADD PRIMARY KEY (`ticket_number`),
  ADD KEY `username` (`username`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indeks untuk tabel `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`flight_id`),
  ADD UNIQUE KEY `flight_id` (`flight_id`),
  ADD KEY `pilot_id` (`pilot_id`),
  ADD KEY `hangar_id` (`hangar_id`),
  ADD KEY `airline` (`airline`);

--
-- Indeks untuk tabel `pilots`
--
ALTER TABLE `pilots`
  ADD PRIMARY KEY (`pilot_id`),
  ADD UNIQUE KEY `pilot_id` (`pilot_id`),
  ADD KEY `airline_name` (`airline_name`);

--
-- Indeks untuk tabel `registration_code`
--
ALTER TABLE `registration_code`
  ADD PRIMARY KEY (`registration_code`),
  ADD UNIQUE KEY `registration_code` (`registration_code`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_number`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `booked_flights`
--
ALTER TABLE `booked_flights`
  ADD CONSTRAINT `booked_flights_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `booked_flights_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`);

--
-- Ketidakleluasaan untuk tabel `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`pilot_id`) REFERENCES `pilots` (`pilot_id`),
  ADD CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`hangar_id`) REFERENCES `hangar` (`hangar_id`),
  ADD CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`airline`) REFERENCES `airlines` (`airline_name`);

--
-- Ketidakleluasaan untuk tabel `pilots`
--
ALTER TABLE `pilots`
  ADD CONSTRAINT `pilots_ibfk_1` FOREIGN KEY (`airline_name`) REFERENCES `airlines` (`airline_name`);

--
-- Ketidakleluasaan untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
