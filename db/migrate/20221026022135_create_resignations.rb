class CreateResignations < ActiveRecord::Migration[5.2]
  def change
    create_table :resignations do |t|
      t.text :reason
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
