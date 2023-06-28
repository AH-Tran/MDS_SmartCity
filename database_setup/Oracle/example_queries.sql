-- Query examples - Database Usage

-- Q0: Query for a specific accident by ID

SELECT TR.*, AT."AccidentType_DESC", RI."RoadType_DESC", SI."AccidentSeverityCategory_DESC",CD."Description"
FROM "TrafficRecord" TR
JOIN "AccidentID" AT ON TR."AccidentType" = AT."Code_ACType"
JOIN "RoadID" RI ON TR."RoadType" = RI."RoadType"
JOIN "SeverityID" SI ON TR."AccidentSeverityCategory" = SI."Code_Severity"
JOIN "MunicipalityCanton" MC ON TR."MunicipalityCode" = MC."MunicipalityCode"
JOIN "CantonDescription" CD ON MC."CantonCode" = CD."CantonCode"
WHERE TR."Index" = 112;

-- Q1: Query for all accidents in a specific canton and a specific year

SELECT *
FROM "TrafficRecord" TR
JOIN "MunicipalityCanton" MC ON TR."MunicipalityCode" = MC."MunicipalityCode"
WHERE "AccidentYear" = 2012 AND MC."CantonCode" = 'ZH';

-- Q2: Like Q1 - Additionally query for the involvement of bicycles, pedestrians or motorcycles

SELECT *
FROM "TrafficRecord" TR
JOIN "MunicipalityCanton" MC ON TR."MunicipalityCode" = MC."MunicipalityCode"
WHERE "AccidentYear" = 2012 AND MC."CantonCode" = 'ZH' AND "AccidentInvolvingPedestrian" = 'True';

-- Q3: Query to compare road types based on the amount of accidents (Optionally filtered by year, Involvement of X ...)

SELECT TR."RoadType" , RI."RoadType_DESC", COUNT(*) AS AmountPerType
FROM "TrafficRecord" TR
JOIN "RoadID" RI ON TR."RoadType" = RI."RoadType"
WHERE "AccidentYear" = 2013 AND "AccidentInvolvingMotorcycle" = 'True'
GROUP BY TR."RoadType", RI."RoadType_DESC"
ORDER BY AmountPerType DESC;

-- Q4: Query to identify the severity of the accidents for the different parties involved in a given year

SELECT COUNT(*) as bicycle_count
FROM "TrafficRecord"
WHERE "AccidentYear" = 2013 AND "AccidentSeverityCategory" = 'as2' AND "AccidentInvolvingMotorcycle" = 'True';

-- Code to flush the Cache and the Shared Pool of the Database (should be executed after every query)

ALTER SYSTEM FLUSH BUFFER_CACHE;
ALTER SYSTEM CHECKPOINT;
ALTER SYSTEM FLUSH SHARED_POOL;
