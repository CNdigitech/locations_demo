class CreateRegionMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :region_masters do |t|
      t.string :region_id
      t.string :region_code
      t.string :name
      t.string :capital
      t.string :capital_gps

      t.timestamps
    end
  end
end
