class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def new
    @list = List.new
    # add the movies to the list
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list), notice: '🙌 Your list was successfully created!'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end

# class ListsController < ApplicationController
#   before_action :set_list, only: [:show]

#   def index
#     @lists = List.all
#     @list = List.new
#     if @list.save
#       redirect_to list_path(@list), notice: '🙌 Your list was successfully created!'
#     else
#       render :new
#     end
#   end

#   def show
#     @lists = List.all
#     @bookmark = Bookmark.all
#   end

#   def new
#     @list = List.new
#   end

#   def create
#     @list = List.new(list_params)
#     if @list.save
#       redirect_to list_path(@list), notice: '🙌 Your list was successfully created!'
#     else
#       render :new
#     end
#   end

#   private
#   def set_list
#     @list = List.find(params[:id])
#   end

#   def list_params
#     params.require(:list).permit(:name)
#   end
# end
