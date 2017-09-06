require 'transaction_log'

describe TransactionLog do
  subject(:transaction_log) { described_class.new }
  let(:account) { double :account }


  it { is_expected.to respond_to(:print_all) }
  it { is_expected.to respond_to(:store) }

  it "starts with empty trnsaction log" do
    expect(transaction_log.history).to eq []
  end

end
