class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to @comment.commentable,
                  notice: t('Comment was successfully created')
    else
      redirect_to @comment.commentable
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.commentable,
                  notice: t('Comment was successfully updated')
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.commentable,
                notice: t('Comment was successfully destroyed')
  end

  def comment_params
    params.require(:comment).permit(:body).merge(user_id: current_user.id)
  end

  def set_commentable
    resource, id = request.path.split('/')[1, 2]
    @commentable = resource.classify.constantize.find(id)
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end
end
