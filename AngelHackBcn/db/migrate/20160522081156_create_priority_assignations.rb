class CreatePriorityAssignations < ActiveRecord::Migration
  def change
    drop_table :priority_assignations
    
    create_table :priority_assignations do |t|
      t.references :user, index: true
      t.references :priority, index: true
      t.references :initiative, index: true

      t.timestamps null: false
    end
  end
end
