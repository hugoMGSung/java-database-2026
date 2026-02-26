-- 부서
CREATE TABLE department (
    dept_id NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50)
);

-- 직원
CREATE TABLE employee (
    emp_id NUMBER PRIMARY KEY,
    emp_name VARCHAR2(50),
    salary NUMBER,
    hire_date DATE,
    dept_id NUMBER,
    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
        REFERENCES department(dept_id)
);

-- 고객
CREATE TABLE customer (
    cust_id NUMBER PRIMARY KEY,
    cust_name VARCHAR2(50),
    city VARCHAR2(50),
    reg_date DATE
);

-- 상품
CREATE TABLE product (
    prod_id NUMBER PRIMARY KEY,
    prod_name VARCHAR2(100),
    price NUMBER
);

-- 주문
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    cust_id NUMBER,
    order_date DATE,
    CONSTRAINT fk_orders_customer FOREIGN KEY (cust_id)
        REFERENCES customer(cust_id)
);

-- 주문 상세
CREATE TABLE order_item (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    prod_id NUMBER,
    quantity NUMBER,
    CONSTRAINT fk_oi_order FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_oi_product FOREIGN KEY (prod_id)
        REFERENCES product(prod_id)
);