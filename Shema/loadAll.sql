USE dealership_db;

INSERT INTO division (division_id, division_name, is_active) VALUES
(1, 'Sales Division', 1),
(2, 'Service Division', 1),
(3, 'Finance Division', 1),
(4, 'Operations Division', 1),
(5, 'HR Division', 1),
(6, 'IT Division', 1),
(7, 'Marketing Division', 1),
(8, 'Parts Division', 1),
(9, 'Customer Care Division', 1),
(10, 'Compliance Division', 0);

INSERT INTO department (department_id, division_id, department_name, is_active) VALUES
(1, 1, 'New Vehicle Sales', 1),
(2, 1, 'Used Vehicle Sales', 1),
(3, 2, 'Maintenance Service', 1),
(4, 2, 'Repair Service', 1),
(5, 3, 'Auto Finance', 1),
(6, 4, 'Facilities', 1),
(7, 5, 'Human Resources', 1),
(8, 6, 'Information Technology', 1),
(9, 8, 'Parts Inventory', 1),
(10, 9, 'Customer Support', 1);

INSERT INTO employee (employee_id, department_id, first_name, last_name, job_title, email, phone, hire_date, is_active) VALUES
(1, 1, 'Alice', 'Morgan', 'Sales Associate', 'alice.morgan@dealer.com', '410-555-1001', '2021-03-15', 1),
(2, 2, 'Brian', 'Turner', 'Sales Associate', 'brian.turner@dealer.com', '410-555-1002', '2020-06-10', 1),
(3, 3, 'Carla', 'Nguyen', 'Service Technician', 'carla.nguyen@dealer.com', '410-555-1003', '2019-08-21', 1),
(4, 4, 'David', 'Patel', 'Master Technician', 'david.patel@dealer.com', '410-555-1004', '2018-11-05', 1),
(5, 5, 'Eva', 'Ramirez', 'Loan Officer', 'eva.ramirez@dealer.com', '410-555-1005', '2022-01-17', 1),
(6, 6, 'Frank', 'Bennett', 'Facilities Manager', 'frank.bennett@dealer.com', '410-555-1006', '2017-09-01', 1),
(7, 7, 'Grace', 'Kim', 'HR Specialist', 'grace.kim@dealer.com', '410-555-1007', '2021-12-12', 1),
(8, 8, 'Henry', 'Lopez', 'Systems Administrator', 'henry.lopez@dealer.com', '410-555-1008', '2020-02-28', 1),
(9, 9, 'Irene', 'Scott', 'Parts Coordinator', 'irene.scott@dealer.com', '410-555-1009', '2019-04-19', 1),
(10, 10, 'Jason', 'Reed', 'Customer Support Lead', 'jason.reed@dealer.com', '410-555-1010', '2023-05-08', 1);

INSERT INTO user_account (user_id, employee_id, username, password_hash, role_name, is_active, last_login_at) VALUES
(1, 1, 'amorgan', 'hash_alice_001', 'Sales', 1, '2026-04-10 08:15:00'),
(2, 2, 'bturner', 'hash_brian_002', 'Sales', 1, '2026-04-11 09:20:00'),
(3, 3, 'cnguyen', 'hash_carla_003', 'Technician', 1, '2026-04-12 07:45:00'),
(4, 4, 'dpatel', 'hash_david_004', 'Technician', 1, '2026-04-12 08:05:00'),
(5, 5, 'eramirez', 'hash_eva_005', 'Finance', 1, '2026-04-13 10:30:00'),
(6, 6, 'fbennett', 'hash_frank_006', 'Operations', 1, '2026-04-13 06:50:00'),
(7, 7, 'gkim', 'hash_grace_007', 'Manager', 1, '2026-04-14 11:10:00'),
(8, 8, 'hlopez', 'hash_henry_008', 'Admin', 1, '2026-04-14 12:00:00'),
(9, 9, 'iscott', 'hash_irene_009', 'Operations', 1, '2026-04-15 08:40:00'),
(10, 10, 'jreed', 'hash_jason_010', 'Manager', 1, '2026-04-15 09:55:00');

