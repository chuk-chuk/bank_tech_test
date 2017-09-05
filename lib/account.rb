require_relative 'transaction'
class Account
  attr_reader :balance, :type, :history, :transaction

  def initialize(transaction)
    @balance = 0
    @transaction = transaction
    @type = " "
  end

  def make_deposit(amount)
    @balance += amount
    transaction.store(time_format, amount, type, balance)
  end

  def withdraw_funds(amount)
    raise 'no funds available' if @balance < amount
    @balance -= amount
    transaction.store(time_format, type, amount, balance)
  end

  private

  def time_format
    Time.now.strftime("%H:%M")
  end

end
