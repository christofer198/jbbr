class User < ApplicationRecord
  has_one :resume, foreign_key: 'applicant_id'
  has_many :applications, foreign_key: 'applicant_id'

  has_many :openings, through: :applications
  has_many :openings, foreign_key: 'employee_id'

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
