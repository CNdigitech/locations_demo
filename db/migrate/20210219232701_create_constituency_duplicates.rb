class CreateConstituencyDuplicates < ActiveRecord::Migration[6.0]
  def change
    create_table :constituency_duplicates do |t|
     
        t.string :constituency_id
        t.string :district_id
        t.string :name
        t.string :ec_constituency_code
        t.integer :registered_voters
        t.boolean :active_status, default: true
        t.boolean :del_status, default: false
  
        t.timestamps
      
    end
  end
end
