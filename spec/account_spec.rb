require 'account'

describe Account do
  subject(:account) { described_class.new(transaction) }
  let(:transaction) { double :transaction, store: nil }
  let(:default_balance) { 0 }
  let(:topup_amount) { 50 }
  let(:withdraw_amount) { 10 }
  let(:bad_amount) { 60 }
  let(:time) { Time.now.strftime("%H:%M") }

  context "initial setup" do

    it "has a default balance of 0" do
      expect(account.balance).to eq default_balance
    end

    it { is_expected.to respond_to(:withdraw_funds) }
    it { is_expected.to respond_to(:make_deposit) }

  end

  context "transactions tracking" do
    before :each { account.make_deposit(topup_amount) }

    it "records a deposit transaction into history log" do
      expect(transaction).to receive(:store)
      account.make_deposit(topup_amount)
    end

    it "records a deposit transaction into history log" do
      expect(transaction).to receive(:store)
      account.withdraw_funds(withdraw_amount)
    end

  end

  it "allows to make a deposit" do
    expect { account.make_deposit(topup_amount) }.to change { account.balance }.by topup_amount
  end

  it "allows to withdraw some funds from the account" do
    account.make_deposit(topup_amount)
    expect { account.withdraw_funds(withdraw_amount) }.to change { account.balance }.by -withdraw_amount
  end

  it "throw an error if no funds left" do
    expect { account.withdraw_funds(bad_amount) }.to raise_error 'no funds available'
  end

end
