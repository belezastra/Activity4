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

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES
(1, 1, '2023-01-05', 'Vaccination'),
(2, 2, '2023-01-10', 'Routine Checkup'),
(3, 3, '2023-02-02', 'Sprained leg'),
(4, 4, '2023-02-15', 'Dental cleaning'),
(5, 5, '2023-03-10', 'Skin infection'),
(6, 6, '2023-03-10', 'Flea infestation'),
(7, 7, '2023-04-12', 'Vaccination'),
(8, 1, '2023-04-18', 'Spaying'),
(9, 9, '2023-05-02', 'Allergic reaction'),
(10, 10, '2023-05-20', 'Conjunctivitis');

INSERT INTO doctors(doctorid, dfirstname, dlastname, speciality, phone, email)
VALUES
(1, 'Dr.Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Dr.Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Dr.Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Dr.Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@xample.com'),
(5, 'Dr.Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Dr.Carmen', 'Fernandez', 'Opthalmology Specialist', '333-222-1111', 'carmen@example.com');

INSERT INTO invoices(invoiceid, appointid, totalamount, paymentdate)
VALUES
(1, 1, 50.00, '09:30:00'),
(2, 2, 75.00, '14:15:00'),
(3, 3, 100.00, '11:00:00'),
(4, 4, 200.00, '13:45:00'),
(5, 5, 80.00, '10:30:00'),
(6, 6, 30.00, '15:00:00'),
(7, 7, 75.00, '09:15:00'),
(8, 8, 150.00, '16:30:00'),
(9, 9, 60.00, '14:45:00'),
(10, 10, 40.00, '11:30:00');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

ALTER TABLE owners
ADD COLUMN registereddate DATE;

ALTER TABLE invoices
RENAME COLUMN paymentdate TO paymenttime;

DELETE FROM appointments
WHERE animalid = (SELECT animalid FROM animals WHERE name = 'Simba')
  AND appointid = 8;

