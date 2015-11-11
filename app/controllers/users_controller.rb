class UsersController < ApplicationController
  def index
    @developers = User.where(["developer = ?", "true"])
  end

  def show
    @user = User.find(params[:id])
    if @user != current_user && @user.employer
      @requests = Request.where({ user_id: @user.id })
    elsif @user == current_user && @user.employer
      @requests = @user.my_requests
    end
    # binding.pry
    if @user == current_user && @user.developer
      @problems = @user.request_problems
    end
    # binding.pry
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
