class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.decimal :price
      t.decimal :diff
      t.date :date
      t.string :card01
      t.string :card02
      t.string :card03
      t.string :card04
      t.string :card05
      t.string :card06
      t.string :card07
      t.string :card08
      t.string :card09
      t.string :card10
      t.string :card11
      t.string :card12
      t.references :person, foreign_key: true

      t.timestamps
    end
  end
end
