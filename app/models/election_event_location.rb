class ElectionEventLocation < ApplicationRecord
    belongs_to :election_event_master, class_name:"ElectionEventMaster",foreign_key: :election_event_id
    attr_accessor :district_id
end
