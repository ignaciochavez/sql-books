-- Ejecutar script desde bd postgres, mediante super usuario del servidor
-- DROP DATABASE IF EXISTS books;

    CREATE DATABASE books
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;