require 'record'

describe Record do
  subject(:record) { described_class.new(time, amount, type, balance)}
  let(:time) { Time.now.strftime("%H:%M") }
  let(:type) { :credit }
  let(:amount) { 50 }
  let(:balance) { 60 }

  it "initialized with time" do
    expect(subject.time).to eq time
  end

  it "initialized with type" do
    expect(subject.type).to eq type
  end

  it "initialized with amount" do
    expect(subject.amount).to eq amount
  end

  it "initialized with balance" do
    expect(subject.balance).to eq balance
  end
end
