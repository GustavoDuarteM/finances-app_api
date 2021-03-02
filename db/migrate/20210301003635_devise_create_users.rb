# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,              null: false, default: ""
      t.string :uid
      t.string :name
      t.string :image_url
      ## Token Validation
      t.string :token
      t.integer :expires_at
      t.string :refresh_token
      t.boolean :expires

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :uid,                unique: true
  end
end
