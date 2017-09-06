require_relative 'transaction_log'

class Account
  attr_reader :balance, :type, :transaction_log

  def initialize(transaction_log)
    @balance = 0
    @transaction_log = transaction_log
    @type = " "
  end

  def make_deposit(amount)
    @balance += amount
    transaction_log.store(time_format, amount, type, balance)
  end

  def withdraw_funds(amount)
    raise 'no funds available' if @balance < amount
    @balance -= amount
    transaction_log.store(time_format, type, amount, balance)
  end

  private

  def time_format
    Time.now.strftime("%H:%M")
  end
end
