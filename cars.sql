CREATE SCHEMA IF NOT EXISTS cars;

SET search_path TO cars;



CREATE TABLE IF NOT EXISTS cars
(
    Order_ID TEXT,
    Order_Date TEXT,
    Delivery_Date TEXT,
    Customer_Name TEXT,
    Customer_Type TEXT,
    Customer_Age TEXT,
    Region TEXT,
    County TEXT,
    City TEXT,
    Branch TEXT,
    Sales_Rep TEXT,
    Lead_Source TEXT,
    Car_Make TEXT,
    Car_Model TEXT,
    Vehicle_Type TEXT,
    Vehicle_Year TEXT,
    Fuel_Type TEXT,
    Transmission TEXT,
    Color TEXT,
    Units_Sold TEXT,
    Unit_Selling_Price TEXT,
    Unit_Cost TEXT,
    Discount TEXT,
    Delivery_Fee TEXT,
    Logistics_Cost TEXT,
    Payment_Method TEXT,
    Payment_Status TEXT,
    Delivery_Status TEXT,
    Customer_Rating TEXT,
    Review_Count TEXT,
    Returned TEXT,
    Revenue_Recorded TEXT
);

SELECT * FROM cars;

-- CLEANING ALL THE DATA



--MAKING ALL THE DATA ALIGN IN ONE CASE 

update cars
set order_id = trim(upper(order_id)),
	customer_name = trim(initcap(customer_name)),
	customer_type = trim(initcap(customer_type)),
	region = trim(initcap(region)),
	county = trim(initcap(county)),
	city = trim(initcap(city)),
	branch = trim(initcap(branch)),
	sales_rep = trim(initcap(sales_rep)),
	lead_source = trim(initcap(lead_source)),
	car_make = trim(initcap(car_make)),
	car_model = trim(initcap(car_model)),
	vehicle_type = trim(initcap(vehicle_type)),
	fuel_type = trim(initcap(fuel_type)),
	transmission = trim(initcap(transmission)),
	color = trim(initcap(color)),
	vehicle_year = trim(vehicle_year),
	logistics_cost = trim(logistics_cost),
	payment_method = trim(initcap(payment_method)),
	payment_status = trim(initcap(payment_status)),
	delivery_status = trim(initcap(delivery_status)),
	returned = trim(initcap(returned));




--CUSTOMER_TYPE

select distinct(customer_type) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set customer_type = case
	when customer_type = 'Corp' then 'Corporate'
	when customer_type =  'Govt' then 'Government'
	when customer_type = 'Person' then 'Individual'
	when customer_type = 'Ngo' then 'N.G.O'
	when customer_type = 'N/A' then null
else customer_type
end;


--REGION
	
select distinct(region) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set region = case
	when region IN('Rift-Valley','Rift','Riftvalley') then 'Rift Valley'
	when region in ('Eastrn','East') then 'Eastern'
	when region IN( 'West','Ksm Region','Westen') then 'Western'
	when region IN('Msa Region','Cost','Coast') then 'Coast'
	when region IN('Nbi','Nairobii','Nrb') then 'Nairobi'
	when region IN('Cental','Central') then 'Central'
	when region = 'Nyanza Region' then 'Nyanza'
	
else nullif(region,'') 
end;

-- CITY
select distinct(city) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set city = case
	when city = 'Eld' then 'Eldoret'
	when city = 'Kakamega Town' then 'Kakamega'
	when city = 'Nkr' then 'Nakuru'
	when city = 'Thikka' then 'Thika'
	when city = 'Athiriver' then 'Athi River'
	when city = 'Msa' then 'Mombasa'
	when city = 'Ksm' then 'Kisumu'
else city
end;


