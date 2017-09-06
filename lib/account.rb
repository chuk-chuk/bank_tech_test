require_relative 'transaction_log'
require_relative 'record'

class Account
  attr_reader :balance, :transaction_log, :history, :type

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
    transaction_log.history.reverse.each do |record|
      if record.type == :credit
        puts "#{record.time} ||  || #{'%.2f' % record.amount} || #{'%.2f' % record.balance}"
      else
        puts "#{record.time} || #{'%.2f' % record.amount} ||  || #{'%.2f' % record.balance}"
      end
    end
  end
end
