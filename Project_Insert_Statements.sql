--Insert data into CARDINAL_CUSTOMERS table
INSERT INTO cardinal_customers VALUES
(cardinal_customers_seq.NEXTVAL,'CVS Health','CVS Drive','Woonsocket','RI','02895','678789456','7709626117','123456','cvs.com',2.5);

INSERT INTO cardinal_customers VALUES
(cardinal_customers_seq.NEXTVAL,'Kroger','1014 Vine Street','Cincinnati','OH','45202','678123456','678456897','123789','kroger.com',1.5);

INSERT INTO cardinal_customers VALUES
(cardinal_customers_seq.NEXTVAL,'Walgreens','200 Wilmot Road','Deerfield','IL','60015','770459789','678888999','258789','walgreens.com',2.5);

INSERT INTO cardinal_customers VALUES
(cardinal_customers_seq.NEXTVAL,'Publix','3300 Publix Pkwy','Lakeland','FL','33811','770555317','678887223','012345','publix.com',1.5);

INSERT INTO cardinal_customers VALUES
(cardinal_customers_seq.NEXTVAL,'Costco','999 Lake Dr','Issaquah','WA','98027','223564789','789456123','002369','costco.com',1.5);

--Insert data into CARDINAL_MANUFACTURERS table
INSERT INTO cardinal_manufacturers VALUES
('M01','Pfizer','235 East 42nd St','New York','NY','10017','2125693333','2127332323','525866','pfizer.com','D');

INSERT INTO cardinal_manufacturers VALUES
('M02','Mylan','1000 Mylan Blvd','Canonburg','PA','15317','7245141800','724555666','014789','mylan.com','D');

INSERT INTO cardinal_manufacturers VALUES
('M03','DHG Pharma','288 Nguyen Van Cu','Can Tho','VN','97000','0292895209','0292891433','288970','dhgpharma.com','I');

INSERT INTO cardinal_manufacturers VALUES
('M04','Teva','25 Petah Tikva','Tel Aviv','Israel','45925','555897456','555784512','234458','teva.com','I');

INSERT INTO cardinal_manufacturers VALUES
('M05','Gilead','333 Lakeside Dr','Foster City','CA','94404','6505743000','6505789264','778963','gilead.com','D');

INSERT INTO cardinal_manufacturers VALUES
('M06','GSK','980 Great West Road','Middlesex','UK','27557','440564789','4402080475','996785','gsk.com','I');

INSERT INTO cardinal_manufacturers VALUES
('M07','Novartis','555 North Dr','Basel','SUI','40058','0234561254','023888579','125786','novartis.com','I');

--Insert data into CARDINAL_EMPLOYEES table
INSERT INTO cardinal_employees VALUES
('E01','Steven','King','sking@cardinal.com','5151234567','17-JUN-97',24000,'President',null);

INSERT INTO cardinal_employees VALUES
('E02','Neena','Kochhar','nkochhar@cardinal.com','5151234568','21-SEP-99',17000,'Vice President','E01');

INSERT INTO cardinal_employees VALUES
('E03','Alexander','Hunold','ahunold@cardinal.com','5151234569','03-JAN-05',10000,'IT Manager','E02');

INSERT INTO cardinal_employees VALUES
('E04','Khang','Ho','kho1@cardinal.com','6782676578','15-DEC-10',9000,'IT Supervisor','E03');

INSERT INTO cardinal_employees VALUES
('E05','John','Chen','jchen@cardinal.com','5904235567','01-JUL-16',5000,'IT Programmer','E04');

INSERT INTO cardinal_employees VALUES
('E06','Arpit','Patel','apatel@cardinal.com','5904237567','30-JUL-16',5000,'IT Programmer','E04');

INSERT INTO cardinal_employees VALUES
('E07','Daniel','Faviet','dfaviet@cardinal.com','5151244169','16-AUG-06',10000,'Finance Manager','E02');

INSERT INTO cardinal_employees VALUES
('E08','Nancy','Greenberg','ngreenberg@cardinal.com','5151244569','05-JUL-10',8200,'Finance Supervisor','E07');

INSERT INTO cardinal_employees VALUES
('E09','Tri','Tran','ttran@cardinal.com','0939498966','11-OCT-10',8000,'Finance Supervisor','E07');

