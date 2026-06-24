import pandas as pd
df = pd.read_csv("D:\\data\\07_scheme_performance.csv")
df['return_1yr_pct'] = pd.to_numeric(df['return_1yr_pct'], errors='coerce')
df = df.dropna(subset=['return_1yr_pct'])
df = df[(df['expense_ratio_pct']>= 0.1) & (df['expense_ratio_pct'] <= 2.5)]
df.to_csv("data/processed/scheme_performance_cleaned.csv", index=False)
print("Scheme performance data cleaned")