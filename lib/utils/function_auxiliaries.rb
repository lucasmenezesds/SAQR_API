require 'active_support/core_ext/string/inflections'
require_relative '../../lib/statistical_libs/exponential_functions'


def get_statistical_function_class(function_name)
  existing_functions = %w[exponential lognormal gamma weibull]
  if (function_name.class == String) && existing_functions.include?(function_name.downcase)
    function_name.capitalize!
    return "#{function_name}Functions".constantize
  end
  raise(ArgumentError, 'The name passed as parameter is invalid')
rescue ArgumentError => e
  raise(ArgumentError, "Check #get_statistical_function_class condition: #{e}")
end