class CountryMaster < ApplicationRecord
    validates :name, presence: true, uniqueness: true

end
