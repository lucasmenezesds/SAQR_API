# frozen_string_literal: true

require 'rspec'
require_relative '../../../../lib/statistical_libs/statistical_functions/normal_distribution_functions'
require_relative '../../../fixtures/lib/statistical_libs/normal_distribution_functions_mocks'

describe NormalDistributionFunctions do
  context 'success: passing the correct parameters' do
    describe '#z_value_from_right' do
      it 'should return the expected result' do
        result = NormalDistributionFunctions.z_value_from_right(85)

        expect(result).to eql(1.04)
      end
    end

    describe '#calculate_z_area' do
      it 'should return the expected result with the value smaller than 0.5' do
        result = described_class.calculate_z_area(0.025)

        expect(result).to eql(-1.96)
      end

      it 'should return the expected result with the value bigger than 0.5' do
        result = described_class.calculate_z_area(0.975)

        expect(result).to eql(1.96)
      end
    end

    describe '#z_position' do
      it 'should return the expected result' do
        result = described_class.z_position(1, 10, 1.96)

        expect(result).to eql(11.96)
      end
    end

    describe '#area_to_paint' do
      it 'should return the expected result' do
        result = described_class.area_to_paint([0.025, 0.975], 1, 10)

        expect(result).to eql([{ color: false, value: 8.04 }, { color: true, value: 11.96 }])
      end
    end
  end
end
