class TestsController < ApplicationController
  # def new
  #   @test = Test.new
  # end

  def create
    @user = User.find(params[:user_id])
    @test = @user.tests.new(test_params)
    @problem = Problem.find(@test.problem_id)
    @problem.tests.push(@test)
    #delete the request
    # binding.pry
    @user.requests.where({ problem_id: @problem.id }).first.destroy
    if @test.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    end
  end

  private
  def test_params
    # binding.pry
    params.require(:test).permit(:problem_id)
  end
end
