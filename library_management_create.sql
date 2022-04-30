/*
Create tables for the library management database
This works for MySQL. To transform it to other databases such as SQL Server, Oracle, or Postgres,
you should be able to just change the data types to types recognised by the database.
*/

CREATE TABLE reservation_status (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_res_status PRIMARY KEY (id)
);

CREATE TABLE category (
  id INT,
  category_name VARCHAR(100),
  CONSTRAINT pk_category PRIMARY KEY (id)
);

CREATE TABLE book (
  id INT,
  title VARCHAR(500),
  category_id INT,
  publication_date DATE,
  copies_owned INT,
  CONSTRAINT pk_book PRIMARY KEY (id),
  CONSTRAINT fk_book_category FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE author (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  CONSTRAINT pk_author PRIMARY KEY (id)
);

CREATE TABLE book_author (
  book_id INT,
  author_id INT,
  CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES author(id)
);

CREATE TABLE member_status (
  id INT,
  status_value VARCHAR(50),
  CONSTRAINT pk_memberstatus PRIMARY KEY (id),
);

CREATE TABLE member (
  id INT,
  first_name VARCHAR(300),
  last_name VARCHAR(300),
  joined_date DATE,
  active_status_id INT,
  CONSTRAINT pk_member PRIMARY KEY (id),
  CONSTRAINT fk_member_status FOREIGN KEY (active_status_id) REFERENCES member_status(id)
);

CREATE TABLE reservation (
  id INT,
  book_id INT,
  member_id INT,
  reservation_date DATE,
  reservation_status_id INT,
  CONSTRAINT pk_reservation PRIMARY KEY (id),
  CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_res_member FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE fine_payment (
  id INT,
  member_id INT,
  payment_date DATE,
  payment_amount INT,
  CONSTRAINT pk_fine_payment PRIMARY KEY (id),
  CONSTRAINT fk_finepay_member FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE loan (
  id INT,
  book_id INT,
  member_id INT,
  loan_date DATE,
  returned_date DATE,
  CONSTRAINT pk_loan PRIMARY KEY (id),
  CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES member(id)
);


CREATE TABLE fine (
  id INT,
  book_id INT,
  loan_id INT,
  fine_date DATE,
  fine_amount INT,
  CONSTRAINT pk_fine PRIMARY KEY (id),
  CONSTRAINT fk_fine_book FOREIGN KEY (book_id) REFERENCES book(id),
  CONSTRAINT fk_fine_loan FOREIGN KEY (loan_id) REFERENCES loan(id)
);
