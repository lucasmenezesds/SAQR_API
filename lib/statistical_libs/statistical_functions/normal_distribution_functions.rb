# frozen_string_literal: true

require_relative './z_table'

# Module with Normal Distribution Methods
module NormalDistributionFunctions
  # TODO: Implement it
  # def self.interval_margin_of_error(sample_size, _std_dev)
  #  if sample_size >= 30
  #
  #
  #    {min_interval: min_interval, max_interval: max_interval}
  #  else
  #    raise NotImplementedError, 'Margin of Error for samples smaller than 30 not implemented yet'
  #  end
  # end
  #
  # def self.min_interval
  #
  # end

  def self.z_value_from_right(confidence_level)
    confidence_level = confidence_level.to_f
    alpha = (confidence_level.abs / 100)

    Ztable.z_value(alpha)
  end

  def self.calculate_z_area(interval)
    if interval < 0.5
      right_z_area = 1 - interval
      z_value = Ztable.z_value(right_z_area)
      z_value * -1
    else
      Ztable.z_value(interval)
    end
  end

  def self.z_position(std_dev, mean, z_area)
    raise ArgumentError 'Some of the parameters are null' unless [std_dev, mean, z_area].all?

    (z_area * std_dev) + mean
  end

  def self.area_to_paint(intervals, std_dev, mean)
    z_area_values = intervals.map do |interval|
      z_area = calculate_z_area(interval)
      z_position(std_dev, mean, z_area)
    end
    ordered_z_values = z_area_values.sort

    # This index_start is to make the coloring for the front dynamic on Highcharts.js based on the interval parameter
    index_start = ordered_z_values.size - 1

    ordered_z_values.map.with_index(index_start) do |val, index|
      paint_range = if index.even?
                      true
                    else
                      false
                    end
      { value: val,
        color: paint_range }
    end
  end
end
