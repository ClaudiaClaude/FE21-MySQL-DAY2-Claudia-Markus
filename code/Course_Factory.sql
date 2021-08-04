-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 04. Aug 2021 um 15:22
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `Course Factory`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Courses`
--

CREATE TABLE `Courses` (
  `course_id` int(11) NOT NULL,
  `FK_room_id` int(11) DEFAULT NULL,
  `FK_teacher_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Dataset`
--

CREATE TABLE `Dataset` (
  `dataset_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Enrollment`
--

CREATE TABLE `Enrollment` (
  `enrollment_id` int(11) NOT NULL,
  `FK_student_id` int(11) DEFAULT NULL,
  `FK_course_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Institute`
--

CREATE TABLE `Institute` (
  `institute_id` int(11) NOT NULL,
  `FK_dataset_id` int(11) DEFAULT NULL,
  `FK_student_id` int(11) DEFAULT NULL,
  `FK_room_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Rooms`
--

CREATE TABLE `Rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Students`
--

CREATE TABLE `Students` (
  `student_id` int(11) NOT NULL,
  `FK_dataset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `Teachers`
--

CREATE TABLE `Teachers` (
  `teacher_id` int(11) NOT NULL,
  `FK_dataset_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `Courses`
--
ALTER TABLE `Courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `FK_room_id` (`FK_room_id`),
  ADD KEY `FK_teacher_id` (`FK_teacher_id`);

--
-- Indizes für die Tabelle `Dataset`
--
ALTER TABLE `Dataset`
  ADD PRIMARY KEY (`dataset_id`);

--
-- Indizes für die Tabelle `Enrollment`
--
ALTER TABLE `Enrollment`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `FK_student_id` (`FK_student_id`),
  ADD KEY `FK_course_id` (`FK_course_id`);

--
-- Indizes für die Tabelle `Institute`
--
ALTER TABLE `Institute`
  ADD PRIMARY KEY (`institute_id`),
  ADD KEY `FK_dataset_id` (`FK_dataset_id`),
  ADD KEY `FK_student_id` (`FK_student_id`),
  ADD KEY `FK_room_id` (`FK_room_id`);

--
-- Indizes für die Tabelle `Rooms`
--
ALTER TABLE `Rooms`
  ADD PRIMARY KEY (`room_id`);

--
-- Indizes für die Tabelle `Students`
--
ALTER TABLE `Students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `FK_dataset_id` (`FK_dataset_id`);

--
-- Indizes für die Tabelle `Teachers`
--
ALTER TABLE `Teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `FK_dataset_id` (`FK_dataset_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `Courses`
--
ALTER TABLE `Courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Dataset`
--
ALTER TABLE `Dataset`
  MODIFY `dataset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Enrollment`
--
ALTER TABLE `Enrollment`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Institute`
--
ALTER TABLE `Institute`
  MODIFY `institute_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Rooms`
--
ALTER TABLE `Rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Students`
--
ALTER TABLE `Students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `Teachers`
--
ALTER TABLE `Teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `Courses`
--
ALTER TABLE `Courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`FK_room_id`) REFERENCES `Rooms` (`room_id`),
  ADD CONSTRAINT `courses_ibfk_2` FOREIGN KEY (`FK_teacher_id`) REFERENCES `Teachers` (`teacher_id`);

--
-- Constraints der Tabelle `Enrollment`
--
ALTER TABLE `Enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`FK_student_id`) REFERENCES `Students` (`student_id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`FK_course_id`) REFERENCES `Courses` (`course_id`);

--
-- Constraints der Tabelle `Institute`
--
ALTER TABLE `Institute`
  ADD CONSTRAINT `institute_ibfk_1` FOREIGN KEY (`FK_dataset_id`) REFERENCES `Dataset` (`dataset_id`),
  ADD CONSTRAINT `institute_ibfk_2` FOREIGN KEY (`FK_student_id`) REFERENCES `Students` (`student_id`),
  ADD CONSTRAINT `institute_ibfk_3` FOREIGN KEY (`FK_room_id`) REFERENCES `Rooms` (`room_id`);

--
-- Constraints der Tabelle `Students`
--
ALTER TABLE `Students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`FK_dataset_id`) REFERENCES `Dataset` (`dataset_id`);

--
-- Constraints der Tabelle `Teachers`
--
ALTER TABLE `Teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`FK_dataset_id`) REFERENCES `Dataset` (`dataset_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
