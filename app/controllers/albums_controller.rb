class AlbumsController < ApplicationController

  def index
    @albums = []
  end

  def search
    finder = Finder.new
    @albums = finder.search params['keyword']
    render 'index'
  end

end
