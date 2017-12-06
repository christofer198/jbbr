class AddMaxDistancetoOpeningsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :openings, :max_distance, :integer
  end
end
