class RegionMaster < ApplicationRecord
    self.primary_key = 'region_id'
    has_many :district_masters

      def self.gen_assigned_code(country,name)
        sql = "select nextval('region_seq')"
        val = ActiveRecord::Base.connection.execute(sql)
        val = val.values[0][0]
        val = val.to_s.rjust(3,'0')
        code = country + "-" + name[0..2].upcase
        val = code+val
        logger.info "===== assigned CODE = #{val}"
        val
      end
      
    #   def self.check_seq_code(param)
    #     assigned_code = loop do
    #       logger.info "0000000000000000000000000000000000000"
    #       puts "====== Generating next assigned ID ======"
    #       assigned_code = gen_assigned_code(param)
    #       logger.info "========== ID: #{assigned_code.inspect} =============="
    #       logger.info "============================================"
    #       break assigned_code unless RegionMaster.exists?(region_id: assigned_code)
    #     end
    
    #     return assigned_code
    #   end
end
