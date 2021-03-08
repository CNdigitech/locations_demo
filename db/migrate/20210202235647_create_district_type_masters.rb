class CreateDistrictTypeMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :district_type_masters do |t|
      t.string :assigned_code
      t.string :name

      t.timestamps
    end
  end
end
