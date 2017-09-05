require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new }
  let(:account) { double :account }


  it { is_expected.to respond_to(:print_all) }
  it { is_expected.to respond_to(:store) }

  it "starts with empty trnsaction log" do
    expect(transaction.history).to eq []
  end

end
