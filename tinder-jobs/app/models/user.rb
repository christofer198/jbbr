class User < ApplicationRecord
  has_one :resume, foreign_key: 'applicant_id'
  has_many :applications, foreign_key: 'applicant_id'

  # has_many :openings, through: :applications
  has_many :openings, foreign_key: 'employee_id'
  # belongs_to :company, foreign_key: 'employee_id'

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  def company_matches
    @applications = Application.where(employer_likes: true, user_like: true)
    @employer_filter = @applications.select{|application| application.opening.company_id == self.company_id}
  end

  def user_matches
    @applications = Application.where(employer_likes: true, user_like: true, applicant_id: self.id)
  end

end
