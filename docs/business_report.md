# Bank Customer & Loan Analytics - Business Report

## Executive Summary

This report summarizes the key findings from the Bank Customer & Loan Analytics database using MySQL.

The analysis covers customer demographics, bank accounts, transactions, loans, loan repayments and branch performance.

## Customer Performance

•⁠  ⁠Total Customers: *50*
•⁠  ⁠Average Annual Income: *₹17,36,000*
•⁠  ⁠Customers are evenly distributed across 10 cities, with *5 customers per city*
•⁠  ⁠Occupations are also evenly distributed, with *5 customers in each occupation category*

## Account Performance

•⁠  ⁠Total Accounts: *70*
•⁠  ⁠Total Account Balance: *₹1,30,99,000*
•⁠  ⁠Most Common Account Type: *Current (24 accounts)*
•⁠  ⁠Salary Accounts: *23*
•⁠  ⁠Savings Accounts: *23*
•⁠  ⁠Highest Account Balance: *₹4,16,500*
•⁠  ⁠Active Accounts: *48*
•⁠  ⁠Inactive Accounts: *11*
•⁠  ⁠Closed Accounts: *11*

## Transaction Performance

•⁠  ⁠Total Transactions: *200*
•⁠  ⁠Total Transaction Value: *₹94,02,500*
•⁠  ⁠Total Deposits: *₹23,66,250*
•⁠  ⁠Total Withdrawals: *₹23,40,000*

Transaction activity is evenly distributed:

•⁠  ⁠Deposits: *50*
•⁠  ⁠Withdrawals: *50*
•⁠  ⁠Transfers: *50*
•⁠  ⁠Payments: *50*

Payment modes are also evenly distributed:

•⁠  ⁠UPI: *40*
•⁠  ⁠Cash: *40*
•⁠  ⁠Card: *40*
•⁠  ⁠Net Banking: *40*
•⁠  ⁠Cheque: *40*

## Loan Performance

•⁠  ⁠Total Loans: *50*
•⁠  ⁠Total Loan Portfolio: *₹10,28,50,000*
•⁠  ⁠Highest Loan Amount: *₹39,75,000*
•⁠  ⁠Active Loans: *20*
•⁠  ⁠Closed Loans: *10*
•⁠  ⁠Defaulted Loans: *10*
•⁠  ⁠Pending Loans: *10*
•⁠  ⁠Loan Default Rate: *20%*

Each loan category contains 10 loans:

•⁠  ⁠Home Loan
•⁠  ⁠Car Loan
•⁠  ⁠Personal Loan
•⁠  ⁠Education Loan
•⁠  ⁠Business Loan

## Loan Payment Performance

•⁠  ⁠Total Loan Payments: *100*
•⁠  ⁠Total Repayment Amount: *₹23,01,682*
•⁠  ⁠Average Payment Amount: *₹23,016.82*
•⁠  ⁠Paid Payments: *49*
•⁠  ⁠Late Payments: *26*
•⁠  ⁠Pending Payments: *25*

## Branch Performance

### Highest Number of Customers

*Andheri Branch* has the highest number of associated customers with *10 customers*.

### Highest Total Account Balance

*Bandra Branch* has the highest total account balance at:

*₹18,74,400*

### Highest Average Account Balance

*Bandra Branch* also has the highest average account balance at approximately:

*₹2,08,266.67*

## Advanced Business Insights

### Loan Exposure vs Account Balance

*35 customers* have total loan amounts greater than their total account balances.

This identifies customers with comparatively high loan exposure relative to the balances held in their bank accounts.

### Active Loans Without Transaction Activity

No customers with an active loan were found to have zero transaction activity.

### Customers Holding Every Loan Type

No customer in the dataset has taken every available loan type.

## Important Data Limitation

Loans are linked directly to customers, while branches are linked through customer accounts.

Therefore, branch-level loan analysis is inferred through the customer-account relationship. A customer who holds accounts at multiple branches may cause a loan to be associated with more than one branch.

This limitation should be considered when interpreting branch-wise loan totals.

## Conclusion

The analysis demonstrates how SQL can be used to combine relational banking data and generate useful insights about customer activity, account balances, transaction behavior, credit exposure, loan repayments and branch performance.

The project uses joins, subqueries, aggregate functions, grouping, filtering and multi-table analysis to answer practical banking business questions.
