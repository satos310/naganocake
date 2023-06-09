class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum making_status: {cant_make: 0, wait_make: 1, making: 2, made: 3}

  def subtotal
    item.with_tax_price * quantity
  end

end
