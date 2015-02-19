require 'active_support/inflector'

class CommentsController < ApplicationController
  def index
    params.each do |name,value|
      if name =~ /(.+)_id$/
        render json: Comment.all
      end
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(comment_params)
      render json: comment
    else
      render json: comment.errors.full_messages
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      render json: {}
    else
      render json: comment.errors.full_messages
    end
  end

  def show
    render json: Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:author_id, :body, :commentable_id, :commentable_type)
  end
end
