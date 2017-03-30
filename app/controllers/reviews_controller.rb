class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def show
    find_review
  end

  def new
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def edit
    find_review
  end

  def create

    @movie = Movie.find(params[:movie_id])
    # byebug
    @review = @movie.reviews.new(review_params.merge(user_id: current_user.id))
    if @review.save
      redirect_to @movie
    else
      render 'new'
    end
  end

  def update
    find_review

    if @review.update(review_params)
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
    find_review
    @review.destroy

    redirect_to movies_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :ratings, :user_id => current_user.id, :movie_id => @movie.id)
  end

  def find_review
    @review = Review.find_by(params[:id])
  end
end
