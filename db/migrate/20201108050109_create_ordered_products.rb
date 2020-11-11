class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      t.references :order, foreign_key: true, null: false
      t.references :product, foreign_key: true, null: false
      t.integer :purchase_price, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
