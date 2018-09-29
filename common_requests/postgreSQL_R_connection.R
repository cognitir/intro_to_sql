# Overview on how to connect R to a PostgreSQL DB #

# install package
install.packages("RPostgreSQL")
require(RPostgreSQL)

# create connection
# able to just use 'postgres' as user

# loading PostgreSQL driver
drv <- dbDriver("PostgreSQL")

# connect to northwind database by using the 'postgres' user 
# make sure to use same password as used for pgadmin 
con <- dbConnect(drv, dbname = "northwind",
                 host = "localhost", port = 5432,
                 user = "postgres", password = "password")

# check for "customers" table 
# we have found it!
dbExistsTable(con, "customers")

# let's pull in the customer table to R! 

# write our command out
sql_command <- "SELECT * FROM customers"
sample_pull <- dbGetQuery(con, sql_command)

# take a look at data 
head(sample_pull)