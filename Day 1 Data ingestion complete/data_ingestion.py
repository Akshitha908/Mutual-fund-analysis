import pandas as pd
import os
folder_path = "data"
for file in os.listdir(folder_path):
    if file.endswith(".csv"):
        path = os.path.join(folder_path, file)

        print(f"\n{'='*50}")
        print(f"FILE: {file}")

        df = pd.read_csv(path)

        print(f"\nFile: {file}")
        print("Shape:", df.shape)
        print("\nData Types:")
        print(df.dtypes)
        print("\nFirst 5 Rows:")
        print(df.head())
        print("\nMissing Values:")
        print(df.isnull().sum())
