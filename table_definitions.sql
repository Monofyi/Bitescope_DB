
CREATE TABLE IF NOT EXISTS Consumers (
Consumer_ID text PRIMARY KEY,
First_Name text,
Last_Name text,
Phone_Number integer,
Email text,
Country text);

CREATE TABLE IF NOT EXISTS Retailers (
Retailer_ID text PRIMARY KEY,
First_Name text,
Last_Name text,
Shop_Name text,
Email text,
Phone_Number integer,
PinCode integer,
City text,
State text,
Country text);

CREATE TABLE IF NOT EXISTS Manufacturers (
Manufacturer_ID text PRIMARY KEY,
Name text);


CREATE TABLE IF NOT EXISTS Products (
Product_ID text PRIMARY KEY,
Manufacturer_ID text REFERENCES Manufacturers(Manufacturer_ID),
Name text,
Price text,
Manufactured_Date text,
Expired_Date text,
Manufactured_Location text,
Production_BatchNo text,
Veg boolean);


CREATE TABLE IF NOT EXISTS Distributors (
Distributor_ID text PRIMARY KEY,
Agency_Name text,
PinCode integer,
Phone_Number integer,
Email text,
City text,
State text,
Country text);


CREATE TABLE IF NOT EXISTS Shipments (
Shipment_ID text PRIMARY KEY,
Product_ID text REFERENCES Products(Product_ID),
Distributor_ID text REFERENCES Distributors(Distributor_ID),
Timestamp timestamptz DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE IF NOT EXISTS ManufacturerExports (
Export_ID text PRIMARY KEY,
Product_ID text REFERENCES Products(Product_ID),
Distributor_ID text REFERENCES Distributors(Distributor_ID),
Depatured timestamptz,
Arrived timestamptz);

CREATE TABLE IF NOT EXISTS Orders (
Order_ID text PRIMARY KEY,
Product_ID text REFERENCES Products(Product_ID),
Retailer_ID text REFERENCES Retailers(Retailer_ID),
Consumer_ID text REFERENCES Consumers(Consumer_ID),
Quantity integer,
Total_Price money,
Timestamp timestamptz DEFAULT CURRENT_TIMESTAMP
);
