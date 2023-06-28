-- Table to query the description of the AccidentType Codes

create table "AccidentID"
(
    "Code_ACType"       VARCHAR2(4) not null
        primary key,
    "AccidentType_DESC" VARCHAR2(30)
);

-- Table to query the description of the Canton Code

create table "CantonDescription"
(
    "CantonCode"  VARCHAR2(2) not null
        primary key,
    "Description" VARCHAR2(25)
);

-- Table to query the CantonCode related to the MunicipalityCode

create table "MunicipalityCanton"
(
    "CantonCode"       VARCHAR2(2)
        constraint "CantonCode"
            references "CantonDescription",
    "MunicipalityCode" NUMBER not null
        primary key
);

-- Table to query the description of the RoadID

create table "RoadID"
(
    "RoadType"      VARCHAR2(5)  not null
        primary key,
    "RoadType_DESC" VARCHAR2(30) not null
);

-- Table to query the description of the SeverityID

create table "SeverityID"
(
    "Code_Severity"                 VARCHAR2(3) not null
        primary key,
    "AccidentSeverityCategory_DESC" VARCHAR2(30)
);


-- Main table containing the informations about all car accidents since 2011

create table "TrafficRecord"
(
    "Index"                       NUMBER      not null
        unique,
    "AccidentType"                VARCHAR2(4) not null
        constraint "TrafficRecord_AccidentID_Code_ACType_fk"
            references "AccidentID",
    "AccidentSeverityCategory"    VARCHAR2(4) not null
        constraint "TrafficRecord_SeverityID_Code_Severity_fk"
            references "SeverityID",
    "AccidentInvolvingPedestrian" VARCHAR2(5) not null,
    "AccidentInvolvingBicycle"    VARCHAR2(5) not null,
    "AccidentInvolvingMotorcycle" VARCHAR2(5) not null,
    "RoadType"                    VARCHAR2(5) not null
        constraint "TrafficRecord_RoadID_test_RoadType_fk"
            references "RoadID",
    "MunicipalityCode"            NUMBER      not null
        constraint "TrafficRecord_MunicipalityCanton_MunicipalityCode_fk"
            references "MunicipalityCanton",
    "AccidentYear"                NUMBER      not null,
    "AccidentMonth"               NUMBER      not null,
    "Weekday"                     VARCHAR2(10)        not null,
    "AccidentHour"                NUMBER
);