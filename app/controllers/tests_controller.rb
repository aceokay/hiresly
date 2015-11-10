class TestsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @test = @user.tests.new(test_params)
    @problem = Problem.find(@test.problem_id)
    @problem.tests.push(@test)
    #delete the request below as to not see the same request again. Allows for resubmition of test request
    @user.requests.where({ problem_id: @problem.id }).first.destroy
    if @test.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @test = Test.find(params[:id])
  end

  def update
    
  end

  private
  def test_params
    params.require(:test).permit(:problem_id)
  end
end
