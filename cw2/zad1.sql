-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 19:16:16.554

-- tables
-- Table: CourierCompanyDim
CREATE TABLE CourierCompanyDim (
    CourierKey int  NOT NULL,
    Name varchar(50)  NOT NULL,
    NIP char(10)  NOT NULL,
    Address varchar(300)  NOT NULL,
    CONSTRAINT CourierCompanyDim_pk PRIMARY KEY  (CourierKey)
);

-- Table: DimClient
CREATE TABLE DimClient (
    ClientKey int  NOT NULL,
    LastName varchar(50)  NOT NULL,
    FirstName varchar(50)  NOT NULL,
    PhoneNumber varchar(20)  NOT NULL,
    Address varchar(300)  NOT NULL,
    CONSTRAINT DimClient_pk PRIMARY KEY  (ClientKey)
);

-- Table: DimProduct
CREATE TABLE DimProduct (
    ProductKey int  NOT NULL,
    Publisher varchar(50)  NOT NULL,
    ISBN char(13)  NOT NULL,
    CONSTRAINT DimProduct_pk PRIMARY KEY  (ProductKey)
);

-- Table: SalesFacts
CREATE TABLE SalesFacts (
    SaleKey int  NOT NULL,
    ProductKey int  NOT NULL,
    ClientKey int  NOT NULL,
    CourierKey int  NOT NULL,
    Date date  NOT NULL,
    DimProduct_ProductKey int  NOT NULL,
    DimClient_ClientKey int  NOT NULL,
    CourierCompanyDim_CourierKey int  NOT NULL,
    CONSTRAINT SalesFacts_pk PRIMARY KEY  (SaleKey)
);

-- foreign keys
-- Reference: SalesFacts_CourierCompanyDim (table: SalesFacts)
ALTER TABLE SalesFacts ADD CONSTRAINT SalesFacts_CourierCompanyDim
    FOREIGN KEY (CourierCompanyDim_CourierKey)
    REFERENCES CourierCompanyDim (CourierKey);

-- Reference: tabela_faktow_klient (table: SalesFacts)
ALTER TABLE SalesFacts ADD CONSTRAINT tabela_faktow_klient
    FOREIGN KEY (DimClient_ClientKey)
    REFERENCES DimClient (ClientKey);

-- Reference: tabela_faktow_produkt (table: SalesFacts)
ALTER TABLE SalesFacts ADD CONSTRAINT tabela_faktow_produkt
    FOREIGN KEY (DimProduct_ProductKey)
    REFERENCES DimProduct (ProductKey);

-- sequences
-- Sequence: CourierCompanyDim_seq
CREATE SEQUENCE CourierCompanyDim_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimClient_seq
CREATE SEQUENCE DimClient_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DimProduct_seq
CREATE SEQUENCE DimProduct_seq
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

-- End of file.

