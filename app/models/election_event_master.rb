class ElectionEventMaster < ApplicationRecord
    self.primary_key = "election_event_id"
    has_many :election_event_locations, class_name:"ElectionEventLocation", primary_key: :election_event_id, foreign_key: :election_event_id
    accepts_nested_attributes_for :election_event_locations
end
