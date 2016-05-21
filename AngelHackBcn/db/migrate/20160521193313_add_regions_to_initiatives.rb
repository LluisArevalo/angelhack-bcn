class AddRegionsToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :region_id, :integer
  end
end
