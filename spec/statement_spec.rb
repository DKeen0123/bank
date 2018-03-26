require 'statement'

describe Statement do
  subject(:statement) { described_class.new }

  describe 'initialize' do
    it 'initializes with an empty array of transactions' do
      expect(statement.transactions).to eq []
    end
  end

  describe 'print_statement' do
    date =  Time.now.strftime('%d/%m/%Y')
    amount = 10
    it 'prints a deposit statement in a user-friendly format' do
      deposit = ['deposit', date, amount, amount]
      statement.transactions.push(deposit)
      expect { statement.display(statement.transactions) }.to output(
        "date: #{date}, credit: #{amount}, debit: 0, balance: #{amount}\n"
      ).to_stdout
    end
  end
end
