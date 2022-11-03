class CreateResignation < ActiveRecord::Migration[5.2]
  def change
    create_table :resignations do |t|
      t.text :reason
      t.string :user_name
      t.string :email
      t.string :password
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
