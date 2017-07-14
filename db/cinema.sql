DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;


CREATE TABLE customers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  funds MONEY
);

CREATE TABLE films (
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  price MONEY
);

CREATE TABLE tickets (
id SERIAL8 PRIMARY KEY,
customer_id INT8 REFERENCES customers(id) ON DELETE CASCADE,
film_id INT8 REFERENCES films(id) ON DELETE CASCADE
);

INSERT INTO customers (name, funds) VALUES ('Andrew', 50);
INSERT INTO customers (name, funds) VALUES ('Stuart', 60);
INSERT INTO customers (name, funds) VALUES ('Ross', 70);
INSERT INTO customers (name, funds) VALUES ('Yan', 80);

INSERT INTO films (title, price) VALUES ('Stand By Me', 5);
INSERT INTO films (title, price) VALUES ('Dead Man''s Shoes', 7);
INSERT INTO films (title, price) VALUES ('Snatch', 10);
INSERT INTO films (title, price) VALUES ('Jurassic Park', 2);

INSERT INTO tickets (customer_id, film_id) VALUES (1, 2);
INSERT INTO tickets (customer_id, film_id) VALUES (2, 4);
INSERT INTO tickets (customer_id, film_id) VALUES (3, 1);
INSERT INTO tickets (customer_id, film_id) VALUES (4, 3);
INSERT INTO tickets (customer_id, film_id) VALUES (1, 3);

