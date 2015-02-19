class SubsController < ApplicationController
  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      render :new
    end
  end

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def edit
    @sub = Sub.find(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      render :edit
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
