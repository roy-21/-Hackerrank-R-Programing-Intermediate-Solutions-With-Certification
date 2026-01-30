# Hackerrank R-Programing Intermediate Solutions With Certification

##  Overview
This repository contains solutions to **HackerRank R Programming (Intermediate)** level challenges completed as part of certification preparation. The tasks are based on real-world styled datasets and focus on **data cleaning, aggregation, metric building, and business insight extraction** using R and `dplyr`.

The repository currently includes two major analytical tasks:

- **Task-1:** Mortgage Market Competitive Index  
- **Task-2:** Top Two Emirates Revenue Potential Forecast

These solutions demonstrate practical, interview-ready R data analysis workflows.

---

##  Task-1 — Mortgage Competitive Index

###  Objective
Measure mortgage market competitiveness across countries and years using approved loan distributions among banks.

###  Method Summary
- Filter only approved mortgage applications
- Aggregate total approved loan amount per bank per year
- Compute country–year total approved amount
- Calculate each bank’s market share
- Square market shares and sum them (HHI-style index)
- Round and sort results

###  Output
A country-year level **Competitive Index** showing how concentrated or competitive each mortgage market is.

---

##  Task-2 — Top Two Emirates Revenue Potential

###  Objective
Analyze cosmetic sales data for 2017 and identify the **top two Emirates with highest projected revenue for 2018** after cleaning inconsistent records.

###  Data Cleaning Steps
- Correct mixed date formats (`dd-mm-yyyy` vs `mm-dd-yyyy`)
- Fix year typos (2027/2037/2047 → 2017)
- Clean corrupted amount values (`#153`, `1%58`, `1,79` → numeric)

###  Analysis Steps
- Find each customer’s first purchase date
- Compute total customer revenue
- Calculate days active until 31-12-2017
- Convert to months and compute **ARPM (Average Revenue Per Month)**
- Estimate 2018 revenue per customer (ARPM × 12)
- Sum estimated revenue per Emirate
- Select top two Emirates
- Apply 10% industry growth
- Round final values

###  Output
A dataframe listing the **top two Emirates** with projected and growth-adjusted revenue.

---

##  Tech Stack
- R
- dplyr
- Base R data processing

---

##  Skills Demonstrated
- Real-world data cleaning
- Handling inconsistent formats
- Grouped aggregation
- Derived metric construction
- Forecast-based estimation
- Business-oriented data analysis in R
