#!/bin/bash

echo "Creating data structures for meteo-station-service"
psql -U postgres -f schema-meteo-station-service.sql

echo "Creating data structures for temperature-service"
psql -U postgres -f schema-temperature-service.sql