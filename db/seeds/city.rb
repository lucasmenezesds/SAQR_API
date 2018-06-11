require 'utils/csv_parser'

csv_parser = CsvParser.new(Rails.root)

if City.count <= 0
  puts '#### Populating Cities Table ####'
  cities = csv_parser.to_array_of_hashes(csv_parser.parse_file('db/data/cities.csv'))

  cities.each do |city|
    City.create!(city)
  end
  puts '#### DONE - Populating Cities Table ####'
else
  puts '#### NOTE - City Tables was already populated! ####'
end