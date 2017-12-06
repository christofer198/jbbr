class Sector < ApplicationRecord
  has_many :companies
  has_many :openings, through: :companies
end
