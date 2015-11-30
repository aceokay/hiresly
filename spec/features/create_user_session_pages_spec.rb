require 'rails_helper'

describe "User sign-in path" do
  it "creates a session for Employers and Developers equally and serves them to different pages" do
    developer = FactoryGirl.create(:developer)
    employer = FactoryGirl.create(:employer)
    visit '/'
    click_on 'Login'
    fill_in 'email', with: developer.email
    fill_in 'password', with: developer.password
    click_on 'Log in'
    expect(page).to have_content "New test challenges"
    # save_and_open_page
    click_on 'Logout'
    click_on 'Login'
    fill_in 'Email', with: employer.email
    fill_in 'Password', with: employer.password
    click_on 'Log in'
    expect(page).to have_content "See the developers"
    # save_and_open_page
  end
end
