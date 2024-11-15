---SQL

DROP DATABASE IF EXISTS datawarehouse_project;

CREATE DATABASE datawarehouse_project;

USE datawarehouse_project;

DROP TABLE IF EXISTS dim_time;
DROP TABLE IF EXISTS dim_location;
DROP TABLE IF EXISTS energy_consumption;

CREATE TABLE dim_time (
    time_id DATETIME,
    year_id INT,
    season_id INT,
    season VARCHAR(10),
    month_id INT,
    month VARCHAR(15),
    PRIMARY KEY (time_id)
);

CREATE TABLE dim_location (
    location_id INT,
    region_id INT,
    region VARCHAR(100),
    municipality_id INT,
    municipality VARCHAR(100),
    parish_id VARCHAR(20),
    parish VARCHAR(100),
    version INT,
    date_from DATETIME,
    date_to DATETIME,
    PRIMARY KEY (location_id)
);

CREATE TABLE energy_smart (
    time_id DATETIME,
    location_id INT,
    yes_smartmeters INT,
    total_smartmeters INT,
    active_energy_kwh DECIMAL(20,3),
    PRIMARY KEY (time_id, location_id),
    FOREIGN KEY (time_id) REFERENCES dim_time(time_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id)
);
