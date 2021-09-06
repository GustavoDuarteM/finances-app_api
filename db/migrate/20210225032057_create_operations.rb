class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.string :name
      t.float :value
      t.date :date_of_operation
      t.integer :operation_type
      t.integer :operation_frequency
      t.timestamps
    end
  end
end
