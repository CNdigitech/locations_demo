class PollingStationMaster < ApplicationRecord
    belongs_to :constituency, class_name:"Constituency", foreign_key: :constituency_id
    belongs_to :region, class_name:"RegionMaster", foreign_key: :region_id
    # has_many :polling_agents , class_name:"PollingStationAgent",primary_key: :polling_station_id,foreign_key: :polling_station_id

    validate :collation_center_validation
    def collation_center_validation
        if constituency_id.present?
            constituency_obj = PollingStationMaster.where(constituency_id: constituency_id, active_status: true)
             if constituency_obj.exists?
                constituency_obj.each do |a|
                    if a.constituency_collation_center = true
                        errors.add(:constituency_collation_center, "already exists for this constituency, please choose a different constituency")
                    end
                end
             end
        end
    end
end
