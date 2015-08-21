class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:user_name], session_params[:password])
    if @user
      log_in!(@user)
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    log_out!
    redirect_to root_url
  end

  private
  def session_params
    params.require(:user).permit(:user_name, :password)
  end
end
