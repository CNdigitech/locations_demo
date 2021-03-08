class DistrictMaster < ApplicationRecord
    self.primary_key = 'district_id'
    attr_accessor :file
    has_many :town_masters, class_name:"TownMaster",primary_key: :district_id, foreign_key: :district_id
    has_many :constituencies, class_name:"Constituency",primary_key: :district_id, foreign_key: :district_id
    has_many :political_parties, class_name:"PoliticalPartyMaster",primary_key: :district_id

    # belongs_to :region_master, class_name:"RegionMaster", foreign_key: :region_id
    # validates :name, presence: true, uniqueness: true
    def self.bulk_import(file)
        records = []
        
        columns = [:district_id, :region_id, :district_type, :name, :capital, :capital_gps]
        CSV.foreach(file.path, headers: true) do |row|
          logger.info "===== csv row = #{row[1]} "
          name = row[3]
          name = name.gsub(/\s+/, "")
          logger.info "===== district name = #{name.inspect} "
          @district_id = DistrictMaster.gen_assigned_code(name)

            records << {district_id: @district_id, region_id: row['region_id'], district_type: row['district_type'],name: row['name'],
                        capital: row['capital'], capital_gps: row['capital_gps']}

        end
        DistrictMaster.import columns, records, validate: false
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

    def self.gen_assigned_code(param)
        sql = "select nextval('district_seq')"
        val = ActiveRecord::Base.connection.execute(sql)
        val = val.values[0][0]
        val = val.to_s.rjust(4,'0')
        code = param[0..2].upcase
        val = code+val
        logger.info "===== assigned CODE = #{val}"
        val
    end
      
end
