class Statement
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def display(transactions=@transactions)
    transactions.each do |transaction|
      if transaction[0] == 'deposit'
        puts "date: #{transaction[1]}, credit: #{transaction[2]}, debit: 0, balance: #{transaction[3]}"
      else
        puts "date: #{transaction[1]}, credit: 0, debit: #{transaction[2]}, balance: #{transaction[3]}"
      end
    end
  end

end
