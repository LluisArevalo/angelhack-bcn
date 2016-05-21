class AddTopicToInitiatives < ActiveRecord::Migration
  def change
    add_column :initiatives, :topic_id, :integer
  end
end
