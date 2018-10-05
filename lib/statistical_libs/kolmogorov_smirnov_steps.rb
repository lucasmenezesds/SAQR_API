require 'numo/narray'
require_relative '../../lib/utils/numo_array_utils'

# Class
class KolmogorovSmirnovSteps


  def get_numo_array_data(received_array)

    min = received_array.min
    max = received_array.max
    size = received_array.size

    [min, max, size]
  end


  def calculate_ecdf(array_of_numbers)
    final_result = {}
    raw_data = array_of_numbers
    data_size = raw_data.size

    array_of_uniq_numbers = array_of_numbers.uniq
    numo_dfloat_array = convert_array_to_narray array_of_uniq_numbers

    x_cdf = numo_dfloat_array.shape

    min, max, size = get_numo_array_data x_cdf

    x_values = Numo::DFloat.linspace(min, max, size)
    final_result['x_values'] = x_values.to_a
    y_values = []

    x_values.each do |current_value|
      # TODO: get the elements that are smaller than the current value
      # temp = raw_data[raw_data <= current_value]
      temp = []
      value = temp.size / data_size
      y_values.push(value)
    end

    final_result['y_values'] = y_values

    final_result
  end
end