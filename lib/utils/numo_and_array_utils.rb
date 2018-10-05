require 'numo/narray'

# Utils class for Numo::NArray
# class NumoArrayUtils

def convert_array_to_narray(received_array)
  if received_array.class == Array
    Numo::DFloat.new(received_array)
  else
    raise StandardError, 'Its seems like its not an array!'
  end
rescue StandardError => e
  raise "Check the array condition: #{e}"
end

def get_numo_array_data(received_array)
  min = received_array.min
  max = received_array.max
  size = received_array.size

  [min, max, size]
end


# end