# bank_tech_test

A simple application that simulates depositing, withdrawing and printing a bank account statement.

## Getting Started

### Installing

You will need to clone this repo and install dependencies (You will need [bundler](http://bundler.io/) for this step.).
In your terminal:

```
git clone https://github.com/DKeen0123/bank
bundle install
```

## Running the tests

The application is unit tested with RSpec. To run the tests, go to the root of the project repo in your terminal and run the command:

```
 rspec
```

## Example usage

the application can be started by going to the root of the directory and running the command 'irb' in the terminal.

example deposits and withdrawals:

```
2.5.0 :001 > account = Account.new
 => #<Account:0x00007fe22c96b980 @balance=0, @statement=#<Statement:0x00007fe22c96b840 @transactions=[]>>
2.5.0 :002 > account.deposit(300)
 => [["deposit", "26/03/2018", 300, 300]]
2.5.0 :003 > account.withdraw(45)
 => [["deposit", "26/03/2018", 300, 300], ["withdraw", "26/03/2018", 45, 255]]
2.5.0 :004 > account.deposit(120)
 => [["deposit", "26/03/2018", 300, 300], ["withdraw", "26/03/2018", 45, 255], ["deposit", "26/03/2018", 120, 375]]
```

and the printed statement:

```
2.5.0 :005 > account.statement.display
date: 26/03/2018, credit: 300, debit: 0, balance: 300
date: 26/03/2018, credit: 0, debit: 45, balance: 255
date: 26/03/2018, credit: 120, debit: 0, balance: 375
```

## My approach

I began by writing out some basic user stories to fulfil the following requirements and acceptance criteria:

### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012 <br >
**And** a deposit of 2000 on 13-01-2012 <br >
**And** a withdrawal of 500 on 14-01-2012 <br >
**When** she prints her bank statement <br >
**Then** she would see

```
date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00
```

the user stories are as follows:

### User stories

```
As a user,
so that I can know how much money I have,
I want to be able to see my balance.

As a user,
so that I can keep my money safe,
I want to be able to deposit into my account.

As a user,
so that I can access my money when I need it,
I want to be able to withdraw from my account balance.

As a user,
so I can see my recent account activity,
I want to see an account statement with past transaction history.
```

### First steps

I diagrammed out what the basic structure would be, deciding on an overall class (first called 'Bank' but later refactored to 'Account') and a statement class to print out the statement as seen in the above acceptance criteria.

I then went about creating the Account class in a TDD manner, first ensuring a readable balance, then a deposit method and a withdraw method which would add to or take away from the balance.

I then created a statement array within the class that has array's given to it when a user deposits or withdraws with the transaction info, in preparation for printing when a user so desires.

I then built a method to print the statement array of arrays in a readable fashion.

### Refactoring

My account object was now responsible for too much, and so to adhere to the single responsibility principle I decided to move the statement responsibility into a separate class.

this new 'Statement' class initializes with an array that has transactions pushed into it by the Account class whenever a user deposits or withdraws. It has the functionality to print these transaction array objects into a readable format.

## Closing thoughts

My printed statement is a little more simplistic than the example given in the acceptance criteria. However, I felt that the things being tested here are my object-oriented design principles and logic/ process, rather than the ability to build a nice looking command line interface.

I did consider extracting the logic that adds to and withdraws from the balance into another class, but felt it was overkill, and would result in more lines of code. Should it need to be extracted in the future, it would be an easy refactor.
