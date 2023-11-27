CREATE USER rentaluser WITH PASSWORD 'rentalpassword';
GRANT CONNECT ON DATABASE your_database_name TO rentaluser;

GRANT SELECT ON TABLE customer TO rentaluser;

SELECT * FROM customer;

CREATE GROUP rental;
ALTER USER rentaluser IN GROUP rental;

GRANT INSERT, UPDATE ON TABLE rental TO rental;

INSERT INTO rental (column1, column2, ...) VALUES (value1, value2, ...);
UPDATE rental SET column1 = new_value WHERE condition;

REVOKE INSERT ON TABLE rental FROM rental;
INSERT INTO rental (column1, column2, ...) VALUES (value1, value2, ...);

CREATE ROLE client_Jaxongir_Kayumov;
GRANT SELECT ON TABLE rental, payment TO client_Jaxongir_Kayumov;
ALTER ROLE client_Jaxongir_Kayumov IN GROUP rental;
SET ROLE client_Jaxongir_Kayumov;
SELECT * FROM rental WHERE customer_id = 111;
SELECT * FROM payment WHERE customer_id = 111;
RESET ROLE;
