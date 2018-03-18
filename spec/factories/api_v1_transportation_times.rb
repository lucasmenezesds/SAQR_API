FactoryBot.define do
  factory :api_v1_transportation_time, class: 'Api::V1::TransportationTime' do
    duration_time 1
    event false
    transportation_date "2018-03-17 23:39:41"
    origin_city nil
    destination_city nil
  end
end
