require_relative 'seed_class'

# Driver Seed
class DriverSeed < SeedClass
  def initialize
    @name = Faker::Name.name
    @age = rand(18..65)
    @contact = '+553400000000'
  end
end