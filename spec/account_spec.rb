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

    it 'pushes an array with the type, date, amount deposited and current balance
    into the statement array' do
      time = Time.now.strftime('%d/%m/%Y')
      account.deposit(amount)
      expect(account.statement).to include(['deposit',time, amount, account.balance])
    end
  end

  describe 'withdraw' do
    it 'decreases balance by the amount being withdrawn' do
      amount = 10
      expect { account.withdraw(amount) }.to change { account.balance }.by(-10)
    end
  end
end
