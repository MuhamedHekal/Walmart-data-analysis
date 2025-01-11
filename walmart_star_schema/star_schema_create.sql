-- run this file as a sys user
CREATE USER walmart_star_schema IDENTIFIED BY walmart;

GRANT CREATE MATERIALIZED VIEW,
      CREATE PROCEDURE,
      CREATE SEQUENCE,
      CREATE SESSION,
      CREATE SYNONYM,
      CREATE TABLE,
      CREATE TRIGGER,
      CREATE TYPE,
      CREATE VIEW
  TO walmart_star_schema;

ALTER USER walmart_star_schema QUOTA UNLIMITED ON USERS;