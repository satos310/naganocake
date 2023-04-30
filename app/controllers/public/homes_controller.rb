class Public::HomesController < ApplicationController

  def top
    # 商品を新着順に4件取得
    @items = Item.all.limit(4).order(created_at: :desc)
  end

  def about
  end

end
