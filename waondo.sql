-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2020 at 08:58 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `waondo`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_class_levels`
--

CREATE TABLE `academic_class_levels` (
  `AcademicClassLevelId` int(11) NOT NULL,
  `AcademicClassLevelName` varchar(9000) NOT NULL,
  `HierachyCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academic_class_levels`
--

INSERT INTO `academic_class_levels` (`AcademicClassLevelId`, `AcademicClassLevelName`, `HierachyCode`) VALUES
(1, 'Form One', 1);

-- --------------------------------------------------------

--
-- Table structure for table `access_privileges`
--

CREATE TABLE `access_privileges` (
  `AccessPrivilegeId` int(11) NOT NULL,
  `AccessPrivilegeDescription` varchar(200) NOT NULL,
  `AccessPrivilegeCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `access_privileges`
--

INSERT INTO `access_privileges` (`AccessPrivilegeId`, `AccessPrivilegeDescription`, `AccessPrivilegeCode`) VALUES
(1, 'Login', 1),
(2, 'View Students Fee Details', 2),
(3, 'Pay student Fee', 3),
(4, 'Correct Student Fee', 4),
(5, 'Register a student', 5),
(6, 'Correct a student\'s details', 6);

-- --------------------------------------------------------

--
-- Table structure for table `actual_terms`
--

