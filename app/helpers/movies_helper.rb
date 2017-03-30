module MoviesHelper  
  def movie_average(movie)
    return 0 if movie.reviews.length == 0
    movie.reviews.map{|review| review.ratings}.inject(:+).to_f / movie.reviews.length
  end
end
