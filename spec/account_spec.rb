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
    it 'increases balance by the amount being deposited' do
      amount = 10
      expect { account.deposit(amount) }.to change { account.balance }.by 10
    end
  end

  describe 'withdraw' do
    it 'decreases balance by the amount being withdrawn' do
      amount = 10
      expect { account.withdraw(amount) }.to change { account.balance }.by(-10)
    end
  end
end
