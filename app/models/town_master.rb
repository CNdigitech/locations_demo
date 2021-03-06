class TownMaster < ApplicationRecord
    self.primary_key = 'town_id'
    attr_accessor :region_id
    belongs_to :district_master , class_name:"DistrictMaster", foreign_key: :district_id
    has_many :political_parties, class_name:"PoliticalPartyMaster",primary_key: :town_id

    # validates :name, presence: true, uniqueness: true

    def self.gen_assigned_code(param)
        sql = "select nextval('town_seq')"
        val = ActiveRecord::Base.connection.execute(sql)
        val = val.values[0][0]
        val = val.to_s.rjust(4,'0')
        code = param[0..2].upcase
        val = code+val
        logger.info "===== assigned CODE = #{val}"
        val
    end


end
