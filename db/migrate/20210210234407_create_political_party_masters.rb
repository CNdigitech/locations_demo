class CreatePoliticalPartyMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :political_party_masters do |t|
      t.string :political_party_id
      t.string :region_id
      t.string :name
      t.string :party_initial
      t.string :contact_number
      t.string :email_address
      t.string :party_logo
      t.string :image_path
      t.string :hq_address_line_1
      t.string :hq_address_line_2
      t.string :district_id
      t.string :town_id
      t.string :gps_coordinates
      t.boolean :active_status
      t.boolean :del_status
      t.integer :user_id

      t.timestamps
    end
  end
end
