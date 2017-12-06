class RenameUserIdApplicantId < ActiveRecord::Migration[5.1]
  def change
    rename_column :applications, :user_id, :applicant_id
    rename_column :resumes, :user_id, :applicant_id
  end
end
