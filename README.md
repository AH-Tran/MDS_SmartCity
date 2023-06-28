# MDS_SmartCity
```
A Traffic Accident Database using Oracle(SQL) and Cassandra(NoSQL)
```
Creating a wide-column store database using Cassandra on the topic 'Towards a Traffic Accident Database in a Smart City Use Case' and comparing its query performance with the relational database Oracle.

## Data
Unfälle mit Personenschaden  
https://data.geo.admin.ch/ch.astra.unfaelle-personenschaeden_alle/ 

## Prerequisites
* Docker
* Docker-compose

Recommended and tested under Ubuntu 20.04

## Repository structure
* `\data`: Repository for raw data sets
* `\database_setup`: Set-up folder for the Oracle and Cassandra database
* `\documentation`: Repository for the project report
* `\script`: Scripts for transforming the raw data sets

## How to use: Cassandra Database
Pull the Cassandra Image:  
``docker pull bitnami/cassandra:latest``

Change Directory to the .yml file:

``cd .\database_setup\Cassandra\``

Create & Start Docker Containers (while in GitHub Repo):  
 ``docker-compose up -d``  
 
Stop & Remove Docker Containers:  
``docker-compose down``

## How to use: Oracle Database
Pull the Oracle Image:  
``docker pull container-registry.oracle.com/database/express:latest``

Change Directory to the .yml file:

``cd .\database_setup\Oracle\``

Create & Start Docker Containers (while in GitHub Repo):  
 ``docker-compose up -d``  
 
Stop & Remove Docker Containers:  
``docker-compose down``


### References
Image Documentation (Cassandra):  
https://hub.docker.com/r/bitnami/cassandra/#environment-variables  

Image Documentation (Oracle):
<br>[Oracle Database XE Release 21c (21.3.0.0) Docker Image Documentation](https://container-registry.oracle.com/ords/f?p=113:4:3402664383330:::4:P4_REPOSITORY,AI_REPOSITORY,AI_REPOSITORY_NAME,P4_REPOSITORY_NAME,P4_EULA_ID,P4_BUSINESS_AREA_ID:803,803,Oracle%20Database%20Express%20Edition,Oracle%20Database%20Express%20Edition,1,0&cs=3Z2oBxPqe_Q_xqan1iSP7oeilIBbliC3CfDuewUsdnm0TETg9WA6gSo-3XpBZ-DvZXiPQcHI9aUBpysBJnxhrZg)

Cassandra Documentation:  
https://cassandra.apache.org/doc/latest/cassandra/getting_started/index.html  
