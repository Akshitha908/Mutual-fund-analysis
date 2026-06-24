CREATE TABLE dim_fund(
    fund_id INTEGER PRIMARY KEY,
    amfi_code TEXT,
    fund_name TEXT,
    category TEXT
);
CREATE TABLE dim_date(
    date_id INTEGER PRIMARY KEY,
    full_date DATE,
    year INTEGER,
    month INTEGER,
    quarter INTEGER,
);
CREATE TABLE fact_nav(
    nav_id INTEGER PRIMARY KEY,
    fund_id INTEGER,
    date_id INTEGER,
    nav REAL,
    FOREIGN KEY(fund_id) REFERENCES dim_fund(fund_id),
    FOREIGN KEY(date_id) REFERENCES dim_date(date_id)
);
CREATE TABLE fact_transactions(
    transaction_id INTEGER PRIMARY KEY,
    fund_id INTEGER,
    date_id INTEGER,
    investor_id INTEGER,
    transaction_type TEXT,
    amount_inr REAL,
    kyc_status TEXT,
    FOREIGN KEY(fund_id) REFERENCES dim_fund(fund_id),
    FOREIGN KEY(date_id) REFERENCES dim_date(date_id)
);
CREATE TABLE fact_performance(
    performance_id INTEGER PRIMARY KEY,
    fund_id INTEGER,
    date_id INTEGER,
    return_1yr_pct REAL,
    expense_ratio_pct REAL,
    FOREIGN KEY(fund_id) REFERENCES dim_fund(fund_id),
    FOREIGN KEY(date_id) REFERENCES dim_date(date_id)
);
CREATE TABLE Fact_aum(
    aum_id INTEGER PRIMARY KEY,
    fund_id INTEGER,
    date_id INTEGER,
    aum_inr REAL,
    FOREIGN KEY(fund_id) REFERENCES dim_fund(fund_id),
    FOREIGN KEY(date_id) REFERENCES dim_date(date_id)
);