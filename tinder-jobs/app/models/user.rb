class User < ApplicationRecord
  has_one :resume
  has_many :applications
  has_many :openings, through: :applications

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
