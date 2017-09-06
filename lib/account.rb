require_relative 'transaction_log'
require_relative 'record'
require_relative 'statement'

class Account
  attr_reader :balance, :transaction_log, :history, :type, :statement

  def initialize(transaction_log, statement = Statement)
    @balance = 0
    @transaction_log = transaction_log
    @statement = statement
  end

  def make_deposit(amount)
    @balance += amount
    transaction_log.store(:credit, amount, balance)
  end

  def withdraw_funds(amount)
    raise 'no funds available' if @balance < amount
    @balance -= amount
    transaction_log.store(:debit, amount, balance)
  end

  def print_statement
    statement.new.print(transaction_log)
  end
end
