class AddZipCodeToOpeningsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :openings, :zip_code, :integer
  end
end
