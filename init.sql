-- Create the heart_data table
CREATE TABLE heart_data (
    id SERIAL PRIMARY KEY,
    age INT,
    sex INT,
    cp INT,
    trestbps INT,
    chol INT,
    fbs INT,
    restecg INT,
    thalach INT,
    exang INT,
    oldpeak FLOAT,
    slope INT,
    ca INT,
    thal INT,
    target INT
);

-- Load CSV data into the table
COPY heart_data(age, sex, cp, trestbps, chol, fbs, restecg, thalach, exang, oldpeak, slope, ca, thal, target)
FROM '/data/heart_disease.csv'
DELIMITER ','
CSV HEADER;
