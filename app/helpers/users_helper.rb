module UsersHelper
  def check_favorite(movie)
    current_user.favorites.include?(movie)
  end

  def check_watchlist(movie)
    current_user.movies_to_watch.include?(movie)
  end

  def reviewed?(movie)
    movie.reviews.any? {|review| review.user_id == current_user.id }
  end
end
