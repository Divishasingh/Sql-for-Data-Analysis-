# Medical Appointment No-Show Analysis - SQL Queries

## Overview
This project contains SQL queries designed to analyze a medical appointment dataset, focusing on patient no-shows. The queries extract insights such as no-show patterns by gender and neighborhood, identify frequent no-show patients, and calculate aggregate statistics related to patient demographics.

## Dataset
- The dataset is a cleaned medical appointment records table named `appointments`.
- Key fields include:
  - `PatientId` — unique patient identifier
  - `AppointmentID` — unique appointment identifier
  - `Age` — patient age
  - `Gender` — patient gender
  - `No_show` — whether the patient missed the appointment (`Yes`/`No`)
  - `Neighbourhood` — neighborhood of appointment
  - `Diabetes` — binary flag (0/1) indicating if patient has diabetes
  - Other patient health and appointment details

## SQL Queries Included

### a. Basic Data Extraction
- Use of `SELECT`, `WHERE`, `ORDER BY`, `GROUP BY`
- Example: Count no-shows by gender ordered by count

### b. Joins
- Examples of `INNER JOIN`, `LEFT JOIN`, and `RIGHT JOIN` (assuming a `patients` table)
- Join appointment data with patient demographic info

### c. Subqueries
- Find patients with more than 3 no-shows

### d. Aggregate Functions
- Use `SUM` and `AVG` to calculate totals and averages
- Example: Average age of patients who missed appointments

### e. Views for Analysis
- Create SQL views for easier access to no-show rates by neighborhood

### f. Index Optimization
- Create indexes on key columns like `PatientId`, `No_show`, and `AppointmentDate` to improve query speed

## Usage Instructions
1. Load the medical appointment dataset into a SQL database (MySQL, PostgreSQL, SQLite).
2. Execute the provided SQL script file to create views and run queries.
3. Use the output to generate reports or further analyze appointment patterns.
4. Optimize performance by applying indexes as demonstrated.



