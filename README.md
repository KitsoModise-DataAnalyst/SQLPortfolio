# E-Commerce Sales Analysis Using SQL

## Project Overview

This project analyses e-commerce sales data using SQL to answer business questions about sales performance, revenue, product performance, order status, and monthly sales trends.

The goal is to demonstrate practical SQL skills by transforming sales data into useful insights that can support business decision-making.

## Dataset

- **Source:** [E-Commerce Sales Data Analysis and EDA — Kaggle](https://www.kaggle.com/datasets/erfan4524/e-commerce-sales-data-analysis-and-eda)
- **Domain:** E-commerce and retail analytics
- **Tools:** SQL, MySQL, and GitHub

The analysis uses order, product, and payment information to investigate sales performance. Where applicable, the analysis focuses on completed orders with paid payments.

## SQL Analysis

The project is organised into two levels, progressing from foundational sales analysis to product performance and sales trends.

### Level 1 — Basic Analysis and Data Quality

This level focuses on understanding the dataset, calculating core sales metrics, and identifying potential data quality issues.

Business questions include:

1. What is the total number of orders?
2. What is the total quantity of products sold?
3. What is the total revenue generated?
4. What is the average order value (AOV)?
5. What percentage of orders fall into each order status?
6. Are there data quality issues, such as missing values, duplicate records, or invalid quantities and prices?

**[View Level 1 SQL Queries](sql/level-1-basic-analysis.sql)**

### Level 2 — Product Performance and Sales Trends

This level explores product and category performance, revenue contribution, and changes in sales over time.

Business questions include:

1. Which product category generates the highest revenue?
2. Which category sells the highest number of units?
3. What are the top 10 products by revenue?
4. Which products have high sales volumes but relatively low revenue per unit?
5. Which products have the highest average selling prices after discounts?
6. Which months have the highest and lowest revenue?
7. How does revenue change from month to month?
8. What percentage of total revenue does each category contribute?

**[View Level 2 SQL Queries](sql/level-2-product-performance.sql)**

## SQL Skills Demonstrated

- Filtering data with `WHERE`
- Aggregating data with `COUNT()`, `SUM()`, and `AVG()`
- Joining related tables using `JOIN`
- Grouping and sorting results with `GROUP BY` and `ORDER BY`
- Conditional logic using 'CASE WHEN'
- Calculating revenue after discounts
- Calculating percentages and average order value
- Identifying potential data quality issues
- Analysing monthly sales trends using date functions

## Revenue Calculation

Revenue is calculated using product quantity, unit price, and discount:

`Revenue = Quantity × Unit Price × (1 − Discount)`

This calculation assumes discounts are stored as decimal values. For example, a discount of `0.10` represents 10%.

Where applicable, completed orders and paid payments are used to focus the analysis on realised sales. Joins are also considered carefully to avoid duplicating order line items and overstating revenue.

## Key Findings

*This section will be updated after the SQL queries have been validated and the results reviewed.*

The final findings will highlight:

- The strongest-performing product categories
- The leading products by revenue
- Monthly sales patterns and revenue changes
- Potential data quality issues
- Business opportunities identified through the analysis

## Repository Structure

```text
SQLPortfolio/
├── README.md
└── sql/
    ├── level-1-basic-analysis.sql
    └── level-2-product-performance.sql
```

## Project Status

- [x] Defined Level 1 and Level 2 business questions
- [x] Developed SQL queries for the analysis
- [x] Uploaded SQL files to GitHub
- [ ] Validate queries and calculations
- [ ] Document verified findings and business recommendations
- [ ] Extend the analysis to profitability and discount performance

## Future Improvements

- Analyse profit margins when reliable product cost data is available.
- Investigate the relationship between discounts and sales performance.
- Create visualisations to communicate key findings.
- Develop business recommendations based on validated results.

## Author

This project is part of my data analytics portfolio, demonstrating my ability to use SQL to explore datasets, answer business questions, and communicate findings in a structured way.
