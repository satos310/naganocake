class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    if address == 0
      @order.address = current_cutomer.addresses.find(params[:address])
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
