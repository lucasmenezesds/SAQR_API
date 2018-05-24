require 'seed_generator/seed_models/storage_time_seed'
require 'support/matchers'


describe StorageTimeSeed do
  let(:storage_time) do
    described_class.new(DateTime.new(2010,
                                     10, 25,
                                     10, 35,
                                     20, '-03:00'))
  end

  let(:expected_date_time_result) { DateTime.new(2010, 10, 25, 10, 35, 20, '-03:00') }

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      storage_time_hash = storage_time.to_hash
      expect(storage_time_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when I call the method on StorageTimeSeed Class' do
      it 'should return a hash including the proper keys' do
        storage_time_hash = storage_time.to_hash
        expect(storage_time_hash).to include('duration_time', 'start_time',
                                             'event', 'storage_date')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :duration_time, Integer
      include_examples 'returned hash should have the key', :start_time, DateTime
      include_examples 'returned hash should have the key', :storage_date, DateTime

      it 'event to be_a_kind_of Boolean' do
        storage_time_hash = storage_time.to_hash
        expect(storage_time_hash['event']).to be_a_kind_of_boolean
      end
    end
  end

  describe '#final_timestamp' do
    context 'when I call the method on StorageTimeSeed Class' do
      it 'should return the date plus 61 minutes' do
        # it will mock start_time and duration_time
        allow_any_instance_of(StorageTimeSeed).to receive(:generate_time).and_return(60)

        expected_final_stamp = expected_date_time_result + 61.minutes
        final_timestamp = storage_time.final_timestamp

        expect(expected_final_stamp).to eql(final_timestamp)
      end
    end
  end
end