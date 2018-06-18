require 'seed_generator/seed_models/delivery_seed'
require 'support/matchers'
require 'rails_helper'

describe DeliverySeed do
  let(:seeds_hash) do
    seeds_hash = {}
    seeds_hash['picking_time'] = PickingTime.new(duration_time: 3185,
                                                 start_time: '2001-10-08 17:59:15',
                                                 number_of_items: 757,
                                                 number_of_items_type: 4,
                                                 picking_date: '2001-10-08 17:58:15')

    seeds_hash['load_time'] = LoadTime.new(duration_time: 2047,
                                           event: false, load_date: '2001-10-08 18:52:20',
                                           start_time: '2001-10-08 20:02:20')

    seeds_hash['transportation_time'] = TransportationTime.new(duration_time: 2045,
                                                               event: false,
                                                               transportation_date: '2001-10-08 20:36:27',
                                                               origin_city_id: 10,
                                                               destination_city_id: 7,
                                                               start_time: '2001-10-08 21:41:27',
                                                               distance: 1158632)

    seeds_hash['receive_time'] = ReceiveTime.new(duration_time: 2981,
                                                 event: true,
                                                 received_date: '2001-10-08 22:15:32',
                                                 start_time: '2001-10-08 22:40:32')

    seeds_hash['storage_time'] = StorageTime.new(duration_time: 3343,
                                                 event: false,
                                                 storage_date: '2001-10-08 23:30:13',
                                                 start_time: '2001-10-09 00:07:13')

    seeds_hash['id'] = 10

    seeds_hash
  end

  let(:delivery) do
    seeds_hash['delivery_date'] = DateTime.new(2010,
                                               10, 25,
                                               10, 35,
                                               20, '-03:00')

    described_class.new(seeds_hash)
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-03:00') }

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      delivery_hash = delivery.to_hash
      expect(delivery_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when the Class is created with id' do
      it 'should return a hash including the proper keys' do
        delivery_hash = delivery.to_hash
        expect(delivery_hash).to include('id', 'picking_time', 'load_time',
                                         'transportation_time', 'receive_time',
                                         'storage_time', 'delivery_date',
                                         'total_duration')
      end

      it 'should have the key id' do
        obj_hash = delivery.to_hash
        expect(obj_hash).to have_key('id')
      end
    end

    context 'when the Class is not created with id' do
      it 'should not have the key id' do
        new_obj = delivery
        new_obj.id = nil
        load_time_hash = new_obj.to_hash
        expect(load_time_hash).not_to have_key('id')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :id, Integer
      include_examples 'returned hash should have the key', :picking_time, PickingTime
      include_examples 'returned hash should have the key', :load_time, LoadTime
      include_examples 'returned hash should have the key', :transportation_time, TransportationTime
      include_examples 'returned hash should have the key', :receive_time, ReceiveTime
      include_examples 'returned hash should have the key', :storage_time, StorageTime
      include_examples 'returned hash should have the key', :delivery_date, DateTime
      include_examples 'returned hash should have the key', :total_duration, Integer

    end
  end
  context 'when I call the method on DeliverySeed Class' do
    describe '#delivery_time' do
      it 'should return the delivery date/time' do
        expect(delivery.delivery_time).to eql(expected_date_time_result)
      end
    end
    describe '#delivery_date' do
      it 'should work as #delivery_time' do
        expect(delivery.delivery_date).to eql(expected_date_time_result)
      end
    end
    describe '#sum_durations' do
      it 'should return the value 13601' do
        expect(delivery.sum_durations).to eql(13601)
      end
    end
  end
end