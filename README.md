#Readme

##Required software:
* docker
* git

##Setup:
1. git clone this repository to your local machine
2. build an image with docker with the following command (make sure, you are in the postgres-directory): `docker build -t mission5-db:v1 . `
3. start a container with the following command: `docker run -p 35000:5432 mission5-db:v1`
4. access the container with an IDE of your choice (I strongly recommend DataGrip) with the following credentials: IP/Address 127.0.0.1 Port 35000 Database mission5 User h0927586 Password h0927586

##What do the scripts do? What is the sequence the scripts are runned?
1. init_db.sql initializes the schemas import and masterdata
2. masterdata_create.sql creates the masterdata structure. Also two views will be created.
3. import_create.sql creates the import structure
4. import_insert.sql inserts the provided data into the tables in the import schema
5. masterdata_insert.sql inserts the already inserted data from import schema and transforms it into the new schema.

##Result:
* Database named mission5
* User named h0927586 with password 'h0927586'
* Provided Data has been imported to the schema called import
* Provided Data has been normalized and stored in the schema called masterdata
* Test it with the following command: select * from masterdata.v_ratings_about_candidates;

Good Luck!