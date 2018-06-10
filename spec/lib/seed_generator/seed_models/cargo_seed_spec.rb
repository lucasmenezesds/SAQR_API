require 'seed_generator/seed_models/cargo_seed'
require 'support/matchers'

describe CargoSeed do
  let(:cargo) do
    described_class.new(1, 1)
  end

  shared_examples 'returned hash should have the key' do |key, class_type|
    it "#{key} to be_a_kind_of #{class_type}" do
      cargo_hash = cargo.to_hash
      expect(cargo_hash[key.to_s]).to be_a_kind_of(class_type)
    end
  end

  describe '#to_hash' do
    context 'when I call the method on CargoSeed Class' do
      it 'should return a hash including the proper keys' do
        cargo_hash = cargo.to_hash
        expect(cargo_hash).to include('truck', 'delivery')
      end
    end

    context 'when the I receive the returned hash expecting the key' do
      include_examples 'returned hash should have the key', :truck, Integer
      include_examples 'returned hash should have the key', :delivery, Integer
    end
  end
end