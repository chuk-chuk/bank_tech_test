require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new(account)}
  let(:account) { double :account }

  it { is_expected.to respond_to(:deposit) }
  it { is_expected.to respond_to(:withdraw) }
  it { is_expected.to respond_to(:print_all) }

end
