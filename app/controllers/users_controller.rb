# frozen_string_literal: true

class UsersController < ApplicationController
  NUMBER_OF_ITEMS = 5
  def index
    @users = User.page(params[:page]).per(NUMBER_OF_ITEMS)
  end

  def show
    @user = User.find(params[:id])
  end
end
