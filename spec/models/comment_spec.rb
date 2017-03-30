require 'rails_helper'


RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create!(username:"nancy",email:"nancy@email.com", password:"password")
    @movie = Movie.create!(title:"The Fox and the Hound")
    @comment = @user.comments.create!(content:"Movie rule!", commentable_type:'Movie', commentable_id:@movie.id)
    @comment_on_comment = @comment.comments.create!(content:"No they don't!", commentable_type:'Comment',commentable_id:@comment.id, user_id:@user.id)
  end

      it 'returns the username who left the comment' do
        expect(@comment.user.username).to eq(@user.username)
      end

      it 'returns the username who left the comment on a comment' do
        expect(@comment_on_comment.user.username).to eq(@user.username)
      end

      it 'returns the comments of a certain comment' do
        expect(@comment.comments).to match_array [@comment_on_comment]
      end



end
