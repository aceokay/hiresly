require 'rails_helper'

describe "User creation path" do
  it "creates a User" do
    employer = FactoryGirl.create(:employer)
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
