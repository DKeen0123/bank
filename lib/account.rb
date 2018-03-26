class Account
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    transaction(['deposit', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  def withdraw(amount)
    @balance -= amount
    transaction(['withdraw', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  def print_statement(statements)
    statements.each do |statement|
      puts "date: #{statement[1]}, credit: #{statement[2]}, debit: 0, balance: #{statement[3]}"
    end
  end

  private

  def transaction(array)
    @statement.push(array)
  end
end
