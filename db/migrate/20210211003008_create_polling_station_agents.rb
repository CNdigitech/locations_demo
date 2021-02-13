class CreatePollingStationAgents < ActiveRecord::Migration[6.0]
  def change
    create_table :polling_station_agents do |t|
      t.string :agent_id
      t.string :political_party_id
      t.string :region_id
      t.string :constituency_id
      t.string :polling_station_id
      t.string :title
      t.string :firstname
      t.string :lastname
      t.string :gender_id
      t.string :agent_photo
      t.string :image_path
      t.string :agent_signature_image
      t.string :phone_number
      t.string :email_address
      t.string :hq_address_line_1
      t.string :hq_address_line_2
      t.string :city
      t.string :town_id
      t.string :gps_coordinates
      t.string :nearest_landmark
      t.boolean :active_status
      t.boolean :del_status
      t.integer :user_id

      t.timestamps
    end
  end
end
