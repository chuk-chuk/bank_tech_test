require_relative 'transaction_log'
require_relative 'record'

class Account
  attr_reader :balance, :transaction_log

  def initialize(transaction_log)
    @balance = 0
    @transaction_log = transaction_log
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

  def print_all
    puts "date || credit || debit || balance"
    @history.reverse.each do |row|
      puts "#{row[0]} || #{row[1].to_f} || #{row[2].to_f} || #{'%.2f' % row[3]}"
    end
  end
end
