class CreateResumes < ActiveRecord::Migration[5.1]
  def change
    create_table :resumes do |t|
      t.string :title
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
