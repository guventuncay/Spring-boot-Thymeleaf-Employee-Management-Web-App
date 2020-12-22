DROP DATABASE  IF EXISTS `spring_security_demo_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `spring_security_demo_bcrypt`;
USE `spring_security_demo_bcrypt`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- A generation tool is avail at: http://www.luv2code.com/generate-bcrypt-password
--
-- Default passwords here are: fun123
--

INSERT INTO `users` 
VALUES 
('GuvenEmp','{bcrypt}$2y$12$mZ85BOnQBU6A9Ahg18Ppu.GAUSZqm6REAbUHQMqTdYSrOJaQDdCe6',1),
('GuvenMan','{bcrypt}$2y$12$mZ85BOnQBU6A9Ahg18Ppu.GAUSZqm6REAbUHQMqTdYSrOJaQDdCe6',1),
('GuvenAdm','{bcrypt}$2y$12$mZ85BOnQBU6A9Ahg18Ppu.GAUSZqm6REAbUHQMqTdYSrOJaQDdCe6',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('GuvenEmp','ROLE_EMPLOYEE'),
('GuvenMan','ROLE_EMPLOYEE'),
('GuvenMan','ROLE_MANAGER'),
('GuvenAdm','ROLE_EMPLOYEE'),
('GuvenAdm','ROLE_ADMIN');


