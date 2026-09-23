-- =====================================================
-- BANK CUSTOMER & LOAN ANALYTICS PROJECT
-- MySQL
-- =====================================================

USE bank_analytics;

-- =====================================================
-- 1. DATA VALIDATION
-- =====================================================

SELECT COUNT(*) AS Total_Customers
FROM Customers;

SELECT COUNT(*) AS Total_Accounts
FROM Accounts;

SELECT COUNT(*) AS Total_Loans
FROM Loans;

SELECT COUNT(*) AS Total_Transactions
FROM Transactions;

SELECT COUNT(*) AS Total_Loan_Payments
FROM LoanPayments;

SELECT COUNT(*) AS Total_Branches
FROM Branches;


-- =====================================================
-- 2. CUSTOMER ANALYSIS
-- =====================================================

-- 2.1 Display all customers
SELECT *
FROM Customers;

-- 2.2 Number of customers by city
SELECT
    City,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City
ORDER BY Total_Customers DESC;

-- 2.3 Number of customers by state
SELECT
    State,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY State
ORDER BY Total_Customers DESC;

-- 2.4 Average annual income of customers
SELECT
    ROUND(AVG(AnnualIncome), 2) AS Average_Annual_Income
FROM Customers;

-- 2.5 Customers with above-average annual income
SELECT
    CustomerID,
    FirstName,
    LastName,
    City,
    AnnualIncome
FROM Customers
WHERE AnnualIncome > (
    SELECT AVG(AnnualIncome)
    FROM Customers
)
ORDER BY AnnualIncome DESC;

-- 2.6 Top 10 customers by annual income
SELECT
    CustomerID,
    FirstName,
    LastName,
    Occupation,
    AnnualIncome
FROM Customers
ORDER BY AnnualIncome DESC
LIMIT 10;

-- 2.7 Customer distribution by occupation
SELECT
    Occupation,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Occupation
ORDER BY Total_Customers DESC;

-- 2.8 Average age of customers
SELECT
    ROUND(AVG(Age), 2) AS Average_Customer_Age
FROM Customers;

-- 2.9 Customers aged 30 to 50
SELECT
    CustomerID,
    FirstName,
    LastName,
    Age,
    City
FROM Customers
WHERE Age BETWEEN 30 AND 50
ORDER BY Age;

-- 2.10 Customers ordered by joining date
SELECT
    CustomerID,
    FirstName,
    LastName,
    JoinDate
FROM Customers
ORDER BY JoinDate DESC;


-- =====================================================
-- 3. ACCOUNT ANALYSIS
-- =====================================================

-- 3.1 Display all accounts
SELECT *
FROM Accounts;

-- 3.2 Number of accounts by account type
SELECT
    AccountType,
    COUNT(*) AS Total_Accounts
FROM Accounts
GROUP BY AccountType
ORDER BY Total_Accounts DESC;

-- 3.3 Number of accounts by status
SELECT
    Status,
    COUNT(*) AS Total_Accounts
FROM Accounts
GROUP BY Status
ORDER BY Total_Accounts DESC;

-- 3.4 Average account balance
SELECT
    ROUND(AVG(Balance), 2) AS Average_Balance
FROM Accounts;

-- 3.5 Total balance held by the bank
SELECT
    ROUND(SUM(Balance), 2) AS Total_Account_Balance
FROM Accounts;

-- 3.6 Top 10 accounts by balance
SELECT
    AccountID,
    CustomerID,
    AccountType,
    Balance,
    Status
FROM Accounts
ORDER BY Balance DESC
LIMIT 10;

-- 3.7 Accounts with above-average balance
SELECT
    AccountID,
    CustomerID,
    AccountType,
    Balance
FROM Accounts
WHERE Balance > (
    SELECT AVG(Balance)
    FROM Accounts
)
ORDER BY Balance DESC;

-- 3.8 Total balance by account type
SELECT
    AccountType,
    COUNT(*) AS Total_Accounts,
    ROUND(SUM(Balance), 2) AS Total_Balance,
    ROUND(AVG(Balance), 2) AS Average_Balance
