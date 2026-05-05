DROP DATABASE IF EXISTS dealership_db;
CREATE DATABASE dealership_db;
USE dealership_db;

CREATE TABLE division (
    division_id INT AUTO_INCREMENT PRIMARY KEY,
    division_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN NOT NULL,
    CONSTRAINT chk_division_active CHECK (is_active IN (0,1))
);

CREATE TABLE department (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    division_id INT NOT NULL,
    department_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BOOLEAN NOT NULL,
    CONSTRAINT fk_department_division
        FOREIGN KEY (division_id) REFERENCES division(division_id),
    CONSTRAINT chk_department_active CHECK (is_active IN (0,1))
);

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    job_title VARCHAR(100),
    email VARCHAR(120) UNIQUE,
    phone VARCHAR(25),
    hire_date DATE,
    is_active BOOLEAN NOT NULL,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id) REFERENCES department(department_id),
    CONSTRAINT chk_employee_active CHECK (is_active IN (0,1))
);

CREATE TABLE user_account (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT NOT NULL UNIQUE,
    username VARCHAR(60) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role_name VARCHAR(50) NOT NULL,
    is_active BOOLEAN NOT NULL,
    last_login_at DATETIME,
    CONSTRAINT fk_user_account_employee
        FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
    CONSTRAINT chk_user_active CHECK (is_active IN (0,1)),
    CONSTRAINT chk_role_name CHECK (role_name IN ('Admin','Sales','Finance','Technician','Manager','Operations'))
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    street_address VARCHAR(150),
    city VARCHAR(80),
    state VARCHAR(40),
    postal_code VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    created_at DATETIME
);

CREATE TABLE customer_phone (
    customer_phone_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    phone_number VARCHAR(25) NOT NULL UNIQUE,
    phone_type VARCHAR(20),
    is_primary BOOLEAN NOT NULL,
    CONSTRAINT fk_customer_phone_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT chk_customer_phone_primary CHECK (is_primary IN (0,1)),
    CONSTRAINT chk_phone_type CHECK (phone_type IN ('Home','Mobile','Work'))
);

CREATE TABLE vehicle (
    vehicle_id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(30) NOT NULL UNIQUE,
    make_name VARCHAR(60) NOT NULL,
    model_name VARCHAR(60) NOT NULL,
    model_year INT NOT NULL,
    list_price DECIMAL(12,2) NOT NULL,
    mileage INT NOT NULL,
    vehicle_condition VARCHAR(10) NOT NULL,
    availability_status VARCHAR(20) NOT NULL,
    CONSTRAINT chk_vehicle_year CHECK (model_year >= 1900),
    CONSTRAINT chk_vehicle_price CHECK (list_price >= 0),
    CONSTRAINT chk_vehicle_mileage CHECK (mileage >= 0),
    CONSTRAINT chk_vehicle_condition CHECK (vehicle_condition IN ('New','Used','Certified')),
    CONSTRAINT chk_vehicle_status CHECK (availability_status IN ('Available','Sold','In Service'))
);

CREATE TABLE sale_transaction (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL UNIQUE,
    sales_employee_id INT NOT NULL,
    sale_date DATE NOT NULL,
    sale_price DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(40) NOT NULL,
    financing_used BOOLEAN NOT NULL,
    CONSTRAINT fk_sale_transaction_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_sale_transaction_vehicle
        FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    CONSTRAINT fk_sale_transaction_employee
        FOREIGN KEY (sales_employee_id) REFERENCES employee(employee_id),
    CONSTRAINT chk_sale_price CHECK (sale_price >= 0),
    CONSTRAINT chk_sale_financing CHECK (financing_used IN (0,1)),
    CONSTRAINT chk_sale_payment_method CHECK (payment_method IN ('Cash','Card','Check','Bank Transfer','Financing'))
);

CREATE TABLE part (
    part_id INT AUTO_INCREMENT PRIMARY KEY,
    part_name VARCHAR(100) NOT NULL UNIQUE,
    part_description VARCHAR(255),
    unit_cost DECIMAL(10,2),
    CONSTRAINT chk_part_unit_cost CHECK (unit_cost >= 0)
);

