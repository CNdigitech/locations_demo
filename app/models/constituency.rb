class Constituency < ApplicationRecord
    self.primary_key = 'constituency_id'
    attr_accessor :file
    belongs_to :district_master, class_name:"DistrictMaster", foreign_key: :district_id
    has_many :polling_stations, class_name:"PollingStationMaster", primary_key: :constituency_id, foreign_key: :constituency_id 
    
    validates :name, presence: true, uniqueness: true
    validates :ec_constituency_code, presence: true, uniqueness: true

    def self.gen_assigned_code(param)
        sql = "select nextval('constituency_seq')"
        val = ActiveRecord::Base.connection.execute(sql)
        val = val.values[0][0]
        val = val.to_s.rjust(4,'0')
        code = param + "-CON"
        val = code+val
        logger.info "===== assigned CODE = #{val}"
        val
    end

    def self.bulk_import(file)
        records = []
        dup_records = []
        columns = [:constituency_id, :region_id, :district_id, :name, :ec_constituency_code, :registered_voters]
        columns2 = [:constituency_id, :region_id, :district_id, :name, :ec_constituency_code, :registered_voters]
        CSV.foreach(file.path, headers: true) do |row|
          logger.info "===== csv row = #{row[1]} "
          region_id = row[1]
          logger.info "===== region id = #{region_id.inspect} "
          region = RegionMaster.where("region_id=? AND active_status=true",region_id).first
          logger.info "===== region object = #{region.inspect} "
          region_code = region.region_code
          @constituency_id = Constituency.gen_assigned_code(region_code)

        is_duplicate = Constituency.import_validation( row['ec_constituency_code'])
        logger.info "Import Validation = #{is_duplicate.inspect}"
            if is_duplicate
                dup_records << {constituency_id: @constituency_id, region_id: row['region_id'], district_id: row['district_id'],name: row['name'],
                                ec_constituency_code: row['ec_constituency_code'], registered_voters: row['registered_voters']}
            else
                records << {constituency_id: @constituency_id, region_id: row['region_id'], district_id: row['district_id'],name: row['name'],
                            ec_constituency_code: row['ec_constituency_code'], registered_voters: row['registered_voters']}
            end
        end
        ConstituencyDuplicate.import columns2, dup_records, validate: false
        Constituency.import columns, records, validate: false
    end

    def self.import_validation(id)
        if !id.nil?
          myObj = Constituency.where("ec_constituency_code=?",id)[0]
          if !myObj.nil?
            return true
          else
            return false
          end
        else
          return false
        end
    end
    
end
