class CreateSingleOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :single_operations do |t|
      t.string :name
      t.float :value
      t.date :date_of_operation
      t.integer :operation_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
