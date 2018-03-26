class Account
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    @statement.push(['deposit', Time.now.strftime('%d/%m/%Y'), amount, @balance])
  end

  def withdraw(amount)
    @balance -= amount
  end
end
