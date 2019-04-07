class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :beekeeper_id
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
