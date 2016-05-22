require 'spec_helper'

describe Register do
  let(:t1) { Debit.new(payee: 'Haley', category: :alcohol, total: 15)}
  let(:t2) { Debit.new(payee: 'Target', category: :groceries, total: 54)}
  let(:t3) { Debit.new(payee: '7-11', category: :alcohol, total: 12.52)}
  let(:t4) { Debit.new(payee: 'Bank of America', category: :credit_card, total: 336.54)}

  subject { Register.new }

  describe '#all_transactions' do
    before do
      subject.transactions << t1
      subject.transactions << t2
      subject.transactions << t3
    end

    it 'should return all transactions with matching category' do
      expect(subject.with_category(:alcohol)).to eq([t1,t3])
    end
  end

  describe '#<<' do
    context 'when pushing a Transaction' do
      it 'should add a transaction to the register' do
        subject << t4
        expect(subject.transactions).to satisfy do |transactions|
          transactions.include?(t4)
        end
      end
    end

    context 'when pushing a non-Transaction' do
      let(:str) {'Hey it\'s me'}
      it 'should discard the data' do
        subject << str
        expect(subject.transactions).to_not include(str)
      end
    end
  end
end
