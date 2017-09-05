class Transaction
  attr_reader :account

  def initialize(account)
    @account = account
  end

  def deposit(amount)
    @account.make_deposit(amount)
  end

  def withdraw(amount)
    @account.withdraw_funds(amount)
  end

  def print_all
    @account.all_transactions
  end
end
