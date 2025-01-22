# Use the official PostgreSQL image
FROM postgres:latest

# Add the initialization SQL script
COPY ./init.sql /docker-entrypoint-initdb.d/

# Add the CSV file to a separate directory
COPY ./data/heart_disease.csv /data/heart_disease.csv
