class AddImageToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :image, :string
  end
end
