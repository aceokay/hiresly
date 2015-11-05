class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end

  def create
    @problem = current_user.problems.new(problem_params)
    if @problem.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    else
      flash[:alert] = 'Please supply text the challenge'
    end
  end

  private
  def problem_params
    params.require(:problem).permit(:title, :body, :difficulty)
  end
end
