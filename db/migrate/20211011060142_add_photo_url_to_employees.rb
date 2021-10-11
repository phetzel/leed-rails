class AddPhotoUrlToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :photoUrl, :string
  end
end
