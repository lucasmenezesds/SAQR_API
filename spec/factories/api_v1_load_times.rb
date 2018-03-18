FactoryBot.define do
  factory :api_v1_load_time, class: 'Api::V1::LoadTime' do
    duration_time 1
    event false
    load_date "2018-03-17 23:39:52"
  end
end
