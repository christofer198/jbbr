class AddPrefSectorIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pref_sector_id, :integer
    add_column :users, :pref_distance, :integer
  end
end