CREATE TABLE `actual_terms` (
  `TermId` int(11) NOT NULL,
  `TermIterationId` int(11) DEFAULT NULL,
  `TermStartDate` date NOT NULL,
  `TermEndDate` date NOT NULL,
  `Year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actual_terms`
--

INSERT INTO `actual_terms` (`TermId`, `TermIterationId`, `TermStartDate`, `TermEndDate`, `Year`) VALUES
(3, 1, '2018-01-01', '2018-03-31', 2018),
(4, 2, '2018-05-01', '2018-07-31', 2018),
(5, 3, '2018-08-01', '2018-11-30', 2018),
(6, 1, '2019-01-01', '2019-03-31', 2019),
(7, 2, '2019-05-01', '2019-07-31', 2019),
(8, 3, '2019-09-01', '2019-11-30', 2019);

-- --------------------------------------------------------

--
-- Table structure for table `actual_weeks`
--

CREATE TABLE `actual_weeks` (
  `ActualWeekId` int(11) NOT NULL,
  `TermId` int(11) NOT NULL,
  `WeekIterationId` int(11) NOT NULL,
  `WeekStartDate` date NOT NULL,
  `WeekEndDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `actual_weeks`
--

INSERT INTO `actual_weeks` (`ActualWeekId`, `TermId`, `WeekIterationId`, `WeekStartDate`, `WeekEndDate`) VALUES
(1, 6, 1, '2019-01-01', '2019-01-06');

-- --------------------------------------------------------

--
-- Table structure for table `carryforward`
--

CREATE TABLE `carryforward` (
  `CarryFowardId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `CarryForwardAmount` int(11) NOT NULL,
  `DateCarriedForward` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `ClassId` int(11) NOT NULL,
  `LotId` int(11) NOT NULL,
  `ClassStreamId` int(11) NOT NULL,
  `RegisteredDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classes`
--

INSERT INTO `classes` (`ClassId`, `LotId`, `ClassStreamId`, `RegisteredDate`) VALUES
(1, 1, 1, '2020-04-24 12:33:37');

-- --------------------------------------------------------

--
-- Table structure for table `class_streams`
--

CREATE TABLE `class_streams` (
  `ClassStreamId` int(11) NOT NULL,
  `ClassStreamName` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_streams`
--

INSERT INTO `class_streams` (`ClassStreamId`, `ClassStreamName`) VALUES
(1, 'Yellow');

-- --------------------------------------------------------

--
-- Table structure for table `correction_descriptions`
--

CREATE TABLE `correction_descriptions` (
  `CorrectionDescriptionId` int(11) NOT NULL,
  `CorrectionDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fee_corrections`
--

CREATE TABLE `fee_corrections` (
  `FeeCorrectionId` int(11) NOT NULL,
  `SessionLogId` int(11) NOT NULL,
  `ActualSessionActivityId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `CorrectionDescriptionId` int(11) NOT NULL,
  `PreviousTermBalance` int(11) NOT NULL,
  `PreviousAnnualBalance` int(11) NOT NULL,
  `PreviousTotal` int(11) NOT NULL,
  `NextTermBalance` int(11) NOT NULL,
  `NextAnnualBalance` int(11) NOT NULL,
  `NextTotal` int(11) NOT NULL,
  `CorrectionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fee_statements`
--

CREATE TABLE `fee_statements` (
  `FeeStatementId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `LunchScheme` int(11) DEFAULT '0',
  `PE` int(11) DEFAULT '0',
  `EW` int(11) DEFAULT '0',
  `LT` int(11) DEFAULT '0',
  `RMI` int(11) DEFAULT '0',
  `Administration` int(11) DEFAULT '0',
  `Activity` int(11) DEFAULT '0',
  `CurrentYearTotal` int(11) DEFAULT '0',
  `CurrentTermBalance` int(11) DEFAULT '0',
  `AnnualBalance` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fee_statements`
--

INSERT INTO `fee_statements` (`FeeStatementId`, `AdmissionNo`, `LunchScheme`, `PE`, `EW`, `LT`, `RMI`, `Administration`, `Activity`, `CurrentYearTotal`, `CurrentTermBalance`, `AnnualBalance`) VALUES
(1, '8032', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, '2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, '8033', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `GenderId` int(11) NOT NULL,
  `GenderDescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`GenderId`, `GenderDescription`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `installments`
--

CREATE TABLE `installments` (
  `InstallmentId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `InstallmentAmount` int(11) NOT NULL,
  `InstallmentDate` datetime NOT NULL,
  `IsCarryForward` int(11) NOT NULL,
  `SessionLogId` int(11) NOT NULL,
  `ActualSessionActivityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lots`
--

CREATE TABLE `lots` (
  `LotId` int(11) NOT NULL,
  `LotDescriptionId` int(11) NOT NULL,
  `AcademicClassLevelId` int(11) NOT NULL,
  `RegisteredDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lots`
--

INSERT INTO `lots` (`LotId`, `LotDescriptionId`, `AcademicClassLevelId`, `RegisteredDate`) VALUES
(1, 1, 1, '2020-04-24 11:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `lot_descriptions`
--

CREATE TABLE `lot_descriptions` (
  `LotDescriptionId` int(11) NOT NULL,
  `LotDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lot_descriptions`
--

INSERT INTO `lot_descriptions` (`LotDescriptionId`, `LotDescription`) VALUES
(1, 'Class of 2012');

-- --------------------------------------------------------

--
-- Table structure for table `month`
--

CREATE TABLE `month` (
  `MonthId` int(11) NOT NULL,
  `Month` varchar(200) NOT NULL,
  `Sync` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `month`
--

INSERT INTO `month` (`MonthId`, `Month`, `Sync`) VALUES
(1, 'February', 'Not Synchronised');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleId` int(11) NOT NULL,
  `RoleDescription` varchar(9000) NOT NULL,
  `RoleCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleId`, `RoleDescription`, `RoleCode`) VALUES
(1, 'Admin', 1),
(2, 'Bursar', 2);

-- --------------------------------------------------------

--
-- Table structure for table `session_activities`
--

CREATE TABLE `session_activities` (
  `SessionActivityId` int(11) NOT NULL,
  `SessionActivityDescription` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `session_logs`
--

CREATE TABLE `session_logs` (
  `SessionLogId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `SessionStartDate` datetime NOT NULL,
  `SessionEndDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `StudentsId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `StudentName` varchar(200) DEFAULT NULL,
  `GenderId` int(11) NOT NULL,
  `StudentDOB` date NOT NULL,
  `StudentTypeId` int(11) NOT NULL,
  `ClassId` int(11) DEFAULT NULL,
  `AdmissionDate` datetime NOT NULL,
  `ProfPicName` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`StudentsId`, `AdmissionNo`, `StudentName`, `GenderId`, `StudentDOB`, `StudentTypeId`, `ClassId`, `AdmissionDate`, `ProfPicName`) VALUES
(1, '8032', '', 1, '2020-04-01', 1, 1, '2020-04-24 18:03:37', 'male_student.png'),
(4, '2', '', 1, '2020-04-01', 1, 1, '2020-04-24 18:41:30', 'male_student.png'),
(5, '8033', '', 2, '2020-04-08', 2, 1, '2020-04-24 19:40:42', '8d9af9ba78b3de79eae47a31dd93352b');

-- --------------------------------------------------------

--
-- Table structure for table `student_registration`
--

CREATE TABLE `student_registration` (
  `StudentRegistrationId` int(11) NOT NULL,
  `SessionLogId` int(11) NOT NULL,
  `ActualSessionActivityId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `StudentRegistrationDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `student_types`
--

CREATE TABLE `student_types` (
  `StudentTypeId` int(11) NOT NULL,
  `StudentTypeDescription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_types`
--

INSERT INTO `student_types` (`StudentTypeId`, `StudentTypeDescription`) VALUES
(1, 'Boarder'),
(2, 'Day Scholar');

-- --------------------------------------------------------

--
-- Table structure for table `term_iterations`
--

CREATE TABLE `term_iterations` (
  `TermIterationId` int(11) NOT NULL,
  `TermIterationDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `term_iterations`
--

INSERT INTO `term_iterations` (`TermIterationId`, `TermIterationDescription`) VALUES
(1, 'Term One'),
(2, 'Term Two'),
(3, 'Term Three');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `TransactionId` int(11) NOT NULL,
  `SessionLogId` int(11) NOT NULL,
  `ActualSessionActivityId` int(11) NOT NULL,
  `AdmissionNo` varchar(200) NOT NULL,
  `TransactionDescriptionId` int(11) NOT NULL,
  `InstallmentId` int(11) DEFAULT NULL,
  `CarryFowardId` int(11) DEFAULT NULL,
  `FeeCorrectionId` int(11) DEFAULT NULL,
  `PreviousTermBalance` int(11) NOT NULL,
  `PreviousAnnualBalance` int(11) NOT NULL,
  `PreviousTotal` int(11) NOT NULL,
  `NextTermBalance` int(11) NOT NULL,
  `NextAnnualBalance` int(11) NOT NULL,
  `NextTotal` int(11) NOT NULL,
  `TransactionDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_descriptions`
--

CREATE TABLE `transaction_descriptions` (
  `TransactionDescriptionId` int(11) NOT NULL,
  `TransactionDescription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `GenderId` int(11) NOT NULL,
  `EncryptedPassword` varchar(9000) NOT NULL,
  `RegisteredDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `Name`, `Email`, `GenderId`, `EncryptedPassword`, `RegisteredDate`) VALUES
(14, 'Silas Onyango', 'silas.onyango93@gmail.com', 1, '$2a$10$UZivdFuxJ7hQBLosU.1TSOjg4j84dHZHFcp865mL4tjNqpDn7rCcC', '2020-04-18 08:54:09'),
(15, 'Hazel Afandi', 'hazel@gmail.com', 2, '$2a$10$sJ1/JzruYT0lObcxGf4mGOPyZCEk3ZP6f6V.Mu5A8CiOeNrklFEVC', '2020-04-19 14:23:02'),
(16, 'Ezekiel Ombima', 'ezekiel@gmail.com', 1, '$2a$10$mNCrph9358v4p3mO2my4T.18BZJ70Xu8/L1BdGMr7.2n8z5JqxdyO', '2020-04-22 18:24:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_privileges`
--

CREATE TABLE `user_access_privileges` (
  `UserAccessPrivilegeId` int(11) NOT NULL,
  `UserRoleId` int(11) NOT NULL,
  `AccessPrivilegeId` int(11) NOT NULL,
  `PermisionStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_access_privileges`
--

INSERT INTO `user_access_privileges` (`UserAccessPrivilegeId`, `UserRoleId`, `AccessPrivilegeId`, `PermisionStatus`) VALUES
(29, 19, 1, 1),
(30, 19, 2, 0),
(31, 19, 3, 0),
(32, 19, 4, 0),
(33, 19, 5, 0),
(34, 19, 6, 0),
(35, 20, 1, 1),
(36, 20, 2, 0),
(37, 20, 3, 0),
(38, 20, 4, 0),
(39, 20, 5, 0),
(40, 20, 6, 0),
(41, 21, 1, 0),
(42, 21, 2, 0),
(43, 21, 3, 0),
(44, 21, 4, 0),
(45, 21, 5, 0),
(46, 21, 6, 0),
(47, 22, 1, 0),
(48, 22, 2, 0),
(49, 22, 3, 0),
(50, 22, 4, 0),
(51, 22, 5, 0),
(52, 22, 6, 0),
(53, 23, 1, 0),
(54, 23, 2, 0),
(55, 23, 3, 0),
(56, 23, 4, 0),
(57, 23, 5, 0),
(58, 23, 6, 0),
(59, 24, 1, 0),
(60, 24, 2, 0),
(61, 24, 3, 0),
(62, 24, 4, 0),
(63, 24, 5, 0),
(64, 24, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `UserRoleId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `ConfirmationStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`UserRoleId`, `UserId`, `RoleId`, `ConfirmationStatus`) VALUES
(19, 14, 1, 1),
(20, 14, 2, 1),
(21, 15, 1, 0),
(22, 15, 2, 0),
(23, 16, 1, 0),
(24, 16, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_session_activities`
--

CREATE TABLE `user_session_activities` (
  `UserSessionActivityId` int(11) NOT NULL,
  `SessionLogId` int(11) NOT NULL,
  `SessionActivityId` int(11) NOT NULL,
  `SessionActivityDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `week_iterations`
--

CREATE TABLE `week_iterations` (
  `WeekIterationId` int(11) NOT NULL,
  `WeekIterationDescription` varchar(9000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `week_iterations`
--

INSERT INTO `week_iterations` (`WeekIterationId`, `WeekIterationDescription`) VALUES
(1, 'Week 1'),
(2, 'Week 2'),
(3, 'Week 3'),
(4, 'Week 4'),
(5, 'Week 5'),
(6, 'Week 6'),
(7, 'Week 7'),
(8, 'Week 8'),
(9, 'Week 9'),
(10, 'Week 10'),
(11, 'Week 11'),
(12, 'Week 12'),
(13, 'Week 13'),
(14, 'Week 14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_class_levels`
--
ALTER TABLE `academic_class_levels`
  ADD PRIMARY KEY (`AcademicClassLevelId`);

--
-- Indexes for table `access_privileges`
--
ALTER TABLE `access_privileges`
  ADD PRIMARY KEY (`AccessPrivilegeId`);

--
-- Indexes for table `actual_terms`
--
ALTER TABLE `actual_terms`
  ADD PRIMARY KEY (`TermId`),
  ADD KEY `TermIterationId` (`TermIterationId`);

--
-- Indexes for table `actual_weeks`
--
ALTER TABLE `actual_weeks`
  ADD PRIMARY KEY (`ActualWeekId`),
  ADD KEY `TermId` (`TermId`),
  ADD KEY `WeekIterationId` (`WeekIterationId`);

--
-- Indexes for table `carryforward`
--
ALTER TABLE `carryforward`
  ADD PRIMARY KEY (`CarryFowardId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`ClassId`),
  ADD KEY `LotId` (`LotId`),
  ADD KEY `ClassStreamId` (`ClassStreamId`);

--
-- Indexes for table `class_streams`
--
ALTER TABLE `class_streams`
  ADD PRIMARY KEY (`ClassStreamId`);

--
-- Indexes for table `correction_descriptions`
--
ALTER TABLE `correction_descriptions`
  ADD PRIMARY KEY (`CorrectionDescriptionId`);

--
-- Indexes for table `fee_corrections`
--
ALTER TABLE `fee_corrections`
  ADD PRIMARY KEY (`FeeCorrectionId`),
  ADD KEY `CorrectionDescriptionId` (`CorrectionDescriptionId`),
  ADD KEY `SessionLogId` (`SessionLogId`),
  ADD KEY `ActualSessionActivityId` (`ActualSessionActivityId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`);

--
-- Indexes for table `fee_statements`
--
ALTER TABLE `fee_statements`
  ADD PRIMARY KEY (`FeeStatementId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GenderId`);

--
-- Indexes for table `installments`
--
ALTER TABLE `installments`
  ADD PRIMARY KEY (`InstallmentId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `SessionLogId` (`SessionLogId`),
  ADD KEY `ActualSessionActivityId` (`ActualSessionActivityId`);

--
-- Indexes for table `lots`
--
ALTER TABLE `lots`
  ADD PRIMARY KEY (`LotId`),
  ADD KEY `AcademicClassLevelId` (`AcademicClassLevelId`),
  ADD KEY `LotDescriptionId` (`LotDescriptionId`);

--
-- Indexes for table `lot_descriptions`
--
ALTER TABLE `lot_descriptions`
  ADD PRIMARY KEY (`LotDescriptionId`);

--
-- Indexes for table `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`MonthId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `session_activities`
--
ALTER TABLE `session_activities`
  ADD PRIMARY KEY (`SessionActivityId`);

--
-- Indexes for table `session_logs`
--
ALTER TABLE `session_logs`
  ADD PRIMARY KEY (`SessionLogId`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`StudentsId`),
  ADD UNIQUE KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `ClassId` (`ClassId`),
  ADD KEY `StudentTypeId` (`StudentTypeId`),
  ADD KEY `GenderId` (`GenderId`);

--
-- Indexes for table `student_registration`
--
ALTER TABLE `student_registration`
  ADD PRIMARY KEY (`StudentRegistrationId`),
  ADD KEY `SessionLogId` (`SessionLogId`),
  ADD KEY `ActualSessionActivityId` (`ActualSessionActivityId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`);

--
-- Indexes for table `student_types`
--
ALTER TABLE `student_types`
  ADD PRIMARY KEY (`StudentTypeId`);

--
-- Indexes for table `term_iterations`
--
ALTER TABLE `term_iterations`
  ADD PRIMARY KEY (`TermIterationId`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`TransactionId`),
  ADD KEY `SessionLogId` (`SessionLogId`),
  ADD KEY `ActualSessionActivityId` (`ActualSessionActivityId`),
  ADD KEY `AdmissionNo` (`AdmissionNo`),
  ADD KEY `TransactionDescriptionId` (`TransactionDescriptionId`),
  ADD KEY `InstallmentId` (`InstallmentId`),
  ADD KEY `FeeCorrectionId` (`FeeCorrectionId`),
  ADD KEY `CarryFowardId` (`CarryFowardId`);

--
-- Indexes for table `transaction_descriptions`
--
ALTER TABLE `transaction_descriptions`
  ADD PRIMARY KEY (`TransactionDescriptionId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`),
  ADD UNIQUE KEY `email` (`Email`),
  ADD KEY `GenderId` (`GenderId`);

--
-- Indexes for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD PRIMARY KEY (`UserAccessPrivilegeId`),
  ADD KEY `AccessPrivilegeId` (`AccessPrivilegeId`),
  ADD KEY `UserRoleId` (`UserRoleId`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`UserRoleId`),
  ADD KEY `UserId` (`UserId`),
  ADD KEY `RoleId` (`RoleId`);

--
-- Indexes for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  ADD PRIMARY KEY (`UserSessionActivityId`),
  ADD KEY `SessionLogId` (`SessionLogId`),
  ADD KEY `SessionActivityId` (`SessionActivityId`);

--
-- Indexes for table `week_iterations`
--
ALTER TABLE `week_iterations`
  ADD PRIMARY KEY (`WeekIterationId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_class_levels`
--
ALTER TABLE `academic_class_levels`
  MODIFY `AcademicClassLevelId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `access_privileges`
--
ALTER TABLE `access_privileges`
  MODIFY `AccessPrivilegeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `actual_terms`
--
ALTER TABLE `actual_terms`
  MODIFY `TermId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `actual_weeks`
--
ALTER TABLE `actual_weeks`
  MODIFY `ActualWeekId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carryforward`
--
ALTER TABLE `carryforward`
  MODIFY `CarryFowardId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `ClassId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `class_streams`
--
ALTER TABLE `class_streams`
  MODIFY `ClassStreamId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `correction_descriptions`
--
ALTER TABLE `correction_descriptions`
  MODIFY `CorrectionDescriptionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_corrections`
--
ALTER TABLE `fee_corrections`
  MODIFY `FeeCorrectionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fee_statements`
--
ALTER TABLE `fee_statements`
  MODIFY `FeeStatementId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `GenderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `installments`
--
ALTER TABLE `installments`
  MODIFY `InstallmentId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lots`
--
ALTER TABLE `lots`
  MODIFY `LotId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lot_descriptions`
--
ALTER TABLE `lot_descriptions`
  MODIFY `LotDescriptionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `month`
--
ALTER TABLE `month`
  MODIFY `MonthId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `session_activities`
--
ALTER TABLE `session_activities`
  MODIFY `SessionActivityId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session_logs`
--
ALTER TABLE `session_logs`
  MODIFY `SessionLogId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `StudentsId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student_registration`
--
ALTER TABLE `student_registration`
  MODIFY `StudentRegistrationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_types`
--
ALTER TABLE `student_types`
  MODIFY `StudentTypeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `term_iterations`
--
ALTER TABLE `term_iterations`
  MODIFY `TermIterationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `TransactionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_descriptions`
--
ALTER TABLE `transaction_descriptions`
  MODIFY `TransactionDescriptionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  MODIFY `UserSessionActivityId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `week_iterations`
--
ALTER TABLE `week_iterations`
  MODIFY `WeekIterationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actual_terms`
--
ALTER TABLE `actual_terms`
  ADD CONSTRAINT `actual_terms_ibfk_1` FOREIGN KEY (`TermIterationId`) REFERENCES `term_iterations` (`TermIterationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `actual_weeks`
--
ALTER TABLE `actual_weeks`
  ADD CONSTRAINT `actual_weeks_ibfk_1` FOREIGN KEY (`TermId`) REFERENCES `actual_terms` (`TermId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actual_weeks_ibfk_2` FOREIGN KEY (`WeekIterationId`) REFERENCES `week_iterations` (`WeekIterationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carryforward`
--
ALTER TABLE `carryforward`
  ADD CONSTRAINT `carryforward_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`LotId`) REFERENCES `lots` (`LotId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `classes_ibfk_2` FOREIGN KEY (`ClassStreamId`) REFERENCES `class_streams` (`ClassStreamId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fee_corrections`
--
ALTER TABLE `fee_corrections`
  ADD CONSTRAINT `fee_corrections_ibfk_1` FOREIGN KEY (`CorrectionDescriptionId`) REFERENCES `correction_descriptions` (`CorrectionDescriptionId`),
  ADD CONSTRAINT `fee_corrections_ibfk_2` FOREIGN KEY (`SessionLogId`) REFERENCES `session_logs` (`SessionLogId`),
  ADD CONSTRAINT `fee_corrections_ibfk_3` FOREIGN KEY (`ActualSessionActivityId`) REFERENCES `user_session_activities` (`UserSessionActivityId`),
  ADD CONSTRAINT `fee_corrections_ibfk_4` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`);

--
-- Constraints for table `fee_statements`
--
ALTER TABLE `fee_statements`
  ADD CONSTRAINT `fee_statements_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `installments`
--
ALTER TABLE `installments`
  ADD CONSTRAINT `installments_ibfk_1` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `installments_ibfk_2` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `installments_ibfk_3` FOREIGN KEY (`SessionLogId`) REFERENCES `session_logs` (`SessionLogId`),
  ADD CONSTRAINT `installments_ibfk_4` FOREIGN KEY (`ActualSessionActivityId`) REFERENCES `user_session_activities` (`UserSessionActivityId`);

--
-- Constraints for table `lots`
--
ALTER TABLE `lots`
  ADD CONSTRAINT `lots_ibfk_1` FOREIGN KEY (`AcademicClassLevelId`) REFERENCES `academic_class_levels` (`AcademicClassLevelId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_ibfk_2` FOREIGN KEY (`LotDescriptionId`) REFERENCES `lot_descriptions` (`LotDescriptionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lots_ibfk_3` FOREIGN KEY (`LotDescriptionId`) REFERENCES `lot_descriptions` (`LotDescriptionId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session_logs`
--
ALTER TABLE `session_logs`
  ADD CONSTRAINT `session_logs_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`ClassId`) REFERENCES `classes` (`ClassId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`StudentTypeId`) REFERENCES `student_types` (`StudentTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `students_ibfk_3` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`GenderId`);

--
-- Constraints for table `student_registration`
--
ALTER TABLE `student_registration`
  ADD CONSTRAINT `student_registration_ibfk_1` FOREIGN KEY (`SessionLogId`) REFERENCES `session_logs` (`SessionLogId`),
  ADD CONSTRAINT `student_registration_ibfk_2` FOREIGN KEY (`ActualSessionActivityId`) REFERENCES `user_session_activities` (`UserSessionActivityId`),
  ADD CONSTRAINT `student_registration_ibfk_3` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`SessionLogId`) REFERENCES `session_logs` (`SessionLogId`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`ActualSessionActivityId`) REFERENCES `user_session_activities` (`UserSessionActivityId`),
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`AdmissionNo`) REFERENCES `students` (`AdmissionNo`),
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`TransactionDescriptionId`) REFERENCES `transaction_descriptions` (`TransactionDescriptionId`),
  ADD CONSTRAINT `transactions_ibfk_5` FOREIGN KEY (`InstallmentId`) REFERENCES `installments` (`InstallmentId`),
  ADD CONSTRAINT `transactions_ibfk_6` FOREIGN KEY (`FeeCorrectionId`) REFERENCES `fee_corrections` (`FeeCorrectionId`),
  ADD CONSTRAINT `transactions_ibfk_7` FOREIGN KEY (`CarryFowardId`) REFERENCES `carryforward` (`CarryFowardId`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`GenderId`) REFERENCES `gender` (`GenderId`);

--
-- Constraints for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD CONSTRAINT `user_access_privileges_ibfk_1` FOREIGN KEY (`AccessPrivilegeId`) REFERENCES `access_privileges` (`AccessPrivilegeId`),
  ADD CONSTRAINT `user_access_privileges_ibfk_2` FOREIGN KEY (`UserRoleId`) REFERENCES `user_roles` (`UserRoleId`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_session_activities`
--
ALTER TABLE `user_session_activities`
  ADD CONSTRAINT `user_session_activities_ibfk_1` FOREIGN KEY (`SessionLogId`) REFERENCES `session_logs` (`SessionLogId`),
  ADD CONSTRAINT `user_session_activities_ibfk_2` FOREIGN KEY (`SessionActivityId`) REFERENCES `session_activities` (`SessionActivityId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
