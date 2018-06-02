require_relative 'seed_class'

class TransportationTimeSeed < SeedClass

  def initialize(received_datetime, number_of_cities)
    @duration_time = generate_time(1800, 3600) # TODO: CHECK VALUES
    @start_time = add_time(received_datetime, generate_time(1, 120), 'minutes')
    @transportation_date = received_datetime
    @origin_city_id = nil
    @destination_city_id = nil
    @distance = nil
    @event = [true, false].sample

    populate_cities_origin_dest(number_of_cities)
  end

  def generate_cities(number_of_cities, origin_city = false)
    return rand(1..number_of_cities) unless origin_city
    generated_city = rand(1..number_of_cities)
    while generated_city == origin_city
      generated_city = rand(1..number_of_cities)
    end
    generated_city
  end

  def final_timestamp
    @start_time + @duration_time.seconds
  end

  def populate_cities_origin_dest(number_of_cities)
    origin = generate_cities(number_of_cities)
    destination = generate_cities(number_of_cities, @origin_city)
    # TODO: Develop distance model etc gettings from the google_maps_consumer
  end


end