require 'rails_helper'

describe "Test update path" do
  it "edits a test (completes it) for a specific Developer", js: true do
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
    click_on 'Submit answer'
    fill_in 'Solution breakdown', with: "Uhhh"
    fill_in 'Github repository link', with: "www.cheese.fondu"
    fill_in 'Youtube video link', with: "https://www.youtube.com/watch?v=dQw4w9WgXcQ"
    click_on 'Submit'
    expect(page).to have_content "Response:"
    expect(page).to have_content "GitHub repository"
  end
end
