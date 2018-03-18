FactoryBot.define do
  factory :api_v1_receive_time, class: 'Api::V1::ReceiveTime' do
    duration_time 1
    event false
    received_date "2018-03-17 23:39:55"
  end
end
