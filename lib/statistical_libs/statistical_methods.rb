require_relative '../../lib/utils/numo_and_array_utils'

# Class that contains  all generic statistical methods
class StatisticalMethods

  # Empiric CDF based on received data array
  def calculate_ecdf(array_of_numbers)
    final_result = {}
    raw_data = array_of_numbers
    raw_data_size = raw_data.size
    array_of_uniq_numbers = array_of_numbers.uniq

    min, max, size = get_numo_array_data array_of_uniq_numbers

    x_values = Numo::DFloat.linspace(min, max, size)
    final_result['x_values'] = x_values.to_a
    y_values = []

    x_values.each do |current_value|
      temp = raw_data.select { |item| item <= current_value }
      value = temp.size / raw_data_size.to_f
      y_values.push(value)
    end
    final_result['y_values'] = y_values

    final_result
  end
end