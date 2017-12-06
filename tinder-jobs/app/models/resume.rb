class Resume < ApplicationRecord
  belongs_to :applicant, class_name: :user

  validates :title, presence: true
  validates :description, presence: true

end
