class CreateBeekeepers < ActiveRecord::Migration
  def change
    create_table :beekeepers do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :experience
      t.string :location
      t.timestamps
    end
  end
end
