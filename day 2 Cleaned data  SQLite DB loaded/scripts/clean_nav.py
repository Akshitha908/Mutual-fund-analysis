import pandas as pd
df = pd.read_csv("D:\\data\\02_nav_history.csv")
df['date'] = pd.to_datetime(df['date'])
df = df.sort_values(['amfi_code', 'date'])
df = df.drop_duplicates()
df['nav'] = df.groupby('amfi_code')['nav'].ffill()
df = df[df['nav'] > 0]
df.to_csv("data/processed/nav_history.csv", index=False)
print("NAV cleaned")