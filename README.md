## Bank tech test

**Requirements**

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Instructions

```
git clone git@github.com:chuk-chuk/bank_tech_test.git
cd bank_tech_test
bundle install
```
Open terminal or another REPL, type the following commands:
```
require './lib/account’
record = Transaction.new
account = Account.new(record)

**** NEXT *****

account.balance
account.make_deposit(20)
account.withdraw_funds(10)
record.print_all

**** OUTPUT *****

date || credit || debit || balance
16:33 || 10.0 || 0.0 || 10.00
16:33 || 0.0 || 20.0 || 20.00

```

### Approach
I used an OOD and TDD to drive the creation of the application. An account was designed with the ability to deposit, to withdraw and to check the balance. On top of the requirements I added an error message display if there are no sufficient funds available. To keep the logic separate, I created a Transaction object, that keeps records of all transactions and print them out upon request. 
