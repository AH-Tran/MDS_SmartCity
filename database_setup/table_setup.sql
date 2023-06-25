-- Table for Q0:

CREATE TABLE accidents (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  AccidentType text,
  AccidentSeverityCategory text,
  AccidentInvolvingPedestrian boolean,
  AccidentInvolvingBicycle boolean,
  AccidentInvolvingMotorcycle boolean,
  RoadType text,
  CantonCode text,
  MunicipalityCode text,
  AccidentWeekDay text,
  AccidentHour int,
  PRIMARY KEY (AccidentID)
);

-- Table for Q1:

CREATE TABLE accidents_by_year (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  CantonCode text,
  PRIMARY KEY ((AccidentYear), CantonCode, AccidentMonth, AccidentID)

) WITH CLUSTERING ORDER BY (CantonCode ASC , AccidentMonth DESC, AccidentID DESC);


-- Table for Q2:

-- Q2.1: Querying about pedestrians

CREATE TABLE accidents_by_pedestrian (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  AccidentInvolvingPedestrian boolean,
  CantonCode text,
  MunicipalityCode text,
  AccidentWeekDay_en text,
  AccidentHour int,
  PRIMARY KEY ((AccidentInvolvingPedestrian, AccidentYear), AccidentMonth, AccidentID)
) WITH CLUSTERING ORDER BY (AccidentMonth DESC, AccidentID DESC);

CREATE INDEX canton_code_idx ON accidents_by_pedestrian (cantoncode);

-- Q2.2: Querying about bicycles

CREATE TABLE accidents_by_bicycle (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  AccidentInvolvingBicycle boolean,
  CantonCode text,
  MunicipalityCode text,
  AccidentWeekDay_en text,
  AccidentHour int,
  PRIMARY KEY ((AccidentInvolvingBicycle, AccidentYear), AccidentMonth, AccidentID)
) WITH CLUSTERING ORDER BY (AccidentMonth DESC, AccidentID DESC);

CREATE INDEX canton_code_idx_bicycle ON accidents_by_bicycle(cantoncode);

-- Q2.2: Querying about motorcycles

CREATE TABLE accidents_by_motorcycle (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  AccidentInvolvingMotorcycle boolean,
  CantonCode text,
  MunicipalityCode text,
  AccidentWeekDay_en text,
  AccidentHour int,
  PRIMARY KEY ((AccidentInvolvingMotorcycle, AccidentYear), AccidentMonth, AccidentID)
) WITH CLUSTERING ORDER BY (AccidentMonth DESC, AccidentID DESC);

CREATE INDEX canton_code_idx_motorcycle ON accidents_by_motorcycle (cantoncode);

-- Table for Q3:

-- Q3.1: Version requiring ALLOW Filtering for Query

CREATE TABLE accidents_by_roadtype_with_filtering (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  RoadType text,
  AccidentInvolvingPedestrian boolean,
  AccidentInvolvingBicycle boolean,
  AccidentInvolvingMotorcycle boolean,
  CantonCode text,
  PRIMARY KEY ((RoadType, AccidentYear), AccidentMonth, AccidentID)
) WITH CLUSTERING ORDER BY (AccidentMonth DESC, AccidentID DESC);

CREATE INDEX canton_code_idx_rt_roadtype ON accidents_by_roadtype (cantoncode);
CREATE INDEX bicycle_idx_rt_roadtype ON accidents_by_roadtype (AccidentInvolvingBicycle);
CREATE INDEX pedestrian_idx_rt_roadtype ON accidents_by_roadtype (AccidentInvolvingPedestrian);
CREATE INDEX motorcycle_idx_rt_roadtype ON accidents_by_roadtype (AccidentInvolvingMotorcycle);

-- Q3.2: Version not requiring ALLOW Filtering for Query

CREATE TABLE accident_by_roadtype (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  RoadType text,
  AccidentInvolvingPedestrian boolean,
  AccidentInvolvingBicycle boolean,
  AccidentInvolvingMotorcycle boolean,
  CantonCode text,
  PRIMARY KEY ((AccidentYear),RoadType, AccidentMonth, AccidentID)
) WITH CLUSTERING ORDER BY (RoadType ASC, AccidentMonth DESC, AccidentID DESC);

CREATE INDEX canton_code_idx_rt_roadtype ON accident_by_roadtype (cantoncode);
CREATE INDEX bicycle_idx_rt_roadtype ON accident_by_roadtype (AccidentInvolvingBicycle);
CREATE INDEX pedestrian_idx_rt_roadtype ON accident_by_roadtype (AccidentInvolvingPedestrian);
CREATE INDEX motorcycle_idx_rt_roadtype ON accident_by_roadtype (AccidentInvolvingMotorcycle);

-- Table for Q4:

CREATE TABLE accident_by_AccidentSeverityCategory (
  AccidentID int,
  AccidentYear int,
  AccidentMonth int,
  AccidentSeverityCategory text,
  AccidentInvolvingPedestrian boolean,
  AccidentInvolvingBicycle boolean,
  AccidentInvolvingMotorcycle boolean,
  CantonCode text,
  PRIMARY KEY ((AccidentYear),AccidentSeverityCategory, AccidentMonth, AccidentID)
) WITH CLUSTERING ORDER BY (AccidentSeverityCategory ASC, AccidentMonth DESC, AccidentID DESC);

CREATE INDEX canton_code_new_idx_severity ON accident_by_AccidentSeverityCategory (cantoncode);
CREATE INDEX bicycle_idx_new_severity ON accident_by_AccidentSeverityCategory (AccidentInvolvingBicycle);
CREATE INDEX pedestrian_idx_new_severity ON accident_by_AccidentSeverityCategory (AccidentInvolvingPedestrian);
CREATE INDEX motorcycle_idx_new_severity ON accident_by_AccidentSeverityCategory (AccidentInvolvingMotorcycle);



