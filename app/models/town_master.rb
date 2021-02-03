class TownMaster < ApplicationRecord
    self.primary_key = 'town_id'
    attr_accessor :region_id
    # belongs_to :district_master , class_name:"DistrictMaster", foreign_key: :district_id
    # belongs_to :a_currency, class_name: "Currency", foreign_key: :currency
    # has_many :banner_deets, class_name:"BannerDetail", foreign_key: :entity_id

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
