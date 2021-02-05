class RegionMaster < ApplicationRecord
    self.primary_key = 'region_id'
    has_many :district_masters
    # validates :name, presence: true, uniqueness: true

    def self.check_similar_name(code)
      code = code[0..3]
      @similar_regions = RegionMaster.where("region_code like '#{code}%'")
      obj_size = @similar_regions.size

      if @similar_regions.exists?
        code = code + obj_size.to_s.rjust(2,'0')
      else
        code
      end
    end

    def self.get_special_code(name)
      name_arr = name.split(" ")
      logger.info "===== ARRAY VALUES ===== #{name_arr.inspect}"
      case name_arr.length
      when 1
        name = name_arr[0][0..3].downcase
      when 2
        name = name_arr[0][0..1] + name_arr[1][0..1]
        name = name.downcase
      when 3
        name = name_arr[0][0] + name_arr[1][0] + name_arr[2][0..1]
        name = name.downcase
      when 4
        name = name_arr[0][0] + name_arr[1][0] + name_arr[2][0] + name_arr[3][0..1]
        name = name.downcase
      end
      name = check_similar_name(name)
      logger.info "===== REGION CODE ===== #{name}"
      return name
    end

    def self.gen_assigned_code(country,name)
      sql = "select nextval('region_seq')"
      val = ActiveRecord::Base.connection.execute(sql)
      val = val.values[0][0]
      val = val.to_s.rjust(4,'0')
      code = country + "-" + name[0..2].upcase
      val = code+val
      logger.info "===== assigned CODE = #{val}"
      val
    end
 
end
