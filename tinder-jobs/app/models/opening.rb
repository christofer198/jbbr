class Opening < ApplicationRecord
  belongs_to :employer
  has_many :applications
end
