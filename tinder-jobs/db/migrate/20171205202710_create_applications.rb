class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.user_id
      t.opening_id
      t.timestamps
    end
  end
end
