require 'rails_helper'

describe "Test creation path" do
  it "creates a test from input given my an Employer meant for a specific Developer", js: true do
    developer = FactoryGirl.create(:developer)
    employer = FactoryGirl.create(:employer)
    problem = employer.problems.push(FactoryGirl.create(:problem)).last
    visit '/'
    click_on 'Login'
    fill_in 'Email', with: employer.email
    fill_in 'Password', with: employer.password
    click_on 'Log in'
    visit '/users'
    click_on developer.name
    click_on 'Send a test'
    select(problem.title, from: 'Challenge')
    click_on 'Send'
    # binding.pry
    # expect(page).to have_content problem.title
    expect(page).not_to have_content "Send a test"
    # save_and_open_page
  end
end
