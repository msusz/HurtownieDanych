-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-10-16 19:42:20.898

-- tables
-- Table: DimEvaluation
CREATE TABLE DimEvaluation (
    EmployeeKey int  NOT NULL,
    EvaluationScore int  NOT NULL,
    EffectiveDate date  NOT NULL,
    "Current" bit  NOT NULL,
    EvaluationKey int  NOT NULL,
    FactsEmployees_EmployeeKey int  NOT NULL,
    CONSTRAINT DimEvaluation_pk PRIMARY KEY  (EmployeeKey)
);

-- Table: FactsEmployees
CREATE TABLE FactsEmployees (
    EmployeeKey int  NOT NULL,
    PESEL char(13)  NOT NULL,
    Address varchar(300)  NOT NULL,
    Salary decimal(12,2)  NOT NULL,
    CONSTRAINT FactsEmployees_pk PRIMARY KEY  (EmployeeKey)
);

-- foreign keys
-- Reference: DimEvaluation_FactsEmployees (table: DimEvaluation)
ALTER TABLE DimEvaluation ADD CONSTRAINT DimEvaluation_FactsEmployees
    FOREIGN KEY (FactsEmployees_EmployeeKey)
    REFERENCES FactsEmployees (EmployeeKey);

-- sequences
-- Sequence: DimEvaluation_seq
CREATE SEQUENCE DimEvaluation_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- Sequence: FactsEmployees_seq
CREATE SEQUENCE FactsEmployees_seq
    START WITH 1 
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    NO CYCLE
    NO CACHE;

-- End of file.

