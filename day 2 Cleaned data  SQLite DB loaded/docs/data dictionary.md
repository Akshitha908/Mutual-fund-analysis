# Data Dictionary
## nav_history
|column name| Date Type | Description |
|-----------|-----------|-------------|
|amfi_code | TEXT|unique identifiers of mutual fund|
|date |DATE| NAV date|
|nav|REAL| Net Assest Value of the fund|

## investor transactions
| Column name | Data Type | Description|
|-------------|-----------|------------|
|transcaton_id| INTEGER| Unique transaction identifier|
|amount |REAL| Investment amount|
|transaction_type| TEXT| SIP, Lumpsum, or Redemption|