FROM Accounts
GROUP BY AccountType
ORDER BY Total_Balance DESC;

-- 3.9 Branch-wise account count and total balance
SELECT
    BranchID,
    COUNT(*) AS Total_Accounts,
    ROUND(SUM(Balance), 2) AS Total_Balance
FROM Accounts
GROUP BY BranchID
ORDER BY Total_Balance DESC;

-- 3.10 Customers having multiple accounts
SELECT
    CustomerID,
    COUNT(*) AS Number_Of_Accounts
FROM Accounts
GROUP BY CustomerID
HAVING COUNT(*) > 1
ORDER BY Number_Of_Accounts DESC;

-- 3.11 Active accounts with high balance
SELECT
    AccountID,
    CustomerID,
    AccountType,
    Balance
FROM Accounts
WHERE Status = 'Active'
  AND Balance > (
      SELECT AVG(Balance)
      FROM Accounts
  )
ORDER BY Balance DESC;

-- 3.12 Accounts ordered by opening date
SELECT
    AccountID,
    CustomerID,
    AccountType,
    OpenDate,
    Status
FROM Accounts
ORDER BY OpenDate DESC;


-- =====================================================
-- 4. TRANSACTION ANALYSIS
-- =====================================================

-- 4.1 Display all transactions
SELECT *
FROM Transactions;

-- 4.2 Total number of transactions
SELECT
    COUNT(*) AS Total_Transactions
FROM Transactions;

-- 4.3 Total transaction amount
SELECT
    ROUND(SUM(Amount), 2) AS Total_Transaction_Amount
FROM Transactions;

-- 4.4 Average transaction amount
SELECT
    ROUND(AVG(Amount), 2) AS Average_Transaction_Amount
FROM Transactions;

-- 4.5 Transaction count by transaction type
SELECT
    TransactionType,
    COUNT(*) AS Total_Transactions
FROM Transactions
GROUP BY TransactionType
ORDER BY Total_Transactions DESC;

-- 4.6 Total amount by transaction type
SELECT
    TransactionType,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Amount), 2) AS Total_Amount,
    ROUND(AVG(Amount), 2) AS Average_Amount
FROM Transactions
GROUP BY TransactionType
ORDER BY Total_Amount DESC;

-- 4.7 Transaction count by payment mode
SELECT
    PaymentMode,
    COUNT(*) AS Total_Transactions
FROM Transactions
GROUP BY PaymentMode
ORDER BY Total_Transactions DESC;

-- 4.8 Total amount by payment mode
SELECT
    PaymentMode,
    ROUND(SUM(Amount), 2) AS Total_Amount
FROM Transactions
GROUP BY PaymentMode
ORDER BY Total_Amount DESC;

-- 4.9 Top 10 highest-value transactions
SELECT
    TransactionID,
    AccountID,
    TransactionDate,
    TransactionType,
    Amount,
    PaymentMode
FROM Transactions
ORDER BY Amount DESC
LIMIT 10;

-- 4.10 Transactions above the average transaction amount
SELECT
    TransactionID,
    AccountID,
    TransactionType,
    Amount
FROM Transactions
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Transactions
)
ORDER BY Amount DESC;

-- 4.11 Total deposits
SELECT
    ROUND(SUM(Amount), 2) AS Total_Deposits
FROM Transactions
WHERE TransactionType = 'Deposit';

-- 4.12 Total withdrawals
SELECT
    ROUND(SUM(Amount), 2) AS Total_Withdrawals
FROM Transactions
WHERE TransactionType = 'Withdrawal';

-- 4.13 Total transfers
SELECT
    ROUND(SUM(Amount), 2) AS Total_Transfers
FROM Transactions
WHERE TransactionType = 'Transfer';

-- 4.14 Total payments
SELECT
    ROUND(SUM(Amount), 2) AS Total_Payments
FROM Transactions
WHERE TransactionType = 'Payment';

