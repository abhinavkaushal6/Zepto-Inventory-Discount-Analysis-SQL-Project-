# 🛒 Zepto Inventory & Discount Analysis | SQL Project

## 📌 Project Summary
Designed and executed an end-to-end SQL analysis on a retail inventory dataset containing 3,733 products to uncover insights related to pricing strategy, discount patterns, and inventory distribution.

This project demonstrates strong SQL fundamentals, real-world data cleaning, and business-driven analytical thinking using MySQL.

---

## 📊 Dataset Overview

The dataset contains **3,733 product records** across multiple retail categories.

### Key Columns

- `sku_id` – Unique product identifier  
- `category` – Product category  
- `name` – Product name  
- `mrp` – Maximum Retail Price  
- `discountPercent` – Discount percentage offered  
- `availableQuantity` – Units available in inventory  
- `discountedSellingPrice` – Final selling price  
- `weightInGms` – Product weight (grams)  
- `outOfStock` – Stock indicator (0 = In Stock, 1 = Out of Stock)  
- `quantity` – Units per package  

---

## 🛠 Tech Stack

- MySQL  
- MySQL Workbench  
- SQL (GROUP BY, Aggregations, Filtering, Sorting, CASE)  
- Excel (Data validation & preprocessing)  

---

## 🔄 Data Preparation & Cleaning

Performed several real-world data cleaning steps before analysis:

- Converted boolean values (TRUE/FALSE → 1/0) for MySQL compatibility  
- Removed special characters (₹, %, commas) from numeric fields  
- Fixed datatype mismatches during import  
- Resolved NULL value issues  
- Debugged `ONLY_FULL_GROUP_BY` errors  
- Validated row count discrepancies after ETL process  

---

## 📈 Sample Analytical Query

```sql
SELECT category,
       SUM(weightInGms * availableQuantity) AS Total_Inventory_Weight
FROM zepto
GROUP BY category
ORDER BY Total_Inventory_Weight DESC;
```

---

## 💡 Key Insights

### 🔹 Discount Strategy
Certain product categories consistently offer higher average discounts, indicating aggressive pricing strategies to drive sales volume.

### 🔹 Inventory Weight Distribution
A small number of categories contribute disproportionately to total inventory weight, impacting warehouse storage and logistics planning.

### 🔹 Stock Availability Trends
Some categories show higher out-of-stock frequency, highlighting potential demand-supply imbalances.

### 🔹 Pricing Behavior
Higher MRP products generally carry larger discount margins, suggesting strategic markdown pricing on premium items.

---

## 🎯 Skills Demonstrated

- Advanced SQL Aggregations  
- Business-Oriented Data Analysis  
- Inventory & Pricing Analytics  
- Data Cleaning & ETL Debugging  
- Handling Strict SQL Modes (`ONLY_FULL_GROUP_BY`)  
- Translating Business Questions into Query Logic  

---

## 🚀 Conclusion

This project simulates a real-world retail analytics scenario and showcases the ability to clean, structure, and analyze structured datasets to generate meaningful business insights using SQL.
