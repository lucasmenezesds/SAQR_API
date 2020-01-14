# frozen_string_literal: true

require 'numo/gsl'
require 'securerandom'

# Module to Generate Number based on a distribution
module RandomNumbersGenerator
  def self.random_number
    SecureRandom.random_number(999_999_999_999_999)
  end

  def self.random_generator(distribution_name, distribution_parameters)
    random_generator = Numo::GSL::Rng::Rand.new(random_number)

    case distribution_name
    when 'exp'
      mu = distribution_parameters[:mu].to_f
      final_val = random_generator.exponential(mu)
    when 'lognorm'
      zeta = distribution_parameters[:zeta].to_f
      sigma = distribution_parameters[:sigma].to_f
      final_val = random_generator.lognormal(zeta, sigma)
    when 'gamma'
      alpha = distribution_parameters[:alpha].to_f
      beta = distribution_parameters[:beta].to_f
      final_val = random_generator.gamma(alpha, beta)
    when 'weibull'
      alpha = distribution_parameters[:alpha].to_f
      beta = distribution_parameters[:beta].to_f
      final_val = random_generator.weibull(alpha, beta)
    else
      raise NoMethodError, "The #{distribution_name} method does not exist"
    end

    raise TypeError, "The number generated for #{distribution_name} was Null, check your parameters value" unless final_val.nil?

    final_val
  end

  def self.distribution_based_generation(number_of_samples, distribution_name, distribution_parameters)
    number_of_samples = number_of_samples.to_i
    raise TypeError, 'number_of_samples is not a integer' unless number_of_samples.is_a? Integer

    arr = []
    number_of_samples.times do
      arr << random_generator(distribution_name, distribution_parameters)
    end
    arr
  end
end
