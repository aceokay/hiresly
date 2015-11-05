require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :problems }
  it { should have_many :tests }
  it { should have_many :interests }
  it { should belong_to :interested_user }
end
