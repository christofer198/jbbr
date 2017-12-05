class CreateEmployers < ActiveRecord::Migration[5.1]
  def change
    create_table :employers do |t|
      t.string :name
      t.integer :sector_id
      t.timestamps
    end
  end
end
