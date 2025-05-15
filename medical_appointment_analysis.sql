
-- a. SELECT, WHERE, ORDER BY, GROUP BY
SELECT Gender, COUNT(*) AS NoShowCount
FROM appointments
WHERE No_show = 'Yes'
GROUP BY Gender
ORDER BY NoShowCount DESC;


-- b. JOINS (INNER, LEFT, RIGHT)
-- Assume there is another table: patients(PatientID, Name, Age)

-- INNER JOIN: Get appointments and patient names
SELECT a.AppointmentID, p.Name, a.AppointmentDate, a.No_show
FROM appointments a
INNER JOIN patients p ON a.PatientID = p.PatientID;

-- LEFT JOIN: Show all appointments, even if patient data is missing
SELECT a.AppointmentID, p.Name, a.No_show
FROM appointments a
LEFT JOIN patients p ON a.PatientID = p.PatientID;

-- RIGHT JOIN: If supported
SELECT a.AppointmentID, p.Name
FROM appointments a
RIGHT JOIN patients p ON a.PatientID = p.PatientID;


-- c. Subqueries
-- Find patients who had more than 3 no-shows
SELECT PatientID
FROM (
    SELECT PatientID, COUNT(*) AS no_show_count
    FROM appointments
    WHERE No_show = 'Yes'
    GROUP BY PatientID
) AS sub
WHERE no_show_count > 3;


-- d. Aggregate Functions (SUM, AVG)
-- Average age of patients who missed their appointments
SELECT AVG(Age) AS AvgAgeMissed
FROM appointments
WHERE No_show = 'Yes';

-- Total diabetic patients who showed up
SELECT SUM(CASE WHEN Diabetes = 1 AND No_show = 'No' THEN 1 ELSE 0 END) AS DiabeticShows
FROM appointments;


-- e. Create Views for Analysis
CREATE VIEW view_no_show_by_neighborhood AS
SELECT Neighbourhood,
       COUNT(*) AS total_appointments,
       SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) AS total_no_shows,
       ROUND(100.0 * SUM(CASE WHEN No_show = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS no_show_rate
FROM appointments
GROUP BY Neighbourhood;

-- Use the view
SELECT * FROM view_no_show_by_neighborhood
ORDER BY no_show_rate DESC;


-- f. Optimize Queries with Indexes
CREATE INDEX idx_patient_id ON appointments(PatientID);
CREATE INDEX idx_no_show ON appointments(No_show);
CREATE INDEX idx_appointment_date ON appointments(AppointmentDate);
