require_relative 'seed_class'

# Truck Seed
class TruckSeed < SeedClass
  def initialize(driver_id)
    @driver_id = driver_id
    @model = %w[AZ3304 AW5504 ZH3204].sample
  end
end