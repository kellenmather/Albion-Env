class ResultsController < ApplicationController
  def show
    @user = User.find_by(email: params[:user][:email])
    if @user.nil?
      flash[:error] = "User not found"
      redirect_to new_user_path
    end
  end
  def create

      @result = Result.new(params_file)

      if @result.save!
        p @result.attachment.url
		  flash[:notice]= "File has been uploaded successfullys"
        redirect_to new_user_path, notice: "The result #{@result.user_id}" # why are we redirecting and setting a new notice here?
      else

        redirect_to new_user_path
      end
  end

  private
    def params_search
      params.require(:user).permit(:email)
    end
    def params_file
      params.require(:result).permit(:user_id, :attachment)
    end
end