-- BRANCH 
select distinct(branch) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set branch = case
	when branch in ('Mombasa Port Yard','Msa Yard','Mombasa Port','Mombasa Yard') then 'Mombasa Branch'
	when branch in ('Kisumu Yard','Ksm Yard') then 'Kisumu Branch'
	when branch = 'Msa Yard' then 'Mombasa Yard'
	when branch in('Eldoret Yard','Eldoret','Eld Yard') then 'Eldoret Branch'
	when branch in ('Thika','Thika Yard') then 'Thika Branch'
	when branch in ('Nkr Yard','Nakuru Yard') then 'Nakuru Branch'
	when branch in ('Kakamega','Kakamega Yard') then 'Kakamega Branch'
	when branch in ('Main Yard','Nairobi Hq')then 'Nairobi Branch'
	when branch in ('Athi River Yard','Athi River','Athiriver Yard') then 'Athi River Branch' 
else branch
end;


-- COUNTY

select distinct(county) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set county = case
	when county = 'Nakuru County' then 'Nakuru'
	when county = 'Kakamega County' then 'Kakamega'
	when county in ('Msa','Mombasa County','Mks') then 'Mombasa'
	when county in ('Kambu','Kiambu County') then 'Kiambu'
	when county in ('Ksm','Kisumu County') then 'Kisumu'
	when county = 'Mchakos' then 'Machakos'
	when county = 'Nkr' then 'Nakuru'
	when county in ('Nairobi County','Nrb','Nairobii') then 'Nairobi'
	when county in('Uasingishu','Uasin-Gishu') then 'Uasin Gishu'
	when county = 'Null' then null
else county
end;



-- LEAD SOURCE 

select distinct(lead_source) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set lead_source = case
	when lead_source in ('Face Book','Fb') then 'Facebook'
	when lead_source in ('Walkin','Walk-In') then 'Walk In'
	when lead_source in ('Phone','Phonecall','Call') then 'Phone Call'
	when lead_source in ('Corporate','Corp Tender','Tender') then 'Corporate Tender'
	when lead_source in ('Refferal','Referal') then 'Referral'
	when lead_source in ('Watsapp','Whats App') then 'Whatsapp'
	when lead_source in ('Ig','Insta') then 'Instagram'
	when lead_source = 'Web' then 'Website'
else nullif(lead_source,'')
end;



-- CAR MAKE

select distinct(car_make) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set car_make = case
	when car_make = 'Mazada' then 'Mazda'
	when car_make in ('Mitsubish','Mitshubishi','Mitsubishi') then 'Mitsubishi'
	when car_make in ('Benz','Mercedes','Mercedes-Benz') then 'Mercedes Benz'
	when car_make = 'Subru' then 'Subaru'
	when car_make in ('Hondaa','Honda Motors') then 'Honda'
	when car_make = 'Nisan'  then 'Nissan'
	when car_make in ('Volks Wagen','V.W') then 'Volkswagen'
	when car_make = 'Bmw' then 'B.M.W'
	when car_make in ('Toyota Kenya','Toyta','Totoya') then 'Toyota'
	when car_make = 'Iszu' then 'Isuzu'
else car_make
end;


-- CAR MODEL
select distinct(car_model) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set car_model = case
	when car_model in ('Prado','Prado-Tx') then 'Prado Tx'
	when car_model in ('X-TRAIL','X Trail','Xtrail') then 'X-Trail'
	when car_model = 'Hillux' then 'Hilux'
	when car_model in ('D Max','Dmax Pickup','Dmax') then 'D-Max'
	when car_model in ('Canterr','Canter Truck') then 'Canter'
	when car_model = 'X5' then 'Bmw X5'
	when car_model = 'Crv' then 'Cr-V'
	when car_model = 'Cx 5' then 'Cx-5'
	when car_model in ('Corola','Corrola','Corolla Altis') then 'Corolla'
	when car_model = 'Harier'then 'Harrier'
	when car_model = 'Out Back' then 'Outback'
	when car_model = 'Xv' then 'Subaru Xv'
	when car_model in ('Land-Cruiser','Land Cruiser') then 'Landcruiser Prado'
	when car_model = 'C-200' then 'C200'
	when car_model = 'Vezel Hybrid' then 'Vezel'
	when car_model = 'Fit Hybrid' then 'Fit'
	when car_model = 'Out Lander' then 'Outlander'
	when car_model = 'Imprezza' then 'Impreza'
	when car_model = 'Forestar' then 'Forester'
	when car_model in ('Hiece','Hiace Van') then 'Hiace'
	when car_model = 'Fieldar' then 'Fielder'
	when car_model = 'E-250' then 'E250'
