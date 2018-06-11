require 'seed_generator/db_seed_generator'

puts '[START] Seed Generator'

seed_generator = DbSeedGenerator.new(10, 10, 10)
seed_generator.populate

puts '[DONE] Seed Generator'
