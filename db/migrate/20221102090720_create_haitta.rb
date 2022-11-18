class CreateHaitta < ActiveRecord::Migration[5.2]
  def change
    create_table :haitta do |t|
      t.integer :user_id
      t.integer :post_id
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
