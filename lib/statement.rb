require_relative 'transaction_log'

class Statement

  attr_reader :history, :transaction_log

  def print(transaction_log)
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
