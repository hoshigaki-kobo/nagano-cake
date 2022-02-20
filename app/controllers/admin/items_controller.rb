class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def cerate
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.page(params[:page])
  end

  def updete
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:genre_id,:tax_included,:is_active,:item_image)
  end
end
