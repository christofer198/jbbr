class ChangeEmployersToCompanies < ActiveRecord::Migration[5.1]
  def change
    rename_table :employers, :companies
  end
end
