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
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
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
