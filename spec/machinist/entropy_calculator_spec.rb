require 'spec_helper'

describe Machinist::EntropyCalculator do
  let(:rows) do
    [
      [:color, :weight, :size],
      [:green, 10, 5],
      [:blue, 3, 6],
      [:red, 12, 5]
    ]
  end

  let(:data) do
    Machinist::Table.new(rows: rows).to_h
  end

  let(:a_thousandth) do
    0.001
  end

  subject do
    described_class.new(data: data, entropy_function: Machinist::ShannonEntropy)
  end

  describe '#entropy' do
    it 'returns the entropy of the full data set' do
      expect(subject.entropy(class_label: :color)).to be_within(a_thousandth).of 1.58496
    end
  end

  describe '#split_entropy' do
    it 'returns entropy after parameterizing by split label' do
      expect(subject.split_entropy(split_label: :size, class_label: :color)).to eq 0
    end
  end
end
