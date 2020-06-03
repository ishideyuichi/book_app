# frozen_string_literal: true

class FollowersController < ApplicationController
  NUMBER_OF_ITEMS = 5

  def index
    @title = 'Followers'
    @user  = User.find(params[:user_id])
    @users = @user.followers.page(params[:page]).per(NUMBER_OF_ITEMS)
    render 'users/show_follow'
  end
end
