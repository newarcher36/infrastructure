FROM postgres:alpine
EXPOSE 5432
COPY schema-temperature-service.sql schema-temperature-service.sql
COPY schema-meteo-station-service.sql schema-meteo-station-service.sql
COPY createPostgresObjects.sh createPostgresObjects.sh
RUN chmod 775 createPostgresObjects.sh