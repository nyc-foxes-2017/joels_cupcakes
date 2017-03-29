class CreateFavoriteMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :favorite_movies do |t|
      t.references :user, null: false
      t.references :movie, null: false
      t.timestamps null: false
    end
  end
end
