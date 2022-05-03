CREATE SCHEMA IF NOT EXISTS temperature;

CREATE TABLE IF NOT EXISTS temperature.temperature
(
    id                SERIAL PRIMARY KEY,
    temperature_value FLOAT(2),
    meteo_data_id     INTEGER
)