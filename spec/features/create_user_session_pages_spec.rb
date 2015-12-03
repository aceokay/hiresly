require 'rails_helper'

describe "User sign-in path" do
  it "creates a session for Employers and Developers equally and serves them to different pages" do
    developer = FactoryGirl.create(:developer)
    employer = FactoryGirl.create(:employer)
    admin = [["Admin K.", "admin@email.com", "asdasdasd", "https://www.linkedin.com/in/aokincaid", "https://github.com/aceokay", "http://aceokay.github.io/"]]

    default_problems = [
      ["Palindrome", "Write code to check a String is palindrome or not."],
      ["Remove Char", "Write a method which will remove any given character from a String."],
      ["Anagram", "Write a method which will check if two String are Anagram"]
    ]

    admin.each do |name, email, password, linkedin, github, website|
      user = User.create(name: name, email: email, password: password, linkedin: linkedin, github: github, website: website, developer: true, employer: true, admin: true)
      if user.save
        default_problems.each do |title, body|
          user.problems.create(title: title, body: body, difficulty: 1)
        end
      end
    end
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
