class CreateTownMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :town_masters do |t|
      t.string :town_id
      t.string :district_id
      t.string :name
      t.string :town_center_gps

      t.timestamps
    end
  end
end
