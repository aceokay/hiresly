class Problem < ActiveRecord::Base
  belongs_to :user
  has_many :tests

  validates :title, presence: true
  validates :body, presence: true
  validates :difficulty, presence: true
end
