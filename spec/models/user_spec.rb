require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
  @user = User.create!(username:"nancy",email:"nancy@email.com", password:"password")
  @movie = Movie.create!(title:"The Fox and the Hound", year:1981, genre:"kids", cast:" Kurt Russell, Mickey Rooney", director:" Richard Rich, Ted Berman, Art Stevens")
  @review = @user.reviews.create!(content:"So good",ratings:10,movie_id:@movie.id)
  # @comment = @user.comments.create!(content:"You're wrong!",commentable_type:"Movie")
  end
  describe 'associations' do

      it 'returns the reviews it has left ' do
        expect(@user.reviews).to match_array [@review]
      end

      # it 'returns the comments it has left ' do
      #   expect(@user.comments).to match_array [@comment]
      # end

  end
end
