class CreateElectionEventMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :election_event_masters  do |t|
      t.string :election_event_id
      t.string :event_name
      t.string :election_type
      t.datetime :election_date
      t.text :notes
      t.string :ec_election_reference
      t.boolean :active_status
      t.boolean :del_status
      t.integer :user_id

      t.timestamps
      
    end
  end
end
