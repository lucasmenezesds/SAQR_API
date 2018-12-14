class Delivery < ApplicationRecord
  belongs_to :picking_time
  belongs_to :load_time
  belongs_to :transportation_time
  belongs_to :receive_time
  belongs_to :storage_time
  has_many :cargos


  def self.get_duration_times(city1, city2)
    Delivery.joins(:transportation_time)
      .where("origin_city_id=#{city1} and destination_city_id=#{city2}
               or origin_city_id=#{city2} and destination_city_id=#{city1}")
      .pluck(:total_duration)
  end

  def self.the_population?(number_of_samples)
    Delivery.count == number_of_samples
  end

end
