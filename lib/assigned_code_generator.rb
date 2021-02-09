module AssignedCodeGenerator

    def self.gen_assigned_code(sequence, param)
        sql = "select nextval('#{sequence}')"
        val = ActiveRecord::Base.connection.execute(sql)
        val = val.values[0][0]
        val = val.to_s.rjust(4,'0')
        code = param[0..2].upcase
        val = code+val
        logger.info "Assigned CODE = #{val}"
        return val
    end

    def test_action
        logger.info "Tihs module works"
    end



      
    #   def check_seq_code(param)
    #     assigned_code = loop do
    #       logger.info "0000000000000000000000000000000000000"
    #       puts "====== Generating next assigned ID ======"
    #       assigned_code = gen_assigned_code(param)
    #       logger.info "========== ID: #{assigned_code.inspect} =============="
    #       logger.info "============================================"
    #       break assigned_code unless RegionMaster.exists?(assigned_code: assigned_code)
    #     end
    
    #     return assigned_code
    #   end
end