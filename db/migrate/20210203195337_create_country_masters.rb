class CreateCountryMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :country_masters do |t|
      t.string :continent_code
      t.string :assigned_code
      t.string :name
      t.boolean :active_status
      t.boolean :del_status

      t.timestamps
    end
  end
end
