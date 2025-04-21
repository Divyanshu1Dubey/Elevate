# 🧹 Data Cleaning and Preprocessing – Task 1  
### 🔍 Data Analyst Internship Project

---

## 📁 Dataset Overview

This project involved cleaning and preprocessing a real-world dataset consisting of:

- ✅ **300,000+ rows**
- ✅ **25 columns**
- ✅ Real-world attributes like `Accident_Index`, `Hour`, `Road_Surface_Conditions`, and more.

---

## 🎯 Objective

To clean a large, raw dataset by identifying and resolving data quality issues such as:
- Missing values
- Duplicates
- Inconsistent formats
- Incorrect data types

Tools used include **Python (Colab)**, **Microsoft Excel**, and **Power BI**.

---

## 🛠 Tools & Technologies Used

- 🐍 **Python (Pandas in Google Colab)**
- 📊 **Microsoft Excel**
- 📈 **Power BI**

---

## 🧼 Cleaning Process Summary

### 1. 🔎 Handling Missing Values
- Used `.isnull().sum()` to identify nulls.
- `Hour` column had over 3L nulls → dropped due to irrelevance.
- `Road_Surface_Conditions` → filled with mode or "Unknown".

### 2. 📌 Removing Duplicates
- Removed using `drop_duplicates()` in Python.
- Verified using Excel’s “Remove Duplicates”.

### 3. 🧽 Standardizing Formats
- Column names changed to lowercase with underscores (e.g., `Accident_Index → accident_index`).
- Text fields like `gender`, `country` standardized.

### 4. 🕒 Date/Time Formatting
- Converted dates to consistent format using `pd.to_datetime()`.

### 5. 📐 Data Type Fixes
- Ensured correct types: `age` as integer, `date` as datetime, etc.

---

## 📤 Outputs

- ✅ Cleaned dataset ready for analysis and visualization.
- ✅ Verified in Power BI for structure and nulls.
- 📁 **Files included in this repo:**
  - `raw_dataset.xlsx`
  - `cleaned_dataset.xlsx`
  - `cleaning_script.ipynb`
  - `README.md`

---

## 🔗 Google Colab Notebook

[👉 Click here to view the Colab notebook](https://colab.research.google.com/drive/1xwx2kB_XWNa8QjNlKaJjhy5SHHItXLWv?usp=sharing)


---

## 📚 Learnings

- Proficient use of `.dropna()`, `.fillna()`, `.drop_duplicates()`, and `pd.to_datetime()`.
- Hands-on experience in multi-tool data wrangling.
- Learned to handle large datasets efficiently.

---

## ✅ Submission

**Task Name:** Task 1 – Data Cleaning  
**Submitted for:** Data Analyst Internship  
**Date of Completion:** *[21st april]*  
**Submission Link:** [https://forms.gle/o2uMAByM719GzebC7](https://forms.gle/o2uMAByM719GzebC7)

---
