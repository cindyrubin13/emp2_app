class Response < ActiveRecord::Base
  attr_accessible :employee_id, :message, :project_request_id
  belongs_to :project_request 
  belongs_to :employee
  has_many :employees,  :through => :project_requests
  has_many :request_selections
  accepts_nested_attributes_for :request_selections, :allow_destroy => true
end
