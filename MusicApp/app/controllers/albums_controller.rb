class AlbumsController < ApplicationController
  before_action :require_login
  
  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album.id)
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album.id)
    else
      render :edit
    end
  end


  private

  def album_params
    params.require(:album).permit(:name, :category, :band_id)
  end
end
