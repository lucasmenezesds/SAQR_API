require_relative '../../../lib/statistical_libs/kolmogorov_smirnov_steps'

describe KolmogorovSmirnovSteps do

  let(:kolmogorov_steps) {
    return KolmogorovSmirnovSteps.new
  }

  let(:array_of_numbers) {
    return [12_296, 13_011, 12_008, 12_927, 14_874, 15_204, 14_694, 14_575, 13_415, 13_771]
  }

  let(:calculated_ecdf) { return kolmogorov_steps.calculate_ecdf(array_of_numbers) }


  describe '#calculate_ecdf' do
    it 'should return an Hash with 2 keys' do

      number_of_keys = calculated_ecdf.keys.length

      expect(number_of_keys).to eql(2)
    end

    it 'should return the expected X values' do
      expected_value = [12_008.0, 12_363.111111111111, 12_718.222222222223, 13_073.333333333334,
                        13_428.444444444445, 13_783.555555555555, 14_138.666666666666,
                        14_493.777777777777, 14_848.888888888889, 15_204.0]

      result = calculated_ecdf['x_values']

      expect(result).to eql expected_value

    end

    it 'should return the expected Y values' do
      expected_value = [0.1, 0.2, 0.2, 0.4, 0.5, 0.6, 0.6, 0.6, 0.8, 1.0]

      result = calculated_ecdf['y_values']

      expect(result).to eql expected_value
    end
  end

end