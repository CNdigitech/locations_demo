class CreateElectionEventLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :election_event_locations  do |t|
      t.string :assigned_code
      t.string :election_event_id
      t.string :region_id
      t.datetime :constituency_id

      t.timestamps
      
    end
  end
end
