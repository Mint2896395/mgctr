class CreateCardlibraries < ActiveRecord::Migration[5.1]
  def change
    create_table :cardlibraries do |t|
      t.string :cardid
      t.string :name
      t.text :description
      t.integer :cardno
      t.integer :value
      t.references :library, foreign_key: true

      t.timestamps
    end
  end
end
