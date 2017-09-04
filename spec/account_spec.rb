require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:default_balance) { 0 }

  it "has a default balance of 0" do
    expect(account.balance).to eq default_balance
  end

end
