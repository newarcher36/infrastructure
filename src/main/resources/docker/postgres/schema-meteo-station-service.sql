CREATE SCHEMA IF NOT EXISTS meteodata;

CREATE TABLE IF NOT EXISTS meteodata.meteodata_register
(
    id                SERIAL PRIMARY KEY,
    registration_date DATE,
    elevation         FLOAT(2)
)