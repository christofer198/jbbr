class CreateOpenings < ActiveRecord::Migration[5.1]
  def change
    create_table :openings do |t|
      t.string :title
      t.string :desc
      t.integer :salary
      t.integer :employer_id

      t.timestamps
    end
  end
end
