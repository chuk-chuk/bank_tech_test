require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:transaction_log) { TransactionLog.new }
  before { allow(Time).to receive(:now).and_return(Time.mktime(2017,1,1,15,45)) }

  context "credit" do
    before { transaction_log.store(40, :credit, 40) }
    let(:body) { "date || credit || debit || balance\n15:45 ||  || 40.00 || 40.00\n" }

    it "receives the method print" do
      expect { statement.print(transaction_log) }.to output(body).to_stdout
    end
  end

  context "debit" do
    before { transaction_log.store(40, :debit, 40) }
    let(:body) { "date || credit || debit || balance\n15:45 || 40.00 ||  || 40.00\n" }

    it "receives the method print" do
      expect { statement.print(transaction_log) }.to output(body).to_stdout
    end
  end
end
