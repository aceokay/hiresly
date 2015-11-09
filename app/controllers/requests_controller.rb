class RequestsController < ApplicationController
  def new
    @request = Request.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @request = @user.requests.new(request_params)
    @problem = Problem.find(@request.problem_id)
    @problem.requests.push(@request)
    if @request.save
      respond_to do |format|
        format.html { redirect_to user_path(user) }
        format.js
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @request = Request.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to user_path(@user) }
      format.js
    end
  end

  private
  def request_params
    params.require(:request).permit(:user_id, :problem_id)
  end
end
