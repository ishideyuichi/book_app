# frozen_string_literal: true

class FollowingController < ApplicationController
  NUMBER_OF_ITEMS = 5

  def index
    @title = 'Following'
    @user  = User.find(params[:user_id])
    @users = @user.following.page(params[:page]).per(NUMBER_OF_ITEMS)
    render 'users/show_follow'
  end
end
