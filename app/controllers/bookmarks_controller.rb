class BookmarksController < ApplicationController
  def show
    @movies = Movie.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path([:id])
  end

  def new
    @bookmark = Bookmark.new(list_params)
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
