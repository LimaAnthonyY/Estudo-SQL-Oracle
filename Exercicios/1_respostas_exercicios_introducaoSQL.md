# Respostas

**1.1**
```sql
CREATE TABLE CUSTOMERS (
    customer_id number,
    first_name Varchar2(50) not null,
    last_name Varchar2(50) not null,
    email Varchar(100) Unique,
    phone Varchar2(15),
    constraint pk_customers primary key (customer_id)
);
```

**1.2**
```sql
CREATE TABLE ORDERS (
    order_id number,
    customer_id number,
    order_data date,
    total_amount Decimal(10, 2),
    constraint pk_orders primary key (order_id),  
    constraint fk_orders_customer_id foreign key (customer_id) 
      references CUSTOMERS (customer_id)  
);
```

**2.3**
```sql
INSERT INTO CUSTOMERS (customer_id, first_name, last_name, email, phone) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '1234567890');

INSERT INTO CUSTOMERS (customer_id, first_name, last_name, email, phone) VALUES
(2, 'Jane', 'Smith', 'jane.smith@example.com', '0987654321');

INSERT INTO CUSTOMERS (customer_id, first_name, last_name, email, phone) VALUES
(3, 'Emily', 'Johnson', 'emily.johnson@example.com', '5555555555');

INSERT INTO CUSTOMERS (customer_id, first_name, last_name, email, phone) VALUES
(4, 'Michael', 'Brown', 'michael.brown@example.com', '4444444444');

INSERT INTO CUSTOMERS (customer_id, first_name, last_name, email, phone) VALUES
(5, 'Sarah', 'Williams', 'sarah.williams@example.com', '3333333333');
```

**2.4**
```sql
INSERT INTO ORDERS (order_id, customer_id, order_data, total_amount) VALUES
(1, 1, TO_DATE('2024-09-01', 'YYYY-MM-DD'), 150.00);

INSERT INTO ORDERS (order_id, customer_id, order_data, total_amount) VALUES
(2, 2, TO_DATE('2024-09-02', 'YYYY-MM-DD'), 200.00);

INSERT INTO ORDERS (order_id, customer_id, order_data, total_amount) VALUES
(3, 1, TO_DATE('2024-09-03', 'YYYY-MM-DD'), 75.50);
```

**3.5**
```sql
SELECT * FROM CUSTOMERS;
```

**3.6**
```sql
SELECT first_name, last_name FROM CUSTOMERS WHERE last_name = 'Smith';
```

**4.7**
```sql
UPDATE CUSTOMERS SET phone = '1140028922' WHERE customer_id = 1;
```

**4.8**
```sql
UPDATE ORDERS
SET total_amount = total_amount * 1.10
WHERE customer_id = (SELECT customer_id FROM CUSTOMERS WHERE first_name = 'John');
```

**5.9**
```sql
DELETE FROM ORDERS
WHERE total_amount < 50;
```

**5.10**
```sql
DELETE FROM ORDERS WHERE customer_id = 3;
DELETE FROM CUSTOMERS WHERE customer_id = 3;
```

**6.11**
```sql
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_data
FROM CUSTOMERS c
JOIN ORDERS o ON c.customer_id = o.customer_id;
```

**6.12**
```sql
SELECT c.customer_id, c.first_name, c.last_name, sum(o.total_amount) AS total_spent
FROM CUSTOMERS c
JOIN ORDERS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

**7.13**
```sql
SELECT c.customer_id, c.first_name, c.last_name, COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM CUSTOMERS c
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

**7.14**
```sql
SELECT c.first_name, c.last_name, o.total_amount
FROM CUSTOMERS c
JOIN ORDERS o ON c.customer_id = o.customer_id
WHERE o.total_amount = (SELECT MAX(total_amount) FROM ORDERS);
```

**8.15**
```sql
CREATE UNIQUE INDEX idx_customer_email ON CUSTOMERS(email);
```

**8.16**
```sql
ALTER TABLE ORDERS ADD CONSTRAINT chk_total_amount CHECK (total_amount >= 0);
```

**9.17**
```sql
SELECT customer_id, COUNT(*) AS order_count
FROM ORDERS
GROUP BY customer_id;
```

**9.18**
```sql
SELECT AVG(total_amount) AS average_order_amount
FROM ORDERS;
```

**10.19**
```sql
ALTER TABLE ORDERS ADD status VARCHAR2(20);
```

**10.20**
```sql
ALTER TABLE CUSTOMERS RENAME COLUMN phone TO contact_number;
```

**11.21**
```sql
SELECT customer_id, first_name, last_name
FROM CUSTOMERS
WHERE customer_id IN (
    SELECT customer_id
    FROM ORDERS
    GROUP BY customer_id
    HAVING COUNT(*) > 1
);
```

**11.22**
```sql
CREATE VIEW CustomerOrderSummary AS
SELECT c.customer_id, c.first_name, c.last_name, COALESCE(SUM(o.total_amount), 0) AS total_spent
FROM CUSTOMERS c
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

**12.23**
```sql
CREATE TABLE ORDERS_BACKUP AS SELECT * FROM ORDERS;
```

**12.24**
```sql
DROP TABLE ORDERS;
CREATE TABLE ORDERS AS SELECT * FROM ORDERS_BACKUP;
```
