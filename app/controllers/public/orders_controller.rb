class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @address = Address.new
    if @order.select_address == 0
      @order.address = current_cutomer.addresses.find(params[:address])
    else
      @order.address = 
    end
    @customer = Customer.all
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
