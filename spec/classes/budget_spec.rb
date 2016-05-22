require 'spec_helper'

describe Budget do
  let(:reg) { Register.new }
  subject { Budget.new(name: :alcohol, total: 250) }

  describe '#remaining' do
    before do
      reg << Debit.new(category: :alcohol, total: 54)
      reg << Debit.new(category: :alcohol, total: 21)
      reg << Debit.new(category: :kitchen, total: 12)
    end

    it 'should subtract Debits and add Credits' do
      expect(subject.remaining(reg)).to eq(175)
    end
  end

  describe '#remaining_per_day' do
    before do
      reg << Debit.new(category: :alcohol, total: 54)
      reg << Debit.new(category: :alcohol, total: 21)
      reg << Debit.new(category: :kitchen, total: 12)
    end

    it 'should divide remaining funds by remaining days' do
      expect(Month).to receive(:days_left).and_return(15)
      expect(subject.remaining_per_day(reg)).to eq(11.67)
    end

    it 'should divide remaining funds by remaining days' do
      expect(Month).to receive(:days_left).and_return(5)
      expect(subject.remaining_per_day(reg)).to eq(35)
    end
  end
end
