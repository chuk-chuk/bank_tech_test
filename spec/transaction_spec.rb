require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new }

  it "initialised empty" do
    expect(transaction.history).to eq []
  end

end
