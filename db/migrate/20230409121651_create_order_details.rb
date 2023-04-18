class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order,        null: false, foreign_key: true
      t.references :item,         null: false, foreign_key: true
      t.integer :price_tax,       null: false, default: ""
      t.integer :quantity,        null: false, default: ""
      t.integer :making_status,   null: false, default: 0

      t.timestamps
    end
  end
end
