CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	make VARCHAR NOT NULL,
	model VARCHAR NOT NULL,
	color VARCHAR NOT NULL,
	year_y INTEGER NOT NULL
)

CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	phone INTEGER NOT NULL
);

CREATE TABLE salesman (
	salesman_id SERIAL PRIMARY KEY,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	phone INTEGER NOT NULL
);

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR,
	last_name VARCHAR
);

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	salesman_id INTEGER NOT NULL,
	FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	invoice_date TIMESTAMP NOT NULL,
	service_id INTEGER NOT NULL
);

CREATE TABLE service (
	service_id SERIAL PRIMARY KEY,
	service_date TIMESTAMP NOT NULL,
	car_id INTEGER NOT NULL,
	FOREIGN KEY (car_id) REFERENCES car(car_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

ALTER TABLE invoice 
ADD FOREIGN KEY(service_id) REFERENCES service(service_id);

INSERT INTO mechanic (first_name,last_name) VALUES('Robert','Baratheon'),('Ned','Stark'),('Euron','Greyjoy');

SELECT *
FROM mechanic m

INSERT INTO car (make,model,color,year_y) VALUES('Toyota','Rav-4','Red',2021),('Honda','Accord','Red',2023),('Ford','Fiesta','Blue',2020);

SELECT*
FROM car c 

INSERT INTO salesman (first_name,last_name,phone) VALUES('Jon','Snow',1336548394),('Renly','Baratheon',1657450534),('Jaime','Lannister',1680458345);

SELECT *
FROM salesman s 

INSERT INTO customer (first_name,last_name,phone) VALUES ('Tywin','Lannister',1238605674),('Robb','Stark',1220567463),('Danny','Targaryan',1567648896);

SELECT *
FROM customer c 

INSERT INTO service (service_date,car_id,mechanic_id) VALUES ('2024-05-05 06:12:08',2,10),('2024-05-05 06:12:08',1,11),('2024-05-05 06:12:08',3,12);

SELECT *
FROM service s 

INSERT INTO invoice (car_id,salesman_id,customer_id,invoice_date,service_id) VALUES (1,1,1,'2024-05-05 06:12:08',8),(2,2,2,'2024-05-05 06:12:08',9),(3,3,3,'2024-05-05 06:12:08',10);

SELECT *
FROM invoice i 

CREATE OR REPLACE FUNCTION add_car(make VARCHAR, model VARCHAR, color VARCHAR, year_y INTEGER)
RETURNS VOID 
AS $$
BEGIN 
	INSERT INTO car(make, model, color, year_y)
	VALUES (make, model, color, year_y);
END;
$$ LANGUAGE plpgsql;

SELECT add_car('mustang','x','red',2000)

SELECT *
FROM car c 
