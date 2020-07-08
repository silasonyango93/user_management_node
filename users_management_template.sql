-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 08, 2020 at 06:33 PM
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
-- Database: `users_management_template`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_privileges`
--

CREATE TABLE `access_privileges` (
  `AccessPrivilegeId` int(11) NOT NULL,
  `AccessPrivilegeDescription` varchar(200) NOT NULL,
  `AccessPrivilegeCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `access_privileges`
--

INSERT INTO `access_privileges` (`AccessPrivilegeId`, `AccessPrivilegeDescription`, `AccessPrivilegeCode`) VALUES
(3, 'Login', 1),
(4, 'Add Team Member', 2),
(5, 'Delete Team Member', 3),
(6, 'Assign Team a team member', 4);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `RoleId` int(11) NOT NULL,
  `RoleDescription` varchar(200) NOT NULL,
  `RoleCode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`RoleId`, `RoleDescription`, `RoleCode`) VALUES
(1, 'Admin', 1),
(2, 'Team Lead', 2),
(3, 'Team Member', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `UserName` varchar(200) NOT NULL,
  `UserEmail` varchar(200) NOT NULL,
  `EncryptedPassword` varchar(900) NOT NULL,
  `Salt` varchar(900) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `UserName`, `UserEmail`, `EncryptedPassword`, `Salt`) VALUES
(1, 'Mary', 'mary', 'fd75eea8adbe3865c7b5f37a108e285c7c6d20c6dfab3249b262f2229aa92fb9819a23be19cd550aa349d60bdb21d0f6e8b6e82ee93cbd22fc29ea4640527c02', 'Z69oP7K5YCweMfbCQZZo42pw9emtX0ZXld5a//yL7Bc6QmjkpZuNg9o8MSjkh4ExF5rSgUaO3Y/9B0OdBqw0Hx53aar7euRXBxjS63/zWIR9N6XlixH6Fyh6r+PXf8f+aDMv1MnTiYylcP0Hb/7Qv/kwx5k1Jh47gOTOMzWbxFE='),
(2, 'Mary', 'maryf', '6dd9cdb8b49fa3f52490c5f9837a3ff009b16deae7e4dc399d97a4e505a3c58e83f0043eafbb15e2b68cddcb17707cd9cefcf3ec40f79e7388388196effe3a2f', '2IRbWtST77aE40sWg9oWNht5YZkVyZAYJP1Pri1LQhU/EG6uDVwDjwSIiLLgu+OY8rB+5x0upeZ6quWppcDOLxt3QUiWXPt99RxOnZnVmHRQcFx1PCU8VZaW4HcXjx+7nmKk1+ftgoArahUinWHyCvLM6XQvB8u3PwroN5RM8nc='),
(3, 'Mary', 'maryfh', '607bb223ba4d5ae85b75dc0fd762530499553b6b6cd29436e67d9e3e439f23408dd9f7be6a7b14b589c786e22c5087e64c3a6a3f0816d376fe60dcb1d6172d70', 'zYKxywJ3UH/jQQnsciBzPey5mYGQkclVKncp/YWE15WgzHxFm7HxQsnLlBa8ZMTx8uYz5WhNFy9zZ2h4xFToVf+HADOe6Bxhtk2T3jNl0oASKAJ9AJXGO4744xYCsj5JqDOMaQ98HXHf8QKORhYm8+23KL/JpAPuF6exmJLDpQU='),
(4, 'Mary', 'maryfhw', '23c7f2cfa886a2cb079369eb1fcc6be1854f79b58489c132e5b9a7cfa61b9a33e7a9f17387bb9ad1da5aab2933cf411ec798910be568ba8080a097c8fc7396cb', 'gCyqiAlY+vBiMqKAXWx4QlkcL8TMChJDaV1rxquF+fBTS+ougK9kX+NjeWtm/mtomCVW521BxiCqalvK0465Vn2tMVfT75AaanzL94nm4bijLBnJNBYEC/C6x6j6bxECSTFkSP0pk73sV4C7QBNJjVRq2NgrXiEkn3LNTmWo4Tw='),
(5, 'Mary', 'maryfhwe', '3eff7ab84ce67f9d805e3acda8aa01ca327b5a39dbdbf28a62a05a99e2187acd66fbb8ab4f7a039d7ca4dc2a72e376ac9de9113ef2cd61cc3a5507a1ee87152e', 'DHhO6J4gbjR1hO15f7+SVVl87u/tP83UCD0oP1nl0TW2bMKKUuVuQNmwmwsE8cocJ1Vwo6QfJcz7SV2QE3oCtz/gSL3Ff1hDEzRMNDpGnTN0crv8CptTg80qrWbxfKSYEGNHKCmf53/WSRb0A8OLkds6ZtUETSXZyD5NOVd6dlM='),
(6, 'silas', 'silas', 'de54a78c789e2e6c77e0844ff0cf3fbe42bc3e74b1f0bf57dd093c8888b3162aa29f140dca16822dab71526b9ff683e4ed636dcdfc7b361aef0e123adc4c063d', 'X8MvSz6MzVvDSXKrhaEcSsvKIpwXFGz2CX4rbnmoMZFwpqqRMiiv9EuS4isfltdIHkZg8FrN2neZMnA71G308UAKHbPjSvpbEjvIYVRqnSQg/80IC5C+oM6Fqg4UcZZfnMiV4AChtLTEUAFwC/p9bbguYtObxDNi5n0jp6RxwRU='),
(7, 'silas', 'silasq', '1996e2894558db4a1d1da19ac00aa33ca1ae9ea059e02f0b08a977ee7841150cc5ab318431c850026578095f8cabcddf0f748fe14aa27fa7b709104687423cc0', '9A4Rqb30z+pl3AghQ9FeT+OSDLgxHVG/hzs1CfuEyYJ+bmu0/pNWpri8i20kdjJzJ2kmNXE2j+dMwVFiTC1FudC7Ck/gpQ1rpgQ1Vqnt6mmgE0L8sTc3MxKjjKvrf/E0Rh7E8+mJP9/ldShgUrqcO8n3OhlIer/sK2IxUWfjCI0='),
(8, 'silas', 'silasqw', '9c296d18594c0789bf23f38545aac711bf24482827564156064f61a686f24d677e54e1a71d04ce0aa43566fcd4c919739cbf544a10a34b6f8b478ef8d125522f', 'DkRy8nQOAf8uQWJwPJdWtNt1xNRA3ioOG6h/POJ3+iCRBU2d1M0E1+JqB+aHxwoiscldiUt24Xfdf8CtR0ZJsnbgiZsGjiUIVCsqxFBK6mJePyhaDBi1jxaau1wPnDKncILyGhrjACE59AzOhDKQu66y6lMvwtuHwP5XwhjdHl4=');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_privileges`
--

