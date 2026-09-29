
-- Create the database
CREATE DATABASE hospital_db;

-- Select and use the database
USE hospital_db;

-- 1. Create Patients Table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Doctors Table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15),
    email VARCHAR(100) UNIQUE
);

-- 3. Create Appointments Table
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    reason TEXT,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Sample Data Insertion
INSERT INTO doctors (first_name, last_name, specialization, phone_number, email)
VALUES 
('Sarah', 'Connor', 'Cardiology', '+254700111222', 's.connor@hospital.com'),
('James', 'Wilson', 'Pediatrics', '+254700333444', 'j.wilson@hospital.com');

INSERT INTO patients (first_name, last_name, date_of_birth, gender, phone_number, email)
VALUES 
('John', 'Doe', '1990-05-15', 'Male', '+254711000111', 'john.doe@example.com'),
('Jane', 'Smith', '1985-11-20', 'Female', '+254722000222', 'jane.smith@example.com');

INSERT INTO appointments (patient_id, doctor_id, appointment_date, status, reason)
VALUES 
(1, 1, '2026-10-05 09:00:00', 'Scheduled', 'Routine heart checkup'),
(2, 2, '2026-10-06 11:30:00', 'Scheduled', 'Child vaccination consultation');
