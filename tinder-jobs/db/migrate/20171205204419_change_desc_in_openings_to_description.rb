class ChangeDescInOpeningsToDescription < ActiveRecord::Migration[5.1]
  def change
    rename_column :openings, :desc, :description
  end
end
