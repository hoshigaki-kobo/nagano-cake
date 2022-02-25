class Public::GenresController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @all_items_count = @genre.items.where(is_active: true).count
    @items_page = Item.where(is_active: true, genre_id: params[:id]).page(params[:page]).per(9)
  end

end
