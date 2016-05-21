class ChangeTopicAndRegionToReference < ActiveRecord::Migration
  def change
    remove_column :initiatives, :topic_id
    remove_column :initiatives, :region_id
    add_reference :initiatives, :topic, index: true
    add_reference :initiatives, :region, index: true
  end
end
