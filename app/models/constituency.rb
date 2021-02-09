class Constituency < ApplicationRecord
    self.primary_key = 'constituency_id'
    belongs_to :district_master, class_name:"DistrictMaster", foreign_key: :district_id
    attr_accessor :region_id
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
end
