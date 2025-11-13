-- Create a new schema (database)
CREATE DATABASE ClinicDB;
USE ClinicDB;

-- Q3.1: Create Patient table
CREATE TABLE Patient (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(50),
    PatientSurname VARCHAR(50),
    PatientDOB DATE
);

-- Q3.2: Create Doctor table
CREATE TABLE Doctor (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(50),
    DoctorSurname VARCHAR(50)
);

-- Q3.3: Create Appointment table
CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY,
    AppointmentDate DATE,
    AppointmentTime TIME,
    AppointmentDuration INT,
    DoctorID INT,
    PatientID INT,
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID)
);

-- Q3.4: Insert data into Patient table
INSERT INTO Patient (PatientID, PatientName, PatientSurname, PatientDOB)
VALUES
(1, 'Debbie', 'Theart', '1980-03-17'),
(2, 'Thomas', 'Duncan', '1976-08-12');

-- Insert data into Doctor table
INSERT INTO Doctor (DoctorID, DoctorName, DoctorSurname)
VALUES
(1, 'Zintle', 'Nukani'),
(2, 'Ravi', 'Maharaj');

-- Insert data into Appointment table
INSERT INTO Appointment (AppointmentID, AppointmentDate, AppointmentTime, AppointmentDuration, DoctorID, PatientID)
VALUES
(1, '2025-01-15', '09:00:00', 15, 2, 1),
(2, '2025-01-18', '15:00:00', 30, 2, 2),
(3, '2025-01-20', '10:00:00', 15, 1, 1),
(4, '2025-01-21', '11:00:00', 15, 2, 1);

-- Q3.5: Display all appointments between 2025-01-16 and 2025-01-20 (inclusive)
SELECT * 
FROM Appointment
WHERE AppointmentDate BETWEEN '2025-01-16' AND '2025-01-20';

-- Q3.6: Display names and surnames of patients with total number of appointments, sorted descending by count
SELECT 
    P.PatientName,
    P.PatientSurname,
    COUNT(A.AppointmentID) AS TotalAppointments
FROM Patient P
JOIN Appointment A ON P.PatientID = A.PatientID
GROUP BY P.PatientID, P.PatientName, P.PatientSurname
ORDER BY TotalAppointments DESC;

-- Q3.7: Create a view listing all patients with appointments with doctor ID 2, sorted by surname
CREATE VIEW Doctor2Patients AS
SELECT 
    P.PatientName,
    P.PatientSurname
FROM Patient P
JOIN Appointment A ON P.PatientID = A.PatientID
WHERE A.DoctorID = 2
ORDER BY P.PatientSurname ASC;


