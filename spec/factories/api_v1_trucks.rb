FactoryBot.define do
  factory :api_v1_truck, class: 'Api::V1::Truck' do
    driver nil
    model "MyString"
  end
end
