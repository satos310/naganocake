class Admin::ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to admin_item_path(@item.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  protect_from_forgery

  private

  def item_params
    # genre_id? or genre_id_id?　どっちか
    params.require(:item).permit(:genre_id_id, :genre_id, :name, :introduction, :price, :is_active)
  end
end
