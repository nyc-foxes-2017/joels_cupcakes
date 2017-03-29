require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create!(username:"nancy",email:"nancy@email.com", password:"password")
    @movie = Movie.create!(title:"The Fox and the Hound")
    @comment = @user.comments.create!(content:"Movie rule!", commentable_type:'Movie', commentable_id:@movie.id)
    @comment_on_comment = @comment.create!(comment:"No they don't!")
  end

      it 'returns the user who left the comment' do
        expect(@comment.users).to match_array [@user]
      end
end
