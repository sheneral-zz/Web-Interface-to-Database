CREATE TABLE `SG_AUTHOR_INVENTORY_INT` (
  `TitleID` int(11) NOT NULL,
  `AuthorID` int(11) NOT NULL,
  PRIMARY KEY (`TitleID`,`AuthorID`),
  KEY `AI_AuthorFK` (`AuthorID`),
  CONSTRAINT `AI_TitleFK` FOREIGN KEY (`TitleID`) REFERENCES `SG_INVENTORY` (`TitleID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `AI_AuthorFK` FOREIGN KEY (`AuthorID`) REFERENCES `SG_AUTHOR` (`AuthorID`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `SG_AUTHOR` (
  `AuthorID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` char(30) NOT NULL,
  `LastName` char(30) NOT NULL,
  PRIMARY KEY (`AuthorID`)
);

CREATE TABLE `SG_BOOKS_LENT` (
  `TitleID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `BorrowDate` date NOT NULL,
  `DueDate` datetime DEFAULT NULL,
  PRIMARY KEY (`TitleID`,`CustomerID`),
  KEY `CustomerFK` (`CustomerID`),
  CONSTRAINT `CustomerFK` FOREIGN KEY (`CustomerID`) REFERENCES `SG_CUSTOMER` (`CustomerID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `TitleFK` FOREIGN KEY (`TitleID`) REFERENCES `SG_INVENTORY` (`TitleID`) ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE `SG_CUSTOMER` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` char(30) NOT NULL,
  `LastName` char(30) NOT NULL,
  `Address` char(70) DEFAULT NULL,
  `ZipCode` mediumint(5) unsigned zerofill DEFAULT NULL,
  `PhoneNumber` char(20) NOT NULL,
  PRIMARY KEY (`CustomerID`)
);

CREATE TABLE `SG_INVENTORY` (
  `TitleID` int(11) NOT NULL AUTO_INCREMENT,
  `Title` char(80) NOT NULL,
  `PublicationDate` date DEFAULT NULL,
  PRIMARY KEY (`TitleID`)
);

CREATE TABLE `SG_RETURN_INFO` (
  `TitleID` int(11) NOT NULL,
  `ReturnDate` date NOT NULL,
  `OverDue` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`TitleID`),
  CONSTRAINT `ReturnInfoFK` FOREIGN KEY (`TitleID`) REFERENCES `SG_INVENTORY` (`TitleID`) ON DELETE CASCADE ON UPDATE NO ACTION
);

