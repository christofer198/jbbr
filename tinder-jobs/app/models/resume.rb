class Resume < ApplicationRecord
  belongs_to :applicant, class_name: "User"

  validates :title, presence: true
  validates :description, presence: true

end
