require 'rspec'
require_relative '../../../lib/statistical_libs/exponential_functions'

describe ExponentialFunctions do
  let(:expo_functions) do
    described_class.new
  end
  let(:sample) do
    [6689, 10_905, 7048, 27_851, 26_230,
     32_731, 5280, 32_802, 15_249, 11_811,
     5208, 14_458, 32_378, 20_880, 9214,
     5276, 8527, 24_170, 35_679, 14_171]
  end

  describe '#calculate_mle' do
    it 'should return an hash with the expected keys and values' do
      expected_result = { sumup: 346_557.0, size: 20, average: 17_327.85 }

      result = expo_functions.calculate_mle(sample)

      expect(result).to eql(expected_result)
    end
  end
end