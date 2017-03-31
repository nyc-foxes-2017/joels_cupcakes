class RemoveColumnsFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_columns :movies, :year, :genre, :director, :cast
  end
end
