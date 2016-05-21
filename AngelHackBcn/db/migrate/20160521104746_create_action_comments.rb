class CreateActionComments < ActiveRecord::Migration
  def change
    create_table :action_comments do |t|
      t.references :user, index: true
      t.references :action, index: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
