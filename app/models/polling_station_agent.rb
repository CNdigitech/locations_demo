class PollingStationAgent < ApplicationRecord
    has_one_attached :agent_photo
    has_one_attached :agent_signature_image


    def fullname
        title+'. '+firstname+' '+lastname
    end
end
