require 'utils/csv_parser'

puts '#### Populating Cities Table ####'
# cities_csv_path = File.join()
csv_parser = CsvParser.new(Rails.root)
cities = csv_parser.to_array_of_hashes(csv_parser.parse_file('db/data/cities.csv'))

cities.each do |city|
  City.create!(city)
end
puts '#### DONE - Populating Cities Table ####'