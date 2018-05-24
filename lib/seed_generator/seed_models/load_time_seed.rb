require_relative 'seed_class'

# LoadTime
class LoadTimeSeed < SeedClass
  def initialize(received_datetime)
    @duration_time = generate_time(1800, 3800) # TODO: CHECK VALUES
    @start_time = add_time(received_datetime, generate_time(1, 120), 'minutes')
    @event = [true, false].sample
    @load_date = received_datetime
  end

  def final_timestamp
    @start_time + @duration_time.seconds
  end
end