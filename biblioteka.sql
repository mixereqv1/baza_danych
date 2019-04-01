-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Czas generowania: 24 Kwi 2018, 10:15
-- Wersja serwera: 5.7.21-0ubuntu0.16.04.1
-- Wersja PHP: 7.0.25-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `01_galinski`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bibl_autor`
--

CREATE TABLE `bibl_autor` (
  `id_autor` int(11) NOT NULL,
  `autor` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `bibl_autor`
--

INSERT INTO `bibl_autor` (`id_autor`, `autor`) VALUES
(1, 'Brytan'),
(2, 'Anna'),
(3, 'Kasia'),
(4, 'Tolkien'),
(5, 'Kugane Maruyama');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bibl_book`
--

CREATE TABLE `bibl_book` (
  `id_book` int(11) NOT NULL,
  `id_autor` int(11) NOT NULL,
  `id_tytul` int(11) NOT NULL,
  `wypoz` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `bibl_book`
--

INSERT INTO `bibl_book` (`id_book`, `id_autor`, `id_tytul`, `wypoz`) VALUES
(1, 1, 1, 0),
(2, 2, 2, 1),
(4, 2, 4, 0),
(5, 3, 6, 1),
(6, 2, 5, 0),
(7, 1, 7, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bibl_tytul`
--

CREATE TABLE `bibl_tytul` (
  `id_tytul` int(11) NOT NULL,
  `tytul` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `bibl_tytul`
--

INSERT INTO `bibl_tytul` (`id_tytul`, `tytul`) VALUES
(1, 'Jak zdac sierpien'),
(2, 'jak sie nie zabic'),
(4, 'galu zawodowiec'),
(5, 'Matematyka z + rozszerzenie'),
(6, 'Overlord'),
(7, 'Jak zdac sierpien2');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bibl_user`
--

CREATE TABLE `bibl_user` (
  `id_user` int(11) NOT NULL,
  `login` text NOT NULL,
  `password` text NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `bibl_user`
--

INSERT INTO `bibl_user` (`id_user`, `login`, `password`, `admin`) VALUES
(1, 'admin', '123', 1),
(2, 'ainz', '123', 0),
(3, 'asd', 'asd', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bibl_wyp`
--

CREATE TABLE `bibl_wyp` (
  `id_wyp` int(11) NOT NULL,
  `id_book` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `date_wyp` date NOT NULL,
  `date_odd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `bibl_wyp`
--

INSERT INTO `bibl_wyp` (`id_wyp`, `id_book`, `id_user`, `date_wyp`, `date_odd`) VALUES
(8, 5, 2, '2018-04-23', '2018-04-30'),
(11, 2, 2, '2018-04-23', '2018-04-30');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `bibl_autor`
--
ALTER TABLE `bibl_autor`
  ADD PRIMARY KEY (`id_autor`);

--
-- Indexes for table `bibl_book`
--
ALTER TABLE `bibl_book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `fk_autor` (`id_autor`),
  ADD KEY `fk_tytul` (`id_tytul`);

--
-- Indexes for table `bibl_tytul`
--
ALTER TABLE `bibl_tytul`
  ADD PRIMARY KEY (`id_tytul`);

--
-- Indexes for table `bibl_user`
--
ALTER TABLE `bibl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `bibl_wyp`
--
ALTER TABLE `bibl_wyp`
  ADD PRIMARY KEY (`id_wyp`),
  ADD KEY `id_book` (`id_book`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `bibl_autor`
--
ALTER TABLE `bibl_autor`
  MODIFY `id_autor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `bibl_book`
--
ALTER TABLE `bibl_book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT dla tabeli `bibl_tytul`
--
ALTER TABLE `bibl_tytul`
  MODIFY `id_tytul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT dla tabeli `bibl_user`
--
ALTER TABLE `bibl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT dla tabeli `bibl_wyp`
--
ALTER TABLE `bibl_wyp`
  MODIFY `id_wyp` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `bibl_book`
--
ALTER TABLE `bibl_book`
  ADD CONSTRAINT `bibl_book_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `bibl_autor` (`id_autor`),
  ADD CONSTRAINT `bibl_book_ibfk_2` FOREIGN KEY (`id_tytul`) REFERENCES `bibl_tytul` (`id_tytul`);

--
-- Ograniczenia dla tabeli `bibl_wyp`
--
ALTER TABLE `bibl_wyp`
  ADD CONSTRAINT `bibl_wyp_ibfk_1` FOREIGN KEY (`id_book`) REFERENCES `bibl_book` (`id_book`),
  ADD CONSTRAINT `bibl_wyp_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `bibl_user` (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
