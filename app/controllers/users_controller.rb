class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in!(@user)
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end
  #
  # def edit
  #   @user = User.find(params[:id])
  # end
  #
  # def update
  #
  # end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
