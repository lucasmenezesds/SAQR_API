require_relative 'seed_class'

class DeliverySeed < SeedClass
  def initialize(received_hash = {})

    @picking_time = received_hash.fetch('picking_time')
    @load_time = received_hash.fetch('load_time')
    @transportation_time = received_hash.fetch('transportation_time')
    @receive_time = received_hash.fetch('receive_time')
    @storage_time = received_hash.fetch('storage_time')
    @delivery_date = received_hash.fetch('delivery_date') # TODO: It need to be the first to
    # be created and the others(picking_time date etc)will be based on this date
    @total_duration = sum_durations
  end

  def delivery_time
    @delivery_date
  end

  def sum_durations
    total_duration = 0
    [@picking_time, @load_time, @transportation_time, @receive_time, @storage_time].each do |model_obj|
      if model_obj['duration_time'].class == Integer
        total_duration += model_obj.duration_time
      else
        throw('Something went wrong when I tried to get the duration_time')
      end
    end
    total_duration
  end

  alias delivery_date delivery_time
end

