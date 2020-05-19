class ChangeBodyOnCommentsToNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :comments, :body, false
  end
end
