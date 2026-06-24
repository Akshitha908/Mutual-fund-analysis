import pandas as pd
from sqlalchemy import create_engine
engine = create_engine('sqlite:///bluestock_mf.db')
nav = pd.read_csv("D:\\data\\02_nav_history.csv")
nav.to_sql('nav_history', con=engine, if_exists='replace', index=False)
print("loaded successfully")