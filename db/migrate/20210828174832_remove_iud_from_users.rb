class RemoveIudFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :uid, :string
  end
end
