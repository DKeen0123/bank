require 'calculator'

describe Calculator do
  subject(:calculator) { described_class.new }

  describe '#add' do
    it 'takes two numbers and adds them together' do
      expect(calculator.add([1, 4])).to eq 5
    end
  end

  describe '#subtract' do
    it 'takes two numbers and subtracts the last from the first' do
      expect(calculator.subtract([4, 1])).to eq 3
    end
  end
end
