-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 19:33:13.681

-- tables
-- Table: ClientDim
CREATE TABLE ClientDim (
    ClientKey int  NOT NULL,
    Name varchar(50)  NOT NULL,
    NIP char(10)  NOT NULL,
    Address varchar(300)  NOT NULL,
    CONSTRAINT ClientDim_pk PRIMARY KEY  (ClientKey)
);

-- Table: FruitCategoryDim
CREATE TABLE FruitCategoryDim (
    FruitCategoryKey int  NOT NULL,
    FruitCategory varchar(50)  NOT NULL,
    CONSTRAINT FruitCategoryDim_pk PRIMARY KEY  (FruitCategoryKey)
);

-- Table: FruitDim
CREATE TABLE FruitDim (
    FruitKey int  NOT NULL,
    Name varchar(20)  NOT NULL,
    PriceKg decimal(12,2)  NOT NULL,
    FruitCategoryKey int  NOT NULL,
    FruitCategoryDim_FruitCategoryKey int  NOT NULL,
    CONSTRAINT FruitDim_pk PRIMARY KEY  (FruitKey)
);

-- Table: SalesFacts
CREATE TABLE SalesFacts (
    SaleKey int  NOT NULL,
    ClientKey int  NOT NULL,
    FruitKey int  NOT NULL,
    Quantity int  NOT NULL,
    Total decimal(12,2)  NOT NULL,
    Place varchar(50)  NOT NULL,
    TimeKey int  NOT NULL,
    FruitDim_FruitKey int  NOT NULL,
    ClientDim_ClientKey int  NOT NULL,
    TimeDim_DateKey int  NOT NULL,
    CONSTRAINT SalesFacts_pk PRIMARY KEY  (SaleKey)
);

-- Table: TimeDim
CREATE TABLE TimeDim (
    DateKey int  NOT NULL,
    Day int  NOT NULL,
    Month int  NOT NULL,
    Time time  NOT NULL,
    CONSTRAINT TimeDim_pk PRIMARY KEY  (DateKey)
);

-- foreign keys
-- Reference: FruitDim_FruitCategoryDim (table: FruitDim)
ALTER TABLE FruitDim ADD CONSTRAINT FruitDim_FruitCategoryDim
    FOREIGN KEY (FruitCategoryDim_FruitCategoryKey)
    REFERENCES FruitCategoryDim (FruitCategoryKey);

-- Reference: SalesFacts_TimeDim (table: SalesFacts)
ALTER TABLE SalesFacts ADD CONSTRAINT SalesFacts_TimeDim
    FOREIGN KEY (TimeDim_DateKey)
    REFERENCES TimeDim (DateKey);

-- Reference: zakupy_klient (table: SalesFacts)
ALTER TABLE SalesFacts ADD CONSTRAINT zakupy_klient
    FOREIGN KEY (ClientDim_ClientKey)
    REFERENCES ClientDim (ClientKey);

-- Reference: zakupy_owoc (table: SalesFacts)
ALTER TABLE SalesFacts ADD CONSTRAINT zakupy_owoc
    FOREIGN KEY (FruitDim_FruitKey)
    REFERENCES FruitDim (FruitKey);

-- sequences
-- Sequence: ClientDim_seq
CREATE SEQUENCE ClientDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FruitCategoryDim_seq
CREATE SEQUENCE FruitCategoryDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FruitDim_seq
CREATE SEQUENCE FruitDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: SalesFacts_seq
CREATE SEQUENCE SalesFacts_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: TimeDim_seq
CREATE SEQUENCE TimeDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

