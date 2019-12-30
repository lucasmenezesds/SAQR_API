# frozen_string_literal: true

require 'rspec'
require_relative '../../../app/models/concerns/simulate_deliveries_helpers'
require_relative '../../fixtures/models/concerns/simulate_deliveries_helpers_mocks.rb'

describe SimulateDeliveriesHelpers do
  steps = steps_list

  context 'success: passing the correct parameters' do
    describe '#calculate_mean_for_steps' do
      it 'should return the expected result for the exponential distribution' do
        allow_any_instance_of(Numo::GSL::Rng).to receive(:exponential).and_return(53)
        allow_any_instance_of(Numo::GSL::Rng).to receive(:gamma).and_return(500)
        allow_any_instance_of(Numo::GSL::Rng).to receive(:weibull).and_return(200)

        result = SimulateDeliveriesHelpers.calculate_mean_for_steps(5, 10, steps)

        expect(result).to eql([251.0, 251.0, 251.0, 251.0, 251.0])
      end
    end

    describe '#calculate_mean_of_arrays_per_position' do
      it 'should return the expected result' do
        data = generated_arrays
        expected_result = mean_for_generated_arrays
        result = SimulateDeliveriesHelpers.calculate_mean_of_arrays_per_position(data)

        expect(result).to eql(expected_result)
      end
    end
  end
end