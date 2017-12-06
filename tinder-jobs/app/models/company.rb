class Company < ApplicationRecord
  validates :name, uniqueness: true
  has_many :employees, class_name: :user
  has_many :openings
  belongs_to :sector
end
