class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @contact = current_user.contacts.build
  end

  def create
    @contact = current_user.contacts.build(contact_params)
    if @contact.save
      redirect_to edit_contact_path(@contact), notice: 'Контакт успешно создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to edit_contact_path(@contact), notice: 'Контакт успешно изменен'
    else
      render :edit
    end
  end

  def destroy
    @contact.delete
    redirect_to :back, notice: 'Контакт успешно удален'
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :phone, :token)
    end

    def check_user
      if @contact.user_id != current_user.id
        respond_to json: {error: true, message: 'Не достаточно прав на изменение Контакта' }
      end
    end
end
