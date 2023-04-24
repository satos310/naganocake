class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
  end

  def confirm
    @order = Order.new(order_params)
    # ↓ カラムのorder_idとselect_address_idを判別している ↓
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      # ↓ @orderでcustomer_idがnillにより、current_customer.idが必要。
      @order.customer_id = current_customer.id
    end
    # ログイン中顧客のカート内商品の情報を取得
    @cart_items = current_customer.cart_items.all
  end

  def complete
  end

  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price_tax = cart_item.item.with_tax_price
      @order_details.quantity = cart_item.amount
      @order_details.making_status = 0
      @order_details.save!
    end

    CartItem.destroy_all
    redirect_to orders_complete_path
  end

  def index
    @order_details = OrderDetail.all
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :customer_id, :postage, :postal_code, :total_payment, :address, :name, :status)
  end
end
