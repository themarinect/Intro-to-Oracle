--Dropping TABLES for multiple runs
DROP TABLE cardinal_orders CASCADE CONSTRAINTS;
DROP TABLE cardinal_medication CASCADE CONSTRAINTS;
DROP TABLE cardinal_manufacturers CASCADE CONSTRAINTS;
DROP TABLE cardinal_employees CASCADE CONSTRAINTS;
DROP TABLE cardinal_customers CASCADE CONSTRAINTS;
DROP SEQUENCE cardinal_customers_seq;

--Creating CARDINAL_CUSTOMERS table
CREATE TABLE cardinal_customers
( customer_id number(3),
  company_name varchar2(20) NOT NULL,
  street varchar2(20) NOT NULL,
  city varchar2(10) NOT NULL,
  state varchar2(2) NOT NULL,
  zip varchar2(10) NOT NULL,
  fax varchar2(20) NOT NULL,
  phone_number varchar2(20) NOT NULL,
  tax_id varchar2(20) NOT NULL,
  web_site varchar2(45),
  rate number(2,1) NOT NULL,
  
  CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
);

--Creating the Primary Key sequence for CARDINAL_CUSTOMERS
CREATE SEQUENCE cardinal_customers_seq
START WITH 1
INCREMENT BY 1;

--Creating CARDINAL_MANUFACTURERS table
CREATE TABLE cardinal_manufacturers
( manu_id varchar2(10),
  manu_name varchar2(20) NOT NULL,
  street varchar2(20) NOT NULL,
  city varchar2(20) NOT NULL,
  state varchar2(10) NOT NULL,
  zip varchar2(10) NOT NULL,
  fax varchar2(20) NOT NULL,
  phone_number varchar2(20) NOT NULL,
  tax_id varchar2(20) NOT NULL,
  web_site varchar2(30),
  international_or_domestic varchar2(1) NOT NULL,
  
  CONSTRAINT pk_manu_id PRIMARY KEY (manu_id),
  CONSTRAINT int_dom_check CHECK (international_or_domestic IN ('I','D'))
);

--Creating CARDINAL_EMPLOYEES table
CREATE TABLE cardinal_employees
( emp_id varchar2(10),
  first_name varchar2(10) NOT NULL,
  last_name varchar2(10) NOT NULL,
  email varchar2(25),
  phone_number varchar2(20),
  hire_date DATE NOT NULL,
  salary number(8,2) NOT NULL,
  job_title varchar2(20) NOT NULL,
  supervisor_id varchar2(10),
  
  CONSTRAINT pk_employee_id PRIMARY KEY (emp_id),
  CONSTRAINT fk_supervisor_id 
              FOREIGN KEY (emp_id)
              REFERENCES cardinal_employees(emp_id)
);

--Creating CARDINAL_MEDICATION table
CREATE TABLE cardinal_medication
( ndc varchar2(12),
  medication_name varchar2(45) NOT NULL,
  manu_id varchar2(10),
  made_in_country varchar2(10) NOT NULL,
  unit varchar2(10) NOT NULL,
  
  CONSTRAINT pk_medication PRIMARY KEY (ndc),
  CONSTRAINT fk_medication_manu 
              FOREIGN KEY (manu_id)
              REFERENCES cardinal_manufacturers(manu_id)
);

--Creating CARDINAL_ORDERS table
CREATE TABLE cardinal_orders
( customer_id number(3),
  ndc varchar2(12),
  quantity number NOT NULL,
  total_price number(10,2) NOT NULL,
  order_date DATE NOT NULL,
  delivery_date DATE,
  expiration_date DATE NOT NULL,
  paid varchar2(1) NOT NULL,
  emp_ordered varchar2(10),
  
  CONSTRAINT pk_order PRIMARY KEY (customer_id,ndc),
  CONSTRAINT fk_order_customers 
              FOREIGN KEY (customer_id)
              REFERENCES cardinal_customers(customer_id),
  CONSTRAINT fk_order_medication 
              FOREIGN KEY (ndc)
              REFERENCES cardinal_medication(ndc),
  CONSTRAINT fk_order_employees
              FOREIGN KEY (emp_ordered)
              REFERENCES cardinal_employees(emp_id),
  CONSTRAINT paid_check CHECK (paid IN ('y','n','Y','N')),
  CONSTRAINT delivery_date_check CHECK (delivery_date > order_date),
  CONSTRAINT expiration_date_check CHECK (expiration_date > order_date)
);

COMMIT;
