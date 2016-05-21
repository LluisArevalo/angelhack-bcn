class CreateActionStatuses < ActiveRecord::Migration
  def change
    create_table :action_statuses do |t|
      t.references :user, index: true
      t.references :action, index: true
      t.boolean :solved

      t.timestamps null: false
    end
  end
end
