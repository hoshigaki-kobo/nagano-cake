class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def cerate
    @item = Item.new(item_params)

  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def updete
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
  end

  def item_params
    params.require(:item).permit(:name,:introduction,:genre_id,:tax_included,:is_active)
  end
end
