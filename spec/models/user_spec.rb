require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:user) {User.create!(username:"nancy",email:"nancy@email.com", password:"password")}
  # let(:movie) {Movie.create!(title:"The Fox and the Hound", year:1981, genre:"kids", cast:" Kurt Russell, Mickey Rooney", director:" Richard Rich, Ted Berman, Art Stevens")}
  # let(:review) {user.reviews.create!(content:"So good",ratings:10,movie_id:movie.id)}
  # let(:comment) {user.comments.create!(content:"You're wrong!",commentable_type:"Movie", commentable_id:movie.id)}
  # let(:fav_movie) {user.favorite_movies.create!(movie_id:movie.id)}
  # let(:watchlist_movie) {user.watchlists.create!(movie_id:movie.id)}
  describe 'validations' do
    let (:user_without_username) {User.new(username:"",email:"betty@email.com", password:"password")}
    let (:user_with_username) {User.new(username:"betty",email:"betty@email.com", password:"password")}
    it "is not valid when username is blank" do
      user_without_username.valid?
      expect(user_without_username.errors[:username]).to_not be_empty
    end

    it "is  valid wwith username" do
      user_without_username.valid?
      expect(user_with_username.errors[:username]).to be_empty
    end
  end

  describe 'associations' do
    before(:each) do
      @user = User.create!(username:"nancy",email:"nancy@email.com", password:"password")
      @movie = Movie.create!(title:"The Fox and the Hound")
      @other_movie = Movie.create!(title:"Movie Title")
      @review = @user.reviews.create!(content:"So good",ratings:10,movie_id:@movie.id)
      @comment = @user.comments.create!(content:"You're wrong!",commentable_type:"Movie", commentable_id: @movie.id)
      @fav_movie = @user.favorite_movies.create!(movie_id: @movie.id)

      @watchlist_movie = @user.watchlists.create!(movie_id: @movie.id)
    end


      it 'returns the reviews it has left ' do
        expect(@user.reviews).to match_array [@review]
      end

      it 'returns the comments it has left ' do
        expect(@user.comments).to match_array [@comment]
      end


      # it "returns user's favorite movies" do
      #   expect(@user.favorite_movies).to match_array [@fav_movie]
      # end





      it "returns user's favorite movies" do

        expect(@user.favorites).to match_array [@movie]
      end

      it "does not return a movie that has not been favorited" do

        expect(@user.favorites).not_to include(@other_movie)
      end


      it "returns user's watchlist movies" do

        expect(@user.movies_to_watch).to match_array [@movie]
      end

      it "does not return a movie that has not been added to watchlist" do

        expect(@user.movies_to_watch).not_to include(@other_movie)
      end


end



end
