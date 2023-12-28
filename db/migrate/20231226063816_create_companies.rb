class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :email
      t.string :industry_type
      t.string :regestration_number
      t.date :founding_date

      t.timestamps
    end
  end
end
