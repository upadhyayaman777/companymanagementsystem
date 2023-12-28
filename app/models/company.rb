class Company < ApplicationRecord
  has_many :departments
  has_many :employees

  enum industry_type: {
    tech_company: '0',
    non_tech: '1',
    finance: '2',
    consultancy: '3'
  }

end
