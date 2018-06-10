require 'seed_generator/db_seed_generator'

puts '[START] Seed Generator'

seed_generator = DbSeedGenerator.new([0, 1], 5)
seed_generator.create_driver_and_trucks

puts '[DONE] Seed Generator'
