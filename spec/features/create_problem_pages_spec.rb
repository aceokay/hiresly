require 'rails_helper'

describe "Problem creation path" do
  it "creates a problem from input given my an Employer", js: true do
    employer = FactoryGirl.create(:employer)
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: employer.email
    fill_in 'Password', with: employer.password
    click_on 'Log in'
    click_on 'Make a new test problem'
    fill_in 'Problem Title', with: "twit-better, twitter"
    fill_in "Let's hear the challenge!", with: "Make it like twitter scept with less words"
    click_on 'Submit'
    expect(page).to have_content "See the developers"
  end
end
