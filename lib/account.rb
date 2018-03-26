class Account
  attr_reader :balance, :statement, :calculator

  def initialize(statement = Statement.new, calculator = Calculator.new)
    @balance = 0
    @statement = statement
    @calculator = calculator
  end

  def deposit(amount, time = Time.now.strftime('%d/%m/%Y'))
    @balance = @calculator.add([balance, amount])
    transaction(['deposit', time, amount, balance])
  end

  def withdraw(amount, time = Time.now.strftime('%d/%m/%Y'))
    @balance = @calculator.subtract([@balance, amount])
    transaction(['withdraw', time, amount, @balance])
  end

  private

  def transaction(array)
    @statement.transactions.push(array)
  end
end
