class TracksController < ApplicationController
  before_action :require_login

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track.id)
    else
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track.id)
    else
      render :edit
    end
  end


  private
  def track_params
    params.require(:track).permit(:name, :lyrics, :track_type, :album_id)
  end
end
