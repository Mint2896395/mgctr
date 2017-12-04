class CreateLibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :description
      t.string :type

      t.timestamps
    end
  end
end
