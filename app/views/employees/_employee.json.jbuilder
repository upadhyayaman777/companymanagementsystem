json.extract! employee, :id, :name, :dob, :address, :joining, :salary, :company_id, :department_id, :created_at, :updated_at
json.url employee_url(employee, format: :json)

