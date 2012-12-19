class ProjectRequest < ActiveRecord::Base
  attr_accessible :employee_id, :project_help, :start_date, :end_date, :status
  belongs_to :employee
  has_many :responses
  belongs_to :request_selection
  has_many :request_selections
  accepts_nested_attributes_for :responses, :allow_destroy => true
  
  validate :check_start_date
  validate :check_end_date
  validate :check_employee_id



def check_start_date
    if start_date < DateTime.now
      errors.add(:start_date, "can only be later than today")
    end
  end

  def check_end_date
  	if end_date < DateTime.now
  		errors.add(:end_date, "can only be later than today")
  	end
  end
  def check_employee_id
    if employee_id  = "nil" 
      errors.add(:employee_id, " Must enter a valid Employee ID")
    end
  end

  



end
