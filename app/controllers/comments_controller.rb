class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    if params[:post]
      @comment = Post.find(params[:post][:post_id]).comments.new(comment_params)
    elsif params[:comment]
      @comment = Comment.find(params[:comment][:comment_id]).comments.new(comment_params)
    end
    if @comment.save
      redirect_to comment_url(@comment)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge({author_id: current_user.id})
  end
end
