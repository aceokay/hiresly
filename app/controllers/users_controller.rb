class UsersController < ApplicationController
  def index
    @developers = User.where(["developer = ?", "true"])
  end

  def show
    @user = User.find(params[:id])
    @requests = Request.where({ user_id: @user.id })
    # binding.pry
    unless @user != current_user
      @problems = @user.request_problems
    end
    if @user.name.nil?
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :address, :linkedin, :github, :website)
  end
end