-- 4.15 Account-wise transaction summary
SELECT
    AccountID,
    COUNT(*) AS Transaction_Count,
    ROUND(SUM(Amount), 2) AS Total_Transaction_Amount,
    ROUND(AVG(Amount), 2) AS Average_Transaction_Amount
FROM Transactions
GROUP BY AccountID
ORDER BY Total_Transaction_Amount DESC;

-- 4.16 Accounts with more than 3 transactions
SELECT
    AccountID,
    COUNT(*) AS Transaction_Count
FROM Transactions
GROUP BY AccountID
HAVING COUNT(*) > 3
ORDER BY Transaction_Count DESC;

-- 4.17 Transactions ordered by most recent date
SELECT
    TransactionID,
    AccountID,
    TransactionDate,
    TransactionType,
    Amount
FROM Transactions
ORDER BY TransactionDate DESC;


-- =====================================================
-- 5. LOAN ANALYSIS
-- =====================================================

-- 5.1 Display all loans
SELECT *
FROM Loans;

-- 5.2 Total number of loans
SELECT
    COUNT(*) AS Total_Loans
FROM Loans;

-- 5.3 Total loan portfolio
SELECT
    ROUND(SUM(LoanAmount), 2) AS Total_Loan_Portfolio
FROM Loans;

-- 5.4 Average loan amount
SELECT
    ROUND(AVG(LoanAmount), 2) AS Average_Loan_Amount
FROM Loans;

-- 5.5 Number of loans by loan type
SELECT
    LoanType,
    COUNT(*) AS Total_Loans
FROM Loans
GROUP BY LoanType
ORDER BY Total_Loans DESC;

-- 5.6 Total loan amount by loan type
SELECT
    LoanType,
    COUNT(*) AS Number_Of_Loans,
    ROUND(SUM(LoanAmount), 2) AS Total_Loan_Amount,
    ROUND(AVG(LoanAmount), 2) AS Average_Loan_Amount
FROM Loans
GROUP BY LoanType
ORDER BY Total_Loan_Amount DESC;

-- 5.7 Number of loans by status
SELECT
    LoanStatus,
    COUNT(*) AS Total_Loans
FROM Loans
GROUP BY LoanStatus
ORDER BY Total_Loans DESC;

-- 5.8 Total loan amount by status
SELECT
    LoanStatus,
    ROUND(SUM(LoanAmount), 2) AS Total_Loan_Amount
FROM Loans
GROUP BY LoanStatus
ORDER BY Total_Loan_Amount DESC;

-- 5.9 Defaulted loans
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount,
    InterestRate,
    LoanStatus
FROM Loans
WHERE LoanStatus = 'Defaulted'
ORDER BY LoanAmount DESC;

-- 5.10 Active loans
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount,
    TenureMonths
FROM Loans
WHERE LoanStatus = 'Active'
ORDER BY LoanAmount DESC;

-- 5.11 Top 10 highest-value loans
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount,
    InterestRate
FROM Loans
ORDER BY LoanAmount DESC
LIMIT 10;

-- 5.12 Loans above average loan amount
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount
FROM Loans
WHERE LoanAmount > (
    SELECT AVG(LoanAmount)
    FROM Loans
)
ORDER BY LoanAmount DESC;

-- 5.13 Average interest rate by loan type
SELECT
    LoanType,
    ROUND(AVG(InterestRate), 2) AS Average_Interest_Rate
FROM Loans
GROUP BY LoanType
ORDER BY Average_Interest_Rate DESC;

-- 5.14 Average tenure by loan type
SELECT
    LoanType,
    ROUND(AVG(TenureMonths), 2) AS Average_Tenure_Months
FROM Loans
GROUP BY LoanType
ORDER BY Average_Tenure_Months DESC;

-- 5.15 Customers with multiple loans
SELECT
    CustomerID,
    COUNT(*) AS Number_Of_Loans,
    ROUND(SUM(LoanAmount), 2) AS Total_Loan_Amount
FROM Loans
GROUP BY CustomerID
HAVING COUNT(*) > 1
ORDER BY Number_Of_Loans DESC;

-- 5.16 Customers with defaulted loans
SELECT DISTINCT
    CustomerID
