require_relative 'seed_class'

# StorageTime
class StorageTimeSeed < SeedClass

  def initialize(received_datetime)
    @duration_time = generate_time(1800, 3800) # TODO: CHECK VALUES
    @start_time = add_time(received_datetime, generate_time(1, 120), 'minutes')
    @storage_date = received_datetime
    @event = [true, false].sample
  end

  def final_timestamp
    @start_time + @duration_time.seconds
  end

end