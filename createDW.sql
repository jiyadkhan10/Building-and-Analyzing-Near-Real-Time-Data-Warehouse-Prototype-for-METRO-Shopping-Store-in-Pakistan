drop schema if exists metro;
create schema `metro`;

CREATE TABLE `metro`.`customer` (
 `C_ID` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`C_id`));
CREATE TABLE `metro`.`supplier` (
 `Sup_ID` VARCHAR(45) NOT NULL,
 `Sup_name` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`Sup_ID`));
CREATE TABLE `metro`.`product` (
 `P_ID` VARCHAR(45) NOT NULL,
 `P_NAME` VARCHAR(45) NULL,
 `Price` float NULL,
 PRIMARY KEY (`P_ID`));
CREATE TABLE `metro`.`store` (
 `S_ID` VARCHAR(45) NOT NULL,
 `S_NAME` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`S_ID`));
CREATE TABLE `metro`.`DDate` (
 `D_ID` VARCHAR(45) NOT NULL,
 `Date` VARCHAR(45) NOT NULL,
 `Day` VARCHAR(45) NOT NULL,
 `Month` VARCHAR(45) NOT NULL,
 `Quater` VARCHAR(45) NOT NULL,
 `Year` VARCHAR(45) NOT NULL,
 PRIMARY KEY (`D_ID`));
 
 CREATE TABLE `metro`.`Fact` (
 `Transaction_ID` int NOT NULL,
 `D_ID` VARCHAR(45) NOT NULL,
 `S_ID` VARCHAR(45) NOT NULL,
 `P_ID` VARCHAR(45) NOT NULL,
 `Sup_ID` VARCHAR(45) NOT NULL,
 `C_ID` VARCHAR(45) NOT NULL,
 `Total_Sales` float NOT NULL,
 foreign KEY (D_ID) references DDate(D_ID),
 foreign KEY (S_ID) references store(S_ID),
 foreign KEY (P_ID) references product(P_ID),
 foreign KEY (Sup_ID) references supplier(Sup_ID),
 foreign KEY (C_ID) references customer(C_ID));