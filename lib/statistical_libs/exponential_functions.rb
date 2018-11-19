# class for methods of exponential functions and it derivatives
class ExponentialFunctions

  def calculate_mle(received_sample)
    if received_sample.class != Array || received_sample.empty?
      throw('calculate_mle should receive a not empty array of numbers')
    else
      result = {}
      sorted_sample = received_sample.sort

      result[:size] = sorted_sample.size
      result[:sumup] = sorted_sample.sum * 1.0
      result[:average] = result[:sumup] / result[:size] * 1.0

      result
    end
  rescue StandardError => e
    "Something went wrong during the calculation, Error: #{e}"
  end
end