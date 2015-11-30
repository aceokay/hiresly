require 'rails_helper'

describe "Test creation path" do
  it "creates a test from a request sent from an Employer for a specific Developer", js: true do
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
    click_on 'Logout'
    click_on 'Login'
    fill_in 'Email', with: developer.email
    fill_in 'Password', with: developer.password
    click_on 'Log in'
    expect(page).to have_content problem.title
    click_on 'Start'
    expect(page).to have_content problem.body
  end
end
