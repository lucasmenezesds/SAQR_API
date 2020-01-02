# frozen_string_literal: true

require 'numo/gsl'
require 'securerandom'

# Module to Generate Number based on a distribution
module RandomNumbersGenerator
  def self.random_number
    SecureRandom.random_number(999_999_999_999)
  end

  def self.random_generator(distribution_name, distribution_parameters)
    random_generator = Numo::GSL::Rng::Rand.new(random_number)

    case distribution_name
    when 'exponential'
      random_generator.exponential(distribution_parameters[:mu])
      # data = random_generator.exponential(distribution_parameters[:mu], distribution_parameters[:shape]) if distribution_parameters[:shape]
    when 'lognormal'
      random_generator.lognormal(distribution_parameters[:zeta], distribution_parameters[:sigma])
      # data = random_generator.lognormal(distribution_parameters[:zeta], distribution_parameters[:sigma], distribution_parameters[:shape])
    when 'gamma'
      random_generator.gamma(distribution_parameters[:alpha], distribution_parameters[:beta])
      # data = random_generator.gamma(distribution_parameters[:alpha], distribution_parameters[:beta], distribution_parameters[:shape])
    when 'weibull'
      random_generator.weibull(distribution_parameters[:alpha], distribution_parameters[:beta])
      # data = random_generator.weibull(distribution_parameters[:alpha], distribution_parameters[:beta], distribution_parameters[:shape])

    else
      raise NoMethodError, "The #{distribution_name} method does not exist"
    end
  end

  def self.distribution_based_generation(number_of_samples, distribution_name, distribution_parameters)
    raise TypeError, 'number_of_samples is not a integer' unless number_of_samples.is_a? Integer

    arr = []
    number_of_samples.times do
      arr << random_generator(distribution_name, distribution_parameters)
    end
    arr
  end
end