INSERT INTO customer (customer_id, first_name, last_name, street_address, city, state, postal_code, email, created_at) VALUES
(1, 'John', 'Carter', '101 Oak St', 'Baltimore', 'MD', '21201', 'john.carter@email.com', '2026-01-03 10:00:00'),
(2, 'Maria', 'Lewis', '202 Pine Ave', 'Columbia', 'MD', '21044', 'maria.lewis@email.com', '2026-01-05 11:30:00'),
(3, 'Kevin', 'Hall', '303 Cedar Rd', 'Ellicott City', 'MD', '21043', 'kevin.hall@email.com', '2026-01-07 14:15:00'),
(4, 'Nina', 'Young', '404 Maple Ln', 'Towson', 'MD', '21204', 'nina.young@email.com', '2026-01-09 09:50:00'),
(5, 'Omar', 'Brooks', '505 Birch Blvd', 'Laurel', 'MD', '20707', 'omar.brooks@email.com', '2026-01-10 13:10:00'),
(6, 'Priya', 'Shah', '606 Walnut Dr', 'Rockville', 'MD', '20850', 'priya.shah@email.com', '2026-01-12 15:40:00'),
(7, 'Quinn', 'Foster', '707 Spruce Ct', 'Annapolis', 'MD', '21401', 'quinn.foster@email.com', '2026-01-14 12:25:00'),
(8, 'Rachel', 'Price', '808 Ash Way', 'Frederick', 'MD', '21701', 'rachel.price@email.com', '2026-01-16 10:45:00'),
(9, 'Samuel', 'Ward', '909 Cherry St', 'Bowie', 'MD', '20715', 'samuel.ward@email.com', '2026-01-18 16:05:00'),
(10, 'Tina', 'Cole', '1001 Poplar Ave', 'Glen Burnie', 'MD', '21061', 'tina.cole@email.com', '2026-01-20 17:20:00');

INSERT INTO customer_phone (customer_phone_id, customer_id, phone_number, phone_type, is_primary) VALUES
(1, 1, '410-555-2001', 'Mobile', 1),
(2, 2, '410-555-2002', 'Home', 1),
(3, 3, '410-555-2003', 'Work', 1),
(4, 4, '410-555-2004', 'Mobile', 1),
(5, 5, '410-555-2005', 'Home', 1),
(6, 6, '410-555-2006', 'Mobile', 1),
(7, 7, '410-555-2007', 'Work', 1),
(8, 8, '410-555-2008', 'Mobile', 1),
(9, 9, '410-555-2009', 'Home', 1),
(10, 10, '410-555-2010', 'Mobile', 1);

INSERT INTO vehicle (vehicle_id, vin, make_name, model_name, model_year, list_price, mileage, vehicle_condition, availability_status) VALUES
(1, '1HGCM82633A000001', 'Toyota', 'Camry', 2022, 24500.00, 18000, 'Used', 'Sold'),
(2, '1HGCM82633A000002', 'Honda', 'Civic', 2023, 26500.00, 12000, 'Used', 'Sold'),
(3, '1HGCM82633A000003', 'Ford', 'Escape', 2021, 22900.00, 25000, 'Used', 'Sold'),
(4, '1HGCM82633A000004', 'Chevrolet', 'Malibu', 2024, 28900.00, 5000, 'Certified', 'Sold'),
(5, '1HGCM82633A000005', 'Nissan', 'Altima', 2022, 23950.00, 21000, 'Used', 'Sold'),
(6, '1HGCM82633A000006', 'Hyundai', 'Elantra', 2024, 25500.00, 7000, 'Certified', 'Sold'),
(7, '1HGCM82633A000007', 'Kia', 'Sportage', 2023, 27900.00, 14000, 'Used', 'Sold'),
(8, '1HGCM82633A000008', 'Mazda', 'CX-5', 2025, 32500.00, 20, 'New', 'Sold'),
(9, '1HGCM82633A000009', 'Subaru', 'Outback', 2024, 31900.00, 3000, 'Certified', 'Sold'),
(10, '1HGCM82633A000010', 'Tesla', 'Model 3', 2025, 39999.00, 10, 'New', 'Sold');

