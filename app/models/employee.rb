class Employee < ActiveRecord::Base
  attr_accessible :department, :employee_email, :employee_name, :location,
  :years_with_company, :manager, :position, :group, :current_skill, :skills_interested_in, :password, :password_confirmation
  has_secure_password 

  has_many :project_requests, dependent: :destroy
  belongs_to :project_request
  has_many :responses, :through => :project_request
  has_many :request_selections, :through => :responses
  #has_many :responses, through: :reverse_responses, foreign_key: "requests_id", class_name: "Responses"
   before_save { |employee| employee.employee_email = employee_email.downcase }
 before_save :create_remember_token 
validates :employee_name, presence: true
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  
  validates :employee_email, presence: true, 
            format: { with: VALID_EMAIL_REGEX } ,
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 } , :on => :create
  
 
  validates :password_confirmation, presence: true, :on => :create
  
 

#def check_employee_name
 #   if employee_name = "nil"
#     errors.add(:employee_name, "-Must enter a valid Employee name")
  #  end
 # end
private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end


end