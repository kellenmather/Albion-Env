class UsersController < ApplicationController
	before_action :require_login, only: [:show, :new]
	before_action :require_admin, only: [:show, :new]
  def index
  end
  def new
    @states = State.all
  end
  def create
    user =  User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:notice] = "The user has been added successfully"
      redirect_to new_user_path #need to see which page shoud we redirect to
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end
  end
  private
    def user_params
      params.require(:user).permit(:contact_name, :company, :email, :phone, :company_address, :city, :state_id, :zipcode, :password, :password_confirmation)
    end
end
