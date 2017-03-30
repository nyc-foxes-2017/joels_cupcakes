class AddimdbIDtoMovies < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :imdbID, :string
  end
end
