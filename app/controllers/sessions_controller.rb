class SessionsController < ApplicationController
	before_action :require_login, only: [:show]
	before_action :require_correct_user, only: [:show]
  def new
  end
  def show
	  
  end
  def create
    user = User.find_by(email: sessions_params[:email])
    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      flash[:notice] = "User has been succesfully logged in"
		if user.admin == true
			redirect_to new_user_path
		else
			redirect_to session_path(user)
		end
    else
      flash[:errors] = ["Email and/or password do not match"]
    end
  end

  def destroy
	  session[:user_id] = nil
	  redirect_to root_path
  end
  private
    def sessions_params
      params.require(:user).permit(:email, :password)
    end
end