else car_model
end;



-- VEHICLE TYPE

select distinct(vehicle_type) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set vehicle_type = nullif(vehicle_type,'');

update cars
set vehicle_type = nullif(vehicle_type,'-');

--
update cars
set vehicle_type = case 
	when vehicle_type = 'Saloon' then 'Sedan'
	when vehicle_type = 'Wagon' then 'Hatchback'
else vehicle_type
end;



-- FUEL TYPE

select distinct(fuel_type) from cars;

--SYNC SIMILAR COLUMN VALUES

UPDATE cars
SET fuel_type = CASE
    WHEN fuel_type in ('Hybridrid','Hyb','Hybrid/Petrol') THEN 'Hybrid'
    WHEN fuel_type = 'Ev' THEN 'Electric'
    WHEN fuel_type = 'Pms' THEN 'Petrol'
    WHEN fuel_type = 'Dsl' THEN 'Diesel'
    WHEN fuel_type = 'Gasoline' THEN 'Petrol'
    ELSE fuel_type
END;



-- TRANSMISSION

select distinct(transmission) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set transmission = case
	when transmission in ('M/T','Mt') then 'Manual'
	when transmission in ('A/T','Auto','At') then 'Automatic'
	when transmission  = 'N/A' then Null
else nullif(transmission,'-')
end;



--COLOR
select distinct(color) from cars;

--SYNC SIMILAR COLUMN VALUES

update cars
set color = case
	when color = 'Sil' then 'Silver'
	when color = 'Bla' then 'Black'
	when color = 'Whi' then 'White'
	when color = 'Blu' then 'Blue'
	when color = 'Gre' then 'Green'
	when color = '-' then null
else color
end;



--PAYMENT METHOD

select distinct(payment_method) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set payment_method = case
	when payment_method = 'Bank Transfer' then ''
	when payment_method in('M-Pesa','Mpesa','M Pesa') then 'MPesa'
	when payment_method in ('Check','Bankers Cheque') then 'Cheque'
	when payment_method = ('Asset Finance') then 'Asset Financing'
	when payment_method = '' then null
else payment_method
end;



-- PAYMENT STATUS
select distinct(payment_status) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set payment_status = case
	when payment_status in ('Partial','Part Paid') then 'Partially Paid'
	when payment_status = 'Awaiting Payment' then 'Pending'
	when payment_status in ('Cancel','Canceled') then 'Cancelled'
	when payment_status in ('Complete','Paid') then 'Completed'
	when payment_status = 'Refund' then 'Refunded'
else payment_status
end;

-- DELIVERY STATUS
select distinct(delivery_status) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set delivery_status = case
	when delivery_status in ('Transit','In-Transit','On The Way') then 'In Transit'
	when delivery_status in ('Done','Completed') then 'Delivered'
	when delivery_status in ('Yard','At Yard') then 'At The Yard'
	when delivery_status in ('Cancel','Canceled') then 'Cancelled'
	when delivery_status in ('Late','Held') then 'Delayed'
	when delivery_status = '' then null
else delivery_status
end;


-- RETURNED

select distinct(returned) from cars;

--SYNC SIMILAR COLUMN VALUES
update cars
set returned = case
	when returned in ('Y','Yes','True') then 'Returned'
	when returned in ('N','No','False') then 'Not Returned'
	when returned in ('','-') then null
else returned
end;



--ORDER ID
update cars
set order_id = case 
	when order_id = 'N/A' then null
else  regexp_replace(order_id,'-','','g')
end;




--CLEANING DATES -THIS IS TOUGH!!

--Step 1.   Converting excel date format 

UPDATE cars
SET order_date = (DATE '1899-12-30' + order_date::integer)::text
WHERE order_date ~ '^[0-9]{5}$';

--Step 2. Convert DD/MM/YYYY

