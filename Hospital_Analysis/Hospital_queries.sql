CREATE TABLE aspatal(
				Hospital_Name VARCHAR(50),
			    Locations VARCHAR(40),
				Department VARCHAR(40),
				Doctors_Count INT,
				Patients_Count INT,
				Admission_Date DATE,
				Discharge_Date DATE,
				Medical_Expenses NUMERIC(10,2));

-- IMPORTED DATA USING IMPORT/EXPORT
SELECT * FROM aspatal;

 -- 1. Write an SQL query to find the total number of patients across all hospitals.

 SELECT SUM(Patients_count) AS Total_Patients
 FROM aspatal;

-- 2. Retrieve the average count of doctors available in each hospital.

SELECT hospital_name,
	   AVG(doctors_count) AS AVG_DOC
FROM aspatal
GROUP BY hospital_name;

-- 3. Find the top 3 hospital departments that have the highest number of patients.

SELECT department,
     SUM(patients_count) AS number_of_pat
FROM aspatal 
GROUP BY department
ORDER BY number_of_pat DESC LIMIT 3;


-- 4. Identify the hospital that recorded the highest medical expenses.

SELECT hospital_name,locations,
	   MAX(Medical_Expenses) AS highest_medical_expenses
FROM aspatal
GROUP BY hospital_name,locations
ORDER BY  highest_medical_expenses DESC LIMIT 1;


-- 5.Calculate the average medical expenses per day for each hospital.

SELECT hospital_name,locations,
       SUM(Medical_Expenses) AS total_expenses,
	   SUM(discharge_date - admission_date + 1) AS Total_Days,
	  SUM(Medical_Expenses) / SUM(discharge_date - admission_date + 1) AS AVG_EXP_PER_DAY
FROM aspatal
GROUP BY Hospital_name,locations
ORDER BY AVG_EXP_PER_DAY DESC;


-- 6. Find the patient with longest stay by calculating difference between Discharge Date and Admission Date.

SELECT hospital_name,locations,department,
       (discharge_date - admission_date + 1) AS Stay_Days
FROM aspatal
ORDER BY Stay_Days DESC LIMIT 1;


-- 7) Count the total number of patients treated in each city.

SELECT locations,
	   SUM(patients_count) AS NO_OF_PAT
FROM aspatal 
GROUP BY locations
ORDER BY NO_OF_PAT DESC;


-- 8) Calculate the average number of days patients spend in each department.

SELECT department,
       AVG(discharge_date - admission_date + 1) AS AVG_DAYS
FROM aspatal
GROUP BY department
ORDER BY AVG_DAYS DESC;


-- 9) Find the department with the least number of patients.

SELECT department,
       SUM(Patients_Count) AS least_Num
FROM aspatal
GROUP BY department
ORDER BY least_Num ASC LIMIT 1;


-- 10) Group the data by month and calculate the total medical expenses for each month.

SELECT 
       DATE_TRUNC('month',admission_date) AS months,
	   SUM(medical_expenses) AS total_expenses
FROM aspatal
GROUP BY months
ORDER BY months;
	   
