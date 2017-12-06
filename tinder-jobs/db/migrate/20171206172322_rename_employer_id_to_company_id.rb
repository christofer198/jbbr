class RenameEmployerIdToCompanyId < ActiveRecord::Migration[5.1]
  def change
    rename_column :openings, :employer_id, :company_id
  end
end