UPDATE cars
SET order_date = TO_CHAR(
    TO_DATE(order_date, 'DD/MM/YYYY'),
    'YYYY-MM-DD'
)
WHERE order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
  AND split_part(order_date, '/', 1)::integer > 12
  AND order_date <> '31/02/2026';

--Step 3. Converting MM/DD/YYYY

UPDATE cars
SET order_date = TO_CHAR(
    TO_DATE(order_date, 'MM/DD/YYYY'),
    'YYYY-MM-DD'
)
WHERE order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
  AND split_part(order_date, '/', 2)::integer > 12;

--Step 4. Converting DD-Mon-YY to YYYY-MM-DD

UPDATE cars
SET order_date = TO_CHAR(
    TO_DATE(order_date, 'DD-Mon-YY'),
    'YYYY-MM-DD'
)
WHERE order_date ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$';

--Step 5. Converting the remaining invalid data to null
-- example 'April 31 2026', april has 30 days, '31/02/2026' -> Feb has 28/29 days

UPDATE cars
SET order_date = NULL
WHERE order_date IN (
    'N/A',
    '#DATE!',
    'not sure',
    'April 31 2026',
    '2026-13-04',
    '31/02/2026',
    ''
);

--Step 6. Converting all dates to MM/DD/YYYY

UPDATE cars
SET order_date = TO_CHAR(
    TO_DATE(order_date, 'MM/DD/YYYY'),
    'YYYY-MM-DD'
)
WHERE order_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';


SELECT DISTINCT (order_date)
FROM cars;

SELECT * FROM cars;

--2. DELIVERY DATE

--Step 1. 

UPDATE cars
SET delivery_date = (DATE '1899-12-30' + delivery_date::integer)::text
WHERE delivery_date ~ '^[0-9]{5}$';

--Step 2. 

UPDATE cars
SET delivery_date = TO_CHAR(
    TO_DATE(delivery_date, 'DD-Mon-YY'),
    'YYYY-MM-DD'
)
WHERE delivery_date ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$';

--Step 3. 
UPDATE cars
SET delivery_date = NULL
WHERE delivery_date IN (
    '31/02/2026',
    'N/A',
    '#DATE!',
    'not sure',
    'NULL',
    '-',
    '2026-13-04',
    '',
    'April 31 2026'
);

--Step 4.

UPDATE cars
SET delivery_date = TO_CHAR(
    TO_DATE(delivery_date, 'DD/MM/YYYY'),
    'YYYY-MM-DD'
)
WHERE delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
  AND split_part(delivery_date, '/', 1)::integer > 12;

--Step 5
UPDATE cars
SET delivery_date = TO_CHAR(
    TO_DATE(delivery_date, 'MM/DD/YYYY'),
    'YYYY-MM-DD'
)
WHERE delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$'
  AND split_part(delivery_date, '/', 2)::integer > 12;

--Step 6

UPDATE cars
SET delivery_date = TO_CHAR(
    TO_DATE(delivery_date, 'MM/DD/YYYY'),
    'YYYY-MM-DD'
)
WHERE delivery_date ~ '^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$';


--VERIFYING THE DATES!

SELECT DISTINCT (delivery_date)
FROM cars;




select* from cars;


--CLEANING VEHICLE YEAR
select vehicle_year from cars;

-- making Twenty Twenty -> 2020
-- making invalid data null

update cars
set vehicle_year = case
	when vehicle_year = 'Twenty Twenty' then '2020'
	when vehicle_year in ('','-','N/A','null') then null
else vehicle_year
end;


-- UNIT SELLING PRICE
-- removing the blanks to null
UPDATE cars
SET unit_selling_price = NULL
WHERE unit_selling_price IN (
    'not available',
    'missing',
    'NULL'
);

-- Converting example 2.4M by multiplying by 1000000 and removing the M

UPDATE cars
SET unit_selling_price =
    (REPLACE(unit_selling_price, 'M', '')::numeric * 1000000)
WHERE unit_selling_price ~ '^[0-9]+(\.[0-9]+)?M$';

--removing the KES,KSH values

UPDATE cars
SET unit_selling_price = regexp_replace(
    unit_selling_price,
    '^(KSh|KES)\s*|,',
    '',
    'g'
)
WHERE unit_selling_price ~ '^(KSh|KES)';

