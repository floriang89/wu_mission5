Required:
* a postgres server
* an existing and empty database

What do the scripts do? What is the sequence to run the scripts?
1. init_db.sql initializes the schemas import and masterdata
2. masterdata_create.sql creates the masterdata structure. Also two views will be created.
3. import_create.sql creates the import structure
4. import_insert.sql inserts the provided data into the tables in the import schema
5. masterdata_insert.sql inserts the already inserted data from import schema and transforms it into the new schema.

Result:
Normalized Data.
