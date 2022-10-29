class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.date :opening_date
      t.string :phone
      t.text :remarks
      t.string :image
      t.references :area, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
