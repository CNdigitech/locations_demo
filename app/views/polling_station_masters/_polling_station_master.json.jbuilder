json.extract! polling_station_master, :id, :polling_station_id, :region_id, :constituency_id, :name, :ec_polling_station_code, :polling_station_gps, :constituency_collation_center, :registered_voters, :active_status, :del_status_boolean, :user_id, :created_at, :updated_at
json.url polling_station_master_url(polling_station_master, format: :json)
