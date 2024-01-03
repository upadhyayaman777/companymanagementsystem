class CreateLeafs < ActiveRecord::Migration[7.1]
  def change
    create_table :leafs do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.text :reason
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
