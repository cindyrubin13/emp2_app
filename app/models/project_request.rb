class ProjectRequest < ActiveRecord::Base
  attr_accessible :employee_id, :project_help
  belongs_to :employee
end
