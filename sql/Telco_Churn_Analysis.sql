USE telco_db;

-- Query 1: Check the table
SELECT COUNT(*) AS total_rows FROM telco_churn;
SELECT TOP 5 * FROM telco_churn;

-- Query 2: Overall churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn;

-- Query 3: Churn rate by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate_percent DESC;

-- Query 4: Churn rate by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;

-- Query 5: Churn rate by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;

-- Query 6: Churn rate by tenure group
SELECT
    TenureGroup,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY TenureGroup
ORDER BY MIN(tenure);

-- Query 7: Churn rate by senior citizen
SELECT
    SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY SeniorCitizen;

-- Query 8: Churn rate by gender
SELECT
    gender,
    COUNT(*) AS total_customers,
    SUM(ChurnFlag) AS churned_customers,
    ROUND(SUM(ChurnFlag) * 100.0 / COUNT(*), 2) AS churn_rate_percent
FROM telco_churn
GROUP BY gender;

-- Query 9: Average monthly charges by churn
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM telco_churn
GROUP BY Churn;

-- Query 10: Monthly revenue lost due to churn
SELECT
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost
FROM telco_churn
WHERE Churn = 'Yes';

