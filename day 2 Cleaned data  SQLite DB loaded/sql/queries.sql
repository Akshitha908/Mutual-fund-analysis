##This query retrieves the top 5 funds based on their Assets Under Management (AUM) in INR.##
SELECT f.fund_id, a.aum_inr
FROM dim_fund f
JOIN Fact_aum a ON f.fund_id = a.fund_id
ORDER BY a.aum_inr DESC
LIMIT 5;

##average NAV of each fund##
SELECT f.fund_id, AVG(n.nav) as avg_nav
FROM fact_nav n
JOIN dim_fund f ON n.fund_id = f.fund_id
GROUP BY f.fund_id;

##monthly nav
SELECT f.fund_id, d.year, d.month, AVG(n.nav) as avg_nav
FROM fact_nav n
JOIN dim_fund f ON n.fund_id = f.fund_id
JOIN dim_date d ON n.date_id = d.date_id
GROUP BY f.fund_id, d.year, d.month
;

##SIP Growth Rate##
SELECT f.fund_id, d.year, d.month, SUM(t.amount_inr) as total_investment
FROM fact_transactions t
JOIN dim_fund f ON t.fund_id = f.fund_id
JOIN dim_date d ON t.date_id = d.date_id
WHERE t.transaction_type = 'SIP'
GROUP BY f.fund_id, d.year, d.month
;

##transaction by type##
SELECT f.fund_id, t.transaction_type, SUM(t.amount_inr) as total_amount
FROM fact_transactions t
JOIN dim_fund f ON t.fund_id = f.fund_id
GROUP BY f.fund_id, t.transaction_type
;

Expense Ratio < 1%
SELECT f.fund_id, p.expense_ratio_pct
FROM dim_fund f
JOIN fact_performance p ON f.fund_id = p.fund_id
WHERE p.expense_ratio_pct < 1
;

##highest return fund##
SELECT f.fund_id, p.return_1yr_pct
FROM dim_fund f
JOIN fact_performance p ON f.fund_id = p.fund_id
ORDER BY p.return_1yr_pct DESC
LIMIT 1;

##total investment##
SELECT f.fund_id, SUM(t.amount_inr) as total_investment
FROM fact_transactions t
JOIN dim_fund f ON t.fund_id = f.fund_id
GROUP BY f.fund_id
;

##Average Expense Ratio##
SELECT f.fund_id, AVG(p.expense_ratio_pct) as avg_expense_ratio
FROM fact_performance p
JOIN dim_fund f ON p.fund_id = f.fund_id
GROUP BY f.fund_id
;

##fund count##
SELECT COUNT(*) as total_funds
FROM dim_fund
;