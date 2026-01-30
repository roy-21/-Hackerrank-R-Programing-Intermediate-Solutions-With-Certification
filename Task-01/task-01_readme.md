# Mortgage Competitive Index (R)

##  Problem Overview
This task calculates a **Mortgage Competitive Index** for each country and year based on approved mortgage loan applications.

The Competitive Index measures how competitive the mortgage market is within a country for a given year.  
It is calculated using the **sum of squared market shares** of each bank.

---

##  Input Data
The input dataset is a CSV file with the following columns:

| Column Name     | Description |
|-----------------|-------------|
| Year            | Year of loan application |
| Country         | Country of the bank |
| Inst_id         | Bank / Institution ID |
| Loan_amount     | Amount of loan applied |
| Action_taken   | Loan approval status (1 = Approved, 0 = Rejected) |

---

##  Processing Steps
The Competitive Index is calculated using these steps:

1. **Filter approved loans only** (`Action_taken = 1`)
2. **Aggregate loan amount per bank** (`Loan_amt_bank`) for each `Year` and `Country`
3. **Calculate total loan amount per country** (`Loan_amt_country`) for each year
4. **Compute squared market share** for each bank:  
   \[
   (Loan\_amt\_bank / Loan\_amt\_country)^2
   \]
5. **Sum squared market shares** to obtain the Competitive Index
6. **Sort output** by `Year` (ascending) and `Country` (alphabetical)
7. **Round Competitive Index** to 3 decimal places

---

##  Output
The final output contains:

| Column Name | Description |
|------------|-------------|
| Year       | Year |
| Country    | Country |
| Competitive_index | Market competitiveness measure |

---

##  Dependencies
- `dplyr`

---

##  How to Run
The program:
- Reads input from standard input (`stdin`)
- Processes data using `calculate_competitive_index()`
- Writes output as a CSV file




