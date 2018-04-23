DROP TABLE transactions;
DROP TABLE merchants;
DROP TABLE types;


CREATE TABLE merchants
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE types
(
  id SERIAL8 primary key,
  type VARCHAR(255) not null
);

CREATE TABLE transactions
(
  id SERIAL8 primary key,
  cost FLOAT8,
  merchant_id INT8 references merchants(id),
  type_id INT8 references types(id),
  date DATE
);

SELECT type_id, sum(cost) FROM transactions
group by S_Date, TID
