class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :beekeeper_id
      t.float :temperature
      t.string :conditions
      t.string :content
      t.timestamps
    end
  end
end
