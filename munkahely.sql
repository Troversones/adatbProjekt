-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 16. 23:40
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `munkahely`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

CREATE TABLE `felhasznalo` (
  `email` varchar(255) NOT NULL,
  `szobaszam` int(11) NOT NULL,
  `nev` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `jelszo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`email`, `szobaszam`, `nev`, `admin`, `jelszo`) VALUES
('user1@example.com', 101, 'Kiss János', 0, 'password123'),
('user10@example.com', 201, 'Takács Ágnes', 0, 'password123'),
('user11@example.com', 202, 'Hegedűs Kata', 0, 'password123'),
('user12@example.com', 203, 'Horváth Zoltán', 0, 'password123'),
('user13@example.com', 204, 'Balogh Éva', 1, 'admin123'),
('user14@example.com', 205, 'Simon Attila', 0, 'password123'),
('user15@example.com', 204, 'Lukács Gergő', 0, 'password123'),
('user2@example.com', 102, 'Nagy Anna', 0, 'password123'),
('user3@example.com', 103, 'Szabó Péter', 1, 'admin123'),
('user4@example.com', 101, 'Tóth Mária', 0, 'password123'),
('user5@example.com', 102, 'Varga Tamás', 0, 'password123'),
('user6@example.com', 103, 'Kovács Eszter', 1, 'admin123'),
('user7@example.com', 104, 'Molnár Gábor', 0, 'password123'),
('user8@example.com', 105, 'Farkas Nóra', 0, 'password123'),
('user9@example.com', 201, 'Bíró László', 0, 'password123');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `foglalas`
--

CREATE TABLE `foglalas` (
  `foglalas_id` int(11) NOT NULL,
  `felhasznalo` varchar(50) NOT NULL,
  `teremszam` int(11) NOT NULL,
  `kezdet` datetime NOT NULL,
  `veg` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `foglalas`
--

INSERT INTO `foglalas` (`foglalas_id`, `felhasznalo`, `teremszam`, `kezdet`, `veg`) VALUES
(1, 'user1@example.com', 201, '2024-11-15 10:00:00', '2024-11-15 12:00:00'),
(2, 'user2@example.com', 202, '2024-11-16 14:00:00', '2024-11-16 16:00:00'),
(3, 'user1@example.com', 203, '2024-11-17 09:00:00', '2024-11-17 11:00:00'),
(4, 'user3@example.com', 204, '2024-11-18 15:00:00', '2024-11-18 17:00:00'),
(5, 'user4@example.com', 205, '2024-11-19 08:00:00', '2024-11-19 10:00:00');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `helyiseg`
--

CREATE TABLE `helyiseg` (
  `szobaszam` int(11) NOT NULL,
  `tipus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `helyiseg`
--

INSERT INTO `helyiseg` (`szobaszam`, `tipus`) VALUES
(101, 'Iroda'),
(102, 'Iroda'),
(103, 'Iroda'),
(104, 'Iroda'),
(105, 'Iroda'),
(201, 'Kongresszusi Terem'),
(202, 'Kongresszusi Terem'),
(203, 'Kongresszusi Terem'),
(204, 'Kongresszusi Terem'),
(205, 'Kongresszusi Terem');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `iroda`
--

CREATE TABLE `iroda` (
  `szobaszam` int(11) NOT NULL,
  `dolgozok_szama` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `iroda`
--

INSERT INTO `iroda` (`szobaszam`, `dolgozok_szama`) VALUES
(101, 4),
(102, 6),
(103, 3),
(104, 5),
(105, 2);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kongresszusi_terem`
--

CREATE TABLE `kongresszusi_terem` (
  `szobaszam` int(11) NOT NULL,
  `ferohely` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kongresszusi_terem`
--

INSERT INTO `kongresszusi_terem` (`szobaszam`, `ferohely`) VALUES
(201, 50),
(202, 100),
(203, 75),
(204, 30),
(205, 120);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `mobiltelefon`
--

CREATE TABLE `mobiltelefon` (
  `telefonszam` varchar(15) NOT NULL,
  `felhasznalo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `mobiltelefon`
--

INSERT INTO `mobiltelefon` (`telefonszam`, `felhasznalo`) VALUES
('555-123-456', 'user1@example.com'),
('555-234-567', 'user2@example.com'),
('555-345-678', 'user3@example.com'),
('555-456-789', 'user4@example.com'),
('555-567-890', 'user5@example.com');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szamitogep`
--

CREATE TABLE `szamitogep` (
  `leltari_szam` int(11) NOT NULL,
  `merevlemez` varchar(10) NOT NULL,
  `memoria` varchar(10) NOT NULL,
  `processzor` varchar(50) NOT NULL,
  `felhasznalo` varchar(50) DEFAULT NULL,
  `szobaszam` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szamitogep`
--

INSERT INTO `szamitogep` (`leltari_szam`, `merevlemez`, `memoria`, `processzor`, `felhasznalo`, `szobaszam`) VALUES
(5001, '512GB', '16GB', 'Intel Core i7', 'user1@example.com', 101),
(5002, '256GB', '8GB', 'Intel Core i5', 'user2@example.com', 102),
(5003, '1TB', '32GB', 'AMD Ryzen 7', 'user3@example.com', 103),
(5004, '512GB', '16GB', 'Intel Core i9', NULL, 104),
(5005, '1TB', '64GB', 'AMD Ryzen 9', 'user4@example.com', 105);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `telefon`
--

CREATE TABLE `telefon` (
  `telefonszam` varchar(15) NOT NULL,
  `leltari_szam` int(11) NOT NULL,
  `gyartasi_datum` date NOT NULL,
  `tipus` enum('Vezetékes','Mobil') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `telefon`
--

INSERT INTO `telefon` (`telefonszam`, `leltari_szam`, `gyartasi_datum`, `tipus`) VALUES
('111-123-456', 4001, '2022-06-01', 'Vezetékes'),
('111-234-567', 4002, '2022-07-01', 'Vezetékes'),
('111-345-678', 4003, '2022-08-01', 'Vezetékes'),
('111-456-789', 4004, '2022-09-01', 'Vezetékes'),
('111-567-890', 4005, '2022-10-01', 'Vezetékes'),
('555-123-456', 3001, '2022-01-10', 'Mobil'),
('555-234-567', 3002, '2022-02-15', 'Mobil'),
('555-345-678', 3003, '2022-03-20', 'Mobil'),
('555-456-789', 3004, '2022-04-25', 'Mobil'),
('555-567-890', 3005, '2022-05-30', 'Mobil');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `vezetekes`
--

CREATE TABLE `vezetekes` (
  `telefonszam` varchar(15) NOT NULL,
  `iroda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `vezetekes`
--

INSERT INTO `vezetekes` (`telefonszam`, `iroda`) VALUES
('111-123-456', 101),
('111-234-567', 102),
('111-345-678', 103),
('111-456-789', 104),
('111-567-890', 105);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD PRIMARY KEY (`email`),
  ADD KEY `szobaszam` (`szobaszam`);

--
-- A tábla indexei `foglalas`
--
ALTER TABLE `foglalas`
  ADD PRIMARY KEY (`foglalas_id`),
  ADD KEY `felhasznalo` (`felhasznalo`),
  ADD KEY `teremszam` (`teremszam`);

--
-- A tábla indexei `helyiseg`
--
ALTER TABLE `helyiseg`
  ADD PRIMARY KEY (`szobaszam`);

--
-- A tábla indexei `iroda`
--
ALTER TABLE `iroda`
  ADD PRIMARY KEY (`szobaszam`);

--
-- A tábla indexei `kongresszusi_terem`
--
ALTER TABLE `kongresszusi_terem`
  ADD PRIMARY KEY (`szobaszam`);

--
-- A tábla indexei `mobiltelefon`
--
ALTER TABLE `mobiltelefon`
  ADD PRIMARY KEY (`telefonszam`),
  ADD KEY `felhasznalo` (`felhasznalo`);

--
-- A tábla indexei `szamitogep`
--
ALTER TABLE `szamitogep`
  ADD PRIMARY KEY (`leltari_szam`),
  ADD KEY `felhasznalo` (`felhasznalo`),
  ADD KEY `szobaszam` (`szobaszam`);

--
-- A tábla indexei `telefon`
--
ALTER TABLE `telefon`
  ADD PRIMARY KEY (`telefonszam`);

--
-- A tábla indexei `vezetekes`
--
ALTER TABLE `vezetekes`
  ADD PRIMARY KEY (`telefonszam`),
  ADD KEY `iroda` (`iroda`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `foglalas`
--
ALTER TABLE `foglalas`
  MODIFY `foglalas_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `felhasznalo`
--
ALTER TABLE `felhasznalo`
  ADD CONSTRAINT `felhasznalo_ibfk_1` FOREIGN KEY (`szobaszam`) REFERENCES `helyiseg` (`szobaszam`);

--
-- Megkötések a táblához `foglalas`
--
ALTER TABLE `foglalas`
  ADD CONSTRAINT `foglalas_ibfk_1` FOREIGN KEY (`felhasznalo`) REFERENCES `felhasznalo` (`email`),
  ADD CONSTRAINT `foglalas_ibfk_2` FOREIGN KEY (`teremszam`) REFERENCES `kongresszusi_terem` (`szobaszam`);

--
-- Megkötések a táblához `iroda`
--
ALTER TABLE `iroda`
  ADD CONSTRAINT `iroda_ibfk_1` FOREIGN KEY (`szobaszam`) REFERENCES `helyiseg` (`szobaszam`);

--
-- Megkötések a táblához `kongresszusi_terem`
--
ALTER TABLE `kongresszusi_terem`
  ADD CONSTRAINT `kongresszusi_terem_ibfk_1` FOREIGN KEY (`szobaszam`) REFERENCES `helyiseg` (`szobaszam`);

--
-- Megkötések a táblához `mobiltelefon`
--
ALTER TABLE `mobiltelefon`
  ADD CONSTRAINT `mobiltelefon_ibfk_1` FOREIGN KEY (`telefonszam`) REFERENCES `telefon` (`telefonszam`),
  ADD CONSTRAINT `mobiltelefon_ibfk_2` FOREIGN KEY (`felhasznalo`) REFERENCES `felhasznalo` (`email`);

--
-- Megkötések a táblához `szamitogep`
--
ALTER TABLE `szamitogep`
  ADD CONSTRAINT `szamitogep_ibfk_1` FOREIGN KEY (`felhasznalo`) REFERENCES `felhasznalo` (`email`),
  ADD CONSTRAINT `szamitogep_ibfk_2` FOREIGN KEY (`szobaszam`) REFERENCES `helyiseg` (`szobaszam`);

--
-- Megkötések a táblához `vezetekes`
--
ALTER TABLE `vezetekes`
  ADD CONSTRAINT `vezetekes_ibfk_1` FOREIGN KEY (`telefonszam`) REFERENCES `telefon` (`telefonszam`),
  ADD CONSTRAINT `vezetekes_ibfk_2` FOREIGN KEY (`iroda`) REFERENCES `iroda` (`szobaszam`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
