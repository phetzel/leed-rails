class RemoveImageFromEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :image, :string
  end
end
