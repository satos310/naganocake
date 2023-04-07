class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to admin_item_path(@item.id)
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "You have update book successfully."
      redirect_to book_path(@book.id)
    else
      #@book = Book.find(params[:id])
      @user = current_user
      render :edit
    end
  end
  
  protect_from_forgery

  private

  def item_params
    # genre_id? or genre_id_id?　どっちか
    params.require(:item).permit(:genre_id_id, :genre_id, :name, :introduction, :price, :is_active, :item_image)
  end
end
