class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments, id: false do |t|
      t.string :department_code, primary_key: true
      t.string :name
      t.string :location
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
