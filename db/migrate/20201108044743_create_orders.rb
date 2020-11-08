class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true, null: false
      t.string :postal_code, null: false
      t.string :street_address, null: false
      t.string :name, null: false
      t.integer :postage, null: false
      t.integer :request_amount, null: false
      t.integer :method_paymen, null: false
      t.integer :order_status, null: false

      t.timestamps
    end
  end
end
