class Request < ActiveRecord::Base
  # validates_uniqueness_of :user_id, :scope => :problem_id
  belongs_to :user
  belongs_to :problem
end
