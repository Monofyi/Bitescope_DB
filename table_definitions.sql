CREATE TABLE IF NOT EXISTS Consumers
(
    Consumer_ID  varchar PRIMARY KEY,
    User_Id      int REFERENCES user_management (user_id),
    First_Name   varchar,
    Last_Name    varchar,
    Phone_Number integer,
    Email        varchar,
    Country      varchar
);

CREATE TABLE IF NOT EXISTS Retailers
(
    Retailer_ID  varchar PRIMARY KEY,
    User_Id      int REFERENCES user_management (user_id),
    First_Name   varchar,
    Last_Name    varchar,
    Shop_Name    varchar,
    Email        varchar,
    Phone_Number integer,
    PinCode      integer,
    City         varchar,
    State        varchar,
    Country      varchar
);

CREATE TABLE IF NOT EXISTS Manufacturers
(
    Manufacturer_ID varchar PRIMARY KEY,
    Name            varchar
);


CREATE TABLE IF NOT EXISTS Products
(
    Product_ID            varchar PRIMARY KEY,
    Manufacturer_ID       varchar REFERENCES Manufacturers (Manufacturer_ID),
    Name                  varchar,
    Price                 varchar,
    Manufactured_Date     varchar,
    Expired_Date          varchar,
    Manufactured_Location varchar,
    Production_BatchNo    varchar,
    Type                   varchar
);


CREATE TABLE IF NOT EXISTS Distributors
(
    Distributor_ID varchar PRIMARY KEY,
    User_Id        int REFERENCES user_management (user_id),
    Agency_Name    varchar,
    PinCode        integer,
    Phone_Number   integer,
    Email          varchar,
    City           varchar,
    State          varchar,
    Country        varchar
);


CREATE TABLE IF NOT EXISTS Shipments
(
    Shipment_ID    varchar PRIMARY KEY,
    Product_ID     varchar REFERENCES Products (Product_ID),
    Distributor_ID varchar REFERENCES Distributors (Distributor_ID),
    Timestamp      timestamptz DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS ManufacturerExports
(
    Export_ID      varchar PRIMARY KEY,
    Product_ID     varchar REFERENCES Products (Product_ID),
    Distributor_ID varchar REFERENCES Distributors (Distributor_ID),
    Depatured      timestamptz,
    Arrived        timestamptz
);

CREATE TABLE IF NOT EXISTS Orders
(
    User_Id     int REFERENCES user_management (user_id),
    Order_ID    varchar PRIMARY KEY,
    Product_ID  varchar REFERENCES Products (Product_ID),
    Retailer_ID varchar REFERENCES Retailers (Retailer_ID),
    Consumer_ID varchar REFERENCES Consumers (Consumer_ID),
    Quantity int,
    Total_Price money,
    Timestamp   timestamptz DEFAULT CURRENT_TIMESTAMP
);