INSERT INTO sale_transaction (sale_id, customer_id, vehicle_id, sales_employee_id, sale_date, sale_price, payment_method, financing_used) VALUES
(1, 1, 1, 1, '2026-02-01', 23800.00, 'Cash', 0),
(2, 2, 2, 2, '2026-02-03', 25900.00, 'Financing', 1),
(3, 3, 3, 1, '2026-02-05', 22100.00, 'Card', 0),
(4, 4, 4, 2, '2026-02-08', 28150.00, 'Financing', 1),
(5, 5, 5, 1, '2026-02-12', 23200.00, 'Check', 0),
(6, 6, 6, 2, '2026-02-15', 24950.00, 'Financing', 1),
(7, 7, 7, 1, '2026-02-18', 27100.00, 'Bank Transfer', 0),
(8, 8, 8, 2, '2026-02-20', 31900.00, 'Financing', 1),
(9, 9, 9, 1, '2026-02-23', 31000.00, 'Card', 0),
(10, 10, 10, 2, '2026-02-25', 39200.00, 'Financing', 1);

INSERT INTO part (part_id, part_name, part_description, unit_cost) VALUES
(1, 'Oil Filter', 'Engine oil filter', 12.50),
(2, 'Air Filter', 'Cabin air filter', 18.75),
(3, 'Brake Pad Set', 'Front brake pads', 79.99),
(4, 'Spark Plug', 'Standard spark plug', 9.50),
(5, 'Battery', '12V car battery', 145.00),
(6, 'Headlight Bulb', 'LED headlight bulb', 29.99),
(7, 'Wiper Blade', 'All-weather blade', 16.25),
(8, 'Alternator Belt', 'Serpentine belt', 35.00),
(9, 'Brake Rotor', 'Front rotor', 95.50),
(10, 'Coolant', 'Engine coolant gallon', 22.00);

INSERT INTO service_record (service_record_id, customer_id, vehicle_id, technician_employee_id, service_type, service_date, service_cost, payment_method, service_notes) VALUES
(1, 1, 1, 3, 'Oil Change', '2026-03-01', 69.99, 'Card', 'Routine oil service'),
(2, 2, 2, 4, 'Brake Inspection', '2026-03-02', 149.99, 'Cash', 'Pads were worn'),
(3, 3, 3, 3, 'Battery Replacement', '2026-03-03', 210.00, 'Card', 'Battery replaced successfully'),
(4, 4, 4, 4, 'Tire Rotation', '2026-03-05', 59.99, 'Check', 'Rotation completed'),
(5, 5, 5, 3, 'Air Filter Replacement', '2026-03-07', 89.99, 'Card', 'Cabin air filter replaced'),
(6, 6, 6, 4, 'Spark Plug Service', '2026-03-09', 175.00, 'Bank Transfer', 'Replaced all spark plugs'),
(7, 7, 7, 3, 'Wiper Replacement', '2026-03-11', 54.99, 'Cash', 'New blades installed'),
(8, 8, 8, 4, 'Brake Repair', '2026-03-13', 420.00, 'Card', 'Pads and rotor replaced'),
(9, 9, 9, 3, 'Cooling System Service', '2026-03-15', 130.00, 'Warranty', 'Coolant flushed and refilled'),
(10, 10, 10, 4, 'Lighting Repair', '2026-03-17', 95.00, 'Card', 'Bulb replaced and tested');

INSERT INTO service_part (service_record_id, part_id, quantity_used, line_cost) VALUES
(1, 1, 1, 12.50),
(2, 3, 1, 79.99),
(3, 5, 1, 145.00),
(4, 7, 1, 16.25),
(5, 2, 1, 18.75),
(6, 4, 4, 38.00),
(7, 7, 2, 32.50),
(8, 3, 1, 79.99),
(9, 10, 2, 44.00),
(10, 6, 1, 29.99);

