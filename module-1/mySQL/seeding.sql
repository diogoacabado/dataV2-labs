# Dummy data into Cars table
INSERT INTO Cars(VIN, Manufacturer, Model, Year, Color)
VALUES ('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White'),
('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray')

# Dummy data into Customers table
INSERT INTO Customers(Name, Phone, Address, City, State_Province, Country, Postal)
VALUES ('Pablo Picasso', '+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045),
('Abraham Lincoln', '+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
('Napoléon Bonaparte', '+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008)

# Dummy data into Salespersons table
INSERT INTO Salespersons(Name, Store)
VALUES ('Petey Cruiser', 'Madrid'),
('Anna Sthesia', 'Barcelona'),
('Paul Molive', 'Berlin'),
('Gail Forcewind', 'Paris'),
('Paige Turner', 'Mimia'),
('Bob Frapples', 'Mexico City'),
('Walter Melon', 'Amsterdam'),
('Shonda Leer',	'São Paulo')

# Dummy data into Invoices table
INSERT INTO Invoices(Invoice_Number, Date, Car, Customer, Salesperson)
VALUES ('852399038', '2018-08-22', 0, 1, 3),
('731166526', '2018-12-31', 3, 0, 5),
('271135104', '2019-01-22', 2, 2, 7)