class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.all
    end
  end

  def confirm
    @order = Order.new(order_params)
    binding.pry
    if @order.select_address == 0
      @order.address = current_cutomer.addresses.find(params[:address])
    else
      # ↓ == 1のselectボックスの際に使用 ↓
      @order.address = Address.find(params[:id])
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method)
  end
end
