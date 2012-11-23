class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location
  has_many :project_requests
end
