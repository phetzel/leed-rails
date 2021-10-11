class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.string :services
      t.text :description
      t.string :photoUrl
      t.string :type

      t.timestamps
    end
  end
end
