class PostsController < ApplicationController

  before_action :correct_author?, only: [:edit, :update]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.sub_ids = params[:post][:sub_ids]
    if @post.save
      redirect_to post_url(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    @post.sub_ids = params[:post][:sub_ids]
    if @post.update(post_params)
      redirect_to post_url(@post)
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :url)
  end
end
