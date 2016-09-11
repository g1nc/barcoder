class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def update
    super
    current_user.token = params[:user][:token]
    current_user.save
  end
end