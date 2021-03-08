class PollingStationMaster < ApplicationRecord
    attr_accessor :file
    # belongs_to :constituency, class_name:"Constituency", foreign_key: :constituency_id
    # belongs_to :region, class_name:"RegionMaster", foreign_key: :region_id
    # has_many :polling_agents , class_name:"PollingStationAgent",primary_key: :polling_station_id,foreign_key: :polling_station_id
    def self.bulk_import(file)
        records = []
        columns = [:polling_station_id, :region_id, :constituency_id, :name, :ec_polling_station_code, :polling_station_gps, :constituency_collation_center, :registered_voters]
        CSV.foreach(file.path, headers: true) do |row|
          @polling_station_id = AssignedCodeGenerator.gen_assigned_code('polling_station_seq','POL')
          
            records << {polling_station_id: @polling_station_id, region_id: row['region_id'], constituency_id: row['constituency_id'],name: row['name'],
                        ec_polling_station_code: row['ec_polling_station_code'], polling_station_gps: row['polling_station_gps'] ,constituency_collation_center: row['constituency_collation_center'],
                        registered_voters: row['registered_voters']}
        
        end
        PollingStationMaster.import columns, records, validate: false
    end

    def self.import_validation(id)
        if !id.nil?
          myObj = Constituency.where("ec_constituency_code =?",id)[0]
          if !myObj.nil?
            return true
          else
            return false
          end
        else
          return false
        end
    end

    validate :collation_center_validation
    def collation_center_validation
        if constituency_id.present?
            constituency_obj = PollingStationMaster.where(constituency_id: constituency_id, active_status: true)
            logger.info "polling stations for selected constituency = #{constituency_obj.inspect}"
             if constituency_collation_center == true && constituency_obj.exists?
                constituency_obj.each do |a|
                    if a.constituency_collation_center = true
                        errors.add(:constituency_collation_center, "already exists for this constituency, please choose a different constituency")
                    end
                end
             end
        end
    end
end
