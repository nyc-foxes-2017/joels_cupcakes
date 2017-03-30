module ActivitiesHelper

  def trackable_words(activity)
    if activity.trackable_type == "FavoriteMovie"
      return " favorited " + activity.trackable.movie.title
    elsif activity.trackable_type== "Watchlist"
        return " added " + activity.trackable.movie.title + " to watchlist"

    end
  end
end
