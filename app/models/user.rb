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

  def requestable(employer)
    show_request_link = true
    if self.requests.any?
      self.requests.each do |request|
        if employer.problems.where({ id: request.problem_id })
          show_request_link = false
        end
      end
    end
    show_request_link
  end
end