FROM Loans
WHERE LoanStatus = 'Defaulted';

-- 5.17 Loans ordered by latest loan date
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount,
    LoanDate,
    LoanStatus
FROM Loans
ORDER BY LoanDate DESC;


-- =====================================================
-- 6. LOAN PAYMENT ANALYSIS
-- =====================================================

-- 6.1 Display all loan payments
SELECT *
FROM LoanPayments;

-- 6.2 Total number of loan payments
SELECT
    COUNT(*) AS Total_Payments
FROM LoanPayments;

-- 6.3 Total repayment amount
SELECT
    ROUND(SUM(PaymentAmount), 2) AS Total_Repayment_Amount
FROM LoanPayments;

-- 6.4 Average payment amount
SELECT
    ROUND(AVG(PaymentAmount), 2) AS Average_Payment_Amount
FROM LoanPayments;

-- 6.5 Number of payments by status
SELECT
    PaymentStatus,
    COUNT(*) AS Total_Payments
FROM LoanPayments
GROUP BY PaymentStatus
ORDER BY Total_Payments DESC;

-- 6.6 Total amount by payment status
SELECT
    PaymentStatus,
    ROUND(SUM(PaymentAmount), 2) AS Total_Amount
FROM LoanPayments
GROUP BY PaymentStatus
ORDER BY Total_Amount DESC;

-- 6.7 Paid loan payments
SELECT
    PaymentID,
    LoanID,
    PaymentDate,
    PaymentAmount
FROM LoanPayments
WHERE PaymentStatus = 'Paid'
ORDER BY PaymentDate DESC;

-- 6.8 Pending loan payments
SELECT
    PaymentID,
    LoanID,
    PaymentDate,
    PaymentAmount
FROM LoanPayments
WHERE PaymentStatus = 'Pending'
ORDER BY PaymentDate;

-- 6.9 Late loan payments
SELECT
    PaymentID,
    LoanID,
    PaymentDate,
    PaymentAmount
FROM LoanPayments
WHERE PaymentStatus = 'Late'
ORDER BY PaymentDate DESC;

-- 6.10 Loan-wise payment summary
SELECT
    LoanID,
    COUNT(*) AS Number_Of_Payments,
    ROUND(SUM(PaymentAmount), 2) AS Total_Paid,
    ROUND(AVG(PaymentAmount), 2) AS Average_Payment
FROM LoanPayments
GROUP BY LoanID
ORDER BY Total_Paid DESC;

-- 6.11 Loans with more than one payment
SELECT
    LoanID,
    COUNT(*) AS Number_Of_Payments
FROM LoanPayments
GROUP BY LoanID
HAVING COUNT(*) > 1
ORDER BY Number_Of_Payments DESC;

-- 6.12 Highest loan payment
SELECT
    PaymentID,
    LoanID,
    PaymentAmount,
    PaymentStatus
FROM LoanPayments
ORDER BY PaymentAmount DESC
LIMIT 1;

-- 6.13 Payments above average payment amount
SELECT
    PaymentID,
    LoanID,
    PaymentAmount,
    PaymentStatus
FROM LoanPayments
WHERE PaymentAmount > (
    SELECT AVG(PaymentAmount)
    FROM LoanPayments
)
ORDER BY PaymentAmount DESC;

-- 6.14 Most recent loan payments
SELECT
    PaymentID,
    LoanID,
    PaymentDate,
    PaymentAmount,
    PaymentStatus
FROM LoanPayments
ORDER BY PaymentDate DESC;


-- =====================================================
-- 7. JOIN ANALYSIS
-- =====================================================

-- 7.1 Customers with their account details
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    a.AccountID,
    a.AccountType,
    a.Balance,
    a.Status
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID;

-- 7.2 Show all customers, including customers without accounts
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    a.AccountID,
    a.AccountType,
    a.Balance
FROM Customers c
LEFT JOIN Accounts a
    ON c.CustomerID = a.CustomerID;

