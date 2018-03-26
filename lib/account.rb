require 'statement'

class Account
  attr_reader :balance, :statement

  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
  end

  def deposit(amount)
    @balance += amount
    transaction(['deposit', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  def withdraw(amount)
    @balance -= amount
    transaction(['withdraw', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  private

  def transaction(array)
    @statement.push(array)
  end
end
