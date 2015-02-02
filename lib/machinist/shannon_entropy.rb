module Machinist
  class ShannonEntropy
    def self.call(probability)
     -1 * probability * Math.log(probability, 2)
    end
  end
end
