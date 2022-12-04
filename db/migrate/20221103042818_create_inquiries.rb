class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.integer :user_id
      t.text :content
      t.boolean :resolve_flag, default: false, null: false
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
