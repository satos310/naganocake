class CreateOderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_items do |t|
      t.references :order_id,       null: false, foreign_key: true
      t.references :item_id,        null: false, foreign_key: true
      t.integer :price_tax,         null: false
      t.integer :quantity,          null: false
      t.integer :status,            null: false, default: 0

      t.timestamps
    end
  end
end