INSERT INTO cardinal_employees VALUES
('E10','Valli','Pataballa','vpata@cardinal.com','5904235567','11-OCT-15',4000,'Finance Accountant','E08');

INSERT INTO cardinal_employees VALUES
('E11','Andy','Nguyen','anguyen@cardinal.com','5904234568','11-OCT-15',4000,'Finance Accountant','E09');

--Insert data into CARDINAL_MEDICATION table
INSERT INTO cardinal_medication VALUES
('61958-2301-1','Vemlidy 25 mg','M05','Canada','bottle');

INSERT INTO cardinal_medication VALUES
('58799-5689-1','Atorvastatin 10 mg','M02','India','bottle');

INSERT INTO cardinal_medication VALUES
('58799-5689-2','Atorvastatin 20 mg','M02','India','bottle');

INSERT INTO cardinal_medication VALUES
('58799-5689-4','Atorvastatin 40 mg','M02','India','bottle');

INSERT INTO cardinal_medication VALUES
('58799-5689-8','Atorvastatin 80 mg','M02','India','bottle');

INSERT INTO cardinal_medication VALUES
('00069-4200-2','Viagra 25 mg','M01','Ireland','bottle');

INSERT INTO cardinal_medication VALUES
('00069-4200-5','Viagra 50 mg','M01','Ireland','bottle');

INSERT INTO cardinal_medication VALUES
('00069-4210-0','Viagra 100 mg','M01','Ireland','bottle');

INSERT INTO cardinal_medication VALUES
('62211-0010-5','Acetaminophen 500 mg','M03','Vietnam','bottle');

INSERT INTO cardinal_medication VALUES
('50090-0162-1','Triamcinolone Cream 0.025%','M04','China','tube');

INSERT INTO cardinal_medication VALUES
('50090-0162-2','Triamcinolone Cream 0.1%','M04','China','tube');

INSERT INTO cardinal_medication VALUES
('50090-0162-3','Triamcinolone Cream 0.5%','M04','China','tube');

INSERT INTO cardinal_medication VALUES
('50090-0163-1','Triamcinolone Ointment 0.025%','M04','Thailand','tube');

INSERT INTO cardinal_medication VALUES
('50090-0163-2','Triamcinolone Ointment 0.1%','M04','Thailand','tube');

INSERT INTO cardinal_medication VALUES
('50090-0163-3','Triamcinolone Ointment 0.5%','M04','Thailand','tube');

INSERT INTO cardinal_medication VALUES
('50090-1663-1','Humalog KwikPen U-100','M06','USA','pen');

INSERT INTO cardinal_medication VALUES
('50090-1663-2','Humalog KwikPen U-200','M06','USA','pen');

INSERT INTO cardinal_medication VALUES
('0002-7510-01','Humalog Vial U-100','M06','USA','vial');

INSERT INTO cardinal_medication VALUES
('0002-7510-02','Humalog Vial U-200','M06','USA','vial');

INSERT INTO cardinal_medication VALUES
('0169-4060-12','Victoza 1.2 mg','M06','USA','pen');

INSERT INTO cardinal_medication VALUES
('0169-4060-18','Victoza 1.8 mg','M06','USA','pen');


--Insert data into CARDINAL_ORDERS table
INSERT INTO cardinal_orders VALUES
(1,'0169-4060-12',25,10000.00,'01-JAN-19',null,'06-JAN-21','N',null);

INSERT INTO cardinal_orders VALUES
(1,'0169-4060-18',25,14000.00,'01-JAN-19',null,'06-JAN-21','N',null);

INSERT INTO cardinal_orders VALUES
(2,'61958-2301-1',2,2000.00,'15-FEB-19','25-FEB-19','04-DEC-20','Y',null);

INSERT INTO cardinal_orders VALUES
(2,'58799-5689-1',30,7500.25,'15-FEB-19','23-FEB-19','30-MAY-20','Y',null);

INSERT INTO cardinal_orders VALUES
(3,'00069-4200-2',10,850.26,'14-APR-19',null,'02-APR-20','N',null);

INSERT INTO cardinal_orders VALUES
(3,'00069-4200-5',5,525.25,'14-APR-19',null,'28-MAR-20','N',null);

COMMIT;
