create database loanproject;
use loanproject;

-- 1.Count the number of loans approved and rejected
SELECT loan_status, COUNT(*) AS Count 
FROM loan_data 
GROUP BY loan_status;

-- 2.Find the average income of individuals grouped by gender.
SELECT person_gender, AVG(person_income) AS AvgIncome 
FROM loan_data
GROUP BY person_gender;

-- 3.Retrieve the age range (minimum and maximum age) of individuals.
SELECT MIN(person_age) AS MinAge, MAX(person_age) AS MaxAge 
FROM loan_data;

-- 4.Count the number of loans with an interest rate above 15%.
SELECT COUNT(*) AS HighInterestLoans 
FROM loan_data 
WHERE loan_int_rate > 15;

-- 5.Calculate the total loan amount approved for individuals owning a home.
SELECT SUM(loan_amnt) AS TotalLoanAmount 
FROM loan_data 
WHERE person_home_ownership = 'OWN' AND loan_status = 1;

-- 6.Calculate the average age of individuals grouped by education level.
SELECT person_education, AVG(person_age) AS AvgAge 
FROM loan_data 
GROUP BY person_education;

-- 7.Identify the top 5 largest loan amounts requested.
SELECT * 
FROM loan_data 
ORDER BY loan_amnt DESC 
LIMIT 5;

-- 8.Identify the proportion of individuals in each education level.
SELECT person_education, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data) AS Percentage 
FROM loan_data 
GROUP BY person_education;

-- 9.Find the maximum interest rate for rejected loans.
SELECT MAX(loan_int_rate) AS MaxInterestRate 
FROM loan_data 
WHERE loan_status = 0;

-- 10.Calculate the average interest rate for approved loans.
SELECT AVG(loan_int_rate) AS AvgInterestRate 
FROM loan_data 
WHERE loan_status = 1;

-- 11.Find the loan purpose (intent) with the highest average interest rate.
SELECT loan_intent, AVG(loan_int_rate) AS AvgInterestRate 
FROM loan_data 
GROUP BY loan_intent 
ORDER BY AvgInterestRate DESC 
LIMIT 1;

-- 12.Identify individuals whose loan-to-income ratio exceeds 50% and were approved for loans.
SELECT * 
FROM loan_data 
WHERE loan_percent_income > 50 AND loan_status = 1;

-- 13.Calculate the proportion of loans based on gender
SELECT person_gender, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data) AS GenderPercentage 
FROM loan_data 
GROUP BY person_gender;

-- 14.Find the youngest and oldest individuals for each loan intent category.
SELECT loan_intent, MIN(person_age) AS YoungestAge, MAX(person_age) AS OldestAge 
FROM loan_data 
GROUP BY loan_intent;

-- 15.Retrieve the average loan amount for individuals grouped by credit history length.
SELECT FLOOR(cb_person_cred_hist_length) AS CreditHistLength, AVG(loan_amnt) AS AvgLoanAmount 
FROM loan_data 
GROUP BY CreditHistLength;

-- 16.Find the average credit score for individuals grouped by loan approval status.
SELECT loan_status, AVG(credit_score) AS AvgCreditScore 
FROM loan_data 
GROUP BY loan_status;

-- 17.Calculate the proportion of individuals with previous loan defaults.
SELECT previous_loan_defaults_on_file, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM loan_data) AS Proportion 
FROM loan_data 
GROUP BY previous_loan_defaults_on_file;

-- 18.Find individuals with a credit score below 600 and no previous loan defaults.
SELECT * 
FROM loan_data 
WHERE credit_score < 600 AND previous_loan_defaults_on_file = 'No';

-- 19.Identify individuals with a credit history length less than 2 years who were approved for loans.
SELECT * 
FROM loan_data 
WHERE cb_person_cred_hist_length < 2 AND loan_status = 1;

-- 20.Find the education level with the lowest average loan-to-income ratio.
SELECT person_education, AVG(loan_percent_income) AS AvgLoanToIncomeRatio 
FROM loan_data 
GROUP BY person_education 
ORDER BY AvgLoanToIncomeRatio ASC 
LIMIT 1;
