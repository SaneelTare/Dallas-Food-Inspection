/*
 * ER/Studio Data Architect SQL Code Generation
 * Project :      DallasFoodInspection.DM1
 *
 * Date Created : Thursday, October 06, 2022 16:05:04
 * Target DBMS : Microsoft SQL Server 2019
 */

/* 
 * TABLE: DimDate 
 */

CREATE TABLE DimDate(
    Date_ID_SK          int             NOT NULL,
    Inspection_Date     nvarchar(10)    NULL,
    Inspection_Month    nvarchar(8)     NULL,
    Inspection_Year     nvarchar(10)    NULL
)

go


IF OBJECT_ID('DimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDate >>>'
go

/* 
 * TABLE: DimDate 
 */

ALTER TABLE DimDate ADD 
    CONSTRAINT PK4 PRIMARY KEY CLUSTERED (Date_ID_SK)
go

IF OBJECT_ID('DimDate') IS NOT NULL
    PRINT '<<< CREATED TABLE DimDate >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimDate >>>'
go

/* 
 * TABLE: DimInspection 
 */

CREATE TABLE DimInspection(
    Inspection_ID_SK    int            NOT NULL,
    Inspection_Type     nvarchar(9)    NULL
)

go


IF OBJECT_ID('DimInspection') IS NOT NULL
    PRINT '<<< CREATED TABLE DimInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimInspection >>>'
go

/* 
 * TABLE: DimInspection 
 */

ALTER TABLE DimInspection ADD 
    CONSTRAINT PK5 PRIMARY KEY CLUSTERED (Inspection_ID_SK)
go

IF OBJECT_ID('DimInspection') IS NOT NULL
    PRINT '<<< CREATED TABLE DimInspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimInspection >>>'
go

/* 
 * TABLE: DimLocation 
 */

CREATE TABLE DimLocation(
    Location_ID_SK       int             NOT NULL,
    Street_Direction     nvarchar(1)     NULL,
    Street_Type          nvarchar(10)    NULL,
    Street_Number        int             NULL,
    Street_Address       nvarchar(25)    NULL,
    Street_Unit          nvarchar(10)    NULL,
    ZipCode              nvarchar(10)    NULL,
    Lat_Long_Location    nvarchar(10)    NULL
)

go


IF OBJECT_ID('DimLocation') IS NOT NULL
    PRINT '<<< CREATED TABLE DimLocation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimLocation >>>'
go

/* 
 * TABLE: DimLocation 
 */

ALTER TABLE DimLocation ADD 
    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (Location_ID_SK)
go

IF OBJECT_ID('DimLocation') IS NOT NULL
    PRINT '<<< CREATED TABLE DimLocation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimLocation >>>'
go

/* 
 * TABLE: DimRestaurant 
 */

CREATE TABLE DimRestaurant(
    Restaurant_ID      int             NOT NULL,
    Restaurant_Name    nvarchar(65)    NULL
)

go


IF OBJECT_ID('DimRestaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE DimRestaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimRestaurant >>>'
go

/* 
 * TABLE: DimRestaurant 
 */

ALTER TABLE DimRestaurant ADD 
    CONSTRAINT PK3 PRIMARY KEY CLUSTERED (Restaurant_ID)
go

IF OBJECT_ID('DimRestaurant') IS NOT NULL
    PRINT '<<< CREATED TABLE DimRestaurant >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimRestaurant >>>'
go

/* 
 * TABLE: DimViolation 
 */

CREATE TABLE DimViolation(
    Violation_ID_SK          int             NOT NULL,
    Violation_Detail         char(1018)      NULL,
    Violation_Description    nvarchar(10)    NULL,
    Violation_Memo           nvarchar(10)    NULL
)

go


IF OBJECT_ID('DimViolation') IS NOT NULL
    PRINT '<<< CREATED TABLE DimViolation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimViolation >>>'
go

/* 
 * TABLE: DimViolation 
 */

ALTER TABLE DimViolation ADD 
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (Violation_ID_SK)
go

IF OBJECT_ID('DimViolation') IS NOT NULL
    PRINT '<<< CREATED TABLE DimViolation >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE DimViolation >>>'
go

/* 
 * TABLE: Fact_Dallas_Food_Inspection 
 */

CREATE TABLE Fact_Dallas_Food_Inspection(
    Fact_ID_SK          int            NOT NULL,
    Inspection_ID_SK    int            NOT NULL,
    Date_ID_SK          int            NOT NULL,
    Violation_ID_SK     int            NOT NULL,
    Restaurant_ID       int            NOT NULL,
    Location_ID_SK      int            NOT NULL,
    Violation_Points    nvarchar(1)    NULL,
    Inspection_Score    nvarchar(1)    NULL
)

go


IF OBJECT_ID('Fact_Dallas_Food_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Dallas_Food_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Dallas_Food_Inspection >>>'
go

/* 
 * TABLE: Fact_Dallas_Food_Inspection 
 */

ALTER TABLE Fact_Dallas_Food_Inspection ADD 
    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (Fact_ID_SK)
go

IF OBJECT_ID('Fact_Dallas_Food_Inspection') IS NOT NULL
    PRINT '<<< CREATED TABLE Fact_Dallas_Food_Inspection >>>'
ELSE
    PRINT '<<< FAILED CREATING TABLE Fact_Dallas_Food_Inspection >>>'
go

/* 
 * INDEX: Ref52 
 */

CREATE INDEX Ref52 ON Fact_Dallas_Food_Inspection(Inspection_ID_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Fact_Dallas_Food_Inspection') AND name='Ref52')
    PRINT '<<< CREATED INDEX Fact_Dallas_Food_Inspection.Ref52 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Fact_Dallas_Food_Inspection.Ref52 >>>'
go

/* 
 * INDEX: Ref33 
 */

CREATE INDEX Ref33 ON Fact_Dallas_Food_Inspection(Restaurant_ID)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Fact_Dallas_Food_Inspection') AND name='Ref33')
    PRINT '<<< CREATED INDEX Fact_Dallas_Food_Inspection.Ref33 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Fact_Dallas_Food_Inspection.Ref33 >>>'
go

/* 
 * INDEX: Ref44 
 */

CREATE INDEX Ref44 ON Fact_Dallas_Food_Inspection(Date_ID_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Fact_Dallas_Food_Inspection') AND name='Ref44')
    PRINT '<<< CREATED INDEX Fact_Dallas_Food_Inspection.Ref44 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Fact_Dallas_Food_Inspection.Ref44 >>>'
go

/* 
 * INDEX: Ref15 
 */

CREATE INDEX Ref15 ON Fact_Dallas_Food_Inspection(Location_ID_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Fact_Dallas_Food_Inspection') AND name='Ref15')
    PRINT '<<< CREATED INDEX Fact_Dallas_Food_Inspection.Ref15 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Fact_Dallas_Food_Inspection.Ref15 >>>'
go

/* 
 * INDEX: Ref86 
 */

CREATE INDEX Ref86 ON Fact_Dallas_Food_Inspection(Violation_ID_SK)
go
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id=OBJECT_ID('Fact_Dallas_Food_Inspection') AND name='Ref86')
    PRINT '<<< CREATED INDEX Fact_Dallas_Food_Inspection.Ref86 >>>'
ELSE
    PRINT '<<< FAILED CREATING INDEX Fact_Dallas_Food_Inspection.Ref86 >>>'
go

/* 
 * TABLE: Fact_Dallas_Food_Inspection 
 */

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDimInspection2 
    FOREIGN KEY (Inspection_ID_SK)
    REFERENCES DimInspection(Inspection_ID_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDimRestaurant3 
    FOREIGN KEY (Restaurant_ID)
    REFERENCES DimRestaurant(Restaurant_ID)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDimDate4 
    FOREIGN KEY (Date_ID_SK)
    REFERENCES DimDate(Date_ID_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDimLocation5 
    FOREIGN KEY (Location_ID_SK)
    REFERENCES DimLocation(Location_ID_SK)
go

ALTER TABLE Fact_Dallas_Food_Inspection ADD CONSTRAINT RefDimViolation6 
    FOREIGN KEY (Violation_ID_SK)
    REFERENCES DimViolation(Violation_ID_SK)
go


