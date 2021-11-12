class BookmarksController < ApplicationController
  def create
    @movies = Movie.all
    @movie = Movie.select { |movie| movie.title == params[:bookmark][:movie_id] }[0]
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end

# class BookmarksController < ApplicationController
#   def index
#     @bookmarks = Bookmark.all
#   end

#   def new
#     @list = List.find(params[:list_id])
#     @bookmark = Bookmark.new
#   end

#   def create
#     @list = List.find(params[:list_id])
#     @bookmark = Bookmark.new(bookmark_params)
#     @bookmark.list = @list
#     if @bookmark.save
#       redirect_to list_path(@list)
#     else
#       render :new
#     end
#   end

#   def destroy
#     @bookmark = Bookmark.find(params[:id])
#     @bookmark.destroy
#     redirect_to @bookmark.list, notice: 'Bookmark successfully deleted'
#   end

#   private

#   def bookmark_params
#     params.require(:bookmark).permit(:comment, :movie_id, :list_id)
#   end
# end
