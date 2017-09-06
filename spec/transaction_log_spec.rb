require 'transaction_log'

describe TransactionLog do
  subject(:transaction_log) { described_class.new }
  let(:account) { double :account }
  let(:time) { Time.now.strftime("%H:%M") }
  let(:type) { 'credit' }
  let(:amount) { 50 }
  let(:balance) { 60 }

  it { is_expected.to respond_to(:store) }

  it "starts with empty trnsaction log" do
    expect(transaction_log.history).to eq []
  end

  it "can store a new record" do
    transaction_log.store(amount, type, balance)
    expect(transaction_log.history).not_to be_empty
  end

end
