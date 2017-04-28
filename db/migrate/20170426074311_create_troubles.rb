class CreateTroubles < ActiveRecord::Migration
  def change
    create_table :troubles do |t|
      t.integer :user_id
      t.integer :counselor_id
      t.text :content

      t.timestamps null: false
    end
  end
end
