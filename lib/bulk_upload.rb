module BulkUpload
    def self.bulk_import(file)
        # records = []
       
        # columns = [:constituency_id, :region_id, :district_id, :name, :ec_constituency_code, :registered_voters]
        # CSV.foreach(file.path, headers: true) do |row|
        #   logger.info "===== csv row = #{row[1]} "
    
        #   @constituency_id = Constituency.gen_assigned_code(region_code)

        # logger.info "Import Validation = #{is_duplicate.inspect}"
           
        #         records << {constituency_id: @constituency_id, region_id: row['region_id'], district_id: row['district_id'],name: row['name'],
        #                     ec_constituency_code: row['ec_constituency_code'], registered_voters: row['registered_voters']}
            
        # end
        # Constituency.import columns, records, validate: false
    end
end