require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(username:"nancy",email:"nancy@email.com", password:"password")}
  let(:movie) {Movie.new(title:"The Fox and the Hound", year:1981, genre:"kids", cast:" Kurt Russell, Mickey Rooney", director:" Richard Rich, Ted Berman, Art Stevens")}
  let(:review) {user.reviews.new(content:"So good",ratings:10,movie_id:movie.id)}
  let(:comment) {user.comments.new(content:"You're wrong!",commentable_type:"Movie", commentable_id:movie.id)}
  let(:fav_movie) {user.favorite_movies.new(movie_id:movie.id)}
  let(:watchlist_movie) {user.watchlists.new(movie_id:movie.id)}

  describe 'associations' do

      it 'returns the reviews it has left ' do
        expect(user.reviews).to match_array [review]
      end

      it 'returns the comments it has left ' do
        expect(user.comments).to match_array [comment]
      end


      # it "returns user's favorite movies" do
      #   expect(user.favorite_movies).to match_array [fav_movie]
      # end

      it "returns user's favorite movies" do

        expect(user.favorites).to match_array [fav_movie]
      end

      # it "returns user's watchlist movies" do
      #   expect(user.watchlists).to match_array [watchlist_movie]
      # end

      it "returns user's watchlist movies" do
        expect(user.movies_to_watch).to match_array [watchlist_movie]
      end


  end
end
