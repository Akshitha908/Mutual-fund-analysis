import pandas as pd
df = pd.read_csv("D:\\data\\08_investor_transactions.csv")
df['transaction_date'] = pd.to_datetime(df['transaction_date'])
df['transaction_type'] = (df['transaction_type'].str.strip().str.upper())
mapping = {
    "SIP": "SIP",
    "LUMPSUM": "LUMPSUM",
    "REDEMPTION": "REDEMPTION",
}
df['transaction_type'] = df['transaction_type'].map(mapping)
df = df[df['amount_inr'] > 0]
valid_kyc = ["Verified", "Pending", "Rejected"]
df = df[df['kyc_status'].isin(valid_kyc)]
df.to_csv("data/processed/investor_transactions_cleaned.csv", index=False)
print("Transactions cleaned")
