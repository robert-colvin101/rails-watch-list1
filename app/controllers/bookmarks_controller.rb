class BookmarksController < ApplicationController
    def index
    @bookmarks = Bookmark.all
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(list: @list)
  end

  def create

    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
    redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to lists_path

  end

  private
   def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)

    # rescue ActionController::ParameterMissing => error
    #   json_response({ message: error }, :unprocessable_entity)
    #   redirect_to list_path(lists/new)
    #   return nil
  end
end
