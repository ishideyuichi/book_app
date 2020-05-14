class UsersController < ApplicationController
  NUMBER_OF_ITEMS = 5
  def index
    @users = User.page(params[:page]).per(NUMBER_OF_ITEMS)
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(NUMBER_OF_ITEMS)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(NUMBER_OF_ITEMS)
    render 'show_follow'
  end
end
