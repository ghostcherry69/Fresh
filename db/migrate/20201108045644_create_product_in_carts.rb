class CreateProductInCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_in_carts do |t|
      t.references :product, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
