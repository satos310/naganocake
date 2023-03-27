class CreateOders < ActiveRecord::Migration[6.1]
  def change
    create_table :oders do |t|
      t.references :customer_id,      null: false, foreign_key: true
      t.string :postal_code,          null: false, default: ""
      t.string :address,              null: false, default: ""
      t.string :name,                 null: false, default: ""
      t.integer :postage,             null: false
      t.integer :total_payment,       null: false
      t.integer :payment_method,      null: false, default: 0
      t.integer :status,              null: false, default: 0

      t.timestamps
    end
  end
end
