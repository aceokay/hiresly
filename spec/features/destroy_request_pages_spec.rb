require 'rails_helper'

describe "Request destroy path" do
  it "destroys a request from an Employer", js: true do
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
    visit '/users'
    click_on developer.name
    click_on 'Delete'
    expect(page).not_to have_content problem.title
    expect(page).to have_content "Send a test"
  end
end
