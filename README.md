## Bank tech test

**Requirements**

- You should be able to interact with your code via a REPL like IRB. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Instructions

```
git clone git@github.com:chuk-chuk/bank_tech_test.git
cd bank_tech_test
bundle install
rspec

```
Open terminal or another REPL, type IRB, then run the following commands:
```
require './lib/account'
transaction_log = TransactionLog.new
account = Account.new(transaction_log)

**** NEXT ****

account.balance
account.make_deposit(10)
account.make_deposit(100)
account.withdraw_funds(15)
account.print_statement

**** OUTPUT ****

date || credit || debit || balance
23:01 || 15.00 ||  || 95.00
23:00 ||  || 100.00 || 110.00
23:00 ||  || 10.00 || 10.00

```

### Approach
I used an OOD and TDD to drive the creation of the application. An account was designed with the ability to deposit, to withdraw and to check the balance of the account.

To keep the logic separate and to follow the Single Responsibility Principle I created a Transaction object, that saves records of all transactions and print them out upon request.

To improve my code even further I would need to break down the print method of the statement class into a few smaller methods (for example, a method that would print a header only and the other one that converts the output to a float).
