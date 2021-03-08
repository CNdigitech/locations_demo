json.extract! election_event_master, :id, :election_event_id, :event_name, :election_type, :election_date, :notes, :ec_election_reference, :active_status, :del_status, :user_id, :created_at, :updated_at
json.url election_event_master_url(election_event_master, format: :json)
