class PollingStationAgent < ApplicationRecord
    has_one_attached :agent_photo
    has_one_attached :agent_signature_image
    # belongs_to :political_party, class_name:"PoliticalPartyMaster",foreign_key: :political_party_id
    # belongs_to :polling_station, class_name:"PollingStationMaster",foreign_key: :polling_station_id

    def fullname
        title+'. '+firstname+' '+lastname
    end
end
