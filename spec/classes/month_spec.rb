require 'spec_helper'

describe Month do
  describe '.days' do
    let(:month) { 5 }

    it 'should be a number of days 31 or under' do
      expect(Month.days(month)).to eq(30)
    end
  end

  describe '.days_left' do
    before do
      expect(Month).to receive(:days).and_return(30)
      expect(Month).to receive(:day).and_return(21)
    end

    it 'should have 18 days left' do
      expect(Month.days_left).to eq(9)
    end
  end
end
