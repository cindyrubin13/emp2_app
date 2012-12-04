class ProjectRequest < ActiveRecord::Base
  attr_accessible :employee_id, :project_help
  belongs_to :employee
  has_many :responses
  accepts_nested_attributes_for :responses, :allow_destroy => true
end
