# E-Commerce Sales Analysis Using SQL

## Project Overview

This project analyses e-commerce sales data using SQL to answer business questions about sales performance, revenue, product performance, order status, and monthly sales trends.

The goal is to demonstrate practical SQL skills by transforming raw sales data into useful insights that can support business decision-making.

## Dataset

- **Source:** [E-Commerce Sales Data Analysis and EDA — Kaggle](https://www.kaggle.com/datasets/erfan4524/e-commerce-sales-data-analysis-and-eda)
- **Domain:** E-commerce and retail analytics
- **Tools:** SQL and GitHub

The analysis uses order, product, and payment information to investigate sales performance. Revenue calculations account for product quantities and discounts, while relevant analyses focus on completed orders with paid payments.

## Business Questions

### Level 1 — Basic Sales Analysis and Data Quality

This level focuses on understanding the dataset and establishing baseline sales metrics.

1. How many orders are in the dataset?
2. What is the total quantity of products sold?
3. What is the total revenue generated?
4. What is the average order value (AOV)?
5. What percentage of orders fall into each order status?
6. Are there any data quality issues, such as missing values, duplicate records, or invalid quantities and prices?

### Level 2 — Product Performance and Sales Trends

This level explores which products and categories contribute most to sales and how sales change over time.

1. Which product category generates the highest revenue?
2. Which product category sells the highest number of units?
3. What are the top 10 products by revenue?
4. Which products have high sales volumes but relatively low revenue per unit?
5. Which products have the highest average selling prices after discounts?
6. Which months have the highest and lowest sales?
7. How does revenue change from month to month?
8. What percentage of total revenue does each product category contribute?

## SQL Skills Demonstrated

- `SELECT`, `WHERE`, `GROUP BY`, and `ORDER BY`
- Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`
- Joining related tables using `JOIN`
- Calculating revenue after discounts
- Using `ROUND()` for readable financial metrics
- Calculating percentages and average order value
- Identifying potential data quality issues
- Ranking products using sorting and `LIMIT`
- Analysing monthly trends using date functions
- Using Common Table Expressions (CTEs) and window functions, including `LAG()`

## Revenue Calculation

Revenue is calculated using product quantity, unit price, and discount:

`Revenue = Quantity × Unit Price × (1 − Discount)`

This calculation assumes discounts are stored as decimal values. For example, a discount of `0.10` represents 10%.

Where applicable, the analysis filters for completed orders and paid payments to focus on realised sales. Care is also needed to ensure joins do not duplicate order line items or inflate revenue.

## Repository Structure

```text
ecommerce-sales-analysis/
├── README.md
└── sql/
    ├── level-1-basic-analysis.sql
    └── level-2-product-performance.sql
```

The SQL files contain the queries used to answer the business questions in each level.

## Key Findings

*This section will be updated after the queries have been executed and the results reviewed.*

Findings will highlight the strongest-performing product categories, leading products by revenue, sales trends, and any data quality issues that could affect the analysis.

## Project Status

- [x] Defined business questions for Level 1 and Level 2
- [x] Developed SQL queries for the analysis
- [ ] Validate query results and calculations
- [ ] Document key findings and business recommendations
- [ ] Extend the project to profitability and discount analysis

## Future Improvements

- Analyse profit margins when reliable product cost data is available.
- Investigate the relationship between discounts and sales performance.
- Create visualisations to communicate key findings.
- Develop recommendations based on the completed analysis.

## Author

This project is part of my data analytics portfolio, demonstrating my ability to use SQL to explore datasets, answer business questions, and communicate findings in a structured way.
