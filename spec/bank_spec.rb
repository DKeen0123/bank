require 'bank'

describe Bank do
  subject(:bank) { described_class.new }

  describe 'initialize' do
    it 'initializes with a balance of 0' do
      expect(bank.balance).to eq 0
    end
  end

  describe 'deposit' do
    it 'increases balance by the amount being deposited' do
      amount = 10
      expect { bank.deposit(amount) }.to change { bank.balance }.by 10
    end
  end

  describe 'withdraw' do
    it 'decreases balance by the amount being withdrawn' do
      amount = 10
      expect { bank.withdraw(amount) }.to change { bank.balance }.by(-10)
    end
  end
end