-- 7.3 Customers who do not have an account
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
LEFT JOIN Accounts a
    ON c.CustomerID = a.CustomerID
WHERE a.AccountID IS NULL;

-- 7.4 Accounts with branch details
SELECT
    a.AccountID,
    a.CustomerID,
    a.AccountType,
    a.Balance,
    b.BranchName,
    b.City AS Branch_City,
    b.ManagerName
FROM Accounts a
INNER JOIN Branches b
    ON a.BranchID = b.BranchID;

-- 7.5 Customer, account and branch details together
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    a.AccountID,
    a.AccountType,
    a.Balance,
    b.BranchName,
    b.City AS Branch_City
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
INNER JOIN Branches b
    ON a.BranchID = b.BranchID;

-- 7.6 Accounts with their transactions
SELECT
    a.AccountID,
    a.AccountType,
    t.TransactionID,
    t.TransactionDate,
    t.TransactionType,
    t.Amount,
    t.PaymentMode
FROM Accounts a
INNER JOIN Transactions t
    ON a.AccountID = t.AccountID;

-- 7.7 Customers with their transaction details
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    a.AccountID,
    t.TransactionID,
    t.TransactionType,
    t.Amount,
    t.PaymentMode
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
INNER JOIN Transactions t
    ON a.AccountID = t.AccountID
ORDER BY t.Amount DESC;

-- 7.8 Customers with their loan details
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    l.LoanID,
    l.LoanType,
    l.LoanAmount,
    l.InterestRate,
    l.LoanStatus
FROM Customers c
INNER JOIN Loans l
    ON c.CustomerID = l.CustomerID;

-- 7.9 Show all customers including customers without loans
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    l.LoanID,
    l.LoanType,
    l.LoanAmount,
    l.LoanStatus
FROM Customers c
LEFT JOIN Loans l
    ON c.CustomerID = l.CustomerID;

-- 7.10 Customers who have not taken any loan
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
LEFT JOIN Loans l
    ON c.CustomerID = l.CustomerID
WHERE l.LoanID IS NULL;

-- 7.11 Loans with payment details
SELECT
    l.LoanID,
    l.CustomerID,
    l.LoanType,
    l.LoanAmount,
    lp.PaymentID,
    lp.PaymentDate,
    lp.PaymentAmount,
    lp.PaymentStatus
FROM Loans l
LEFT JOIN LoanPayments lp
    ON l.LoanID = lp.LoanID;

-- 7.12 Customers with loan payment details
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    l.LoanID,
    l.LoanType,
    l.LoanAmount,
    lp.PaymentAmount,
    lp.PaymentStatus
FROM Customers c
INNER JOIN Loans l
    ON c.CustomerID = l.CustomerID
LEFT JOIN LoanPayments lp
    ON l.LoanID = lp.LoanID;

-- 7.13 Number of customers associated with each branch
SELECT
    b.BranchID,
    b.BranchName,
    COUNT(DISTINCT a.CustomerID) AS Total_Customers
FROM Branches b
LEFT JOIN Accounts a
    ON b.BranchID = a.BranchID
GROUP BY
    b.BranchID,
    b.BranchName
ORDER BY Total_Customers DESC;

-- 7.14 Branch-wise account balance
SELECT
    b.BranchID,
    b.BranchName,
    COUNT(a.AccountID) AS Total_Accounts,
    ROUND(COALESCE(SUM(a.Balance), 0), 2) AS Total_Balance
FROM Branches b
LEFT JOIN Accounts a
    ON b.BranchID = a.BranchID
GROUP BY
    b.BranchID,
    b.BranchName
ORDER BY Total_Balance DESC;

-- 7.15 Customers having both an account and a loan
SELECT DISTINCT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
INNER JOIN Loans l
    ON c.CustomerID = l.CustomerID;

-- 7.16 Customer-wise total transaction amount
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    COUNT(t.TransactionID) AS Total_Transactions,
    ROUND(SUM(t.Amount), 2) AS Total_Transaction_Amount
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
INNER JOIN Transactions t
    ON a.AccountID = t.AccountID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
ORDER BY Total_Transaction_Amount DESC;


