class CreateOperations < ActiveRecord::Migration[6.1]
  def change
    create_table :operations do |t|
      t.string :name
      t.float :value
      t.date :date_of_operation
      t.integer :operation_flow
      t.integer :step

      t.timestamps
    end
  end
end
