require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:transaction_log) { double :transaction_log, history: [record] }

  context "credit" do
    let(:record) { double :record, type: :credit, time: "15:45", amount: 40, balance: 40 }
    let(:body) { "date || credit || debit || balance\n15:45 ||  || 40.00 || 40.00\n" }

    it "receives the method print" do
      expect { statement.print(transaction_log) }.to output(body).to_stdout
    end
  end

  context "debit" do
    let(:record) { double :record, type: :debit, time: "15:45", amount: 40, balance: 40 }
    let(:body) { "date || credit || debit || balance\n15:45 || 40.00 ||  || 40.00\n" }

    it "receives the method print" do
      expect { statement.print(transaction_log) }.to output(body).to_stdout
    end
  end
end
