CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals(
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments(
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors(
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    speciality VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE invoices(
    invoiceid PRIMARY KEY,
    appointid FOREIGN KEY,
    totalamount NUMERIC(10,2),
    paymentdate TIME
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    recorddate DATETIME,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, firstname, lastname, address, phone, email) VALUES
(1, 'Maria', 'Garcia', '123 Oak St', '555-1234', 'maria@example.com'),
(2, 'Jose', 'Santos', '456 Pine Ave', '555-5678', 'jose@example.com'),
(3, 'Carla', 'Lopez', '789 Elm Blvd', '555-9012', 'carla@example.com'),
(4, 'Pedro', 'Mendez', '101 Maple Dr', '555-3456', 'pedro@example.com'),
(5, 'Sofia', 'Reyes', '202 Birch Ln', '555-7890', 'sofia@example.com'),
(6, 'Juan', 'Cruz', '303 Cedar Rd', '555-2345', 'juan@example.com'),
(7, 'Ana', 'Ramos', '404 Willow Ct', '555-6789', 'ana@example.com'),
(8, 'Luis', 'Torres', '505 Poplar Pk', '555-1011', 'luis@example.com'),
(9, 'Elena', 'Perez', '606 Ash Way', '555-1213', 'elena@example.com'),
(10, 'Carlos', 'Gomez', '707 Fir Trl', '555-1415', 'carlos@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Buddy', 'Dog', 'Labrador', '2019-05-12', 'Male', 'Yellow', 1),
(2, 'Bella', 'Dog', 'Beagle', '2020-07-01', 'Female', 'Tricolor', 2),
(3, 'Whiskers', 'Cat', 'Siamese', '2018-08-08', 'Male', 'Cream', 3),
(4, 'Simba', 'Cat', 'Mixed', '2021-03-03', 'Male', 'Orange', 4),
(5, 'Luna', 'Dog', 'Shih Tzu', '2020-12-12', 'Female', 'White', 5),
(6, 'Charlie', 'Dog', 'Poodle', '2017-11-02', 'Male', 'White', 6),
(7, 'Milo', 'Cat', 'Tabby', '2019-09-09', 'Male', 'Brown', 7),
(8, 'Nala', 'Cat', 'Persian', '2022-01-20', 'Female', 'White', 8),
(9, 'Ginger', 'Dog', 'Bulldog', '2016-04-04', 'Female', 'Brindle', 9),
(10, 'Shadow', 'Cat', 'Russian Blue', '2015-06-06', 'Male', 'Gray', 10);
