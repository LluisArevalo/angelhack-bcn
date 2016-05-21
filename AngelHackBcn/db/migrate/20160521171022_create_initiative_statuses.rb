class CreateInitiativeStatuses < ActiveRecord::Migration
  def change
    create_table :initiative_statuses do |t|

      t.references :user, index: true
      t.references :initiative, index: true
      t.boolean :solved

      t.timestamps null: false
    end
  end
end
