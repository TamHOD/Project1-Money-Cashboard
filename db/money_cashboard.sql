DROP TABLE IF EXISTS taggings;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS payees;

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) UNIQUE,
  color VARCHAR(255),
  description VARCHAR(255),
  budget NUMERIC(10,2)
);

CREATE TABLE payees(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  website VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  payee_id INT4 REFERENCES payees(id) ON DELETE CASCADE,
  amount NUMERIC(10,2)
);

CREATE TABLE taggings(
 tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
 transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE,
 PRIMARY key (tag_id, transaction_id)
);