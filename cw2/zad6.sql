-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 19:47:44.84

-- tables
-- Table: Product
CREATE TABLE Product (
    ProductKey int  NOT NULL,
    Name varchar(30)  NOT NULL,
    Brand varchar(30)  NOT NULL,
    "Current" bit  NOT NULL,
    CONSTRAINT Product_pk PRIMARY KEY  (ProductKey)
);

-- Table: Stock
CREATE TABLE Stock (
    StockKey int  NOT NULL,
    ProductKey int  NOT NULL,
    DateKey int  NOT NULL,
    Stock int  NOT NULL,
    WarehouseKey int  NOT NULL,
    "Current" bit  NOT NULL,
    Warehouse_WarehouseKey int  NOT NULL,
    Product_ProductKey int  NOT NULL,
    Time_DateKey int  NOT NULL,
    CONSTRAINT Stock_pk PRIMARY KEY  (StockKey)
);

-- Table: Time
CREATE TABLE Time (
    DateKey int  NOT NULL,
    Day int  NOT NULL,
    Month int  NOT NULL,
    CONSTRAINT Time_pk PRIMARY KEY  (DateKey)
);

-- Table: Warehouse
CREATE TABLE Warehouse (
    WarehouseKey int  NOT NULL,
    Address varchar(300)  NOT NULL,
    Country varchar(50)  NOT NULL,
    CONSTRAINT Warehouse_pk PRIMARY KEY  (WarehouseKey)
);

-- foreign keys
-- Reference: Stock_Product (table: Stock)
ALTER TABLE Stock ADD CONSTRAINT Stock_Product
    FOREIGN KEY (Product_ProductKey)
    REFERENCES Product (ProductKey);

-- Reference: Stock_Time (table: Stock)
ALTER TABLE Stock ADD CONSTRAINT Stock_Time
    FOREIGN KEY (Time_DateKey)
    REFERENCES Time (DateKey);

-- Reference: Stock_Warehouse (table: Stock)
ALTER TABLE Stock ADD CONSTRAINT Stock_Warehouse
    FOREIGN KEY (Warehouse_WarehouseKey)
    REFERENCES Warehouse (WarehouseKey);

-- sequences
-- Sequence: Product_seq
CREATE SEQUENCE Product_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Stock_seq
CREATE SEQUENCE Stock_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Time_seq
CREATE SEQUENCE Time_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: Warehouse_seq
CREATE SEQUENCE Warehouse_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

