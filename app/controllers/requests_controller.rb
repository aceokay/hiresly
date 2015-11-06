class RequestsController < ApplicationController
  def new
    @request = Request.new
    @user = User.find(params[:user_id])
    # binding.pry
  end

  # def create
  #   # user = params.find(:id)
  #   # request = user.requests.new()
  #   # problem
  #   @problem = current_user.problems.new(problem_params)
  #   if @problem.save
  #     respond_to do |format|
  #       format.html { redirect_to user_path(current_user) }
  #       format.js
  #     end
  #   end
  # end

  private
  def request_params
    params.require(:request).permit(:user_id, :problem_id)
  end
end
