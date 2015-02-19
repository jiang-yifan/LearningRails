class NotesController < ApplicationController
  before_action :require_login
  before_action :belongs_to_current_user, except: [:new, :create]

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]
    if @note.save
      redirect_to track_url(@note.track_id)
    else
      render :new
    end
  end

  def edit
    @note = Note.find(params[:id])
    render :edit
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to track_url(@note.track_id)
    else
      render :edit
    end
  end

  def belongs_to_current_user
    render text: "Not the author" unless Note.find(params[:id]).user_id == current_user.id
  end

  private

  def note_params
    params.require(:note).permit(:note, :track_id)
  end
end
