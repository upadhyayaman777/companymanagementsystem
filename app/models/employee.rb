class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"

  belongs_to :manager, class_name: "Employee", optional: true
  

  has_many :leafs
  belongs_to :company
  belongs_to :department, foreign_key: :department_code
  validates_presence_of :department
end
