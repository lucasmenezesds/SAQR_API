# frozen_string_literal: true

require 'rspec'
require_relative '../../../../lib/statistical_libs/statistical_functions/random_numbers_generators'

describe RandomNumbersGenerators do
  context 'success: passing the correct parameters' do
    describe '#distribution_based_generation' do
      it 'should return the expected result' do
        allow_any_instance_of(Numo::GSL::Rng).to receive(:exponential).and_return(1)
        result = RandomNumbersGenerators.distribution_based_generation(5, 'exponential', mu: 1)

        expect(result).to eql([1, 1, 1, 1, 1])
      end
    end

    context 'for exponential distribution' do
      describe '#random_generator' do
        it 'should return the expected result' do
          allow_any_instance_of(Numo::GSL::Rng).to receive(:exponential).and_return(10)
          result = RandomNumbersGenerators.random_generator('exponential', mu: 1)

          expect(result).to eql(10)
        end
      end
    end

    context 'for lognormal distribution' do
      describe '#random_generator' do
        it 'should return the expected result' do
          allow_any_instance_of(Numo::GSL::Rng).to receive(:lognormal).and_return(2020)
          result = RandomNumbersGenerators.random_generator('lognormal', zeta: 2.5, sigma: 5)

          expect(result).to eql(2020)
        end
      end
    end

    context 'for gamma distribution' do
      describe '#random_generator' do
        it 'should return the expected result' do
          allow_any_instance_of(Numo::GSL::Rng).to receive(:gamma).and_return(8080)
          result = RandomNumbersGenerators.random_generator('gamma', alpha: 2, beta: 4)

          expect(result).to eql(8080)
        end
      end
    end

    context 'for weibull distribution' do
      describe '#random_generator' do
        it 'should return the expected result' do
          allow_any_instance_of(Numo::GSL::Rng).to receive(:weibull).and_return(4040)
          result = RandomNumbersGenerators.random_generator('weibull', alpha: 1, beta: 2)

          expect(result).to eql(4040)
        end
      end
    end
  end

  context 'fail: passing wrong parameters' do
    describe '#random_generator' do
      it 'should raise a noMethodError when passing non existing distribution method' do
        expect { RandomNumbersGenerators.random_generator('testDistribution', '') }.to(
          raise_error(NoMethodError,
                      'The testDistribution method does not exist')
        )
      end
    end
  end
end
