require_relative 'record'

class TransactionLog
  attr_reader :history, :record, :amount, :balance, :type

  def initialize(record = Record)
    @history = []
    @record = record
  end

  def store(amount, type, balance)
    @history << record.new(time_format, amount, type, balance)
  end

  private
  def time_format
    Time.now.strftime("%H:%M")
  end
end
