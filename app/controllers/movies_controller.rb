class MoviesController < ApplicationController

  def index
    @movies = Movie.all
    if params[:search]
      @movie = Movie.search(params[:search]).order("created_at DESC")
    else
      @movie = Movie.all.order("created_at DESC")
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    
  end

end
