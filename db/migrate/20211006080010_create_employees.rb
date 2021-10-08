class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :employees, :name
  end
end