CREATE TABLE `user_access_privileges` (
  `UserAccessPrivilegeId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `UserRoleId` int(11) NOT NULL,
  `AccessPrivilegeId` int(11) NOT NULL,
  `PermisionStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_access_privileges`
--

INSERT INTO `user_access_privileges` (`UserAccessPrivilegeId`, `UserId`, `UserRoleId`, `AccessPrivilegeId`, `PermisionStatus`) VALUES
(1, 8, 7, 3, 0),
(2, 8, 7, 4, 0),
(3, 8, 7, 5, 0),
(4, 8, 8, 3, 0),
(5, 8, 7, 6, 0),
(6, 8, 8, 4, 0),
(7, 8, 8, 5, 0),
(8, 8, 9, 3, 0),
(9, 8, 8, 6, 0),
(10, 8, 9, 4, 0),
(11, 8, 9, 5, 0),
(12, 8, 9, 6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `UserRoleId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `ConfirmationStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`UserRoleId`, `UserId`, `RoleId`, `ConfirmationStatus`) VALUES
(1, 6, 1, 0),
(2, 6, 2, 0),
(3, 6, 3, 0),
(4, 7, 1, 0),
(5, 7, 2, 0),
(6, 7, 3, 0),
(7, 8, 1, 0),
(8, 8, 2, 0),
(9, 8, 3, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_privileges`
--
ALTER TABLE `access_privileges`
  ADD PRIMARY KEY (`AccessPrivilegeId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- Indexes for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD PRIMARY KEY (`UserAccessPrivilegeId`),
  ADD KEY `UserId` (`UserId`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_privileges`
--
ALTER TABLE `access_privileges`
  MODIFY `AccessPrivilegeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  MODIFY `UserAccessPrivilegeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `UserRoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_access_privileges`
--
ALTER TABLE `user_access_privileges`
  ADD CONSTRAINT `user_access_privileges_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_privileges_ibfk_2` FOREIGN KEY (`AccessPrivilegeId`) REFERENCES `access_privileges` (`AccessPrivilegeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_access_privileges_ibfk_3` FOREIGN KEY (`UserRoleId`) REFERENCES `user_roles` (`UserRoleId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`RoleId`) REFERENCES `roles` (`RoleId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
