class Account
  attr_reader :balance, :statement, :calculator

  def initialize(statement = Statement.new, calculator = Calculator.new)
    @balance = 0
    @statement = statement
    @calculator = calculator
  end

  def deposit(amount)
    @balance = @calculator.add([@balance, amount])
    transaction(['deposit', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  def withdraw(amount)
    @balance = @calculator.subtract([@balance, amount])
    transaction(['withdraw', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  private

  def transaction(array)
    @statement.transactions.push(array)
  end
end
