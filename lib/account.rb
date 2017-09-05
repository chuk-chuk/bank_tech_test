class Account
  attr_reader :balance, :history, :type

  DEFAULT_BALANCE = 0

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @history = []
    @type = " "
  end

  def make_deposit(amount)
    @balance += amount
    @history.push([time_format, amount, type, balance])
  end

  def withdraw_funds(amount)
    raise 'no funds available' if @balance < DEFAULT_BALANCE
    @balance -= amount
    @history.push([time_format, type, amount, balance])
  end

  def all_transactions
    puts "date || credit || debit || balance"
    @history.reverse.each do |row|
      puts "#{row[0]} || #{row[1].to_f} || #{row[2].to_f} || #{'%.2f' % row[3]}"
    end
  end

  private

  def time_format
    Time.now.strftime("%H:%M")
  end

end
