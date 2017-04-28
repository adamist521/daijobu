class CreateCounselors < ActiveRecord::Migration
  def change
    create_table :counselors do |t|
      t.integer :user_id
      t.text :response

      t.timestamps null: false
    end
  end
end
