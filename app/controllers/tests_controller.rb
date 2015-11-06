class TestsController < ApplicationController
  def new
    @test = Test.new
  end

  def create
    @problem = current_user.problems.new(problem_params)
    if @problem.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    end
  end

  private
  def problem_params
    params.require(:problem).permit(:title, :body, :difficulty)
  end
end
