class UsersController < ApplicationController
  def index
    @developers = User.where({ developer: true }).where.not({ name: nil, linkedin: nil, website: nil })
  end

  def show
    @user = User.find(params[:id])

    if current_user == @user
      if @user.name.nil? || @user.linkedin.nil? || @user.website.nil?
        render :edit
      end
    end

    if @user != current_user && current_user.employer
      @requests = Request.where({ user_id: @user.id })
    elsif @user == current_user && @user.employer
      @requests = @user.my_requests
      @completed_tests = @user.completed_tests
    end

    if @user == current_user && @user.developer
      @problems = @user.request_problems
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
