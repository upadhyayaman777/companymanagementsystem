class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.date :dob
      t.string :address
      t.date :joining
      t.decimal :salary
      t.references :company, null: false, foreign_key: true
      t.string :department_code  # Add department_code as a string
      t.index :department_code  # Add an index for faster lookups
      t.foreign_key :departments, column: :department_code, primary_key: :department_code, type: :string, on_delete: :cascade

      t.timestamps
    end
  end
end
