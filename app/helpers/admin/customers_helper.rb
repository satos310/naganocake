module Admin::CustomersHelper
  def customer_status_name(customer)
    if customer.is_deleted
      '有効'
    else
      '退会'
    end
  end
end
