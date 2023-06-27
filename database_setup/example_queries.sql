-- Query examples - Database Usage

-- Q0: Query for a specific accident by ID

SELECT * FROM traffic_accidents.accidents WHERE accidentid = 37034;

-- Q1: Query for all accidents in a specific canton and a specific year

SELECT *
FROM traffic_accidents.accidents_by_year
WHERE accidentyear = 2012
 AND cantoncode = 'ZH';

-- Q2: Like Q1 - Additionally query for the involvement of bicycles, pedestrians or motorcycles

-- Q2.1: Involvement of Pedestrians

SELECT *
FROM traffic_accidents.accidents_by_pedestrian
WHERE cantoncode = 'ZH'
  AND accidentyear = 2012
  AND accidentinvolvingpedestrian = true;

-- Q2.2: Involvement of bicycles

SELECT *
FROM traffic_accidents.accidents_by_bicycle
WHERE cantoncode = 'ZH'
  AND accidentyear = 2012
  AND accidentinvolvingbicycle = true;

-- Q2.3: Involvement of motorcycles

SELECT * FROM traffic_accidents.accidents_by_motorcycle
         WHERE cantoncode = 'ZH'
           AND accidentyear = 2012
           AND accidentinvolvingmotorcycle = true;

-- Q3: Query to compare road types based on the amount of accidents (Optionally filtered by year, Involvement of X ...)

-- Q3.1: Using Table 3.1 requires ALLOW FILTERING
SELECT roadtype, COUNT(*) AS RoadTypeCount
FROM accident_by_roadtype
WHERE accidentinvolvingbicycle = true AND accidentyear = 2013
GROUP BY roadtype,accidentyear
ALLOW FILTERING ;

-- Q3.2: Using Table 3.2 without ALLOW FILTERING

SELECT roadtype, COUNT(*) AS RoadTypeCount
FROM accident_by_roadtype
WHERE accidentinvolvingbicycle = true AND accidentyear = 2013
GROUP BY roadtype;

-- Q4: Query to identify the severity of the accidents for the different parties involved in a given year

SELECT COUNT(*) as bicycle_count
FROM traffic_accidents.accident_by_AccidentSeverityCategory
WHERE accidentyear = 2013 AND AccidentSeverityCategory = 'as2' AND accidentinvolvingmotorcycle =true;

