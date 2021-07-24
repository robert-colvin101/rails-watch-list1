class ListsController < ApplicationController
  def index
    @lists = List.all


  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to list_path(@list)
    else
      redirect_to lists_path(new)
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new

  end

  private
   def list_params
    params.require(:list).permit(:name, :photo)

    # rescue ActionController::ParameterMissing => error
    #   json_response({ message: error }, :unprocessable_entity)
    #   redirect_to list_path(lists/new)
    #   return nil
  end
end
