CREATE TABLE customer(       /* customer is table name*/
customer_id serial primary key,
customer_name varchar(100),
age numeric check(age>0 and age<100),
email varchar(100)unique,
cust_date timestamp default current_timestamp
);
pg admin:
INSERT INTO customer(customer_name,age,email) 
values('virat','35','virat@gmail.com')

SELECT*FROM customer;          /*to select rows*/c
SELECT customer_name,age FROM customer;

SELECT*FROM customer;  /*star means everything in table*/

/*(product page)*/
CREATE TABLE product(
    prduct_id serial primary key,
    product_name varchar(100)
);
/*inventory page*/
CREATE TABLE inventory(
    inventory_id serial primary key,
    product_id integer references product(product_id),
    quantity numeric check(quantity>=0),
    inventory_update timestamp default current_timestamp
);
/*invoice page*/
CREATE TABLE invoice(
    invoice_id serial primary key,
    customer_id integer references customer(customer_id),
    product_id integer references product(product_id),
    quantity integer checkc(quantity>=0),
    price integer check(price>0),
    inv_date timestamp default current_timestamp
    );