--removing all invalid data formats

UPDATE cars
SET unit_selling_price = regexp_replace(
    unit_selling_price,
    ',',
    '',
    'g'
)
WHERE unit_selling_price ~ ',';

--removing dashes(-)

UPDATE cars
SET unit_selling_price = NULL
WHERE unit_selling_price = '-';

update cars 
set unit_selling_price = case
	when unit_selling_price = 'error' then null
else unit_selling_price
end;



--removing any value infornt of the numbers

UPDATE cars
SET unit_selling_price = regexp_replace(
    unit_selling_price,
    '^\?\s*|,',
    '',
    'g'
)
WHERE unit_selling_price ~ '^\?';

--removing dash infront of numbers

UPDATE cars
SET unit_selling_price = regexp_replace(
    unit_selling_price,
    '^-',
    ''
)
WHERE unit_selling_price ~ '^-';


update cars
set unit_selling_price = trim(unit_selling_price);


-- multiplying USD and $ by flat rate of 129

UPDATE cars
SET unit_selling_price = (
    regexp_replace(unit_selling_price, '^(USD|\$)\s*|,', '', 'g')::numeric * 129
)
WHERE unit_selling_price ~ '^(USD|\$)';

-- multipying ZAR and R by 8
UPDATE cars
SET unit_selling_price = (
    regexp_replace(unit_selling_price, '^(ZAR|R)\s*|,', '', 'g')::numeric * 8
)
WHERE unit_selling_price ~ '^(ZAR|R)';

--multiplying EUR by 147

UPDATE cars
SET unit_selling_price =
    (
        regexp_replace(unit_selling_price, '^EUR\s*|,', '', 'g')::numeric * 147
    )::text
WHERE unit_selling_price ~ '^EUR';



--MAKING EVERYTHING NUMERIC

alter table cars
alter column unit_selling_price type numeric
using unit_selling_price::numeric;

select distinct(unit_selling_price) from cars;


select* from cars;






-- UNIT COST

UPDATE cars
SET unit_cost = NULL
WHERE unit_cost IN (
    '#VALUE!',
    'missing',
    'error',
    'not available',
    '-',
    ''
);

--STEP 1

UPDATE cars
SET unit_cost = regexp_replace(
    unit_cost,
    '^(KSh|KES)\s*|,',
    '',
    'g'
)
WHERE unit_cost ~ '^(KSh|KES)';

--STEP 2:
UPDATE cars
SET unit_cost =
    (REPLACE(unit_cost, 'M', '')::numeric * 1000000)::text
WHERE unit_cost ~ '^[0-9]+(\.[0-9]+)?M$';

--STEP 3
UPDATE cars
SET unit_cost = regexp_replace(
    unit_cost,
    '^\?\s*|,',
    '',
    'g'
)
WHERE unit_cost ~ '^\?';

--STEP 4
UPDATE cars
SET unit_cost = regexp_replace(unit_cost, '^-', '')
WHERE unit_cost ~ '^-';

--STEP 5
-- multiplying USD and $ by flat rate of 129

UPDATE cars
SET unit_cost = (
    regexp_replace(unit_cost, '^(USD|\$)\s*|,', '', 'g')::numeric * 129
)::text
WHERE unit_cost ~ '^(USD|\$)';

-- multipying ZAR and R by 8
UPDATE cars
SET unit_cost = (
    regexp_replace(unit_cost, '^(ZAR|R)\s*|,', '', 'g')::numeric * 8
)::text
WHERE unit_cost ~ '^(ZAR|R)';

--removing spaces infront of the numbers

update cars
set unit_cost =  trim(unit_cost);





select discount from cars;

