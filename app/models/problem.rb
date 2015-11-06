class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :tests
  has_many :requests

  validates :title, presence: true
  validates :body, presence: true
  validates :difficulty, presence: true
end
