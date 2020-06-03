# frozen_string_literal: true

class AddPolymorphicToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :commentable_id, :bigint
    add_column :comments, :commentable_type, :string
  end
  add_index :comments, %i[commentable_id commentable_type]
end
