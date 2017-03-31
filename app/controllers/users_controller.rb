class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
      

    @activities = PublicActivity::Activity.all.order("created_at desc").limit(5)
    @movies_to_watch = current_user.movies_to_watch.all
    @favorites = current_user.favorites.all
    if find_user
      find_user
    else
      redirect_to root_path
    end

  end



  def new
    @user = User.new
  end

  def edit
    find_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    find_user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def delete
    find_user
    @user.destroy

    redirect_to users_path
  end


  private
  def user_params
    params.require(:user).permit(:username, :email,:password)
  end

  def find_user
    @user = User.find_by(id: params[:id])
  end
end
