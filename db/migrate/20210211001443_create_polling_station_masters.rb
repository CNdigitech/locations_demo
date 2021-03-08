class CreatePollingStationMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :polling_station_masters do |t|
      t.string :polling_station_id
      t.string :region_id
      t.string :constituency_id
      t.string :name
      t.string :ec_polling_station_code
      t.string :polling_station_gps
      t.boolean :constituency_collation_center
      t.integer :registered_voters
      t.boolean :active_status
      t.boolean :del_status
      t.integer :user_id

      t.timestamps
    end
  end
end
