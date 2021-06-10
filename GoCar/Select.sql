-- The following commands select the registrations we want from the database

-- 1st query
SELECT *
FROM car c
WHERE c.Release_Year >= 2000 AND c.Release_Year <= 2010 AND Brand = 'Ford';


-- 2nd query
SELECT c.Seller_idSeller, count(*) AS 'Sales'
FROM car c, invoice i
WHERE c.Invoice_idInvoice = i.idInvoice AND i.Date_of_Purchase = 2020
GROUP BY c.Seller_idSeller;


-- 3rd query
SELECT e.idRepair
FROM engineer_repairs_car e, repair_certificate r
WHERE e.Repair_Certificate_idRepair_Certificate = r.idRepair_Certificate AND r.Cost = (
	SELECT max(Cost)
	FROM repair_certificate r
	WHERE r.Date_of_repair >= DATE '2021-04-01' AND r.Date_of_repair <= DATE '2021-04-30');
    
SELECT e.idRepair
FROM engineer_repairs_car e, repair_certificate r
WHERE e.Repair_Certificate_idRepair_Certificate = r.idRepair_Certificate AND r.Cost = (
	SELECT min(Cost)
	FROM repair_certificate r
	WHERE r.Date_of_repair >= DATE '2021-04-01' AND r.Date_of_repair <= DATE '2021-04-30');
    
SELECT e.idRepair
FROM engineer_repairs_car e, repair_certificate r
WHERE e.Repair_Certificate_idRepair_Certificate = r.idRepair_Certificate AND r.Cost = (
	SELECT avg(Cost)
	FROM repair_certificate r
	WHERE r.Date_of_repair >= DATE '2021-04-01' AND r.Date_of_repair <= DATE '2021-04-30');


-- 4th query
SELECT count(*) AS 'Number of spare_parts'
FROM engineer_repairs_car e, spare_part s
WHERE s.Engineer_repairs_Car_idRepair = e.idRepair AND e.Repair_Certificate_idRepair_Certificate IN (
	SELECT r.idRepair_Certificate
	FROM repair_certificate r
	WHERE r.Date_of_repair >= DATE '2021-05-01' AND r.Date_of_repair <= DATE '2021-05-31');


-- 5th query
SELECT c.idCustomer, c.Name
FROM engineer_repairs_car e, customer c, repair_certificate r
WHERE e.Car_Customer_idCustomer = c.idCustomer AND r.idRepair_Certificate = e.Repair_Certificate_idRepair_Certificate AND r.Date_of_Repair >= DATE '2021-01-01' AND r.Date_of_Repair <= DATE '2021-12-31';


-- 6th query
SELECT avg(s.Cost) AS 'Average cost of spare_parts'
FROM spare_part s, engineer_repairs_car e, repair_certificate r
WHERE s.Engineer_repairs_Car_idRepair = e.idRepair AND e.Repair_Certificate_idRepair_Certificate = r.idRepair_Certificate AND r.Date_of_repair >= DATE '2020-01-01' AND r.Date_of_repair <= DATE '2020-12-31';


-- 7th query
SELECT n.Name, count(*) AS 'Number of cars fixed'
FROM engineer_repairs_car e, engineer n
WHERE e.Engineer_idEngineer = n.idEngineer AND e.Repair_Certificate_idRepair_Certificate IN (
	SELECT r.idRepair_Certificate
	FROM repair_certificate r
	WHERE r.Date_of_repair >= DATE '2020-01-01' AND r.Date_of_repair <= DATE '2020-12-31')
GROUP BY e.Engineer_idEngineer;
