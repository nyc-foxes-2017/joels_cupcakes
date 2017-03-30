class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    find_comment
  end

  def new
    @movie = Movie.find(params[:id])
    @comment = Comment.new
  end

  def edit
    find_comment
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.new(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    find_comment
    
    if @comment.update(comment_params)
      redirect_to @movie
    else
      render 'edit'
    end
  end

  def destroy
    find_comment

    @comment.destroy
    redirect_to movies_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :movie_id)
  end


  def find_comment
    @comment = Comment.find_by(params[:id])
  end




end
