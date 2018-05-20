require 'faker'
require 'active_support'
require 'active_support/core_ext/numeric/time'

Faker::Config.locale = 'pt-BR'


# Parent Class
class SeedClass
  def to_hash
    Hash[instance_variables.map { |name| [name.to_s.delete('@'), instance_variable_get(name)] }]
  end

  def generate_time(min, max)
    if min.is_a?(Numeric) && max.is_a?(Numeric)
      rand(min..max)
    else
      10
    end
  end

  def add_time(received_datetime, generated_time, time_type)
    if %w[seconds minutes hours].include?(time_type) && received_datetime.is_a?(DateTime) && generated_time.is_a?(Numeric)
      generated_minutes = generated_time.send(time_type)
      return received_datetime + generated_minutes
    end
    received_datetime
  end
end
