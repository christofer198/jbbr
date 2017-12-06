class Application < ApplicationRecord
  belongs_to :applicant, class_name: :user
  belongs_to :opening
end
