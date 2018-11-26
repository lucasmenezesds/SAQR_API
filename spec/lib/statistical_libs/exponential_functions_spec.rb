require 'rspec'
require_relative '../../../lib/statistical_libs/exponential_functions'
require_relative '../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../spec/fixtures/lib/statistical_libs/exponential_functions_mocks'

describe ExponentialFunctions do
  let(:expo_functions) do
    described_class.new
  end
  let(:sample, &method(:set_general_sample))

  let(:mle_result) do
    { sumup: 346_557.0,
      size: 20,
      mean: 17_327.85,
      lambda: 0.000057710564207330976 }
  end

  describe '#calculate_mle' do
    it 'should return an hash with the expected keys and values' do
      result = expo_functions.calculate_mle(sample)

      expect(result).to eql(mle_result)
    end
  end

  describe '#calculate_theoretical_cdf' do
    #todo check it
    it 'should return an array with the expected cdf values' do
      expected_result = set_expected_theoretical_cdf_result

      result = expo_functions.calculate_theoretical_cdf(sample, mle_result[:lambda])
      expect(result).to match_array(expected_result)
    end
  end

  describe '#generate_theoretical_cdf' do
    #TODO check it
    it 'should return an array with the generated theoretical cdf' do
      expected_result = set_expected_theoretical_cdf_result
      result = expo_functions.generate_theoretical_cdf(sample)

      expect(result).to match_array(expected_result)
    end
  end

end