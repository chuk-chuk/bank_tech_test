class Account
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def make_deposit(amount)
    @balance += amount
  end

  def withdraw_funds(amount)
    @balance -= amount
  end

end
