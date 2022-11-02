-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-11-02 12:43:25.524

-- tables
-- Table: DIMCustomers
CREATE TABLE DIMCustomers (
    id_key int  NOT NULL,
    customer_id varchar(10)  NULL,
    first_name varchar(50)  NULL,
    last_name varchar(50)  NULL,
    street varchar(100)  NULL,
    city varchar(50)  NULL,
    state varchar(50)  NULL,
    country varchar(50)  NULL,
    phone varchar(30)  NULL,
    email varchar(50)  NULL,
    CONSTRAINT DIMCustomers_pk PRIMARY KEY  (id_key)
);

-- Table: DIMDate
CREATE TABLE DIMDate (
    date_id int  NOT NULL,
    date date  NOT NULL,
    quater int  NOT NULL,
    year int  NOT NULL,
    week_day int  NOT NULL,
    month int  NOT NULL,
    CONSTRAINT DIMDate_pk PRIMARY KEY  (date_id)
);

-- Table: DIMPizzaTypes
CREATE TABLE DIMPizzaTypes (
    id_key int  NOT NULL,
    pizza_type_id varchar(10)  NULL,
    name varchar(50)  NULL,
    ingredients varchar(300)  NULL,
    pizza_id varchar(10)  NULL,
    category varchar(30)  NULL,
    size varchar(2)  NULL,
    price varchar(10)  NULL,
    CONSTRAINT DIMPizzaTypes_pk PRIMARY KEY  (id_key)
);

-- Table: FactSales
CREATE TABLE FactSales (
    id int  NOT NULL,
    customer_id int  NOT NULL,
    pizza_type_id int  NOT NULL,
    date_id int  NOT NULL,
    timestamp datetime2  NOT NULL,
    amount varchar(10)  NOT NULL,
    CONSTRAINT FactSales_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: FactSales_DIMCustomers (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DIMCustomers
    FOREIGN KEY (customer_id)
    REFERENCES DIMCustomers (id_key);

-- Reference: FactSales_DIMDate (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DIMDate
    FOREIGN KEY (date_id)
    REFERENCES DIMDate (date_id);

-- Reference: FactSales_DIMPizzaTypes (table: FactSales)
ALTER TABLE FactSales ADD CONSTRAINT FactSales_DIMPizzaTypes
    FOREIGN KEY (pizza_type_id)
    REFERENCES DIMPizzaTypes (id_key);

-- sequences
-- Sequence: DIMCustomers_seq
CREATE SEQUENCE DIMCustomers_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMDate_seq
CREATE SEQUENCE DIMDate_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: DIMPizzaTypes_seq
CREATE SEQUENCE DIMPizzaTypes_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactSales_seq
CREATE SEQUENCE FactSales_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

