class BookmarksController < ApplicationController
  def show
    @bookmarks = Bookmark.all
  end
end
