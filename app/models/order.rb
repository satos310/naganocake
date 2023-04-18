class Order < ApplicationRecord
  has_many :order_detail
  belongs_to :customer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {wait_payment: 0, payment: 1, making: 2, prepare_shipping: 3, shipped: 4}
  
end
