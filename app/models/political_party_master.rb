class PoliticalPartyMaster < ApplicationRecord
    has_one_attached :party_logo
    # belongs_to :region, class_name:"RegionMaster",foreign_key: :region_id
    # belongs_to :district, class_name:"DistrictMaster",foreign_key: :district_id
    # belongs_to :town, class_name:"TownMaster",foreign_key: :town_id
    # has_many :polling_agents,class_name:"PollingStationAgent",primary_key: :political_party_id,foreign_key: :political_party_id
    
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
  

    #   if party_logo.attached? && !party_logo.attachment.blob.content_type.in?(%w(image/png image/jpeg))
    #     party_logo.purge
    #     errors.add(:party_logo, 'Must be an image file')
    # end
end
