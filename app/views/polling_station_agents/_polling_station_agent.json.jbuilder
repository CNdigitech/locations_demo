json.extract! polling_station_agent, :id, :agent_id, :political_party_id, :region_id, :constituency_id, :polling_station_id, :title, :firstname, :lastname, :gender_id, :agent_photo, :image_path, :agent_signature_image, :phone_number, :email_address, :hq_address_line_1, :hq_address_line_2, :city, :town_id, :gps_coordinates, :nearest_landmark, :active_status, :del_status, :user_id, :created_at, :updated_at
json.url polling_station_agent_url(polling_station_agent, format: :json)