require 'faker'
require_relative '../../spec/rails_helper'

Dir[File.join(Rails.root, 'lib/seed_generator/seed_models/*.rb')].each do |file|
  require file
end

# IMPORTANT
#
# The times and dates are not important it exist just to be quite similar to
# a real application, but I don't use it for measuring anything
#

# Seed Generator Based on DB Schema
class DbSeedGenerator

  def initialize(cities_number = 100, number_of_drivers = 100,
                 number_of_deliveries = 1, range_date = %w[01/01/2000 31/12/2017])
    @cities_number = cities_number
    @number_of_drivers = number_of_drivers
    @number_of_deliveries = number_of_deliveries
    @range_date = range_date
  end

  def populate
    puts '[START] Populating with DbSeedGenerator'
    create_driver_and_trucks
    @number_of_deliveries.times do |i|
      generate_complete_delivery
      puts "Generating Delivery Number #{i}"
    end
    puts '[DONE] Populating is over'
  end

  private

  def create_cargo(delivery_id)
    truck = Truck.all.sample
    cargo = CargoSeed.new(truck, delivery_id)

    Cargo.create!(cargo.to_hash)
  end

  def create_delivery_data_dependencies(delivery_hash)
    date = delivery_hash['delivery_date']

    picking = PickingTimeSeed.new(date)
    picking_final_timestamp = picking.final_timestamp
    picking_hash = picking.to_hash
    delivery_hash['picking_time'] = PickingTime.create!(picking_hash)

    load = LoadTimeSeed.new(picking_final_timestamp)
    load_final_timestamp = load.final_timestamp
    load_hash = load.to_hash
    delivery_hash['load_time'] = LoadTime.create!(load_hash)

    transportation = TransportationTimeSeed.new(load_final_timestamp,
                                                @cities_number)
    transportation_final_timestamp = transportation.final_timestamp
    transportation_hash = transportation.to_hash
    delivery_hash['transportation_time'] = TransportationTime.create!(transportation_hash)

    received = ReceiveTimeSeed.new(transportation_final_timestamp)
    received_final_timestamp = received.final_timestamp
    receive_hash = received.to_hash
    delivery_hash['receive_time'] = ReceiveTime.create!(receive_hash)

    storage = StorageTimeSeed.new(received_final_timestamp)
    storage_hash = storage.to_hash
    delivery_hash['storage_time'] = StorageTime.create!(storage_hash)

    delivery_hash
  end

  def create_delivery_data(received_data)
    delivery_hash = create_delivery_data_dependencies(received_data)
    delivery_hash['delivery_date'] = delivery_hash['delivery_date'].to_s
    Delivery.create!(delivery_hash)
  end

  # private

  def create_driver_and_trucks
    @number_of_drivers.times do
      new_driver = DriverSeed.new
      created_driver = Driver.create!(new_driver.to_hash)
      created_truck = TruckSeed.new(created_driver.id)
      Truck.create!(created_truck.to_hash)
    end
  end



  def generate_complete_delivery
    delivery_hash = {}
    delivery_hash['delivery_date'] = Faker::Time.between(@range_date[0],
                                                         @range_date[1],
                                                         :day).to_datetime
    delivery = create_delivery_data(delivery_hash)

    create_cargo(delivery)
  end
end