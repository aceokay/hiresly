class ProblemsController < ApplicationController
  def new
    @problem = Problem.new
  end

  def create

  end

  private
  def problem_params
  end
end
