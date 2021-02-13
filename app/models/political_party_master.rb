class PoliticalPartyMaster < ApplicationRecord
    has_one_attached :party_logo
    def self.get_special_code(name)
        name_arr = name.split(" ")
        logger.info "===== ARRAY VALUES ===== #{name_arr.inspect}"
        case name_arr.length
        when 1
          name = name_arr[0][0..3].upcase
        when 2
          name = name_arr[0][0] + name_arr[1][0]
          name = name.upcase
        when 3
          name = name_arr[0][0] + name_arr[1][0] + name_arr[2][0]
          name = name.upcase
        when 4
          name = name_arr[0][0] + name_arr[1][0] + name_arr[2][0] + name_arr[3][0]
          name = name.upcase
        end
        # name = check_similar_name(name)
        logger.info "===== REGION CODE ===== #{name}"
        return name
      end
  
end
