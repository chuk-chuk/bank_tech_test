class Transaction
  attr_reader :history

  def initialize
    @history = []
  end

  def store(time_format, amount, type, balance)
    @history.push([time_format, amount, type, balance])
  end

  def print_all
    puts "date || credit || debit || balance"
    @history.reverse.each do |row|
      puts "#{row[0]} || #{row[1].to_f} || #{row[2].to_f} || #{'%.2f' % row[3]}"
    end
  end

end
