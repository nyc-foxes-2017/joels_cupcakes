class MoviesController < ApplicationController

  def index
    @movies = Movie.all.sample(4)
    @most_recent = Movie.order("created_at DESC").limit(3)
    @mr_c_movie = Movie.find_by(title: "The Princess Diaries")
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def search
    if params[:search]
      if !Movie.search(params[:search]).empty?
        @movies = Movie.search(params[:search]).order("created_at DESC")
      else
        string = params[:search].split(" ").join("+")
        movie = JSON.parse open("http://www.omdbapi.com/?t=" + string + "&plot=full").read
        @movie = Movie.create!( { title: movie["Title"]} )
        @movies = Movie.search(params[:search]).order("created_at DESC")
      end
    else
      @movies = Movie.all.order("created_at DESC")
      redirect_to '/'
    end
  end

end
