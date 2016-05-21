class CreateInitiativeComments < ActiveRecord::Migration
  def change
    create_table :initiative_comments do |t|
      t.references :user, index: true
      t.references :initiative, index: true
      t.text :comment

      t.timestamps null: false
    end
  end
end
