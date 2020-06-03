# frozen_string_literal: true

class FollowingBooksController < ApplicationController
  NUMBER_OF_ITEMS = 5

  def index
    @books = Book.where(user_id: fetch_id).page(params[:page]).per(NUMBER_OF_ITEMS)
  end

  private

  def fetch_id
    current_user.following.map(&:id)
  end
end
