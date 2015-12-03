require 'rails_helper'

describe "User creation path" do
  it "creates a User" do
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
    click_on 'Sign up'
    choose 'I am a Developer'
    fill_in 'Email', with: "Daves@fishin.net"
    fill_in 'Password', with: "itwasTHISbig"
    fill_in 'Password confirmation', with: "itwasTHISbig"
    within(:css, '#new_user') { click_on 'Sign up' }
    expect(page).to have_content "Complete your profile"
    fill_in 'Name', with: "Bitter Mike"
    fill_in "Address", with: "123 Fun St., Vancouver, WA"
    fill_in "LinkedIn URL", with: "https://www.linkedin.com/in/laura-rothenberg-262b4029"
    fill_in "GitHub URL", with: "https://gist.github.com/zhengjia/428105"
    fill_in "Website", with: "https://gist.github.com/zhengjia/428105"
    click_on 'Finish'
    expect(page).to have_content "New test challenges"
  end
end
