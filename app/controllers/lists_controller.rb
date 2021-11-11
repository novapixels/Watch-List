class ListsController < ApplicationController
  def show
    @lists = List.all
  end
end
