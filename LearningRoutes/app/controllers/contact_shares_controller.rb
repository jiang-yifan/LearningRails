class ContactSharesController < ApplicationController
  def index
    render json: ContactShare.all
  end

  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render json: contact_share.errors.full_messages
    end
  end

  def update
    contact_share = ContactShare.find(params[:id])
    if contact_share.update(contact_share_params)
      render json: contact_share
    else
      render json: contact_share.errors.full_messages
    end
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    if contact_share.destroy
      render json: {}
    else
      render json: contact_share.errors.full_messages
    end
  end

  def show
    render json: ContactShare.find(params[:id])
  end

  private
  def contact_share_params
    params.require(:contact_shares).permit(:contact_id, :user_id)
  end
end