INSERT INTO loan (loan_id, sale_id, customer_id, vehicle_id, loan_officer_employee_id, loan_amount, interest_rate, loan_term_months, monthly_payment, approval_status, current_balance, start_date) VALUES
(1, 2, 2, 2, 5, 22000.00, 5.25, 60, 418.27, 'Approved', 19850.00, '2026-02-03'),
(2, 4, 4, 4, 5, 24500.00, 4.75, 60, 459.81, 'Approved', 22075.00, '2026-02-08'),
(3, 6, 6, 6, 5, 21000.00, 6.10, 48, 493.81, 'Approved', 18990.00, '2026-02-15'),
(4, 8, 8, 8, 5, 28000.00, 5.90, 72, 462.59, 'Approved', 26550.00, '2026-02-20'),
(5, 10, 10, 10, 5, 35000.00, 4.95, 72, 562.41, 'Approved', 33750.00, '2026-02-25'),
(6, 1, 1, 1, 5, 0.00, 0.00, 12, 0.00, 'Closed', 0.00, '2026-02-01'),
(7, 3, 3, 3, 5, 0.00, 0.00, 12, 0.00, 'Closed', 0.00, '2026-02-05'),
(8, 5, 5, 5, 5, 0.00, 0.00, 12, 0.00, 'Closed', 0.00, '2026-02-12'),
(9, 7, 7, 7, 5, 0.00, 0.00, 12, 0.00, 'Closed', 0.00, '2026-02-18'),
(10, 9, 9, 9, 5, 0.00, 0.00, 12, 0.00, 'Closed', 0.00, '2026-02-23');

INSERT INTO loan_payment (loan_payment_id, loan_id, payment_method, payment_date, amount_paid, remaining_balance_after_payment) VALUES
(1, 1, 'AutoPay', '2026-03-03', 418.27, 21581.73),
(2, 2, 'Bank Transfer', '2026-03-08', 459.81, 24040.19),
(3, 3, 'Card', '2026-03-15', 493.81, 20506.19),
(4, 4, 'AutoPay', '2026-03-20', 462.59, 27537.41),
(5, 5, 'Check', '2026-03-25', 562.41, 34437.59),
(6, 1, 'AutoPay', '2026-04-03', 418.27, 21163.46),
(7, 2, 'Bank Transfer', '2026-04-08', 459.81, 23580.38),
(8, 3, 'Card', '2026-04-15', 493.81, 20012.38),
(9, 4, 'AutoPay', '2026-04-20', 462.59, 27074.82),
(10, 5, 'Check', '2026-04-25', 562.41, 33875.18);

INSERT INTO operational_cost (cost_id, department_id, recorded_by_employee_id, cost_date, cost_type, amount, description) VALUES
(1, 1, 1, '2026-03-01', 'Advertising', 1200.00, 'Online ad campaign'),
(2, 2, 2, '2026-03-02', 'Travel', 350.00, 'Offsite vehicle pickup'),
(3, 3, 3, '2026-03-03', 'Supplies', 425.50, 'Shop consumables'),
(4, 4, 4, '2026-03-04', 'Equipment', 980.00, 'Brake lathe maintenance'),
(5, 5, 5, '2026-03-05', 'Software', 650.00, 'Loan management license'),
(6, 6, 6, '2026-03-06', 'Utilities', 1500.00, 'Facility electricity'),
(7, 7, 7, '2026-03-07', 'Training', 700.00, 'HR onboarding workshop'),
(8, 8, 8, '2026-03-08', 'Hardware', 2100.00, 'Server replacement parts'),
(9, 9, 9, '2026-03-09', 'Inventory', 3300.00, 'Bulk parts restock'),
(10, 10, 10, '2026-03-10', 'Customer Care', 275.00, 'Survey gift cards');
