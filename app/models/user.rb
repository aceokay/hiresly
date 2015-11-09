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
end