-- =====================================================
-- 8. SUBQUERY ANALYSIS
-- =====================================================

-- 8.1 Customers whose annual income is above average
SELECT
    CustomerID,
    FirstName,
    LastName,
    AnnualIncome
FROM Customers
WHERE AnnualIncome > (
    SELECT AVG(AnnualIncome)
    FROM Customers
)
ORDER BY AnnualIncome DESC;

-- 8.2 Accounts with balance above average
SELECT
    AccountID,
    CustomerID,
    AccountType,
    Balance
FROM Accounts
WHERE Balance > (
    SELECT AVG(Balance)
    FROM Accounts
)
ORDER BY Balance DESC;

-- 8.3 Customer(s) having the highest account balance
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    a.AccountID,
    a.Balance
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
WHERE a.Balance = (
    SELECT MAX(Balance)
    FROM Accounts
);

-- 8.4 Transactions above average transaction amount
SELECT
    TransactionID,
    AccountID,
    TransactionType,
    Amount
FROM Transactions
WHERE Amount > (
    SELECT AVG(Amount)
    FROM Transactions
)
ORDER BY Amount DESC;

-- 8.5 Customers who made transactions above average amount
SELECT DISTINCT
    c.CustomerID,
    c.FirstName,
    c.LastName
FROM Customers c
INNER JOIN Accounts a
    ON c.CustomerID = a.CustomerID
WHERE a.AccountID IN (
    SELECT AccountID
    FROM Transactions
    WHERE Amount > (
        SELECT AVG(Amount)
        FROM Transactions
    )
);

-- 8.6 Loans above average loan amount
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount
FROM Loans
WHERE LoanAmount > (
    SELECT AVG(LoanAmount)
    FROM Loans
)
ORDER BY LoanAmount DESC;

-- 8.7 Customer(s) having the largest loan
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    l.LoanType,
    l.LoanAmount
FROM Customers c
INNER JOIN Loans l
    ON c.CustomerID = l.CustomerID
WHERE l.LoanAmount = (
    SELECT MAX(LoanAmount)
    FROM Loans
);

-- 8.8 Customers who have taken a loan
SELECT
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Loans
);

-- 8.9 Customers who have not taken any loan
SELECT
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM Loans
    WHERE CustomerID IS NOT NULL
);

-- 8.10 Customers having a defaulted loan
SELECT
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Loans
    WHERE LoanStatus = 'Defaulted'
);

-- 8.11 Loans with payments above average payment amount
SELECT
    LoanID,
    CustomerID,
    LoanType,
    LoanAmount
FROM Loans
WHERE LoanID IN (
    SELECT LoanID
    FROM LoanPayments
    WHERE PaymentAmount > (
        SELECT AVG(PaymentAmount)
        FROM LoanPayments
    )
);

-- 8.12 Customers with account balance above average
SELECT
    CustomerID,
    FirstName,
    LastName
FROM Customers
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Accounts
    WHERE Balance > (
        SELECT AVG(Balance)
        FROM Accounts
    )
);

-- 8.13 Branches having more accounts than the average branch
SELECT
    b.BranchID,
    b.BranchName
FROM Branches b
WHERE b.BranchID IN (
    SELECT BranchID
    FROM Accounts
    GROUP BY BranchID
    HAVING COUNT(*) > (
        SELECT AVG(Account_Count)
        FROM (
            SELECT COUNT(*) AS Account_Count
            FROM Accounts
            GROUP BY BranchID
        ) x
    )
);

-- 8.14 Customers whose total loan amount is above
-- the average customer loan total
SELECT
    CustomerID,
    SUM(LoanAmount) AS Total_Loan_Amount
FROM Loans
GROUP BY CustomerID
HAVING SUM(LoanAmount) > (
    SELECT AVG(Customer_Loan_Total)
    FROM (
        SELECT
            CustomerID,
            SUM(LoanAmount) AS Customer_Loan_Total
        FROM Loans
        GROUP BY CustomerID
    ) x
)
ORDER BY Total_Loan_Amount DESC;


