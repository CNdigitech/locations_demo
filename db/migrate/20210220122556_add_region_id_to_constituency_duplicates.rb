class AddRegionIdToConstituencyDuplicates < ActiveRecord::Migration[6.0]
  def change
    add_column :constituency_duplicates, :region_id, :string
  end
end
