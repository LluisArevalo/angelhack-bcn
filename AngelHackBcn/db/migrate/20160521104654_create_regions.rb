class CreateRegions < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :ambit
      t.string :area

      t.timestamps null: false
    end
  end
end
