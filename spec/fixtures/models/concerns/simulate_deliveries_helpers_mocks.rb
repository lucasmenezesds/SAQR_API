# frozen_string_literal: true

def steps_list
  [
    {
      delivery_step: 'picking_time',
      distribution_method: {
        name: 'exponential',
        parameters: [
          {
            name: 'mu',
            value: 10,
            uppercase: false
          }
        ]
      }
    },
    {
      delivery_step: 'load_time',
      distribution_method: {
        name: 'gamma',
        parameters: [
          {
            name: 'mu',
            value: 10,
            uppercase: false
          }
        ]
      }
    },
    {
      delivery_step: 'receive_time',
      distribution_method: {
        name: 'weibull',
        parameters: [
          {
            name: 'mu',
            value: 10,
            uppercase: false
          }
        ]
      }
    }
  ]
end


def generated_arrays
  [[10, 61, 60], [5, 90, 11], [30, 500, 1]]
end

def mean_for_generated_arrays
  [15, 217, 24]
end