class User < ApplicationRecord
  has_one :resume

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

end
