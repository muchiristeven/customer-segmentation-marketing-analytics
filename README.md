# Customer Segmentation & Marketing Analytics

## Project Overview

This project analyzes retail transaction data to identify meaningful customer segments and translate those segments into practical marketing strategies.

The analysis uses **RFM segmentation** and **K-Means clustering** to group customers according to:

- Recency — how recently they purchased
- Frequency — how often they purchased
- Monetary value — how much they spent

The project also examines customer contribution to revenue, unit volume, product breadth, and overall commercial value.

> **Project principle: Core fundamentals > unnecessary depth**

---

## Business Objective

The main business question is:

**How can an online retailer segment its customers based on purchasing behaviour and use those segments to support more targeted marketing decisions?**

The project focuses on identifying:

- high-value loyal customers
- mid-value regular customers
- recent but low-engagement customers
- inactive low-value customers

and determining appropriate marketing strategies for each group.

---

## Dataset

The project uses the **UCI Online Retail dataset**, containing transactional retail data from December 2010 to December 2011.

Key fields include:

- InvoiceNo
- StockCode
- Description
- Quantity
- InvoiceDate
- UnitPrice
- CustomerID
- Country

The analysis focuses primarily on customers from the **United Kingdom**, which represents the majority of customers and revenue in the dataset.

---

## Tools Used

### Python
- pandas
- numpy
- matplotlib
- scikit-learn

### SQL
- Customer revenue analysis
- Purchase frequency analysis
- Average order value
- Product breadth
- Product revenue ranking

### Power BI
Used to present customer segments, revenue contribution, quantity share, RFM characteristics, and recommended marketing actions.

---

## Analysis Workflow

### 1. Data Cleaning

The transactional dataset was cleaned by:

- removing transactions without CustomerID
- excluding cancelled transactions
- removing non-positive quantities
- removing non-positive unit prices
- creating a Revenue field

Revenue was calculated as:

`Revenue = Quantity × UnitPrice`

---

### 2. Customer-Level Analysis

Transaction data was aggregated to customer level to calculate:

- total orders
- total quantity
- total revenue
- average order value
- first purchase
- last purchase
- customer lifespan

---

### 3. RFM Analysis

Each customer was represented using:

- **Recency** — number of days since their most recent purchase
- **Frequency** — number of unique orders
- **Monetary** — total customer revenue

The resulting variables were strongly skewed, particularly Frequency and Monetary.

A `log1p()` transformation was applied to reduce skewness before clustering.

---

### 4. Standardization

The transformed RFM variables were standardized using `StandardScaler`.

This ensured that Recency, Frequency, and Monetary contributed comparably to the K-Means distance calculations.

---

### 5. K-Means Clustering

The number of clusters was evaluated using:

- Elbow Method
- Silhouette Score

A four-cluster solution was selected because it provided a useful balance between statistical separation and business interpretability.

---

## Customer Segments

| Segment | Customers | Avg Recency | Avg Frequency | Avg Monetary |
|---|---:|---:|---:|---:|
| High-Value Loyal | 632 | 11.56 | 13.68 | £7,251.41 |
| Regular Mid-Value | 1,051 | 68.49 | 4.23 | £1,743.95 |
| Recent Low-Engagement | 776 | 19.37 | 2.08 | £525.64 |
| Inactive Low-Value | 1,461 | 182.84 | 1.33 | £331.77 |

---

## Key Business Findings

### High-Value Loyal Customers

High-Value Loyal customers represent approximately **16.1% of customers** but generate approximately:

- **62.7% of revenue**
- **60.4% of total unit volume**

Their revenue per unit is only moderately higher than other segments, indicating that their commercial value is driven mainly by:

- higher purchase frequency
- larger order volumes
- broader product purchasing behaviour

These customers also purchase across a much wider variety of products, with a median of approximately **117 unique products per customer**.

---

### Regular Mid-Value Customers

Regular Mid-Value customers represent approximately **26.8% of customers** and generate approximately **25.1% of revenue**.

This group represents an important opportunity for:

- loyalty development
- cross-selling
- product recommendations
- repeat-purchase incentives

---

### Recent Low-Engagement Customers

Recent Low-Engagement customers have purchased relatively recently but have:

- low purchase frequency
- low monetary value

The main marketing opportunity is to encourage a second or subsequent purchase.

---

### Inactive Low-Value Customers

Inactive Low-Value customers represent approximately **37.3% of customers**, making them the largest segment by customer count.

However, they generate only approximately **6.6% of revenue**.

This suggests that expensive individualized marketing campaigns would be difficult to justify.

Low-cost automated reactivation strategies are more appropriate.

---

## Marketing Strategy by Segment

| Segment | Recommended Strategy |
|---|---|
| High-Value Loyal | Retention, VIP rewards, loyalty benefits, early access, cross-selling |
| Regular Mid-Value | Repeat-purchase incentives, personalized recommendations, bundles |
| Recent Low-Engagement | Welcome campaigns, second-purchase incentives, product discovery |
| Inactive Low-Value | Low-cost win-back campaigns, automated reactivation offers |

---

## Revenue Concentration Insight

The strongest commercial finding is that:

**High-Value Loyal and Regular Mid-Value customers represent approximately 42.9% of customers but generate approximately 87.8% of total revenue.**

This demonstrates that customer value is highly concentrated among the more engaged segments.

---

## Power BI Dashboard

The final dashboard includes:

- Total Customers
- Total Revenue
- Total Orders
- Total Units Sold
- Revenue Share by Segment
- Customer vs Quantity vs Revenue Share
- RFM Segment Summary
- Recommended Marketing Strategy

The dashboard provides a concise view of which customer groups drive commercial value and how each group can be approached differently.

---

## Repository Structure

```text
customer-segmentation-marketing-analytics/
│
├── data/
│
├── notebooks/
│   └── 01_data_preparation_eda.ipynb
│
├── sql/
│   └── customer_marketing_analysis.sql
│
├── outputs/
│   ├── customer_segments.csv
│   ├── segment_business_summary.csv
│   └── segment_strategy_summary.csv
│
├── docs/
│
├── README.md
├── requirements.txt
└── .gitignore