class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre, foreign_key: true, null: false
      t.references :angler, foreign_key: true, null: false
      t.string :name, null: false
      t.string :image_id, null: false
      t.text :explanation, null: false
      t.integer :price_excluding_tax, null: false
      t.integer :stock_quantity, null: false
      t.boolean :is_active, null: false

      t.timestamps
    end
  end
end
