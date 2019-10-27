-- Create database script
-- Barney Young - 40231585 - Team 48
-- Draft 2 - 2019-10-17

CREATE DATABASE IF NOT EXISTS `QUBAccomodation48`;

CREATE TABLE IF NOT EXISTS `Person`
(
    `PersonID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `EmergencyContactName` VARCHAR(255) NOT NULL,
    `EmergencyContactNumber` INT NOT NULL,
    `EmergencyContactRelation` VARCHAR(255) NOT NULL,
    `BankAccNo` INT NOT NULL,
    PRIMARY KEY(`PersonID`),
    INDEX(`FirstName`),
    INDEX(`LastName`)
);

CREATE TABLE IF NOT EXISTS `Tenant`
(
    `TenantID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `PersonID` INT NOT NULL,
    PRIMARY KEY(`TenantID`),
    FOREIGN KEY(`PersonID`) REFERENCES Person(`PersonID`)
);

CREATE TABLE IF NOT EXISTS `Employee`
(
    `EmployeeID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `PersonID` INT NOT NULL,
    `Pay` DOUBLE NOT NULL,
    PRIMARY KEY(`EmployeeID`),
    FOREIGN KEY(`PersonID`) REFERENCES Person(`PersonID`)
);

CREATE TABLE IF NOT EXISTS `Manager`
(
    `ManagerID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `EmployeeID` INT NOT NULL,
    PRIMARY KEY(`ManagerID`),
    FOREIGN KEY(`EmployeeID`) REFERENCES Employee(`EmployeeID`)
);

CREATE TABLE IF NOT EXISTS `Skill`
(
    `SkillID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `SkillName` VARCHAR(255),
    PRIMARY KEY(`SkillID`),
    INDEX(`SkillName`)
);

CREATE TABLE IF NOT EXISTS `TechnicianSkill`
(
    `EmployeeID` INT NOT NULL,
    `SkillID` INT NOT NULL,
    FOREIGN KEY(`EmployeeID`) REFERENCES Employee(`EmployeeID`),
    FOREIGN KEY(`SkillID`) REFERENCES Skill(`SkillID`)
);

CREATE TABLE IF NOT EXISTS `Building`
(
    `BuildingID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `Address` TEXT,
    `Postcode` VARCHAR(8),
    PRIMARY KEY(`BuildingID`)
);

CREATE TABLE IF NOT EXISTS `Apartment`
(
    `AptID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `AptNo` INT NOT NULL,
    `Bedrooms` INT,
    `Bathrooms` INT,
    `TotalArea` INT,
    PRIMARY KEY(`AptID`),
    INDEX(`AptNo`)
);

CREATE TABLE IF NOT EXISTS `ApartmentBuilding`
(
    `AptID` INT NOT NULL,
    `BuildingID` INT NOT NULL,
    FOREIGN KEY(`AptID`) REFERENCES Apartment(`AptID`),
    FOREIGN KEY(`BuildingID`) REFERENCES Building(`BuildingID`)
);

CREATE TABLE IF NOT EXISTS `Office`
(
    `OfficeID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `AptID` INT NOT NULL,
    PRIMARY KEY(`OfficeID`),
    FOREIGN KEY(`AptID`) REFERENCES Apartment(`AptID`)
);

CREATE TABLE IF NOT EXISTS `ManagerOffice`
(
    `ManagerID` INT NOT NULL,
    `OfficeID` INT NOT NULL,
    FOREIGN KEY(`ManagerID`) REFERENCES Manager(`ManagerID`),
    FOREIGN KEY(`OfficeID`) REFERENCES Office(`OfficeID`)
);

CREATE TABLE IF NOT EXISTS `ApartmentManager`
(
    `AptID` INT NOT NULL,
    `ManagerID` INT NOT NULL,
    FOREIGN KEY(`AptID`) REFERENCES Apartment(`AptID`),
    FOREIGN KEY(`ManagerID`) REFERENCES Manager(`ManagerID`)
);

CREATE TABLE IF NOT EXISTS `Lease`
(
    `LeaseID` INT NOT NULL AUTO_INCREMENT UNIQUE,
    `AptID` INT NOT NULL,
    `StartDate` DATE NOT NULL,
    `Duration` INT NOT NULL,
    `Rent` DOUBLE NOT NULL,
    PRIMARY KEY(`LeaseID`),
    FOREIGN KEY(`AptID`) REFERENCES Apartment(`AptID`),
    INDEX(`StartDate`)
);

CREATE TABLE IF NOT EXISTS `LeaseTenant`
(
    `LeaseID` INT NOT NULL,
    `TenantID` INT NOT NULL,
    FOREIGN KEY(`LeaseID`) REFERENCES Lease(`LeaseID`),
    FOREIGN KEY(`TenantID`) REFERENCES Tenant(`TenantID`)
);

CREATE TABLE IF NOT EXISTS `LeaseManager`
(
    `LeaseID` INT NOT NULL,
    `ManagerID` INT NOT NULL,
    FOREIGN KEY(`LeaseID`) REFERENCES Lease(`LeaseID`),
    FOREIGN KEY(`ManagerID`) REFERENCES Manager(`ManagerID`)
);