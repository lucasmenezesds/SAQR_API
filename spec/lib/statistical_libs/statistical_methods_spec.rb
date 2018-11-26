require_relative '../../../lib/statistical_libs/statistical_methods'
require_relative '../../../spec/fixtures/lib/statistical_libs/general_mocks'
require_relative '../../../spec/fixtures/lib/statistical_libs/exponential_functions_mocks'

describe StatisticalMethods do

  let(:statistical_methods) { described_class.new }
  let(:sample, &method(:set_general_sample))


  describe '#calculate_ecdf' do
    let(:calculated_ecdf) { statistical_methods.calculate_ecdf(sample) }

    it 'should return an Hash with 2 keys' do
      number_of_keys = calculated_ecdf.keys.length

      expect(number_of_keys).to eql(2)
    end

    it 'should return the expected X values' do
      expected_value = set_linspace_result_from_sample
      result = calculated_ecdf['x_values']

      expect(result).to eql expected_value
    end

    it 'should return the expected Y values' do
      expected_value = [0.05, 0.2, 0.25, 0.35, 0.4, 0.45, 0.55, 0.6, 0.6, 0.6,
                        0.65, 0.65, 0.7, 0.7, 0.75, 0.8, 0.8, 0.85, 0.95, 1.0]
      result = calculated_ecdf['y_values']

      expect(result).to eql expected_value
    end
  end
end