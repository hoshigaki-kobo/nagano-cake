class Public::GenresController < ApplicationController

  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    # しょーたさんここから下書き換えました
    @items = @genre.items.where(is_active: true)
    @items_page = @items.page(params[:page])

  end

end
