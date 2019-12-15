require 'utils/csv_parser'

csv_parser = CsvParser.new(Rails.root)

puts '[START] Distribution Methods Populator'
if 1 <= 0 #TODO: ADD Condition based on model distributions_methods
  distributions_methods = csv_parser.parse_file('db/data/distributions_methods.csv')

  #TODO: ADD model

  puts '#### DONE - Populating Distributions Methods Table ####'
else
  puts '#### NOTE - Distributions Methods Table was already populated! ####'
end

if 1 <= 0 #TODO: ADD Condition based on model distributions_parameters
  distributions_methods = csv_parser.parse_file('db/data/distributions_parameters.csv')

  #TODO: ADD model

  puts '#### DONE - Populating Distributions Parameters Table ####'
else
  puts '#### NOTE - Distributions Parameters Table was already populated! ####'
end

puts '[DONE] Distribution Methods Populator'