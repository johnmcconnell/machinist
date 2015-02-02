require 'spec_helper'

describe Machinist::Table do
  let(:value_rows) do
    [
      [:green, 10, 5],
      [:blue, 3, 6],
      [:red, 5, 1]
    ]
  end

  let(:head_row) do
    [:color, :weight, :size]
  end

  let(:rows) do
    [head_row] + value_rows
  end

  let(:hashed_value) do
    value_rows.map do |row|
      { color: row[0], weight: row[1], size: row[2] }
    end
  end

  subject do
    described_class.new(rows: rows)
  end

  describe '#head_row' do
    it 'returns the first row' do
      expect(subject.head_row).to eq rows[0]
    end
  end

  describe '#value_rows' do
    it 'returns the remaining rows' do
      expect(subject.value_rows).to eq rows[1..-1]
    end
  end

  describe '#to_h' do
    it 'returns hashes representing the rows' do
      expect(subject.to_h).to eq hashed_value
    end
  end
end
