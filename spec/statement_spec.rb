require 'statement'

describe Statement do
  subject(:statement) { described_class.new }

  describe 'initialize' do
    it 'initializes with an empty array of transactions' do
      expect(statement.transactions).to eq []
    end
  end
end
