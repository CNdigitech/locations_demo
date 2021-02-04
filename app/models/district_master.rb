class DistrictMaster < ApplicationRecord
    self.primary_key = 'district_id'
    has_many :town_masters
    # belongs_to :region_master

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
