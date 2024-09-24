SHOW DATABASES;

USE mysql;

SHOW CREATE DATABASE mysql;

SHOW TABLES;

DESCRIBE user;

SHOW CREATE TABLE servers;

SHOW COLUMNS FROM servers;

CREATE TABLE IF NOT EXISTS Actors (
    Id INT AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    SecondName VARCHAR(20) NOT NULL,
    DoB DATE NOT NULL,
    Gender ENUM('Male', 'Female', 'Other') NOT NULL ,
    MaritalStatus ENUM('Married', 'Divorce', 'Single', 'Unknown') DEFAULT 'Unknown',
    NetWorthInMillions DECIMAL NOT NULL,
    PRIMARY KEY (Id));






-- Views
CREATE VIEW DigitalAssetCount AS
SELECT ActorId, COUNT(AssetType) AS NumberOfAssets
FROM DigitalAssets
GROUP BY ActorId;


