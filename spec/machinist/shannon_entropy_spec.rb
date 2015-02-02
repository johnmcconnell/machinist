require 'spec_helper'

describe Machinist::ShannonEntropy do
  let(:probability) do
    0.5
  end

  let(:a_thousandth) do
    0.001
  end

  let(:the_correct_value) do
    0.5
  end

  subject do
    described_class
  end

  describe 'call' do
    it 'returns shannon entropy' do
      expect(
        subject.call(probability)
      ).to be_within(a_thousandth).of the_correct_value
    end
  end
end
