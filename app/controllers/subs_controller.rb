class SubsController < ApplicationController

  def new
    @sub = Sub.new
  end

  def create
    @sub = current_user.moderated_subs.new(sub_params)

    if @sub.save
      flash[:notice] = "Successfully created #{@sub.title}"
      redirect_to root_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.update(sub_params)
      flash[:notice] = "Your changes have been recorded"
      redirect_to root_url
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.destroy!
    redirect_to root_url
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
