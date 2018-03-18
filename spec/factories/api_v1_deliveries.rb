FactoryBot.define do
  factory :api_v1_delivery, class: 'Api::V1::Delivery' do
    picking_time nil
    load_time nil
    transportation_time nil
    receive_time nil
    storage_time nil
    delivery_date "2018-03-17 23:39:57"
  end
end
