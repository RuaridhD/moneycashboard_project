DROP TABLE merchants;
DROP TABLE types;
DROP TABLE transactions;

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
  cost DECIMAL,
  merchant_id INT8 references merchants(id),
  type_id INT8 references types(id)
);
