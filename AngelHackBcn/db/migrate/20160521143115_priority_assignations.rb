class PriorityAssignations < ActiveRecord::Migration
  def change
    create_table :priority_assignations do |t|
      t.references :user, index: true
      t.references :priority, index: true
      t.references :action, index: true

      t.timestamps null: false
    end
  end
end
