require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe 'initialize' do
    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'initializes with an empty statement array' do
      expect(account.statement).to eq []
    end
  end

  describe 'deposit' do
    amount = 10

    it 'increases balance by the amount being deposited' do
      expect { account.deposit(amount) }.to change { account.balance }.by 10
    end

    it 'pushes an array with the type, date, amount deposited and current
    balance into the statement array' do
      date = Time.now.strftime('%d/%m/%Y')
      account.deposit(amount)
      expect(account.statement).to include(
        ['deposit', date, amount, account.balance]
      )
    end
  end

  describe 'withdraw' do
    amount = 10

    it 'decreases balance by the amount being withdrawn' do
      expect { account.withdraw(amount) }.to change { account.balance }.by(-10)
    end

    it 'pushes an array with the type, date, amount withdrawn and current
    balance into the statement array' do
      date = Time.now.strftime('%d/%m/%Y')
      account.withdraw(amount)
      expect(account.statement).to include(
        ['withdraw', date, amount, account.balance]
      )
    end
  end

  describe 'print_statement' do
    amount = 10
    date = Time.now.strftime('%d/%m/%Y')

    it 'takes an array of arrays and prints them in a readable format' do
      account.deposit(amount)
      expect { account.print_statement(account.statement) }.to output(
        "date: #{date}, credit: #{amount}, debit: 0, balance: #{account.balance}\n"
      ).to_stdout
    end
  end
end
