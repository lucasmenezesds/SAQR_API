require_relative 'seed_class'

class DeliverySeed < SeedClass
  def initialize(received_picking, received_load,
                 received_transp, received_receive,
                 received_storage, received_delivery_date)

    @picking_time = received_picking
    @load_time = received_load
    @transportation_time = received_transp
    @receive_time = received_receive
    @storage_time = received_storage
    @delivery_date = received_delivery_date # TODO: It need to be the first to
    # be created and the others(picking_time date etc)will be based on this date
  end

  def delivery_time
    @delivery_date
  end

  alias delivery_date delivery_time
end
