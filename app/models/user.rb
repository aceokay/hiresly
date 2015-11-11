class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :problems
  has_many :tests
  has_many :requests
  has_many :interests, class_name: "User",
                       foreign_key: "interested_user_id"
  belongs_to :interested_user, class_name: "User"

  # Checks to see if a particular employer can make a request on a developer
  # Requests are capped at one per employer per developer
  def requestable(employer)
    show_request_link = true
    if self.requests.any?
      self.requests.each do |request|
        if employer.problems.where({ id: request.problem_id }).any?
          show_request_link = false
        end
      end
    end
    show_request_link
  end

  # Checks if a given request belongs to a user (as in it was sent from a user)
  def my_request(request)
    if self.problems.where({ id: request.problem_id }).any?
      true
    else
      false
    end
  end

  # Returns an array of all live requests sent from a given User
  def my_requests()
    request_array = []
    self.problems.each do |problem|
      Request.where({ problem_id: problem.id}).each do |request|
        request_array.push(request)
      end
    end
    request_array
  end

  # returns an array of problems from requests aimed at a given User
  def request_problems()
    problem_array = []
    self.requests.each do |request|
      problem_array.push(Problem.find(request.problem_id))
    end
    problem_array
  end
end