-- CLEANING DISCOUNT
UPDATE cars
SET discount = CASE
    WHEN discount IN ('No Discount', 'Disc') THEN '0'
    WHEN discount IN ('NULL', '-', 'unknown', '#ERROR!') THEN NULL
    WHEN discount = 'fifteen' THEN '15'
    WHEN discount = 'twenty %' THEN '20'
    WHEN discount = 'ten percent' THEN '10'
    WHEN discount = 'fifteen percent' THEN '15'
    WHEN discount = '12 percent' THEN '12'
    WHEN discount = '5 percent' THEN '5'
    WHEN discount = '3 percent' THEN '3'
    WHEN discount = '2 percent' THEN '2'
    WHEN discount = '7 percent' THEN '7'
    WHEN discount = '10 percent' THEN '10'
    WHEN discount = '15 percent' THEN '15'
    WHEN discount = '0 percent' THEN '0'
    when discount = '-10 percent' then '10'
    when discount in ('','#ERROR','None') then null
    ELSE discount
END;

--removing values infront of numbers

UPDATE cars
SET discount = regexp_replace(discount, '%', '', 'g')
WHERE discount LIKE '%\%%';

--multiplyimg decimals 
UPDATE cars
SET discount = (discount::numeric * 100)::text
WHERE discount ~ '^0\.[0-9]+$';

--removing negatives UPDATE cars
UPDATE cars
SET discount = ABS(discount::numeric)::text
WHERE discount ~ '^-?[0-9]+(\.[0-9]+)?$';

select distinct(discount) from cars
where discount >100;



ALTER TABLE cars
ALTER COLUMN discount TYPE INTEGER
USING discount::numeric::integer;

sele


select* from cars;


--UNITS SOLDS

--Step 1
UPDATE cars
SET units_sold = CASE
    WHEN units_sold = '3 cars' THEN '3'
    WHEN units_sold = 'two' THEN '2'
    WHEN units_sold = 'one' THEN '1'
    WHEN units_sold IN('N/A','')  THEN NULL
    ELSE units_sold
END;

--Step 2
UPDATE cars
SET units_sold = ABS(units_sold::numeric)::text
WHERE units_sold ~ '^-?[0-9]+$';


select* from cars;


-- DELIVERY FEE

--Step 1

UPDATE cars
SET delivery_fee = NULL
WHERE delivery_fee IN (
    '#VALUE!',
    'not available',
    'missing',
    'error',
    ''
);

--Step 2

UPDATE cars
SET delivery_fee = regexp_replace(
    delivery_fee,
    '^(KSh|KES)\s*|,',
    '',
    'g'
)
WHERE delivery_fee ~ '^(KSh|KES)';


--Step 3
UPDATE cars
SET delivery_fee =
    (REPLACE(delivery_fee, 'M', '')::numeric * 1000000)::text
WHERE delivery_fee ~ '^[0-9]+(\.[0-9]+)?M$';

--Step 4
UPDATE cars
SET delivery_fee = (
    regexp_replace(delivery_fee, '^(USD|\$)\s*|,', '', 'g')::numeric * 129
)::text
WHERE delivery_fee ~ '^(USD|\$)';

--Step 5

UPDATE cars
SET delivery_fee = (
    regexp_replace(delivery_fee, '^(ZAR|R)\s*|,', '', 'g')::numeric * 8
)::text
WHERE delivery_fee ~ '^(ZAR|R)';

--Step 6
UPDATE cars
SET delivery_fee = (
    regexp_replace(delivery_fee, '^EUR\s*|,', '', 'g')::numeric * 147
)::text
WHERE delivery_fee ~ '^EUR';

--Step 7

UPDATE cars
SET delivery_fee = regexp_replace(
    delivery_fee,
    '^\?\s*|,',
    '',
    'g'
)
WHERE delivery_fee ~ '^\?';

--Step 8
UPDATE cars
SET delivery_fee = regexp_replace(delivery_fee, ',', '', 'g')
WHERE delivery_fee LIKE '%,%';

--Step 9
UPDATE cars
SET delivery_fee = ABS(delivery_fee::numeric)::text
WHERE delivery_fee ~ '^-?[0-9]+(\.[0-9]+)?$';

ALTER TABLE cars
ALTER COLUMN delivery_fee TYPE NUMERIC
USING delivery_fee::numeric;


select* from cars;


-- LOGISTICS COST
select distinct(logistics_cost) from cars;

--Step 1

