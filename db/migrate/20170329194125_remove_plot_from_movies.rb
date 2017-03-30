class RemovePlotFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :plot
  end
end
