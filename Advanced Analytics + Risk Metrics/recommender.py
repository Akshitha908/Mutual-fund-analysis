import pandas as pd
import numpy as np

funds = pd.read_csv(
    r"D:\mutual fund project\day 2 Cleaned data  SQLite DB loaded\Data\raw\01_fund_master.csv"
)

nav = pd.read_csv(
    r"D:\mutual fund project\day 2 Cleaned data  SQLite DB loaded\Data\raw\02_nav_history.csv"
)


nav["nav_date"] = pd.to_datetime(nav["date"])


nav = nav.sort_values(["amfi_code","date"])



nav["daily_return"] = (
    nav.groupby("amfi_code")["nav"]
       .pct_change()
)

sharpe = (
    nav.groupby("amfi_code")["daily_return"]
       .agg(["mean","std"])
       .reset_index()
)

sharpe["Sharpe_Ratio"] = (
    sharpe["mean"] /
    sharpe["std"]
) * np.sqrt(252)

recommend = sharpe.merge(
    funds[
        ["amfi_code","scheme_name","risk_category"]
    ],
    on="amfi_code"
)

risk = input(
    "Enter Risk Appetite (Low/Moderate/High): "
).strip().title()

print(funds["risk_category"].unique())



risk_map = {
    "Low":["Low"],
    "Moderate":["Moderate","Moderately High"],
    "High":["High","Very High"]
}
filtered = recommend[
    recommend["risk_category"].isin(
        risk_map[risk]
    )
]
top3 = (
    filtered
    .sort_values(
        "Sharpe_Ratio",
        ascending=False
    )
    .head(3)
)

print("\nTop 3 Recommended Funds\n")

print(
    top3[
        [
            "scheme_name",
            "risk_category",
            "Sharpe_Ratio"
        ]
    ]
)