UPDATE cars
SET logistics_cost = NULL
WHERE logistics_cost IN (
    'not available',
    '#VALUE!',
    'TBD',
    'missing',
    'error',
    '-',
    ''
);

--Step 2
UPDATE cars
SET logistics_cost = regexp_replace(
    logistics_cost,
    '^(KSh|KES)\s*|,',
    '',
    'g'
)
WHERE logistics_cost ~ '^(KSh|KES)';

--Step 3

UPDATE cars
SET logistics_cost =
    (REPLACE(logistics_cost, 'M', '')::numeric * 1000000)
WHERE logistics_cost ~ '^[0-9]+(\.[0-9]+)?M$';

--Step 4

UPDATE cars
SET logistics_cost = (
    regexp_replace(logistics_cost, '^(USD|\$)\s*|,', '', 'g')::numeric * 129
)
WHERE logistics_cost ~ '^(USD|\$)';

--Step 5

UPDATE cars
SET logistics_cost = (
    regexp_replace(logistics_cost, '^EUR\s*|,', '', 'g')::numeric * 147
)
WHERE logistics_cost ~ '^EUR';

--Step 6
UPDATE cars
SET logistics_cost =
    regexp_replace(
        logistics_cost,
        '^(ZAR|R)\s*|,',
        '',
        'g'
    )::numeric * 8
WHERE logistics_cost ~ '^(ZAR|R)';

--removing question mark infront
UPDATE cars
SET logistics_cost = REPLACE(logistics_cost, '? ', '')
WHERE logistics_cost LIKE '? %';
--
UPDATE cars
SET logistics_cost =
    REPLACE(
        REPLACE(logistics_cost, '?', ''),
        ',',
        ''
    )::numeric;

--making evrything absolute
 update cars
 set logistics_cost = ABS(logistics_cost::numeric);


--making evrything numeric
 alter table cars
 alter column logistics_cost type numeric
 using logistics_cost::numeric;


select distinct(logistics_cost) from cars;









--CUSTOMER RATING

select distinct(customer_rating) from cars;

--removing 'out of 5 or /5'
UPDATE cars
SET customer_rating = regexp_replace(
    customer_rating,
    '\s*(out of 5|/5)$',
    '',
    'i'
)
WHERE customer_rating ~* '(out of 5|/5)$';

--removing error
update cars
set customer_rating = case
	when customer_rating ='Excellent' then '5'
	when customer_rating in ('','-','N/A') then null
else customer_rating
end;

--removing all negatives

update cars
set customer_rating = ABS(customer_rating::numeric)::TEXT;

--converting the column to type numeric

alter table cars
alter column customer_rating type numeric
using customer_rating::numeric;

--Replacing numbers greater than 5 by 5

select customer_rating
from cars
where customer_rating > 5 ;
								--2 numbers found
--replacing them

update cars
set customer_rating = '5' where customer_rating = '6';



select* from cars;

--REVIEW COUNT
select distinct(review_count) from cars;

--Step 1: removing all invalid formats
update cars
set review_count = case
	when review_count in ('N/A','','-') then null
	when review_count = 'ten' then '10'
else review_count

end;

--Making all numbers absoulute to remove negatives

update cars
set review_count = ABS(review_count::numeric);

--making the column numeric
alter table cars
alter column review_count type numeric
using review_count::numeric;


-- REVENUE RECORDED

select distinct(revenue_recorded) from cars;

 --Step 1 : removing any invalid numbers

UPDATE cars
SET revenue_recorded = CASE
    WHEN revenue_recorded IN ('', 'N/A', '-','not available','#VALUE!','missing','error') THEN NULL
    ELSE regexp_replace(
        revenue_recorded,
        '^(KSh|KES|\?)\s*|,',
        '',
        'g'
    )
END;

--Step 2: Multiply M by 1000000
update cars
set revenue_recorded = 
		(replace(revenue_recorded,'M','')::numeric *1000000)
		where revenue_recorded ~ '^[0-9]+(\.[0-9]+)?M$';

--Step 3: Multiplying EUR by 147

