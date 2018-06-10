require_relative 'seed_class'

class CargoSeed < SeedClass
  def initialize(received_truck, received_delivery)

    @truck = received_truck
    @delivery = received_delivery
  end
end
