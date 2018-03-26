require 'calculator'

describe Calculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'takes two numbers and adds them together' do
      expect(calculator.add(1, 4)).to eq 5
    end
  end
end
