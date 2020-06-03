# frozen_string_literal: true

class Book < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true
  validates :memo, presence: true
end
