CREATE DATABASE mls;

USE mls;

CREATE TABLE app_info (
    mls_id INTEGER,
    system_name VARCHAR(25),
    description VARCHAR(255),
	department VARCHAR(25),
	app_owner VARCHAR(255),
	app_delegate VARCHAR(255),
	app_sme VARCHAR(255),
	bia_rating ENUM('High', 'Medium', 'Low'),
	criticality ENUM('Platinum', 'Gold', 'Silver', 'Bronze'),
	hosted ENUM('Internal', '3rd Party'),
	user_access ENUM('IT', 'Vendor'),
    PRIMARY KEY (mls_id)
);

CREATE TABLE app_risk (
    id INTEGER,
    criticality ENUM('Platinum', 'Gold', 'Silver', 'Bronze'),
    rto ENUM('4hrs', '8hrs', '12hrs', '24hrs'),
	rpo ENUM('8hrs', '24hrs'),
    PRIMARY KEY (id)
);

INSERT INTO app_info (mls_id, system_name, description, department, app_owner, app_delegate, app_sme, bia_rating, criticality, hosted, user_access) 
VALUES
    (1001, "ACBS", "Commercial Lending and Trading System", "Accounting", "John Anderson", "Sofia James", "Robert Council", "High", "Gold", "Internal", "IT"),
    (1002, "Bloomberg", "Financial Trading System", "Financial Markets", "Angela Silva", "Jose Rodriguez", "Georgia Curtis", "Medium", "Silver", "3rd Party", "Vendor"),
    (1003, "LexWorkplace", "Legal Document Management System", "Legal", "Kevin Smith", "Andy Warhol", "Chase Finnan", "Medium", "Bronze", "Internal", "IT"),
    (1004, "Microsoft Outlook", "Enterprise Email System", "Everyone", "Chris Jones", "Lee Smith", "Kyle Richards", "Low", "Platinum", "Internal", "IT"),
    (1005, "Microsoft SQL Server", "Relational Database Management System", "IT", "John Chu", "Kenny Sebastian", "Kanan Gill", "High", "Gold", "Internal", "IT");

INSERT INTO app_risk (id, criticality, rto, rpo) 
VALUES
    (1, "Platinum", "4hrs", "8hrs"),
    (2, "Gold", "8hrs", "24hrs"),
	(3, "Silver", "12hrs", "24hrs"),
    (4, "Bronze", "24hrs", "24hrs");

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'it635';
CREATE USER 'user'@'%' IDENTIFIED BY 'password';
GRANT ALL ON mls.app_info TO 'user'@'%';
GRANT ALL ON mls.app_risk TO 'user'@'%';
FLUSH PRIVILEGES;