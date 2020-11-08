class CreateDeliveryDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_destinations do |t|
      t.references :user, foreign_key: true, null: false
      t.string :postal_code, null: false
      t.string :street_address, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
