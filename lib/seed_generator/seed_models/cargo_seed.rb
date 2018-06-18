require_relative 'seed_class'

class CargoSeed < SeedClass
  def initialize(received_truck, received_delivery, received_id = nil)
    @id = received_id
    @truck = received_truck
    @delivery = received_delivery
  end
end