-- =====================================================
-- 9. ADVANCED BUSINESS ANALYSIS
-- =====================================================

-- 9.1 Customers who have an active loan
-- but have never performed a transaction
SELECT DISTINCT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name
FROM Customers c
INNER JOIN Loans l
    ON c.CustomerID = l.CustomerID
WHERE l.LoanStatus = 'Active'
  AND NOT EXISTS (
      SELECT 1
      FROM Accounts a
      INNER JOIN Transactions t
          ON a.AccountID = t.AccountID
      WHERE a.CustomerID = c.CustomerID
  );

-- 9.2 Customers whose total transaction amount
-- is greater than the average customer transaction total
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    ct.Total_Transaction_Amount
FROM Customers c
INNER JOIN (
    SELECT
        a.CustomerID,
        SUM(t.Amount) AS Total_Transaction_Amount
    FROM Accounts a
    INNER JOIN Transactions t
        ON a.AccountID = t.AccountID
    GROUP BY a.CustomerID
) ct
    ON c.CustomerID = ct.CustomerID
WHERE ct.Total_Transaction_Amount > (
    SELECT AVG(Customer_Total)
    FROM (
        SELECT
            a.CustomerID,
            SUM(t.Amount) AS Customer_Total
        FROM Accounts a
        INNER JOIN Transactions t
            ON a.AccountID = t.AccountID
        GROUP BY a.CustomerID
    ) x
)
ORDER BY ct.Total_Transaction_Amount DESC;

-- 9.3 Customers whose total loan amount
-- is greater than their total account balance
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    ROUND(l.Total_Loan_Amount, 2) AS Total_Loan_Amount,
    ROUND(a.Total_Account_Balance, 2) AS Total_Account_Balance
FROM Customers c
INNER JOIN (
    SELECT
        CustomerID,
        SUM(LoanAmount) AS Total_Loan_Amount
    FROM Loans
    GROUP BY CustomerID
) l
    ON c.CustomerID = l.CustomerID
INNER JOIN (
    SELECT
        CustomerID,
        SUM(Balance) AS Total_Account_Balance
    FROM Accounts
    GROUP BY CustomerID
) a
    ON c.CustomerID = a.CustomerID
WHERE l.Total_Loan_Amount > a.Total_Account_Balance
ORDER BY l.Total_Loan_Amount DESC;

-- 9.4 Branch having the highest average account balance
SELECT
    b.BranchID,
    b.BranchName,
    b.City,
    ROUND(AVG(a.Balance), 2) AS Average_Account_Balance
FROM Branches b
INNER JOIN Accounts a
    ON b.BranchID = a.BranchID
GROUP BY
    b.BranchID,
    b.BranchName,
    b.City
ORDER BY Average_Account_Balance DESC
LIMIT 1;

-- 9.5 Customers who have taken every type
-- of loan offered by the bank
SELECT
    c.CustomerID,
    CONCAT(c.FirstName, ' ', c.LastName) AS Customer_Name,
    COUNT(DISTINCT l.LoanType) AS Loan_Types_Taken
FROM Customers c
INNER JOIN Loans l
    ON c.CustomerID = l.CustomerID
GROUP BY
    c.CustomerID,
    c.FirstName,
    c.LastName
HAVING COUNT(DISTINCT l.LoanType) = (
    SELECT COUNT(DISTINCT LoanType)
    FROM Loans
);


-- =====================================================
-- 10. FINAL BUSINESS REPORT QUERIES
-- =====================================================

-- CUSTOMER PERFORMANCE

-- 10.1 Total customers
SELECT
    COUNT(*) AS Total_Customers
FROM Customers;

-- 10.2 Average customer income
SELECT
    ROUND(AVG(AnnualIncome), 2) AS Average_Customer_Income
FROM Customers;

-- 10.3 Most common occupation
SELECT
    Occupation,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY Occupation
ORDER BY Total_Customers DESC
LIMIT 1;

-- 10.4 City with the highest number of customers
SELECT
    City,
    COUNT(*) AS Total_Customers
