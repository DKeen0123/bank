require 'account'

describe Account do
  let(:statement) { double 'statement', transactions: [] }
  let(:calculator) { double 'calculator' }
  subject(:account) { described_class.new(statement, calculator) }

  describe 'initialize' do
    it 'initializes with a balance of 0' do
      expect(account.balance).to eq 0
    end

    it 'initializes with a statement object' do
      expect(account.statement).to eq statement
    end

    it 'initializes with a calculator object' do
      expect(account.calculator).to eq calculator
    end
  end

  describe 'deposit' do
    amount = 10
    before(:each) do
      allow(calculator).to receive(:add) {[0, 10]}.and_return 10
    end

    it 'increases balance by the amount being deposited' do
      expect { account.deposit(amount) }.to change { account.balance }.by 10
    end

    it 'pushes an array with the type, date, amount deposited and current
    balance into the statements transactions array' do
      date = '06/06/2018'
      account.deposit(amount, date)
      expect(account.statement.transactions).to include(
        ['deposit', date, amount, account.balance]
      )
    end
  end

  describe 'withdraw' do
    amount = 10
    before(:each) do
      allow(calculator).to receive(:subtract) {[0, 10]}.and_return(-10)
    end

    it 'decreases balance by the amount being withdrawn' do
      date = '06/06/2018'
      expect { account.withdraw(amount, date) }.to change { account.balance }.by(-10)
    end

    it 'pushes an array with the type, date, amount withdrawn and current
    balance into the statement array' do
      date = Time.now.strftime('%d/%m/%Y')
      account.withdraw(amount)
      expect(account.statement.transactions).to include(
        ['withdraw', date, amount, account.balance]
      )
    end
  end
end
