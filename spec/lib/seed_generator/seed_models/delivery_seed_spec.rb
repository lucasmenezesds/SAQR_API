require 'seed_generator/seed_models/delivery_seed'
require 'support/matchers'

describe DeliverySeed do
  let(:delivery) do
    delivery_date = DateTime.new(2010,
                                 10, 25,
                                 10, 35,
                                 20, '-03:00')
    described_class.new(1, 1, 1, 1, 1, delivery_date)
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-03:00') }

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      delivery_hash = delivery.to_hash
      expect(delivery_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when I call the method on DeliverySeed Class' do
      it 'should return a hash including the proper keys' do
        delivery_hash = delivery.to_hash
        expect(delivery_hash).to include('picking_time', 'load_time',
                                         'transportation_time', 'receive_time',
                                         'storage_time', 'delivery_date')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :picking_time, Integer
      include_examples 'returned hash should have the key', :load_time, Integer
      include_examples 'returned hash should have the key', :transportation_time, Integer
      include_examples 'returned hash should have the key', :receive_time, Integer
      include_examples 'returned hash should have the key', :storage_time, Integer
      include_examples 'returned hash should have the key', :delivery_date, DateTime

    end
  end

  describe '#delivery_time' do
    context 'when I call the method on DeliverySeed Class' do
      it 'should return the delivery date/time' do
        expect(delivery.delivery_time).to eql(expected_date_time_result)
      end
    end
  end
  describe '#delivery_date' do
    context 'delivery_date is an alias for delivery_time' do
      it 'should work as #delivery_time' do
        expect(delivery.delivery_date).to eql(expected_date_time_result)
      end
    end
  end
end