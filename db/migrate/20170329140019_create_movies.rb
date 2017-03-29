class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string    :title, null: false
      t.integer   :year, null: false
      t.string    :genre, null: false
      t.string    :director, null: false
      t.string    :cast, null: false
      
      t.timestamps  null: false
    end
  end
end
