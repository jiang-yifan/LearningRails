class ContactsController < ApplicationController
  def index
    render json: Contact.where(user_id: params[:user_id])
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      render json: {}
    else
      render json: contact.errors.full_messages
    end
  end

  def show
    render json: Contact.find(params[:id])
  end

  def fav
    contact = Contact.find(params[:id])
    fav = contact.favorite
    fav = fav == 1 ? 0: 1
    if contact.update(favorite: fav)
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
