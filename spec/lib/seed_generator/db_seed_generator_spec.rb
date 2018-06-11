require 'rails_helper'
require 'seed_generator/db_seed_generator'
require 'support/matchers'

describe DbSeedGenerator do
  before(:all) do
    City.create!('name' => 'City1', 'state' => 'S1', 'country' => 'BR')
    City.create!('name' => 'City2', 'state' => 'S2', 'country' => 'BR')
  end

  let(:db_seed_generator) do
    described_class.new(2, 2, 10, %w[25/10/2010 25/10/2010])
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-02:00') }

  describe '#populate' do
    context 'when I call the method on DbSeedGenerator Class' do
      it 'should populate the database with 10 deliveries' do
        before_populate = Delivery.count
        db_seed_generator.populate
        after_populate = Delivery.count
        expect(after_populate).to eql(before_populate + 10)
      end
    end
  end
  # TODO: Add fail cases etc
end