CREATE TABLE service_record (
    service_record_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    technician_employee_id INT NOT NULL,
    service_type VARCHAR(100) NOT NULL,
    service_date DATE NOT NULL,
    service_cost DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(40),
    service_notes VARCHAR(255),
    CONSTRAINT fk_service_record_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_service_record_vehicle
        FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    CONSTRAINT fk_service_record_employee
        FOREIGN KEY (technician_employee_id) REFERENCES employee(employee_id),
    CONSTRAINT chk_service_cost CHECK (service_cost >= 0),
    CONSTRAINT chk_service_payment_method CHECK (payment_method IN ('Cash','Card','Check','Bank Transfer','Warranty'))
);

CREATE TABLE service_part (
    service_record_id INT NOT NULL,
    part_id INT NOT NULL,
    quantity_used INT NOT NULL,
    line_cost DECIMAL(10,2),
    PRIMARY KEY (service_record_id, part_id),
    CONSTRAINT fk_service_part_service_record
        FOREIGN KEY (service_record_id) REFERENCES service_record(service_record_id),
    CONSTRAINT fk_service_part_part
        FOREIGN KEY (part_id) REFERENCES part(part_id),
    CONSTRAINT chk_service_part_qty CHECK (quantity_used > 0),
    CONSTRAINT chk_service_part_cost CHECK (line_cost >= 0)
);

CREATE TABLE loan (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT NOT NULL UNIQUE,
    customer_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    loan_officer_employee_id INT NOT NULL,
    loan_amount DECIMAL(12,2) NOT NULL,
    interest_rate DECIMAL(5,2) NOT NULL,
    loan_term_months INT NOT NULL,
    monthly_payment DECIMAL(12,2) NOT NULL,
    approval_status VARCHAR(30) NOT NULL,
    current_balance DECIMAL(12,2) NOT NULL,
    start_date DATE NOT NULL,
    CONSTRAINT fk_loan_sale_transaction
        FOREIGN KEY (sale_id) REFERENCES sale_transaction(sale_id),
    CONSTRAINT fk_loan_customer
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_loan_vehicle
        FOREIGN KEY (vehicle_id) REFERENCES vehicle(vehicle_id),
    CONSTRAINT fk_loan_employee
        FOREIGN KEY (loan_officer_employee_id) REFERENCES employee(employee_id),
    CONSTRAINT chk_loan_amount CHECK (loan_amount >= 0),
    CONSTRAINT chk_interest_rate CHECK (interest_rate >= 0),
    CONSTRAINT chk_loan_term CHECK (loan_term_months > 0),
    CONSTRAINT chk_monthly_payment CHECK (monthly_payment >= 0),
    CONSTRAINT chk_current_balance CHECK (current_balance >= 0),
    CONSTRAINT chk_approval_status CHECK (approval_status IN ('Pending','Approved','Rejected','Closed'))
);

CREATE TABLE loan_payment (
    loan_payment_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_id INT NOT NULL,
    payment_method VARCHAR(40) NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(12,2) NOT NULL,
    remaining_balance_after_payment DECIMAL(12,2) NOT NULL,
    CONSTRAINT fk_loan_payment_loan
        FOREIGN KEY (loan_id) REFERENCES loan(loan_id),
    CONSTRAINT chk_loan_payment_method CHECK (payment_method IN ('Cash','Card','Check','Bank Transfer','AutoPay')),
    CONSTRAINT chk_amount_paid CHECK (amount_paid > 0),
    CONSTRAINT chk_remaining_balance CHECK (remaining_balance_after_payment >= 0)
);

CREATE TABLE operational_cost (
    cost_id INT AUTO_INCREMENT PRIMARY KEY,
    department_id INT NOT NULL,
    recorded_by_employee_id INT NOT NULL,
    cost_date DATE NOT NULL,
    cost_type VARCHAR(60) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    description VARCHAR(255),
    CONSTRAINT fk_operational_cost_department
        FOREIGN KEY (department_id) REFERENCES department(department_id),
    CONSTRAINT fk_operational_cost_employee
        FOREIGN KEY (recorded_by_employee_id) REFERENCES employee(employee_id),
    CONSTRAINT chk_operational_cost_amount CHECK (amount >= 0)
);
