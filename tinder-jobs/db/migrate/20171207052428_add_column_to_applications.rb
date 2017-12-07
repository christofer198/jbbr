class AddColumnToApplications < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :user_like, :boolean
  end
end
