require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:default_balance) { 0 }
  let(:topup_amount) { 50 }
  let(:withdraw_amount) { 10 }
  let(:bad_amount) { 60 }

  it "has a default balance of 0" do
    expect(account.balance).to eq default_balance
  end

  it { is_expected.to respond_to(:make_deposit) }

  it "allows to make a deposit" do
    expect { account.make_deposit(topup_amount) }.to change { account.balance }.by topup_amount
  end

  it { is_expected.to respond_to(:withdraw_funds) }

  it "allows to withdraw some funds from the account" do
    expect { account.withdraw_funds(withdraw_amount) }.to change { account.balance }.by -withdraw_amount
  end

  it "throw an error if no funds left" do
    account.make_deposit(topup_amount)
    account.withdraw_funds(bad_amount)
    expect { account.withdraw_funds(bad_amount) }.to raise_error('no funds available')
  end

end
