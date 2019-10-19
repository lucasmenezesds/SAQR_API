# frozen_string_literal: true

# PickingTime's Model Class
class PickingTime < ApplicationRecord
  has_one :delivery

  def self.duration_times_based_on_deliveries; end

  # TODO: Review - Brainstorm
  # STASHED \/
  # #
  # def self.get_durations_time_based_on_ids_list1(ids_array)
  #   raise StandardError, 'Its seems like its not an array!' unless ids_array.class == Array
  #
  #   PickingTime.select(:duration_time)
  #              .where("id IN #{ids_array}")
  #              .pluck(:duration_time)
  # rescue StandardError => e
  #   raise "Check the array condition: #{e}"
  # end
  #
  # def self.get_durations_time_based_on_ids_list2(ids_array)
  #   raise StandardError, 'Its seems like its not an array!' unless ids_array.class == Array
  #
  #   LoadTime.select(:duration_time)
  #           .where("id IN #{ids_array}")
  #           .pluck(:duration_time)
  # rescue StandardError => e
  #   raise "Check the array condition: #{e}"
  # end
  #
  # def self.get_durations_time_based_on_ids_list3(ids_array)
  #   raise StandardError, 'Its seems like its not an array!' unless ids_array.class == Array
  #
  #   TransportationTime.select(:duration_time)
  #                     .where("id IN #{ids_array}")
  #                     .pluck(:duration_time)
  # rescue StandardError => e
  #   raise "Check the array condition: #{e}"
  # end
  #
  # def self.get_durations_time_based_on_ids_list4(ids_array)
  #   raise StandardError, 'Its seems like its not an array!' unless ids_array.class == Array
  #
  #   ReceiveTime.select(:duration_time)
  #              .where("id IN #{ids_array}")
  #              .pluck(:duration_time)
  # rescue StandardError => e
  #   raise "Check the array condition: #{e}"
  # end
  #
  # def self.get_durations_time_based_on_ids_list5(ids_array)
  #   raise StandardError, 'Its seems like its not an array!' unless ids_array.class == Array
  #
  #   StorageTime.select(:duration_time)
  #              .where("id IN #{ids_array}")
  #              .pluck(:duration_time)
  # rescue StandardError => e
  #   raise "Check the array condition: #{e}"
  # end
end
