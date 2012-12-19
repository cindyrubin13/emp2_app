class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in
  has_many :project_requests
  belongs_to :project_request
  has_many :responses, :through => :project_request
  has_many :request_selections, :through => :responses
  #has_many :responses, through: :reverse_responses, foreign_key: "requests_id", class_name: "Responses"
  validate :check_employee_name
 

def check_employee_name
    if employee_name = "nil"
      errors.add(:employee_name, "-Must enter a valid Employee name")
    end
  end



end