class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @total = 0
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  # カート商品追加
  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    # もしカート内に同じ商品がある場合
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      # 既存の数量に追加
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.save
    # カート内に同じ商品がない場合、通常の保存処理
    else
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end

end
