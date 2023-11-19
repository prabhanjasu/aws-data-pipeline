CREATE DATABASE IF NOT EXISTS Gans;

--- DROP DATABASE Gans;

USE Gans;

-- DROP TABLE cities;
CREATE TABLE IF NOT EXISTS cities (
city_id INT NOT NULL AUTO_INCREMENT,
city_name VARCHAR(255),
country VARCHAR(255),
PRIMARY KEY (city_id)
);

-- DROP TABLE populations;
CREATE TABLE IF NOT EXISTS populations (
     city_id INT,
    `population` BIGINT,
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

-- DROP TABLE weathers;
CREATE TABLE IF NOT EXISTS weathers (
    weather_id INT NOT NULL AUTO_INCREMENT,
    city_id INT,
    country_code VARCHAR(50),
    forecasttime DATETIME,
    weather_outlook VARCHAR(50),
    weather_description VARCHAR(50),
    temperature FLOAT(6),
    temperature_feels_like FLOAT(6),
    wind_speed FLOAT (6),
    humidity INT,
    prob_prec FLOAT (6),
    snow DOUBLE,
    rain DOUBLE,
    info_retrieved_at DATETIME,
    PRIMARY KEY (weather_id),
    FOREIGN KEY (city_id) REFERENCES cities (city_id)
);

-- DROP TABLE airports;
CREATE TABLE IF NOT EXISTS airports (
    airport_icao VARCHAR(50) ,
    airport_name VARCHAR(50),
    country_code VARCHAR(3),
    latitude VARCHAR(50),
    longitude VARCHAR(50),
    PRIMARY KEY (airport_icao)
);

-- DROP TABLE cities_airport;
CREATE TABLE IF NOT EXISTS cities_airport (
    city_id INT,
    airport_icao VARCHAR(50),
    FOREIGN KEY (city_id) REFERENCES cities (city_id),
    FOREIGN KEY (airport_icao) REFERENCES airports (airport_icao)
);

-- DROP TABLE flights;
CREATE TABLE IF NOT EXISTS flights (
flight_id INT NOT NULL AUTO_INCREMENT,
flight_number VARCHAR(50),
arrival_icao VARCHAR(50),
arrival_time_local DATETIME,
arrival_terminal INT,
departure_icao VARCHAR(50),
departure_time_local DATETIME,
departure_city VARCHAR(50),
airline VARCHAR(50),
flight_status VARCHAR(50),
info_retrieved_on DATETIME,
PRIMARY KEY (flight_id),
FOREIGN KEY (arrival_icao) REFERENCES airports (airport_icao)
);