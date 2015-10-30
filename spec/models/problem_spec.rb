require 'rails_helper'

describe Problem do
  it { should belong_to :user }
  it { should have_many :tests }
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  it { should validate_presence_of :difficulty }
end
