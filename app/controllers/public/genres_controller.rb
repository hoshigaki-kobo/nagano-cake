class Public::GenresController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.where(is_active: true)
    @items_page = @items.page(params[:page])

  end

end
