class User < ApplicationRecord
  has_one :resume
  has_many :applications
  has_many :openings, through: :applications

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
