# Bank Customer & Loan Analytics

## Project Overview

This project analyzes banking data using MySQL to generate insights about customers, accounts, transactions, loans, loan payments, and branch performance.

The objective is to demonstrate practical SQL skills by designing and analyzing a relational banking database and answering real-world business questions.

## Database

Database Name:

⁠ bank_analytics ⁠

The project contains six relational tables:

| Table | Purpose |
|---|---|
| Customers | Stores customer demographic and income information |
| Accounts | Stores customer bank account information |
| Transactions | Stores deposits, withdrawals, transfers and payments |
| Loans | Stores customer loan information |
| LoanPayments | Stores loan repayment information |
| Branches | Stores bank branch information |

## Database Relationships

The main relationships are:

•⁠  ⁠Customers.CustomerID → Accounts.CustomerID
•⁠  ⁠Customers.CustomerID → Loans.CustomerID
•⁠  ⁠Accounts.AccountID → Transactions.AccountID
•⁠  ⁠Branches.BranchID → Accounts.BranchID
•⁠  ⁠Loans.LoanID → LoanPayments.LoanID

## ER Diagram

⁠ mermaid
erDiagram

    CUSTOMERS ||--o{ ACCOUNTS : owns
    CUSTOMERS ||--o{ LOANS : takes
    BRANCHES ||--o{ ACCOUNTS : contains
    ACCOUNTS ||--o{ TRANSACTIONS : has
    LOANS ||--o{ LOANPAYMENTS : receives

    CUSTOMERS {
        int CustomerID PK
        varchar FirstName
        varchar LastName
        varchar Gender
        int Age
        varchar City
        varchar State
        varchar Phone
        varchar Email
        varchar Occupation
        decimal AnnualIncome
        date JoinDate
    }

    ACCOUNTS {
        int AccountID PK
        int CustomerID FK
        varchar AccountType
        decimal Balance
        date OpenDate
        int BranchID FK
        varchar Status
    }

    TRANSACTIONS {
        int TransactionID PK
        int AccountID FK
        date TransactionDate
        varchar TransactionType
        decimal Amount
        varchar PaymentMode
    }

    LOANS {
        int LoanID PK
        int CustomerID FK
        varchar LoanType
        decimal LoanAmount
        decimal InterestRate
        date LoanDate
        int TenureMonths
        varchar LoanStatus
    }

    LOANPAYMENTS {
        int PaymentID PK
        int LoanID FK
        date PaymentDate
        decimal PaymentAmount
        varchar PaymentStatus
    }

    BRANCHES {
        int BranchID PK
        varchar BranchName
        varchar City
        varchar State
        varchar ManagerName
    }
 ⁠

## SQL Skills Demonstrated

This project uses:

•⁠  ⁠Database and table creation
•⁠  ⁠Primary keys and foreign keys
•⁠  ⁠SELECT
•⁠  ⁠WHERE
•⁠  ⁠BETWEEN
•⁠  ⁠ORDER BY
•⁠  ⁠GROUP BY
•⁠  ⁠HAVING
•⁠  ⁠COUNT, SUM, AVG, MAX and MIN
•⁠  ⁠INNER JOIN
•⁠  ⁠LEFT JOIN
•⁠  ⁠Subqueries
•⁠  ⁠IN / NOT IN
•⁠  ⁠NOT EXISTS
•⁠  ⁠Aggregate analysis
•⁠  ⁠Multi-table business analysis

## Analysis Performed

### Customer Analysis

•⁠  ⁠Total number of customers
•⁠  ⁠Customers by city and state
•⁠  ⁠Customer income analysis
•⁠  ⁠Customers with above-average income
•⁠  ⁠Top customers by annual income
•⁠  ⁠Age and occupation analysis

### Account Analysis

•⁠  ⁠Total accounts
•⁠  ⁠Accounts by type and status
•⁠  ⁠Total and average account balances
•⁠  ⁠Customers with multiple accounts
•⁠  ⁠High-balance accounts
•⁠  ⁠Branch-wise account balances

### Transaction Analysis

•⁠  ⁠Total transactions
•⁠  ⁠Total transaction value
•⁠  ⁠Deposits and withdrawals
•⁠  ⁠Transaction type analysis
•⁠  ⁠Payment mode analysis
•⁠  ⁠High-value transactions
•⁠  ⁠Customer-wise transaction activity

### Loan Analysis

•⁠  ⁠Total loans
•⁠  ⁠Total loan portfolio
•⁠  ⁠Loan type analysis
•⁠  ⁠Loan status analysis
•⁠  ⁠Defaulted loans
•⁠  ⁠High-value loans
•⁠  ⁠Customers with multiple loans
•⁠  ⁠Interest rate and tenure analysis

### Loan Payment Analysis

•⁠  ⁠Total repayments
•⁠  ⁠Paid, pending and late payments
•⁠  ⁠Loan-wise repayment analysis
•⁠  ⁠High-value loan payments

### Advanced Business Analysis

The project also answers advanced questions such as:

•⁠  ⁠Which customers have active loans but no transaction activity?
•⁠  ⁠Which customers transact above the average customer transaction value?
•⁠  ⁠Which customers have loan exposure greater than their account balance?
•⁠  ⁠Which branch has the highest average account balance?
•⁠  ⁠Which customers have taken every available loan type?

## Project Files

```text
Bank-Customer-Loan-Analytics/
│
├── README.md
│
└── sql/
    ├── 01_database_schema.sql
    ├── 02_project_queries.sql
    └── bank_analytics_full.sql

