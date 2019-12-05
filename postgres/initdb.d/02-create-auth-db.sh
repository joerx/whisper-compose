#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER whisper_auth;
    ALTER USER whisper_auth WITH PASSWORD '${WHISPER_DB_PASSWORD}';
    CREATE DATABASE whisper_auth;
    GRANT ALL PRIVILEGES ON DATABASE whisper_auth TO whisper_auth;
EOSQL
