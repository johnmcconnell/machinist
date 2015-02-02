module Machinist
  class EntropyCalculator
    reader_struct :data, :entropy_function

    def split_entropy(params)
      split_sets = data.group_by { |datum| datum[params[:split_label]] }
      split_sets.values.inject(0) do |sum, split_set|
        sum + (split_set.size / data.size.to_f) * entropy_of(split_set, params[:class_label])
      end
    end

    def entropy(params)
      entropy_of(data, params[:class_label])
    end

    def information_gain(params)
      entropy(params) - split_entropy(params)
    end

    protected

    def probability(x, y)
      x / y.to_f
    end

    def entropy_of(full_set, label)
      split_sets = full_set.group_by { |datum| datum[label] }
      split_sets.values.inject(0) do |sum, split_set|
        sum + entropy_function.call(probability(split_set.size, full_set.size))
      end
    end
  end
end
