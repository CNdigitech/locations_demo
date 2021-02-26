class PollingStationAgent < ApplicationRecord
    has_one_attached :agent_photo
    has_one_attached :agent_signature_image
    # belongs_to :political_party, class_name:"PoliticalPartyMaster",foreign_key: :political_party_id
    # belongs_to :polling_station, class_name:"PollingStationMaster",foreign_key: :polling_station_id

    def self.bulk_import(file)
        records = []
        columns = [:agent_id, :political_party_id, :region_id, :constituency_id, :polling_station_id, :title, :firstname, :lastname, :gender_id,
                    :phone_number, :email_address, :hq_address_line_1, :hq_address_line_2, :city, :town_id, :gps_coordinates, :nearest_landmark]
        CSV.foreach(file.path, headers: true) do |row|
          @polling_agent_id = AssignedCodeGenerator.gen_assigned_code("polling_agent_seq", "PSA")
          
            records << {agent_id: @polling_agent_id, political_party_id: row['political_party_id'], region_id: row['region_id'], constituency_id: row['constituency_id'],
                        polling_station_id: row['polling_station_id'],title: row['title'], firstname: row['firstname'] ,lastname: row['lastname'],gender_id: row['gender_id'],
                        phone_number: row['phone_number'],email_address: row['email_address'],hq_address_line_1: row['hq_address_line_1'],hq_address_line_2: row['hq_address_line_2'],
                        city: row['city'],town_id: row['town_id'],gps_coordinates: row['gps_coordinates'],nearest_landmark: row['nearest_landmark']}
        
        end
        PollingStationAgent.import columns, records, validate: false
    end


    def fullname
        title+'. '+firstname+' '+lastname
    end
end
