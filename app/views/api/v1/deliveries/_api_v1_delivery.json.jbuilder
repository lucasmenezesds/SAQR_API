json.extract! api_v1_delivery, :id, :delivery_truck_id, :picking_time_id, :load_time_id, :transportation_time_id, :receive_time_id, :storage_time_id, :delivery_date, :created_at, :updated_at
json.url api_v1_delivery_url(api_v1_delivery, format: :json)
