class CreateDistrictMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :district_masters do |t|
      t.string :district_id
      t.string :region_id
      t.string :district_type
      t.string :name
      t.string :capital
      t.string :capital_gps

      t.timestamps
    end
  end
end
