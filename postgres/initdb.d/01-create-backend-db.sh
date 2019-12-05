#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER whisper_backend;
    ALTER USER whisper_backend WITH PASSWORD '${WHISPER_DB_PASSWORD}';
    CREATE DATABASE whisper_backend;
    GRANT ALL PRIVILEGES ON DATABASE whisper_backend TO whisper_backend;
EOSQL
