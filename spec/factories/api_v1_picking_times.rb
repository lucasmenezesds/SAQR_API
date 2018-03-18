FactoryBot.define do
  factory :api_v1_picking_time, class: 'Api::V1::PickingTime' do
    duration_time 1
    start_time "2018-03-17 23:39:48"
    number_of_items 1
    number_of_items_type 1
    picking_date "2018-03-17 23:39:48"
  end
end
