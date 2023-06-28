# MDS_SmartCity
Creating a Column Family Database storing traffic accident related data for a monthly analysis use case. 

## Data
Unfälle mit Personenschaden 
https://data.geo.admin.ch/ch.astra.unfaelle-personenschaeden_alle/ 


## Cassandra Database
Pull the Cassandra Image:  
``docker pull bitnami/cassandra:latest``

Change Directory to the .yml file:

``cd .\database_setup\Cassandra\``

Create & Start Docker Containers (while in GitHub Repo):  
 ``docker-compose up -d``  
 
Stop & Remove Docker Containers:  
``docker-compose down``

## Oracle Database
Pull the Oracle Image:  
``docker pull container-registry.oracle.com/database/express:latest``

Change Directory to the .yml file:

``cd .\database_setup\Oracle\``

Create & Start Docker Containers (while in GitHub Repo):  
 ``docker-compose up -d``  
 
Stop & Remove Docker Containers:  
``docker-compose down``


### References
Image Documentation:  
https://hub.docker.com/r/bitnami/cassandra/#environment-variables  

Cassandra Documentation:  
https://cassandra.apache.org/doc/latest/cassandra/getting_started/index.html  
