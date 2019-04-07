class CreateHives < ActiveRecord::Migration
  def change
    create_table :hives do |t|
      t.integer :beekeeper_id
      t.string :name
      t.string :hive_type
      t.string :bee_type
      t.string :location
      t.timestamps
    end
  end
end
