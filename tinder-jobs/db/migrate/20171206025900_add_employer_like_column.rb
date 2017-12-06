class AddEmployerLikeColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :applications, :employer_likes, :boolean
  end
end
