class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
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