FROM Customers
GROUP BY City
ORDER BY Total_Customers DESC
LIMIT 1;

-- ACCOUNT PERFORMANCE

-- 10.5 Total accounts
SELECT
    COUNT(*) AS Total_Accounts
FROM Accounts;

-- 10.6 Total account balance
SELECT
    ROUND(SUM(Balance), 2) AS Total_Account_Balance
FROM Accounts;

-- 10.7 Most popular account type
SELECT
    AccountType,
    COUNT(*) AS Total_Accounts
FROM Accounts
GROUP BY AccountType
ORDER BY Total_Accounts DESC
LIMIT 1;

-- 10.8 Highest account balance
SELECT
    MAX(Balance) AS Highest_Account_Balance
FROM Accounts;

-- TRANSACTION PERFORMANCE

-- 10.9 Total transactions
SELECT
    COUNT(*) AS Total_Transactions
FROM Transactions;

-- 10.10 Total deposits
SELECT
    ROUND(SUM(Amount), 2) AS Total_Deposits
FROM Transactions
WHERE TransactionType = 'Deposit';

-- 10.11 Total withdrawals
SELECT
    ROUND(SUM(Amount), 2) AS Total_Withdrawals
FROM Transactions
WHERE TransactionType = 'Withdrawal';

-- 10.12 Most common transaction type
SELECT
    TransactionType,
    COUNT(*) AS Total_Transactions
FROM Transactions
GROUP BY TransactionType
ORDER BY Total_Transactions DESC
LIMIT 1;

-- 10.13 Most used payment mode
SELECT
    PaymentMode,
    COUNT(*) AS Usage_Count
FROM Transactions
GROUP BY PaymentMode
ORDER BY Usage_Count DESC
LIMIT 1;

-- LOAN PERFORMANCE

-- 10.14 Total loans
SELECT
    COUNT(*) AS Total_Loans
FROM Loans;

-- 10.15 Total loan amount
SELECT
    ROUND(SUM(LoanAmount), 2) AS Total_Loan_Amount
FROM Loans;

-- 10.16 Most popular loan type
SELECT
    LoanType,
    COUNT(*) AS Total_Loans
FROM Loans
GROUP BY LoanType
ORDER BY Total_Loans DESC
LIMIT 1;

-- 10.17 Number of defaulted loans
SELECT
    COUNT(*) AS Defaulted_Loans
FROM Loans
WHERE LoanStatus = 'Defaulted';

-- 10.18 Highest loan amount
SELECT
    MAX(LoanAmount) AS Highest_Loan_Amount
FROM Loans;

-- BRANCH PERFORMANCE

-- 10.19 Branch with the highest number of customers
SELECT
    b.BranchID,
    b.BranchName,
    COUNT(DISTINCT a.CustomerID) AS Total_Customers
FROM Branches b
LEFT JOIN Accounts a
    ON b.BranchID = a.BranchID
GROUP BY
    b.BranchID,
    b.BranchName
ORDER BY Total_Customers DESC
LIMIT 1;

-- 10.20 Branch with the highest account balance
SELECT
    b.BranchID,
    b.BranchName,
    ROUND(SUM(a.Balance), 2) AS Total_Balance
FROM Branches b
INNER JOIN Accounts a
    ON b.BranchID = a.BranchID
GROUP BY
    b.BranchID,
    b.BranchName
ORDER BY Total_Balance DESC
LIMIT 1;

-- 10.21 Branch with the highest loan amount
-- Note:
-- Loans are linked to customers, not directly to branches.
-- This query attributes a customer's loan to the branch
-- where that customer has an account.

SELECT
    b.BranchID,
    b.BranchName,
    ROUND(SUM(l.LoanAmount), 2) AS Total_Loan_Amount
FROM Branches b
INNER JOIN Accounts a
    ON b.BranchID = a.BranchID
INNER JOIN Loans l
    ON a.CustomerID = l.CustomerID
GROUP BY
    b.BranchID,
    b.BranchName
ORDER BY Total_Loan_Amount DESC
LIMIT 1;
