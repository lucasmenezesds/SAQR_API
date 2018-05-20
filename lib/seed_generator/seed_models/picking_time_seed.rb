require_relative 'seed_class'

class PickingTimeSeed < SeedClass
  def initialize(received_datetime)
    @duration_time = generate_time(1800, 3800) # TODO: CHECK VALUES
    @start_time = add_time(received_datetime, generate_time(1, 120), 'minutes')
    @number_of_items = rand(100..4000)
    @number_of_items_type = rand(1..10)
    @picking_date = received_datetime
    @event = [true, false].sample
  end

  def final_timestamp
    @picking_date + @duration_time.seconds
  end
end