update cars
set revenue_recorded = 
	(replace(revenue_recorded,'EUR','')::numeric *147)
		where revenue_recorded like 'EUR%';

--Step 4:Multiplying USD with 129
update cars
set revenue_recorded = 
	(replace(revenue_recorded,'USD','')::numeric *129)
		where revenue_recorded like ('USD%');

-- Step 5:Multiplying ZAR by 8
UPDATE cars
SET revenue_recorded =
    (
        regexp_replace(revenue_recorded, '^(ZAR|R)\s*|,', '', 'g')::numeric * 8
    )::text
WHERE revenue_recorded ~ '^(ZAR|R)';


--Step 6: Removing negatives by making everything absolute

update cars
set revenue_recorded = ABS(revenue_recorded::numeric);

--Step 7 : Making it numeric
alter table cars
alter column revenue_recorded type numeric
using revenue_recorded::numeric;

--CUSTOMER AGE
select distinct(customer_age) from cars;

--removing all invalid text

update cars
set customer_age = case
	when customer_age in ('','N/A','-','unknown') then null
	when customer_age = 'thirty' then '30'
else customer_age
end;

--Making everything absolute and numeric
 update cars
 set customer_age = ABS(customer_age::numeric);

--
alter table cars
alter column customer_age type numeric
using customer_age::numeric;

--VEHICLE YEAR
select distinct(vehicle_year) from cars;

update cars
set vehicle_year = case
	when vehicle_year in ('2032','202A','') then null
else vehicle_year
end;


--CUSTOMER NAME
UPDATE cars
SET customer_name = NULL
WHERE TRIM(INITCAP(customer_name)) IN ('N/A', 'Null', 'Unknown','');

--SALES_REP

select distinct(sales_rep) from cars;
--

UPDATE cars
SET sales_rep = CASE

    -- Fix 1 replacing the letter i
    WHEN sales_rep = 'Grace Njer1' THEN 'Grace Njeri'
    WHEN sales_rep = 'Fa1th Achieng' THEN 'Faith Achieng'
    WHEN sales_rep = 'Mary Wanj1ku' THEN 'Mary Wanjiku'
    WHEN sales_rep = 'Br1an Otieno' THEN 'Brian Otieno'
    WHEN sales_rep = 'Peter K1ptoo' THEN 'Peter Kiptoo'
    WHEN sales_rep = 'Kev1n Mwangi' THEN 'Kevin Mwangi'
    WHEN sales_rep = 'A1sha Mohamed' THEN 'Aisha Mohamed'
    WHEN sales_rep = 'Mercy At1eno' THEN 'Mercy Atieno'
    WHEN sales_rep = 'Dan1el Kimani' THEN 'Daniel Kimani'

    -- Match single names to full names
    WHEN sales_rep = 'Daniel' THEN 'Daniel Kimani'
    WHEN sales_rep = 'Faith' THEN 'Faith Achieng'
    WHEN sales_rep = 'Grace' THEN 'Grace Njeri'
    WHEN sales_rep = 'Samuel' THEN 'Samuel Mutua'
    WHEN sales_rep = 'Mary' THEN 'Mary Wanjiku'
    WHEN sales_rep = 'Peter' THEN 'Peter Kiptoo'
    WHEN sales_rep = 'Kevin' THEN 'Kevin Mwangi'
    WHEN sales_rep = 'Mercy' THEN 'Mercy Atieno'
    WHEN sales_rep = 'Aisha' THEN 'Aisha Mohamed'
    WHEN sales_rep = 'Brian' THEN 'Brian Otieno'

    ELSE sales_rep
END;

--removing double spaces

UPDATE cars
SET sales_rep = REGEXP_REPLACE(sales_rep, '\s+', ' ', 'g');



-- DELETING ALL ORDER_ID VALUES WHICH ARE EITHER NULL OR BLANK

DELETE FROM cars
WHERE order_id IS NULL
   OR TRIM(order_id) = '';

--SET THE PRIMARY KEY
alter table cars
add primary key (order_id);


select* from cars;
select distinct(delivery_status) from cars;
select distinct(fuel_type) from cars;

select distinct(delivery_date) from cars;
