require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:default_balance) { 0 }
  let(:topup_amount) { 50 }
  let(:withdraw_amount) { 10 }

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
end
