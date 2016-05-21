class AddAttachmentImageToInitiatives < ActiveRecord::Migration
  def self.up
    change_table :initiatives do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :initiatives, :image
  end
end
