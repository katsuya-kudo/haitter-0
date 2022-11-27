class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :email
      t.string :password_digest
      t.string :district
      t.boolean :resign_flag, default: false, null: false
      t.boolean :admin_flag, default: false, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
