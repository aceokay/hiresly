require 'rails_helper'

describe Test do
  it { should belong_to :user }
  it { should belong_to :problem }
end
